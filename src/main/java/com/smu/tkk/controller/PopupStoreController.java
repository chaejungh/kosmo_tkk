package com.smu.tkk.controller;

import com.smu.tkk.entity.PopupGood;
import com.smu.tkk.entity.PopupStore;
import com.smu.tkk.service.PopupService;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.sql.SQLException;
import java.util.Collections;
import java.util.List;

@Controller
@RequiredArgsConstructor
@RequestMapping("/popupstore")
public class PopupStoreController {

    private final PopupService popupService;

    /**
     * ✅ 팝업 리스트
     * 예) /popupstore/list.do?page=0&pageLimit=20&sort=createAt
     */
    @GetMapping("/list.do")
    public String popupList(
            @PageableDefault(page = 0, size = 10,
                    sort = "createdAt",
                    direction = Sort.Direction.DESC) Pageable pageable,
            Model model
    ) {

        Page<PopupStore> popupList;

        try {
            popupList = popupService.readAll(pageable);
        } catch (Exception e) {
            e.printStackTrace();
            popupList = Page.empty(pageable);
        }

        model.addAttribute("popupList", popupList);

        return "popupstore/popup_list";   // templates/popupstore/popup_list.html
    }

    /**
     * ✅ 팝업 상세 + 이 팝업의 굿즈 목록
     * 예) /popupstore/1/detail.do
     */
    @GetMapping("/{popupId}/detail.do")
    public String popupDetail(
            @PathVariable Long popupId,
            Model model
    ) {

        // 1) 팝업 본문 정보
        PopupStore popup;
        try {
            popup = popupService.readOne(popupId);
        } catch (Exception e) {
            e.printStackTrace();
            popup = new PopupStore();
        }

        // 2) 굿즈 목록 (이 팝업에 속한 것만)
        Pageable goodsPageable = PageRequest.of(
                0,
                100,
                Sort.by(Sort.Direction.ASC, "name")
        );

        List<PopupGood> goodsList;
        try {
            goodsList = popupService.goods(popupId, goodsPageable);
        } catch (Exception e) {
            e.printStackTrace();
            goodsList = Collections.emptyList();
        }

        model.addAttribute("popup", popup);
        model.addAttribute("popupId", popupId);
        model.addAttribute("goodsList", goodsList);

        return "popupstore/popup_detail"; // templates/popupstore/popup_detail.html
    }
}
