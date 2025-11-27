package com.smu.tkk.controller;

import com.smu.tkk.dto.TradePostListDto;
import com.smu.tkk.entity.TradePost;
import com.smu.tkk.entity.TradePostImage;
import com.smu.tkk.service.TradePostImageService;
import com.smu.tkk.service.TradeService;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;
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

    /* ===============================================================
       0) /trade → /trade/list.do 이동
       ============================================================== */
    @GetMapping
    public String tradeRoot() {
        return "redirect:/trade/list.do";
    }

    /* ===============================================================
       1) 검색 — GET /trade?keyword=
       ============================================================== */
    @GetMapping(params = "keyword")
    public String searchTrade(@RequestParam String keyword,
                              @PageableDefault(size = 20, sort = "id", direction = DESC) Pageable pageable,
                              Model model) {

        Page<TradePost> entityPage = tradeService.search(keyword, pageable);
        model.addAttribute("page", entityPage.map(this::toListDTO));
        model.addAttribute("keyword", keyword);

        return "trade/trade_list";
    }

    /* ===============================================================
       2) 거래 리스트 — GET /trade/list.do
       ============================================================== */
    @GetMapping("/list.do")
    public String tradeList(@PageableDefault(size = 20, sort = "id", direction = DESC) Pageable pageable,
                            Model model) {

        Page<TradePost> entityPage = tradeService.readAll(pageable);
        model.addAttribute("page", entityPage.map(this::toListDTO));

        return "trade/trade_list";
    }

    /* ===============================================================
       3) 거래 상세 — GET /trade/{tradeId}/article/detail.do
       ============================================================== */
    @GetMapping("/{tradeId}/article/detail.do")
    public String tradeDetail(@PathVariable Long tradeId, Model model) {

        TradePost trade = tradeService.readOneTradePostById(tradeId);

        Optional<TradePostImage> coverOpt = tradePostImageService.readOneImage(tradeId);
        String coverUrl = coverOpt.map(TradePostImage::getImageUrl)
                .orElse("/images/dummy/noimg.png");

        model.addAttribute("trade", trade);
        model.addAttribute("coverUrl", coverUrl);

        // ⭐ 추가: coverImageId 전달
        Long coverImageId = coverOpt.map(TradePostImage::getId).orElse(0L);
        model.addAttribute("coverImageId", coverImageId);

        Long currentMemberId = 1L;
        model.addAttribute("currentMemberId", currentMemberId);

        model.addAttribute("sellerId", trade.getSellerId());

        return "trade/trade_detail";
    }

    /* ===============================================================
       4) 이미지 상세 ( 갤러리 + 예외 완전 방지 + 람다 오류 수정)
       ============================================================== */
    @GetMapping("/{tradeId}/article/{imageId}/detail.do")
    public String imageDetail(@PathVariable Long tradeId,
                              @PathVariable Long imageId,
                              Model model) {

        // 전체 이미지 목록 가져오기
        List<TradePostImage> imageList = tradePostImageService.readAllList(tradeId);

        // ① 이미지가 아예 없으면 dummy 생성
        if (imageList == null || imageList.isEmpty()) {
            TradePostImage dummy = new TradePostImage();
            dummy.setId(0L);
            dummy.setImageUrl("/images/dummy/noimg.png");
            imageList = List.of(dummy);
        }

        //  람다 비교용 final 변수
        final Long targetImageId = imageId;

        // ② imageId가 실제 이미지에 없으면 첫 이미지로 교체
        boolean exists = imageList.stream()
                .anyMatch(i -> i.getId().equals(targetImageId));

        Long validImageId = exists ? imageId : imageList.get(0).getId();

        // ③ 현재 이미지 index 계산
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
       5) 글쓰기 폼 — GET /trade/{memberId}/write?t=
       ============================================================== */
    @GetMapping("/{memberId}/write")
    public String writeForm(@PathVariable Long memberId,
                            @RequestParam(name = "t", required = false) String t,
                            Model model) {

        TradePost post = new TradePost();
        post.setSellerId(memberId);
        if (t != null) post.setTradeType(t);

        model.addAttribute("memberId", memberId);
        model.addAttribute("post", post);

        return "trade/trade_write";
    }

    /* ===============================================================
       6) 글쓰기 저장 — POST /trade/{memberId}/write
       ============================================================== */
    @PostMapping("/{memberId}/write")
    public String writeSubmit(@PathVariable Long memberId,
                              @ModelAttribute TradePost post) {

        post.setSellerId(memberId);

        // 기본 상태값
        if (post.getStatus() == null) {
            post.setStatus("ON_SALE");
        }

        // 저장
        tradeService.register(post);

        // 저장 후 목록으로 이동
        return "redirect:/trade/list.do";
    }

    /* ===============================================================
       DTO 변환
       ============================================================== */
    private TradePostListDto toListDTO(TradePost post) {

        TradePostListDto dto = new TradePostListDto();

        dto.setId(post.getId());
        dto.setTitle(post.getTitle());
        dto.setRegion(post.getRegion() != null ? post.getRegion() : "지역 미지정");

        if (post.getPrice() == null) dto.setPriceText("가격 미정");
        else dto.setPriceText(String.format("%,d원", post.getPrice()));

        LocalDate created = post.getCreatedAt();
        if (created == null) dto.setTimeAgo("방금 전");
        else {
            long days = ChronoUnit.DAYS.between(created, LocalDate.now());
            dto.setTimeAgo(days == 0 ? "오늘" :
                    days == 1 ? "어제" :
                            days < 7 ? days + "일 전" :
                                    created.toString());
        }

        if (post.getTradePostImages() != null && !post.getTradePostImages().isEmpty()) {
            dto.setThumbnailUrl(post.getTradePostImages().iterator().next().getImageUrl());
        }

        return dto;
    }
}