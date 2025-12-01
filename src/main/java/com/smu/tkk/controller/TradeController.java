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

    @GetMapping
    public String tradeRoot() {
        return "redirect:/trade/list.do";
    }

    @GetMapping(params = "keyword")
    public String searchTrade(@RequestParam String keyword,
                              @PageableDefault(size = 20, sort = "id", direction = DESC) Pageable pageable,
                              Model model) {

        Page<TradePost> entityPage = tradeService.search(keyword, pageable);
        model.addAttribute("page", entityPage.map(this::toListDTO));
        model.addAttribute("keyword", keyword);

        return "trade/trade_list";
    }

    @GetMapping("/list.do")
    public String tradeList(@PageableDefault(size = 20, sort = "id", direction = DESC) Pageable pageable,
                            Model model) {

        Page<TradePost> entityPage = tradeService.readAll(pageable);
        model.addAttribute("page", entityPage.map(this::toListDTO));

        return "trade/trade_list";
    }

    /* ===============================================================
       거래 상세
       ============================================================== */
    @GetMapping("/{tradeId}/article/detail.do")
    public String tradeDetail(@PathVariable Long tradeId, Model model) {

        TradePost trade = tradeService.readOneTradePostById(tradeId);

        Optional<TradePostImage> coverOpt = tradePostImageService.readOneImage(tradeId);
        String coverUrl = coverOpt.map(TradePostImage::getImageUrl)
                .orElse("/images/dummy/noimg.png");

        model.addAttribute("trade", trade);
        model.addAttribute("coverUrl", coverUrl);

        Long coverImageId = coverOpt.map(TradePostImage::getId).orElse(0L);
        model.addAttribute("coverImageId", coverImageId);

        // ⭐ 핵심: HTML과 동일하게 currentMemberId 전달
        Long memberId = 1L;
        model.addAttribute("currentMemberId", memberId);

        Long sellerId =
                (trade.getSeller() != null ? trade.getSeller().getId() : trade.getSellerId());
        model.addAttribute("sellerId", sellerId);

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
       이미지 상세
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

    @PostMapping("/{memberId}/write")
    public String writeSubmit(@PathVariable Long memberId,
                              @ModelAttribute TradePost post) {

        post.setSellerId(memberId);

        if (post.getStatus() == null) {
            post.setStatus("ON_SALE");
        }

        tradeService.register(post);

        return "redirect:/trade/list.do";
    }

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