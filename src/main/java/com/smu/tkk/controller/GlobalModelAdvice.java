package com.smu.tkk.controller;

import jakarta.servlet.http.HttpSession;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;

@ControllerAdvice
public class GlobalModelAdvice {

    // 모든 컨트롤러의 Model 에 자동으로 들어감
    @ModelAttribute("nickname")
    public String loginNickname(HttpSession session) {
        return (String) session.getAttribute("nickname");
    }

    @ModelAttribute("memberId")
    public Long loginMemberId(HttpSession session) {
        return (Long) session.getAttribute("memberId");
    }
}
