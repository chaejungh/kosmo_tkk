package com.smu.tkk.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {

    /**
     * 홈 화면
     * URL  : /
     * View : templates/index.html
     */
    @GetMapping("/")
    public String home() {
        return "index";
    }

    /**
     * 문의 / 고객센터 진입 (플로팅 버튼)
     * URL  : /help
     * View : templates/mypage/service/inquiries.html
     *       (혹은 네가 만든 help 전용 화면으로 바꿔도 됨)
     */
    @GetMapping("/help")
    public String help() {
        // 만약 별도 help.html 쓰고 싶으면 "mypage/service/inquiries" 대신 "mypage/service/help" 등으로 바꿔도 돼.
        return "mypage/service/inquiries";
    }
}