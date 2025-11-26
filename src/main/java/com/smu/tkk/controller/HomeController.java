package com.smu.tkk.controller;

import com.smu.tkk.service.PopupService;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
@RequiredArgsConstructor
public class HomeController {

    private final PopupService popupService;  // ⭐ 홈에 팝업 목록 띄우려고 추가

    /**
     * 홈 화면
     * URL : /
     * View : templates/index.html
     */
    @GetMapping("/")
    public String home(Model model) throws Exception {

        // ⭐ 홈 스와이퍼에서 사용할 팝업 리스트  (최대 10개만)
        model.addAttribute("popupList",
                popupService.readAll(PageRequest.of(0, 10)));

        return "index";
    }

    /**
     * 문의 / 고객센터
     * URL : /help
     * View : templates/mypage/service/inquiries.html
     */
    @GetMapping("/help")
    public String help() {
        return "mypage/service/inquiries";
    }
}