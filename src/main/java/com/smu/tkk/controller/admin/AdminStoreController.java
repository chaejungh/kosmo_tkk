package com.smu.tkk.controller.admin;

import com.smu.tkk.entity.Store;
import com.smu.tkk.repository.StoreRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequiredArgsConstructor
@RequestMapping("/admin/stores")
public class AdminStoreController {

    private final StoreRepository storeRepository;

    /**
     * 매장 리스트 (관리자용)
     *  - /admin/stores?page=0&type=...&keyword=...
     */
    @GetMapping
    public String storeList(@RequestParam(value = "page", defaultValue = "0") int page,
                            @RequestParam(value = "type", required = false) String type,
                            @RequestParam(value = "keyword", required = false) String keyword,
                            Model model) {

        Pageable pageable = PageRequest.of(page, 20, Sort.by(Sort.Direction.DESC, "id"));
        Page<Store> storePage = storeRepository.findAll(pageable);

        // 템플릿에서 쓰는 이름: stores
        model.addAttribute("stores", storePage);
        model.addAttribute("page", page);
        model.addAttribute("type", type);
        model.addAttribute("keyword", keyword);

        return "admin/store_list";
    }

    /**
     * 매장 상세 (관리자용)
     *  - /admin/stores/{id}
     */
    @GetMapping("/{id}")
    public String storeDetail(@PathVariable Long id,
                              @RequestParam(value = "page", defaultValue = "0") int page,
                              @RequestParam(value = "type", required = false) String type,
                              @RequestParam(value = "keyword", required = false) String keyword,
                              Model model) {

        Store store = storeRepository.findById(id)
                .orElseThrow(() -> new IllegalArgumentException("매장 없음 : " + id));

        model.addAttribute("store", store);
        model.addAttribute("page", page);
        model.addAttribute("type", type);
        model.addAttribute("keyword", keyword);

        return "admin/store_detail";
    }

    /**
     * 매장 숨김/노출 토글
     *  - POST /admin/stores/{id}/toggle
     */
    @PostMapping("/{id}/toggle")
    public String toggleStore(@PathVariable Long id,
                              @RequestParam(value = "page", defaultValue = "0") int page,
                              @RequestParam(value = "type", required = false) String type,
                              @RequestParam(value = "keyword", required = false) String keyword) {

        Store store = storeRepository.findById(id)
                .orElseThrow(() -> new IllegalArgumentException("매장 없음 : " + id));

        String deletedYn = store.getDeletedYn();

        if (deletedYn == null || "N".equals(deletedYn)) {
            store.setDeletedYn("Y");  // 노출 → 숨김
        } else {
            store.setDeletedYn("N");  // 숨김 → 노출
        }

        storeRepository.save(store);

        String redirectUrl = String.format(
                "redirect:/admin/stores?page=%d%s%s",
                page,
                (type == null || type.isBlank()) ? "" : "&type=" + type,
                (keyword == null || keyword.isBlank()) ? "" : "&keyword=" + keyword
        );

        return redirectUrl;
    }
}
