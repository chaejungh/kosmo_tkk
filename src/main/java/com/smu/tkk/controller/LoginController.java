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
                        HttpSession session,
                        Model model) throws SQLException {

        Member member = memberService.login(loginId, loginPw);

        if (member == null) {
            model.addAttribute("error", "아이디 또는 비밀번호가 올바르지 않습니다.");
            return "auth/login"; // 로그인 실패 시 다시 로그인 페이지로
        }

        // ✅ 로그인 성공 시 세션 저장
        session.setAttribute("loginMember", member);
        session.setAttribute("memberId", member.getId());

        // ✅ 로그인 후 메인 페이지로 이동
        return "redirect:/";
    }
}
