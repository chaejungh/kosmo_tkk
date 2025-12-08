package com.smu.tkk.controller.admin;

import com.smu.tkk.entity.TradePost;
import com.smu.tkk.repository.TradePostRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.util.UriUtils;

import java.nio.charset.StandardCharsets;

@Controller
@RequiredArgsConstructor
@RequestMapping("/admin/trades")
public class AdminTradeController {

    private final TradePostRepository tradePostRepository;

    /**
     * 거래글 리스트 (관리자용)
     *  - /admin/trades?page=0&keyword=테스트
     */
    @GetMapping
    public String tradeList(@RequestParam(value = "page", defaultValue = "0") int page,
                            @RequestParam(value = "keyword", required = false) String keyword,
                            Model model) {

        Pageable pageable = PageRequest.of(page, 20, Sort.by(Sort.Direction.DESC, "id"));

        // 검색 기능이 아직 없으면 일단 전체 조회만 사용
        Page<TradePost> tradePage = tradePostRepository.findAll(pageable);

        model.addAttribute("tradePage", tradePage);
        model.addAttribute("keyword", keyword);

        return "admin/trade_list";
    }

    /**
     * 거래글 상세 (관리자용)
     *  - GET /admin/trades/{id}
     */
    @GetMapping("/{id}")
    public String tradeDetail(@PathVariable Long id,
                              @RequestParam(value = "page", defaultValue = "0") int page,
                              @RequestParam(value = "keyword", required = false) String keyword,
                              Model model) {

        TradePost trade = tradePostRepository.findById(id)
                .orElseThrow(() -> new IllegalArgumentException("거래글 없음 : " + id));

        model.addAttribute("trade", trade);
        model.addAttribute("page", page);
        model.addAttribute("keyword", keyword);

        // templates/admin/trade_detail.html
        return "admin/trade_detail";
    }

    /**
     * 거래 상태 변경 (SALE / RESERVED / COMPLETED)
     *  - POST /admin/trades/{id}/status
     */
    @PostMapping("/{id}/status")
    public String changeStatus(@PathVariable Long id,
                               @RequestParam("status") String status,
                               @RequestParam(value = "page", defaultValue = "0") int page,
                               @RequestParam(value = "keyword", required = false) String keyword,
                               RedirectAttributes rttr) {

        TradePost trade = tradePostRepository.findById(id)
                .orElseThrow(() -> new IllegalArgumentException("거래글 없음 : " + id));

        // TradePost 엔티티에 setStatus(...) 메서드 있어야 함
        trade.setStatus(status);
        tradePostRepository.save(trade);

        rttr.addFlashAttribute("message", "거래 상태를 변경했습니다.");

        String redirectUrl = buildRedirectUrl(page, keyword);
        return redirectUrl;
    }

    /**
     * 거래글 삭제 (관리자용)
     *  - POST /admin/trades/{id}/delete
     *  - 일단 물리 삭제 (필요하면 나중에 deletedYn 플래그로 변경)
     */
    @PostMapping("/{id}/delete")
    public String deleteTrade(@PathVariable Long id,
                              @RequestParam(value = "page", defaultValue = "0") int page,
                              @RequestParam(value = "keyword", required = false) String keyword,
                              RedirectAttributes rttr) {

        tradePostRepository.deleteById(id);
        rttr.addFlashAttribute("message", "거래글이 삭제되었습니다.");

        String redirectUrl = buildRedirectUrl(page, keyword);
        return redirectUrl;
    }

    // 공통 리다이렉트 URL 생성
    private String buildRedirectUrl(int page, String keyword) {
        StringBuilder sb = new StringBuilder();
        sb.append("redirect:/admin/trades?page=").append(page);

        if (keyword != null && !keyword.isBlank()) {
            sb.append("&keyword=");
            sb.append(UriUtils.encode(keyword, StandardCharsets.UTF_8));
        }

        return sb.toString();
    }
}
