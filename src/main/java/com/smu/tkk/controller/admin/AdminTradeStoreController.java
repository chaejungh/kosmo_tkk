package com.smu.tkk.controller.admin;

import com.smu.tkk.entity.PopupStore;
import com.smu.tkk.entity.Store;
import com.smu.tkk.entity.TradePost;
import com.smu.tkk.service.AdminTradeStoreService;
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
@RequiredArgsConstructor
@RequestMapping("/admin/trade-store")
public class AdminTradeStoreController {

    private final AdminTradeStoreService adminTradeStoreService;

    // ===================== 거래글 목록 =====================
    @GetMapping("/trades")
    public String tradeList(@RequestParam(defaultValue = "0") int page,
                            @RequestParam(defaultValue = "20") int size,
                            @RequestParam(required = false) String keyword,
                            Model model) {

        Pageable pageable = PageRequest.of(
                page,
                size,
                Sort.by(Sort.Direction.DESC, "createdAt")
        );

        Page<TradePost> tradePage =
                adminTradeStoreService.readTradePosts(pageable, keyword);

        model.addAttribute("tradePage", tradePage);
        model.addAttribute("keyword", keyword);
        model.addAttribute("page", page);

        return "admin/trade_list";
    }

    // 거래글 소프트 삭제 (DELETED_YN = 'Y')
    @PostMapping("/trades/{tradeId}/delete")
    public String deleteTrade(@PathVariable Long tradeId,
                              @RequestParam(defaultValue = "0") int page,
                              @RequestParam(required = false) String keyword,
                              RedirectAttributes redirectAttributes) {

        adminTradeStoreService.softDeleteTradePost(tradeId);
        redirectAttributes.addFlashAttribute("message", "거래글이 삭제(숨김) 처리되었습니다.");

        return buildTradeRedirect(page, keyword);
    }

    // 거래글 복구 (DELETED_YN = 'N')
    @PostMapping("/trades/{tradeId}/restore")
    public String restoreTrade(@PathVariable Long tradeId,
                               @RequestParam(defaultValue = "0") int page,
                               @RequestParam(required = false) String keyword,
                               RedirectAttributes redirectAttributes) {

        adminTradeStoreService.restoreTradePost(tradeId);
        redirectAttributes.addFlashAttribute("message", "거래글이 복구되었습니다.");

        return buildTradeRedirect(page, keyword);
    }

    // ===================== 상설 매장 목록 =====================
    @GetMapping("/stores")
    public String storeList(@RequestParam(defaultValue = "0") int page,
                            @RequestParam(defaultValue = "20") int size,
                            @RequestParam(required = false) String keyword,
                            Model model) {

        Pageable pageable = PageRequest.of(
                page,
                size,
                Sort.by(Sort.Direction.DESC, "createdAt")
        );

        Page<Store> stores =
                adminTradeStoreService.readStores(pageable, keyword);

        model.addAttribute("stores", stores);
        model.addAttribute("keyword", keyword);
        model.addAttribute("page", page);

        return "admin/store_list";
    }

    @PostMapping("/stores/{storeId}/active")
    public String changeStoreActive(@PathVariable Long storeId,
                                    @RequestParam boolean active,
                                    @RequestParam(defaultValue = "0") int page,
                                    @RequestParam(required = false) String keyword,
                                    RedirectAttributes redirectAttributes) {

        adminTradeStoreService.changeStoreActive(storeId, active);
        redirectAttributes.addFlashAttribute("message", "매장 상태가 변경되었습니다.");

        return buildStoreRedirect(page, keyword);
    }

    // ===================== 팝업스토어 목록 =====================
    @GetMapping("/popups")
    public String popupList(@RequestParam(defaultValue = "0") int page,
                            @RequestParam(defaultValue = "20") int size,
                            @RequestParam(required = false) String keyword,
                            Model model) {

        Pageable pageable = PageRequest.of(
                page,
                size,
                Sort.by(Sort.Direction.DESC, "createdAt")
        );

        Page<PopupStore> popups =
                adminTradeStoreService.readPopupStores(pageable, keyword);

        model.addAttribute("popups", popups);
        model.addAttribute("keyword", keyword);
        model.addAttribute("page", page);

        return "admin/popup_list";
    }

    @PostMapping("/popups/{popupId}/active")
    public String changePopupActive(@PathVariable Long popupId,
                                    @RequestParam boolean active,
                                    @RequestParam(defaultValue = "0") int page,
                                    @RequestParam(required = false) String keyword,
                                    RedirectAttributes redirectAttributes) {

        adminTradeStoreService.changePopupActive(popupId, active);
        redirectAttributes.addFlashAttribute("message", "팝업스토어 상태가 변경되었습니다.");

        return buildPopupRedirect(page, keyword);
    }

    // ===================== redirect 헬퍼 =====================

    private String buildTradeRedirect(int page, String keyword) {
        StringBuilder sb = new StringBuilder("redirect:/admin/trade-store/trades?page=")
                .append(page);
        if (keyword != null && !keyword.isBlank()) {
            sb.append("&keyword=").append(keyword);
        }
        return sb.toString();
    }

    private String buildStoreRedirect(int page, String keyword) {
        StringBuilder sb = new StringBuilder("redirect:/admin/trade-store/stores?page=")
                .append(page);
        if (keyword != null && !keyword.isBlank()) {
            sb.append("&keyword=").append(keyword);
        }
        return sb.toString();
    }

    private String buildPopupRedirect(int page, String keyword) {
        StringBuilder sb = new StringBuilder("redirect:/admin/trade-store/popups?page=")
                .append(page);
        if (keyword != null && !keyword.isBlank()) {
            sb.append("&keyword=").append(keyword);
        }
        return sb.toString();
    }
}
