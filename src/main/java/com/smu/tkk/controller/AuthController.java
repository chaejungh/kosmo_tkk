package com.smu.tkk.controller;

import com.smu.tkk.entity.Member;
import com.smu.tkk.repository.MemberRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import jakarta.servlet.http.HttpSession;

@Controller
@RequiredArgsConstructor
@RequestMapping("/auth")
public class AuthController {

    private final MemberRepository memberRepository;

    /**
     * 로그인 화면
     * URL  : /auth/login  또는 /auth/login.do
     * View : templates/auth/login.html
     */
    @GetMapping({"/login", "/login.do"})
    public String loginForm() {
        return "auth/login";
    }

    /**
     * 로그인 처리
     * POST : /auth/login  또는 /auth/login.do
     */
    @PostMapping({"/login", "/login.do"})
    public String login(
            @RequestParam String loginId,
            @RequestParam String loginPw,
            HttpSession session,
            RedirectAttributes rttr
    ) {

        // MEMBER 테이블에 아이디+비밀번호 조합이 존재하는지 검사
        boolean exists = memberRepository.existsByLoginIdAndLoginPw(loginId, loginPw);
        Member member= memberRepository.findByLoginIdAndLoginPw(loginId,loginPw);
        if (!exists) {
            rttr.addFlashAttribute("loginError", "아이디 또는 비밀번호가 올바르지 않습니다.");
            rttr.addFlashAttribute("loginId", loginId);   // 입력했던 아이디 유지
            return "redirect:/auth/login";
        }

        // 로그인 성공 → 세션에 로그인 아이디만 저장 (레포 수정 안 하려고 간단 버전)
        session.setAttribute("loginId", member.getLoginId());
        session.setAttribute("nickname", member.getNickname());
        session.setAttribute("memberId", member.getId());
        session.setAttribute("loginMember", member);

        return "redirect:/";
    }

    /**
     * 로그아웃
     * URL : /auth/logout
     */
    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/";
    }

    /**
     * 회원가입 화면
     * URL  : /auth/join  또는 /auth/join.do
     * View : templates/auth/join.html
     */
    @GetMapping({"/join", "/join.do"})
    public String joinForm() {
        return "auth/join";
    }

    /**
     * 회원가입 처리
     * POST : /auth/join  또는 /auth/join.do
     */
    @PostMapping({"/join", "/join.do"})
    public String join(
            @RequestParam String loginId,
            @RequestParam String loginPw,
            @RequestParam String nickname,
            @RequestParam(required = false) String email,
            RedirectAttributes rttr
    ) {

        // 아이디 / 닉네임 중복 체크 (기존 레포 그대로 사용)
        if (memberRepository.existsByLoginId(loginId)) {
            rttr.addFlashAttribute("joinError", "이미 사용 중인 아이디입니다.");
            rttr.addFlashAttribute("loginId", loginId);
            rttr.addFlashAttribute("nickname", nickname);
            rttr.addFlashAttribute("email", email);
            return "redirect:/auth/join";
        }

        if (memberRepository.existsByNickname(nickname)) {
            rttr.addFlashAttribute("joinError", "이미 사용 중인 닉네임입니다.");
            rttr.addFlashAttribute("loginId", loginId);
            rttr.addFlashAttribute("nickname", nickname);
            rttr.addFlashAttribute("email", email);
            return "redirect:/auth/join";
        }

        // 새 회원 엔티티 생성 (비번 평문 저장 - 더미데이터랑 맞춤)
        Member member = new Member();
        member.setLoginId(loginId);
        member.setLoginPw(loginPw);
        member.setNickname(nickname);
        member.setEmail(email);
        // 나머지 필드는 null / default 값 그대로 두면 됨




        memberRepository.save(member);

        rttr.addFlashAttribute("joinSuccess", "회원가입이 완료되었습니다. 로그인해 주세요.");

        return "redirect:/auth/login";
    }
}