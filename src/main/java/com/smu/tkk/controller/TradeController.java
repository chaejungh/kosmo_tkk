package com.smu.tkk.controller;

import com.smu.tkk.config.NotificationPublisher;
import com.smu.tkk.dto.ChatRoomListDTO;
import com.smu.tkk.dto.TradePostListDto;
import com.smu.tkk.dto.TradeWriteValid;
import com.smu.tkk.entity.TradeBookmark;
import com.smu.tkk.entity.TradePost;
import com.smu.tkk.entity.TradePostImage;
import com.smu.tkk.repository.TradeBookmarkRepository;
import com.smu.tkk.repository.TradeChatRoomRepository;
import com.smu.tkk.service.TradeBookmarkService;
import com.smu.tkk.service.TradeChatService;
import com.smu.tkk.service.TradePostImageService;
import com.smu.tkk.service.TradeService;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;
import java.util.Optional;

import static org.springframework.data.domain.Sort.Direction.DESC;

@Controller
@RequiredArgsConstructor
@RequestMapping("/trade")
public class TradeController {

    private final TradeService tradeService;
    private final TradePostImageService tradePostImageService;
    private final TradeChatService tradeChatService;

    private final SimpMessagingTemplate messagingTemplate;
    private final NotificationPublisher notificationPublisher;

    private final TradeChatRoomRepository tradeChatRoomRepository;
    private final TradeBookmarkRepository tradeBookmarkRepository;
    private final TradeBookmarkService tradeBookmarkService;

    @GetMapping
    public String tradeRoot() {
        return "redirect:/trade/list.do";
    }

    /* ===============================================================
       🔥 검색 (DTO로 바로 내려서 썸네일 확실)
       ============================================================== */
    @GetMapping(params = "keyword")
    public String searchTrade(@RequestParam String keyword,
                              @PageableDefault(size = 20, sort = "id", direction = DESC) Pageable pageable,
                              Model model) {

        Page<TradePostListDto> dtoPage = tradeService.searchDto(keyword, pageable);

        model.addAttribute("page", dtoPage);
        model.addAttribute("keyword", keyword);

        return "trade/trade_list";
    }

    /* ===============================================================
       🔥 전체 목록
       ============================================================== */
    @GetMapping("/list.do")
    public String tradeList(
            @RequestParam(required = false) String sort,
            Pageable pageable,
            @SessionAttribute(name = "memberId", required = false) Long memberId,
            Model model) {

        int unreadCount = 0;
        if (memberId != null) {
            List<ChatRoomListDTO> rooms = tradeChatService.getChatRoomList(memberId);
            for (ChatRoomListDTO room : rooms) unreadCount += room.getUnreadCount();
        }

        // ✅ pageable 정렬 제거 (sort 파라미터로만 컨트롤)
        pageable = Pageable.ofSize(pageable.getPageSize()).withPage(pageable.getPageNumber());

        Page<TradePostListDto> result;
        if ("like".equals(sort)) result = tradeService.readAllOrderByLike(pageable);
        else if ("view".equals(sort)) result = tradeService.readAllOrderByView(pageable);
        else result = tradeService.readAllOrderByLatest(pageable);

        model.addAttribute("page", result);
        model.addAttribute("sort", sort);
        model.addAttribute("unreadCount", unreadCount);

        return "trade/trade_list";
    }

    /* ===============================================================
       🔥 특정 판매자의 거래글 목록
       ============================================================== */
    @GetMapping("/seller/{sellerId}")
    public String tradeListBySeller(@PathVariable Long sellerId,
                                    @PageableDefault(size = 20, sort = "id", direction = DESC) Pageable pageable,
                                    Model model) {

        // 1) 판매자 글 (엔티티: sellerName 뽑는 용도)
        Page<TradePost> entityPage = tradeService.readBySellerId(sellerId, pageable);

        // 2) DTO (썸네일 포함)
        Page<TradePostListDto> dtoPage = tradeService.readBySellerIdDto(sellerId, pageable);

        String sellerName = "판매자 #" + sellerId;
        if (entityPage.hasContent()) {
            TradePost first = entityPage.getContent().get(0);
            if (first.getSeller() != null && first.getSeller().getNickname() != null) {
                sellerName = first.getSeller().getNickname();
            }
        }

        model.addAttribute("page", dtoPage);
        model.addAttribute("sellerId", sellerId);
        model.addAttribute("sellerName", sellerName);
        model.addAttribute("isSellerList", true);

        return "trade/trade_list";
    }

    /* ===============================================================
       🔥 거래 상세
       ============================================================== */
    @GetMapping("/{tradeId}/article/detail.do")
    public String tradeDetail(@PathVariable Long tradeId,
                              Model model,
                              @SessionAttribute(name = "memberId", required = false) Long memberId) {

        tradeService.increaseViewCount(tradeId);

        TradePost trade = tradeService.readOneTradePostById(tradeId);

        Optional<TradePostImage> coverOpt = tradePostImageService.readOneImage(tradeId);
        String coverUrl = coverOpt.map(TradePostImage::getImageUrl).orElse("/images/dummy/noimg.png");

        model.addAttribute("trade", trade);
        model.addAttribute("coverUrl", coverUrl);
        model.addAttribute("coverImageId", coverOpt.map(TradePostImage::getId).orElse(0L));
        model.addAttribute("currentMemberId", memberId);

        Long sellerId = (trade.getSeller() != null ? trade.getSeller().getId() : trade.getSellerId());
        model.addAttribute("sellerId", sellerId);

        long chatCount = tradeChatRoomRepository.countByTradeId(tradeId);
        long likeCount = tradeBookmarkRepository.countByTradeId(tradeId);
        model.addAttribute("chatCount", chatCount);
        model.addAttribute("likeCount", likeCount);

        boolean liked = (memberId != null) && tradeBookmarkRepository.existsByMemberIdAndTradeId(memberId, tradeId);
        model.addAttribute("liked", liked);

        // 상태 라벨
        String status = trade.getStatus();
        String statusLabel = "판매중";
        String statusClass = "badge-onsale";

        if ("RESERVED".equalsIgnoreCase(status)) {
            statusLabel = "예약중";
            statusClass = "badge-reserved";
        } else if ("SOLD".equalsIgnoreCase(status) || "SOLD_OUT".equalsIgnoreCase(status)) {
            statusLabel = "판매완료";
            statusClass = "badge-sold";
        }

        model.addAttribute("statusLabel", statusLabel);
        model.addAttribute("statusClass", statusClass);

        return "trade/trade_detail";
    }

    /* ===============================================================
       🔥 이미지 상세
       ============================================================== */
    @GetMapping("/{tradeId}/article/{imageId}/detail.do")
    public String imageDetail(@PathVariable Long tradeId,
                              @PathVariable Long imageId,
                              Model model) {

        List<TradePostImage> imageList = tradePostImageService.readAllList(tradeId);

        if (imageList == null || imageList.isEmpty()) {
            TradePostImage dummy = new TradePostImage();
            dummy.setId(0L);
            dummy.setImageUrl("/images/dummy/noimg.png");
            imageList = List.of(dummy);
        }

        boolean exists = imageList.stream().anyMatch(i -> i.getId().equals(imageId));
        Long validImageId = exists ? imageId : imageList.get(0).getId();

        int activeIndex = 0;
        for (int i = 0; i < imageList.size(); i++) {
            if (imageList.get(i).getId().equals(validImageId)) {
                activeIndex = i;
                break;
            }
        }

        model.addAttribute("imageList", imageList);
        model.addAttribute("activeIndex", activeIndex);

        return "trade/trade_image_detail";
    }

    /* ===============================================================
       🔥 글쓰기
       ============================================================== */
    @GetMapping("/{memberId}/write")
    public String writeForm(@Valid TradeWriteValid tradeWriteValid,
                            BindingResult bindingResult,
                            @SessionAttribute(name = "memberId", required = false) Long memberId,
                            @RequestParam(name = "t", required = false) String t,
                            Model model) {

        TradePost post = new TradePost();
        post.setSellerId(memberId);
        if (t != null) post.setTradeType(t);

        model.addAttribute("tradeWriteValid", tradeWriteValid);
        model.addAttribute("memberId", memberId);
        model.addAttribute("post", post);

        return "trade/trade_write";
    }

    @PostMapping("/{memberId}/write")
    public String writeSubmit(@Valid TradeWriteValid tradeWriteValid,
                              BindingResult bindingResult,
                              @SessionAttribute(name = "memberId", required = false) Long memberId,
                              TradePost post,
                              @RequestParam("images") List<MultipartFile> images) {

        post.setSellerId(memberId);

        if (post.getGoodsName() == null || post.getGoodsName().isBlank()) post.setGoodsName(post.getTitle());
        if (post.getTradeType() == null || post.getTradeType().isBlank()) post.setTradeType("SELL");
        if (post.getStatus() == null || post.getStatus().isBlank()) post.setStatus("ON_SALE");

        tradeService.createPostWithImages(post, images);

        messagingTemplate.convertAndSend("/sub/trade.list", "NEW_POST");
        return "redirect:/trade/list.do";
    }

    // edit/delete는 너 코드 그대로(너무 길어서 생략해도 되는데, 이미 붙어있으면 유지하면 됨)
}