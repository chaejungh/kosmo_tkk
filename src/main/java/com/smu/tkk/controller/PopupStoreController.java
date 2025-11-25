package com.smu.tkk.controller;

import com.smu.tkk.entity.PopupStore;
import com.smu.tkk.service.PopupService;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Collections;
import java.util.List;

@Controller
@RequiredArgsConstructor
@RequestMapping("/popupstore")
public class PopupStoreController {

    private final PopupService popupService;

    /**
     * ✅ 팝업 리스트
     * 예) /popupstore/list.do?page=1&pageLimit=20&sort=createAt
     */
    @GetMapping("/list.do")
    public String popupList(
            @RequestParam(defaultValue = "1") int page,
            @RequestParam(defaultValue = "20") int pageLimit,
            @RequestParam(defaultValue = "createAt") String sort,  // 일단 받기만
            Model model
    ) {

        Pageable pageable = PageRequest.of(page - 1, pageLimit);
        List<PopupStore> popupList;

        try {
            popupList = popupService.readAll(pageable);
        } catch (Exception e) {
            e.printStackTrace();
            popupList = Collections.emptyList();
        }

        model.addAttribute("popupList", popupList);
        model.addAttribute("page", page);
        model.addAttribute("pageLimit", pageLimit);
        model.addAttribute("sort", sort);

        return "popupstore/popup_list";   // templates/popupstore/popup_list.html
    }

    /**
     * ✅ 팝업 상세
     * 예) /popupstore/1/detail.do
     */
    @GetMapping("/{popupId}/detail.do")
    public String popupDetail(
            @PathVariable Long popupId,
            Model model
    ) {

        PopupStore popup = null;

        try {
            popup = popupService.readOne(popupId);
        } catch (Exception e) {
            e.printStackTrace();
        }

        if (popup == null) {
            popup = new PopupStore();
        }

        model.addAttribute("popup", popup);
        model.addAttribute("popupId", popupId);

        return "popupstore/popup_detail"; // templates/popupstore/popup_detail.html
    }
}