package com.smu.tkk.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/auth")
public class LoginController {

    /**
     * 로그인 화면
     * URL  : /auth/login
     * View : templates/auth/login.html
     */
    @GetMapping("/login")
    public String login() {
        return "auth/login";
    }

    /**
     * 회원가입 화면
     * URL  : /auth/join
     * View : templates/auth/join.html
     */
    @GetMapping("/join")
    public String join() {
        return "auth/join";
    }
}