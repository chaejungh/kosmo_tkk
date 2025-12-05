package com.smu.tkk.controller;

import com.smu.tkk.dto.TradePostListDto;
import com.smu.tkk.entity.Member;
import com.smu.tkk.entity.TradePost;
import com.smu.tkk.entity.TradePostImage;
import com.smu.tkk.repository.TradeBookmarkRepository;
import com.smu.tkk.repository.TradeChatRoomRepository;
import com.smu.tkk.service.TradePostImageService;
import com.smu.tkk.service.TradeService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.time.LocalDateTime;
import java.time.temporal.ChronoUnit;
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

    // ✅ 로그인한 회원 ID 가져오는 헬퍼 (세션 키 이름 맞게 수정!)
    private Long getLoginMemberId(HttpSession session) {

        // 1) 전체 Member 객체가 있으면 거기서 바로 PK 꺼내기
        Member loginMember = (Member) session.getAttribute("loginMember");
        if (loginMember != null) {
            return loginMember.getId();
        }

        // 2) PK만 따로 저장된 경우 (memberId)
        Object id = session.getAttribute("memberId");
        if (id instanceof Long) {
            return (Long) id;
        }
        if (id instanceof Integer) {
            return ((Integer) id).longValue();
        }

        // 3) 로그인 안 되어 있으면 null
        return null;
    }

    // ✅ 상세 페이지에서 쓸 상대 시간 계산
    private String calcTimeAgo(LocalDateTime createdAt) {
        if (createdAt == null) return "등록 시간 없음";

        LocalDateTime now = LocalDateTime.now();
        if (createdAt.isAfter(now)) return "방금 전";

        long minutes = ChronoUnit.MINUTES.between(createdAt, now);
        if (minutes < 1) return "방금 전";
        if (minutes < 60) return minutes + "분 전";

        long hours = ChronoUnit.HOURS.between(createdAt, now);
        if (hours < 24) return hours + "시간 전";

        long days = ChronoUnit.DAYS.between(createdAt, now);
        if (days == 1) return "어제";
        if (days < 7) return days + "일 전";

        if (days < 30) {
            long weeks = days / 7;
            if (weeks < 1) weeks = 1;
            return weeks + "주 전";
        }

        if (days < 365) {
            long months = days / 30;
            if (months < 1) months = 1;
            return months + "개월 전";
        }

        long years = days / 365;
        if (years < 1) years = 1;
        return years + "년 전";
    }

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
       ============================================================== */
    @GetMapping("/seller/{sellerId}")
    public String tradeListBySeller(@PathVariable Long sellerId,
                                    @PageableDefault(size = 20, sort = "id", direction = DESC) Pageable pageable,
                                    Model model) {

        Page<TradePost> entityPage = tradeService.readBySellerId(sellerId, pageable);
        Page<TradePostListDto> dtoPage = entityPage.map(tradeService::toListDTO);

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
                              HttpSession session) {

        // 🔥 상세 진입할 때 조회수 +1
        tradeService.increaseViewCount(tradeId);

        TradePost trade = tradeService.readOneTradePostById(tradeId);

        // ✅ 상대 시간 문자열 계산 (몇분 전 / 몇시간 전 / 어제 ...)
        String timeAgo = calcTimeAgo(trade.getCreatedAt());
        model.addAttribute("timeAgo", timeAgo);

        // 표지 이미지
        Optional<TradePostImage> coverOpt = tradePostImageService.readOneImage(tradeId);
        String coverUrl = coverOpt.map(TradePostImage::getImageUrl)
                .orElse("/images/dummy/noimg.png");

        model.addAttribute("trade", trade);
        model.addAttribute("coverUrl", coverUrl);

        Long coverImageId = coverOpt.map(TradePostImage::getId).orElse(0L);
        model.addAttribute("coverImageId", coverImageId);

        // 📌 로그인 user (세션에서)
        Long memberId = getLoginMemberId(session);
        if (memberId == null) {
            memberId = 0L; // 비로그인 상태일 때 표시용
        }
        model.addAttribute("currentMemberId", memberId);

        Long sellerId =
                (trade.getSeller() != null ? trade.getSeller().getId() : trade.getSellerId());
        model.addAttribute("sellerId", sellerId);

        // 🔥 채팅 / 찜 개수
        long chatCount = tradeChatRoomRepository.countByTradeId(tradeId);
        long likeCount = tradeBookmarkRepository.countByTradeId(tradeId);
        model.addAttribute("chatCount", chatCount);
        model.addAttribute("likeCount", likeCount);

        // 🔥 현재 사용자가 이 글을 찜했는지 여부
        boolean liked = false;
        if (memberId != null && memberId != 0L) {
            liked = tradeBookmarkRepository.existsByMemberIdAndTradeId(memberId, tradeId);
        }
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
       ============================================================== */
    @GetMapping("/{memberId}/write")
    public String writeForm(@PathVariable Long memberId,
                            @RequestParam(name = "t", required = false) String t,
                            @RequestParam(name = "tradeId", required = false) Long tradeId,
                            Model model,
                            HttpSession session) {

        // ✅ 세션에서 로그인 사용자 확인
        Long loginMemberId = getLoginMemberId(session);
        if (loginMemberId == null) {
            return "redirect:/login";
        }

        // 🔒 URL에 있는 memberId가 세션이랑 다르면, 세션 기준으로 맞춤
        if (!loginMemberId.equals(memberId)) {
            memberId = loginMemberId;
        }

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
        model.addAttribute("post", post);

        return "trade/trade_write";
    }

    /* ===============================================================
       🔥 이미지 포함 글 등록 / 수정
       ============================================================== */
    @PostMapping("/{memberId}/write")
    public String writeSubmit(@PathVariable Long memberId,
                              TradePost post,
                              @RequestParam(value = "images", required = false) List<MultipartFile> images,
                              HttpSession session) {

        // ✅ 세션에서 로그인 사용자 확인
        Long loginMemberId = getLoginMemberId(session);
        if (loginMemberId == null) {
            return "redirect:/login";
        }
        if (!loginMemberId.equals(memberId)) {
            memberId = loginMemberId;
        }

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
       ============================================================== */
    @PostMapping("/{tradeId}/delete")
    public String deletePost(@PathVariable Long tradeId,
                             HttpSession session) {

        // 📌 로그인 유저
        Long currentMemberId = getLoginMemberId(session);
        if (currentMemberId == null) {
            return "redirect:/login";
        }

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
       ============================================================== */
    @PostMapping("/{tradeId}/status")
    public String updateStatus(@PathVariable Long tradeId,
                               @RequestParam("status") String status,
                               HttpSession session) {

        // 📌 로그인 유저
        Long currentMemberId = getLoginMemberId(session);
        if (currentMemberId == null) {
            return "redirect:/login";
        }

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