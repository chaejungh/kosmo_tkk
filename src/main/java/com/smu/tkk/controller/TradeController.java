package com.smu.tkk.controller;

import com.smu.tkk.dto.BoardWriteValid;
import com.smu.tkk.dto.ChatRoomListDTO;
import com.smu.tkk.dto.TradePostListDto;
import com.smu.tkk.dto.TradeWriteValid;
import com.smu.tkk.entity.*;
import com.smu.tkk.repository.TradeBookmarkRepository;  // 🔥 추가
import com.smu.tkk.repository.TradeChatRoomRepository;   // 🔥 추가
import com.smu.tkk.service.TradeChatService;
import com.smu.tkk.service.TradePostImageService;
import com.smu.tkk.service.TradeService;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.messaging.simp.SimpMessagingTemplate;   // ★ WebSocket
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
    public String tradeList(
            @RequestParam(required = false) String sort,
            Pageable pageable,
            @SessionAttribute(name = "memberId",required = false) Long memberId,
            Model model) {

        int unreadCount=0;
        List<ChatRoomListDTO> rooms = tradeChatService.getChatRoomList(memberId);
        for (ChatRoomListDTO room : rooms){
            unreadCount = room.getUnreadCount();
        }



        // 🔥 pageable 의 정렬 정보 제거
        pageable = Pageable.ofSize(pageable.getPageSize())
                .withPage(pageable.getPageNumber());

        Page<TradePostListDto> result;

        if ("like".equals(sort)) {
            result = tradeService.readAllOrderByLike(pageable);

        } else if ("view".equals(sort)) {
            result = tradeService.readAllOrderByView(pageable);

        } else {
            result = tradeService.readAllOrderByLatest(pageable);
        }

        model.addAttribute("page", result);
        model.addAttribute("sort", sort);
        model.addAttribute("unreadCount", unreadCount);
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
    public String tradeDetail(@PathVariable Long tradeId,
                              Model model,
                              @SessionAttribute(name = "memberId",required = false) Long memberId) {

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
       🔥 글쓰기 페이지
       ============================================================== */
    @GetMapping("/{memberId}/write")
    public String writeForm(
                            @Valid TradeWriteValid tradeWriteValid,
                            BindingResult bindingResult,
                            @SessionAttribute(name = "memberId",required = false) Long memberId,
                            @RequestParam(name = "t", required = false) String t,
                            Model model) {

        TradePost post = new TradePost();
        post.setSellerId(memberId);
        if (t != null) post.setTradeType(t);
        model.addAttribute("tradeWriteValid",tradeWriteValid);
        model.addAttribute("memberId", memberId);
        model.addAttribute("post", post);

        return "trade/trade_write";
    }

    /* ===============================================================
       🔥 이미지 포함 글 등록
       ============================================================== */
    @PostMapping("/{memberId}/write")
    public String writeSubmit(
                                @Valid TradeWriteValid tradeWriteValid,
                                BindingResult bindingResult,
                                @SessionAttribute(name = "memberId",required = false) Long memberId,
                                TradePost post,
                                @RequestParam("images") List<MultipartFile> images) {

        System.out.println("📩 [writeSubmit] memberId=" + memberId
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

        // 글 + 이미지 저장
        tradeService.createPostWithImages(post, images);

        // ★★ 새 글 등록됨 → 리스트 보고 있는 사람들한테 알림 푸시.
        messagingTemplate.convertAndSend("/sub/trade.list", "NEW_POST");

        return "redirect:/trade/list.do";
    }


    @GetMapping("/{memberId}/article/{postId}/edit.do")
    public String editForm(
                            @SessionAttribute(name = "memberId",required = false) Long memberId,
                            @PathVariable Long postId,
                            Model model) throws Exception {


        // 게시글 조회
        TradePost post = tradeService.readOneTradePostById(postId);
        if (post == null) {
            return "redirect:/trade/list.do"; // 없으면 대략 리스트로
        }

        //  작성자 본인인지 한 번 더 확인
        if (!post.getSellerId().equals(memberId)) {
            return "redirect:/board/not-allowed";
        }

        // 폼 바인딩용 DTO 세팅 (BoardWriteValid 기준)
        TradeWriteValid form = new TradeWriteValid();
        form.setTitle(post.getTitle());
        form.setPrice(post.getPrice());
        form.setCategory(post.getCategory());
        form.setRegion(post.getRegion());
        form.setTradeMethod(post.getTradeMethod());
        form.setContent(post.getContent());
        form.setStatus(post.getStatus());
        model.addAttribute("memberId", memberId);
        model.addAttribute("postId", postId);
        model.addAttribute("tradeWriteValid", form);
        model.addAttribute("mode", "edit");

        // 👉 별도 템플릿을 쓰면 "board/board_edit",
        //    기존 작성 폼 재사용이면 "board/board_write" 로 맞춰서 사용
        return "trade/trade_write";
    }
    // 게시글 수정 처리
// =============================
    @PostMapping("/{memberId}/article/{postId}/edit.do")
    public String editSubmit(@SessionAttribute(name = "memberId",required = false) Long memberId,
                             @PathVariable Long postId,
                             @Valid TradeWriteValid tradeWriteValid,
                             BindingResult bindingResult,
                             Model model) throws Exception {


        TradePost post = tradeService.readOneTradePostById(postId);
        if (post == null || !post.getSellerId().equals(memberId)) {
            return "redirect:/board/not-allowed";
        }

        // 유효성 에러 있으면 다시 폼으로
        if (bindingResult.hasErrors()) {
            model.addAttribute("memberId", memberId);
            model.addAttribute("postId", postId);
            return "trade/trade_write";
        }

        // 변경 값 세팅
        post.setTitle(tradeWriteValid.getTitle());
        post.setPrice(tradeWriteValid.getPrice());
        post.setCategory(tradeWriteValid.getCategory());
        post.setRegion(tradeWriteValid.getRegion());
        post.setTradeMethod(tradeWriteValid.getTradeMethod());
        post.setContent(tradeWriteValid.getContent());
        post.setStatus(tradeWriteValid.getStatus());
        post.setDeletedYn("N");
        try {
            TradePost success = tradeService.modifyTradePost(post);
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("errorMessage", "게시글 수정에 실패했습니다.");
            model.addAttribute("memberId", memberId);
            model.addAttribute("postId", postId);
            return "trade/trade_write";
        }

        // 수정 후 상세로 이동
        return "redirect:/trade/" + postId +"/article/detail.do";
    }



    @GetMapping("/{memberId}/article/{postId}/delete.do")
    public String deletePost(@SessionAttribute(name = "memberId",required = false) Long memberId,
                             @PathVariable Long postId,
                             HttpSession session) throws Exception {


        TradePost post = tradeService.readOneTradePostById(postId);
        if (post == null || !post.getSellerId().equals(memberId)) {
            return "redirect:/board/not-allowed";
        }

        tradeService.removeTradePost(post);  // 내부에서 deleted_yn = 'Y' 소프트 삭제라고 가정

        // 삭제 후 해당 카테고리 리스트로 이동
        return "redirect:/trade/list.do";
    }



}