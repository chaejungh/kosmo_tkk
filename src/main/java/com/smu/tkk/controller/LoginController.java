package com.smu.tkk.controller;

import com.smu.tkk.entity.Member;
import com.smu.tkk.service.MemberService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.sql.SQLException;

@Controller
@RequiredArgsConstructor
public class LoginController {

    private final MemberService memberService;

    /**
     * 로그인 페이지
     */
    @GetMapping("/login")
    public String loginForm() {
        return "auth/login";   // templates/auth/login.html
    }

    /**
     * 로그인 처리
     */
    @PostMapping("/login")
    public String login(@RequestParam("loginId") String loginId,
                        @RequestParam("loginPw") String loginPw,
                        HttpSession session,
                        Model model) throws SQLException {

        // 🔥 아이디/비번으로 회원 조회
        Member member = memberService.login(loginId, loginPw);

        if (member == null) {
            // 로그인 실패
            model.addAttribute("error", "아이디 또는 비밀번호가 올바르지 않습니다.");
            return "auth/login";
        }

        // ✅ 로그인 성공 → 세션에 저장
        session.setAttribute("loginMember", member);      // 전체 객체
        session.setAttribute("memberId", member.getId()); // PK만 따로

        // 메인으로 이동
        return "redirect:/";
    }

    /**
     * 로그아웃 (있으면 편함)
     */
    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/";
    }
}