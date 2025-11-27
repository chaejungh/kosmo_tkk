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
import java.util.Optional;

import static org.springframework.data.domain.Sort.Direction.DESC;

@Controller
@RequiredArgsConstructor
@RequestMapping("/trade")
public class TradeController {

    private final TradeService tradeService;
    private final TradePostImageService tradePostImageService;

    /* ===============================================================
       0) /trade 로 들어오면 리스트로 이동
       URL : GET /trade
       → /trade/list.do 로 리다이렉트
       ============================================================== */
    @GetMapping
    public String tradeRoot() {
        return "redirect:/trade/list.do";
    }

    /* ===============================================================
       1) 검색  — /trade?keyword=
       URL : GET /trade?keyword=검색어
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
       2) 거래 리스트 — /trade/list.do
       URL : GET /trade/list.do?page=&pageLimit=&sort=
       (pageLimit, sort 는 나중에 Pageable 커스텀해도 됨)
       ============================================================== */
    @GetMapping("/list.do")
    public String tradeList(@PageableDefault(size = 20, sort = "id", direction = DESC) Pageable pageable,
                            Model model) {

        Page<TradePost> entityPage = tradeService.readAll(pageable);
        model.addAttribute("page", entityPage.map(this::toListDTO));

        return "trade/trade_list";
    }

    /* ===============================================================
       3) 거래 상세 — /trade/{tradePostId}/article/detail.do
       URL : GET /trade/{tradeId}/article/detail.do
       ============================================================== */
    @GetMapping("/{tradeId}/article/detail.do")
    public String tradeDetail(@PathVariable Long tradeId, Model model) {

        TradePost trade = tradeService.readOneTradePostById(tradeId);

        Optional<TradePostImage> coverOpt = tradePostImageService.readOneImage(tradeId);
        String coverUrl = coverOpt.map(TradePostImage::getImageUrl)
                .orElse("/images/dummy/noimg.png");

        model.addAttribute("trade", trade);
        model.addAttribute("coverUrl", coverUrl);

        return "trade/trade_detail";
    }

    /* ===============================================================
       4) 이미지 상세 — /trade/{tradePostId}/article/{imageId}/detail.do
       URL : GET /trade/{tradeId}/article/{imageId}/detail.do
       ============================================================== */
    @GetMapping("/{tradeId}/article/{imageId}/detail.do")
    public String imageDetail(@PathVariable Long tradeId,
                              @PathVariable Long imageId,
                              Model model) {

        TradePostImage image = tradePostImageService.readOneImageById(imageId);
        model.addAttribute("image", image);

        return "trade/trade_image_detail";
    }

    /* ===============================================================
       5) 글쓰기 폼 — /trade/{memberId}/write?t=
       URL : GET /trade/{memberId}/write?t=SELL (또는 BUY 등)
       ============================================================== */
    @GetMapping("/{memberId}/write")
    public String writeForm(@PathVariable Long memberId,
                            @RequestParam(name = "t", required = false) String t,
                            Model model) {

        TradePost post = new TradePost();
        post.setSellerId(memberId);      // 작성자
        if (t != null) {
            post.setTradeType(t);        // t 로 타입 받아서 기본값 세팅
        }

        model.addAttribute("memberId", memberId);
        model.addAttribute("post", post); // th:object 에서 사용

        return "trade/trade_write";
    }

    /* ===============================================================
       6) 글쓰기 저장 — /trade/{memberId}/write
       URL : POST /trade/{memberId}/write
       form 에서 넘어온 값으로 TradePost 저장
       ============================================================== */
    @PostMapping("/{memberId}/write")
    public String writeSubmit(@PathVariable Long memberId,
                              @ModelAttribute TradePost post) {

        // seller 고정
        post.setSellerId(memberId);

        // 상태 기본값 (null 들어오면 ON_SALE 로)
        if (post.getStatus() == null) {
            post.setStatus("ON_SALE");
        }

        tradeService.register(post);  // 구현체에서 save 해주는 메서드라고 가정

        // 방금 작성한 글 상세로 보내도 되고, 리스트로 보내도 됨
        // 아이디 세팅이 확실치 않으니 우선 리스트로 리다이렉트
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

        if (post.getPrice() == null) {
            dto.setPriceText("가격 미정");
        } else {
            dto.setPriceText(String.format("%,d원", post.getPrice()));
        }

        LocalDate created = post.getCreatedAt();
        if (created == null) {
            dto.setTimeAgo("방금 전");
        } else {
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