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

@Controller
@RequestMapping("/admin/trades")
@RequiredArgsConstructor
public class AdminTradeController {

    private final TradePostRepository tradePostRepository;

    /** 거래글 리스트 */
    @GetMapping
    public String tradeList(@RequestParam(value = "page", defaultValue = "0") int page,
                            @RequestParam(value = "keyword", required = false) String keyword,
                            Model model) {

        Pageable pageable = PageRequest.of(page, 20, Sort.by(Sort.Direction.DESC, "id"));

        Page<TradePost> tradePage;
        if (keyword != null && !keyword.isBlank()) {
            tradePage = tradePostRepository.search(keyword, pageable);
        } else {
            tradePage = tradePostRepository.findByDeletedYnIsNullOrDeletedYn("N", pageable);
        }

        model.addAttribute("tradePage", tradePage);
        model.addAttribute("keyword", keyword);

        return "admin/trade_list";
    }

    /** 거래글 상세 (관리자용) */
    @GetMapping("/{id}")
    public String tradeDetail(@PathVariable Long id,
                              @RequestParam(value = "page", defaultValue = "0") int page,
                              @RequestParam(value = "keyword", required = false) String keyword,
                              Model model) {

        TradePost trade = tradePostRepository.findById(id)
                .orElseThrow(() -> new IllegalArgumentException("거래글 없음: " + id));

        model.addAttribute("trade", trade);
        model.addAttribute("page", page);
        model.addAttribute("keyword", keyword);

        return "admin/trade_detail";
    }

    /** 거래 상태 변경 (판매중/예약중/완료) */
    @PostMapping("/{id}/status")
    public String changeStatus(@PathVariable Long id,
                               @RequestParam("status") String status,
                               @RequestParam(value = "page", defaultValue = "0") int page,
                               @RequestParam(value = "keyword", required = false) String keyword,
                               RedirectAttributes rattr) {

        tradePostRepository.modify(status, id);
        rattr.addFlashAttribute("message", "거래 상태가 변경되었습니다.");
        return buildRedirectUrl(page, keyword);
    }

    /** 거래글 삭제(숨김) */
    @PostMapping("/{id}/delete")
    public String deleteTrade(@PathVariable Long id,
                              @RequestParam(value = "page", defaultValue = "0") int page,
                              @RequestParam(value = "keyword", required = false) String keyword,
                              RedirectAttributes rattr) {

        TradePost trade = tradePostRepository.findById(id)
                .orElseThrow(() -> new IllegalArgumentException("거래글 없음: " + id));

        trade.setDeletedYn("Y");  // 🔥 문자열 Y
        tradePostRepository.save(trade);

        rattr.addFlashAttribute("message", "거래글이 삭제(숨김) 처리되었습니다.");
        return buildRedirectUrl(page, keyword);
    }

    /** 거래글 복구 */
    @PostMapping("/{id}/restore")
    public String restoreTrade(@PathVariable Long id,
                               @RequestParam(value = "page", defaultValue = "0") int page,
                               @RequestParam(value = "keyword", required = false) String keyword,
                               RedirectAttributes rattr) {

        TradePost trade = tradePostRepository.findById(id)
                .orElseThrow(() -> new IllegalArgumentException("거래글 없음: " + id));

        trade.setDeletedYn("N");  // 🔥 문자열 N
        tradePostRepository.save(trade);

        rattr.addFlashAttribute("message", "거래글이 복구되었습니다.");
        return buildRedirectUrl(page, keyword);
    }

    // 공통 리다이렉트 URL 구성
    private String buildRedirectUrl(int page, String keyword) {
        StringBuilder sb = new StringBuilder();
        sb.append("redirect:/admin/trades?page=").append(page);
        if (keyword != null && !keyword.isBlank()) {
            sb.append("&keyword=").append(keyword);
        }
        return sb.toString();
    }
}
