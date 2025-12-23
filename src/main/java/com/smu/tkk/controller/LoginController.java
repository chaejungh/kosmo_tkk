package com.smu.tkk.controller;

import com.smu.tkk.entity.Member;
import com.smu.tkk.service.MemberService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*; // ✅ PostMapping, RequestParam 등 추가

import java.sql.SQLException;

@Controller
@RequiredArgsConstructor
public class LoginController {

    private final MemberService memberService;

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

    // ✅ 여기에 로그인 처리 로직 추가
    @PostMapping("/login")
    public String login(@RequestParam String loginId,
                        @RequestParam String loginPw,
                        Model model,
                        HttpSession session) throws SQLException {

        Member member = memberService.login(loginId, loginPw);

        // ❌ 로그인 실패
        if (member == null) {
            model.addAttribute("msg", "아이디 또는 비밀번호가 올바르지 않습니다.");
            return "auth/login";   // ✔ 반드시 auth/login
        }

        // ✅ 정상 로그인
        session.setAttribute("memberId", member.getId());
        session.setAttribute("loginMember", member);

        return "redirect:/";
    }
    @GetMapping({"/member/login", "/member/login.do"})
    public String memberLoginAlias() {
        return "redirect:/login";
    }
}
