package com.smu.tkk.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {

    // 홈 화면
    @GetMapping("/")
    public String home() {
        return "index";   // templates/index.html
    }

    // 덕질게시판
    @GetMapping("/board")
    public String board() {
        return "user/board";
    }

    // 굿즈거래
    @GetMapping("/trade")
    public String trade() {
        return "user/trade";
    }

    // 마이페이지
    @GetMapping("/mypage")
    public String mypage() {
        return "user/mypage";
    }

    // 문의/도움말
    @GetMapping("/help")
    public String help() {
        return "user/help";
    }
}