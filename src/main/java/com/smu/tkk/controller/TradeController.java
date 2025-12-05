package com.smu.tkk.controller;

import com.smu.tkk.dto.TradePostListDto;
import com.smu.tkk.entity.TradePost;
import com.smu.tkk.entity.TradePostImage;
import com.smu.tkk.repository.TradeBookmarkRepository;   // 🔥 추가
import com.smu.tkk.repository.TradeChatRoomRepository;  // 🔥 추가
import com.smu.tkk.service.TradePostImageService;
import com.smu.tkk.service.TradeService;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.messaging.simp.SimpMessagingTemplate;   // ★ WebSocket
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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

    // ★ WebSocket으로 이벤트 쏘기 위해 추가
    private final SimpMessagingTemplate messagingTemplate;

    // 🔥 채팅방 / 북마크 개수 조회용 레포지토리
    private final TradeChatRoomRepository tradeChatRoomRepository;
    private final TradeBookmarkRepository tradeBookmarkRepository;

    @GetMapping
    public String tradeRoot() {
        return "redirect:/trade/list.do";
    }

    /* ===============================================================
       🔥 검색
       ============================================================== */
    @GetMapping(params = "keyword")
    public String searchTrade(@RequestParam String keyword,
                              @PageableDefault(size = 20, sort = "id", direction = DESC) Pageable pageable,
                              Model model) {

        Page<TradePost> entityPage = tradeService.search(keyword, pageable);

        // ⭐ 서비스에서 DTO 변환 수행
        Page<TradePostListDto> dtoPage = entityPage.map(tradeService::toListDTO);

        model.addAttribute("page", dtoPage);
        model.addAttribute("keyword", keyword);

        return "trade/trade_list";
    }

    /* ===============================================================
       🔥 전체 목록
       ============================================================== */
    @GetMapping("/list.do")
    public String tradeList(@PageableDefault(size = 20, sort = "id", direction = DESC) Pageable pageable,
                            Model model) {

        Page<TradePostListDto> dtoPage = tradeService.readAllListDto(pageable);
        model.addAttribute("page", dtoPage);

        return "trade/trade_list";
    }

    /* ===============================================================
       🔥 특정 판매자의 거래글 목록
       URL 예: /trade/seller/1
       ============================================================== */
    @GetMapping("/seller/{sellerId}")
    public String tradeListBySeller(@PathVariable Long sellerId,
                                    @PageableDefault(size = 20, sort = "id", direction = DESC) Pageable pageable,
                                    Model model) {

        // 1) 해당 판매자의 글 목록 조회 (엔티티)
        Page<TradePost> entityPage = tradeService.readBySellerId(sellerId, pageable);

        // 2) DTO 변환
        Page<TradePostListDto> dtoPage = entityPage.map(tradeService::toListDTO);

        // 3) 상단에 보여줄 판매자 이름
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
        model.addAttribute("isSellerList", true);   // 판매자 목록인지 구분용 플래그

        // 👉 기존 리스트 템플릿 재사용
        return "trade/trade_list";
    }

    /* ===============================================================
       🔥 거래 상세
       ============================================================== */
    @GetMapping("/{tradeId}/article/detail.do")
    public String tradeDetail(@PathVariable Long tradeId, Model model) {

        // 🔥 상세 진입할 때 조회수 +1
        tradeService.increaseViewCount(tradeId);

        TradePost trade = tradeService.readOneTradePostById(tradeId);

        // 표지 이미지
        Optional<TradePostImage> coverOpt = tradePostImageService.readOneImage(tradeId);
        String coverUrl = coverOpt.map(TradePostImage::getImageUrl)
                .orElse("/images/dummy/noimg.png");

        model.addAttribute("trade", trade);
        model.addAttribute("coverUrl", coverUrl);

        Long coverImageId = coverOpt.map(TradePostImage::getId).orElse(0L);
        model.addAttribute("coverImageId", coverImageId);

        // 📌 로그인 user (임시) - 나중에 세션/시큐리티로 교체
        Long memberId = 1L;
        model.addAttribute("currentMemberId", memberId);

        Long sellerId =
                (trade.getSeller() != null ? trade.getSeller().getId() : trade.getSellerId());
        model.addAttribute("sellerId", sellerId);

        // 🔥 채팅 / 찜 개수
        long chatCount = tradeChatRoomRepository.countByTradeId(tradeId);
        long likeCount = tradeBookmarkRepository.countByTradeId(tradeId);
        model.addAttribute("chatCount", chatCount);
        model.addAttribute("likeCount", likeCount);

        // 🔥 현재 사용자가 이 글을 찜했는지 여부 → detail.html 의 liked 에 사용
        boolean liked = tradeBookmarkRepository.existsByMemberIdAndTradeId(memberId, tradeId);
        model.addAttribute("liked", liked);

        // 상태 라벨링
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

        final Long targetImageId = imageId;

        boolean exists = imageList.stream()
                .anyMatch(i -> i.getId().equals(targetImageId));

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
       🔥 글쓰기 / 수정 폼
       - tradeId 파라미터가 있으면 "수정 모드"
       - 없으면 "새 글 작성"
       URL 예)
         새 글:   /trade/1/write
         수정:    /trade/1/write?tradeId=10
       ============================================================== */
    @GetMapping("/{memberId}/write")
    public String writeForm(@PathVariable Long memberId,
                            @RequestParam(name = "t", required = false) String t,
                            @RequestParam(name = "tradeId", required = false) Long tradeId,
                            Model model) {

        TradePost post;

        if (tradeId != null) {
            // ✏ 수정 모드
            post = tradeService.readOneTradePostById(tradeId);
            if (post == null) {
                // 글이 없으면 새 글로
                post = new TradePost();
                post.setSellerId(memberId);
            } else {
                // ✅ 권한 체크: 본인 글 아니면 리스트로 튕기기
                if (!post.getSellerId().equals(memberId)) {
                    return "redirect:/trade/list.do";
                }
            }
        } else {
            // 🆕 새 글 작성 모드
            post = new TradePost();
            post.setSellerId(memberId);
            if (t != null) post.setTradeType(t);
        }

        model.addAttribute("memberId", memberId);
        model.addAttribute("post", post);  // 🔥 trade_write.html에서 이 이름으로 받음

        return "trade/trade_write";
    }

    /* ===============================================================
       🔥 이미지 포함 글 등록 / 수정
       - post.id 가 null이면 INSERT
       - post.id 가 있으면 UPDATE (JPA가 merge 해줌)
       ============================================================== */
    @PostMapping("/{memberId}/write")
    public String writeSubmit(@PathVariable Long memberId,
                              TradePost post,
                              @RequestParam(value = "images", required = false) List<MultipartFile> images) {

        System.out.println("📩 [writeSubmit] memberId=" + memberId
                + ", tradeId=" + post.getId()
                + ", 이미지 수=" + (images != null ? images.size() : 0));

        post.setSellerId(memberId);

        if (post.getGoodsName() == null || post.getGoodsName().isBlank()) {
            post.setGoodsName(post.getTitle());
        }

        if (post.getTradeType() == null || post.getTradeType().isBlank()) {
            post.setTradeType("SELL");
        }

        if (post.getStatus() == null || post.getStatus().isBlank()) {
            post.setStatus("ON_SALE");
        }

        // 글 + 이미지 저장 (id 유무에 따라 insert / update)
        tradeService.createPostWithImages(post, images);

        // ★★ 새 글 또는 수정됨 → 리스트 보고 있는 사람들한테 알림 푸시.
        messagingTemplate.convertAndSend("/sub/trade.list", "NEW_OR_UPDATE_POST");

        return "redirect:/trade/list.do";
    }

    /* ===============================================================
       🔥 글 삭제 (작성자만 가능)
       URL: POST /trade/{tradeId}/delete
       ============================================================== */
    @PostMapping("/{tradeId}/delete")
    public String deletePost(@PathVariable Long tradeId) {

        // 📌 로그인 유저 (임시)
        Long currentMemberId = 1L;

        TradePost post = tradeService.readOneTradePostById(tradeId);
        if (post == null) {
            return "redirect:/trade/list.do";
        }

        // ✅ 권한 체크: 내가 쓴 글이 아니면 삭제 불가
        if (!post.getSellerId().equals(currentMemberId)) {
            return "redirect:/trade/" + tradeId + "/article/detail.do";
        }

        tradeService.removeTradePost(post);

        // 리스트 보고 있는 사람들한테도 반영되도록 신호
        messagingTemplate.convertAndSend("/sub/trade.list", "DELETE_POST");

        return "redirect:/trade/list.do";
    }

    /* ===============================================================
       🔥 거래 상태 변경 (판매자만 가능)
       URL: POST /trade/{tradeId}/status
       파라미터: status = ON_SALE / RESERVED / SOLD
       ============================================================== */
    @PostMapping("/{tradeId}/status")
    public String updateStatus(@PathVariable Long tradeId,
                               @RequestParam("status") String status) {

        // 📌 로그인 유저 (임시)
        Long currentMemberId = 1L;

        TradePost post = tradeService.readOneTradePostById(tradeId);
        if (post == null) {
            return "redirect:/trade/list.do";
        }

        // ✅ 권한 체크: 내가 쓴 글이 아니면 상태 변경 불가
        if (!post.getSellerId().equals(currentMemberId)) {
            return "redirect:/trade/" + tradeId + "/article/detail.do";
        }

        // 🔒 허용하는 상태 값만 통과
        if (!"ON_SALE".equalsIgnoreCase(status)
                && !"RESERVED".equalsIgnoreCase(status)
                && !"SOLD".equalsIgnoreCase(status)) {
            return "redirect:/trade/" + tradeId + "/article/detail.do";
        }

        // 실제 상태 변경
        tradeService.updateStatus(tradeId, status);

        // 리스트 화면 보고 있는 사람들한테도 반영되라고 신호 보내기
        messagingTemplate.convertAndSend("/sub/trade.list", "STATUS_CHANGE");

        // 다시 상세로
        return "redirect:/trade/" + tradeId + "/article/detail.do";
    }
}