package com.smu.tkk.controller;

import com.smu.tkk.entity.PopupStore;
import com.smu.tkk.service.PopupService;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.time.LocalDate;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

@Controller
@RequiredArgsConstructor
public class HomeController {

    private final PopupService popupService;

    @GetMapping("/")
    public String home(Model model) throws Exception {

        // ✅ 헤더 active 표시용
        model.addAttribute("activeMenu", "home");

        // 1) 진행 중 팝업 (모달용)
        List<PopupStore> activeList = popupService.active(LocalDate.now());
        List<PopupStore> activePopupList = activeList.stream()
                .limit(4)
                .toList();
        model.addAttribute("activePopupList", activePopupList);

        // 2) 홈 스와이퍼용 (진행중 팝업은 제외해서 중복 방지)
        Page<PopupStore> page = popupService.readAll(PageRequest.of(0, 10));
        List<PopupStore> all = page.getContent();

        Set<Long> activeIds = activeList.stream()
                .map(PopupStore::getId)
                .collect(Collectors.toSet());

        List<PopupStore> homePopupList = all.stream()
                .filter(p -> p.getId() != null && !activeIds.contains(p.getId()))
                .limit(10)
                .toList();

        model.addAttribute("popupList", homePopupList);

        return "index";
    }

    @GetMapping("/help")
    public String help(Model model) {
        model.addAttribute("activeMenu", "help");
        return "mypage/service/inquiries";
    }
}