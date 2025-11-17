package com.smu.tkk.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class LoginController {

    /**
     * 로그인 페이지
     * /login 요청 → templates/auth/login.html 반환
     */
    @GetMapping("/login")
    public String loginForm() {
        return "auth/login";   // auth 폴더 내부의 login.html 표시
    }

    /**
     * 회원가입 페이지
     * /join 요청 → templates/auth/join.html 반환
     */
    @GetMapping("/join")
    public String joinForm() {
        return "auth/join";    // auth 폴더 내부의 join.html 표시
    }
}