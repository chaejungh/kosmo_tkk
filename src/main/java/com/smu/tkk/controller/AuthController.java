package com.smu.tkk.controller;

import com.smu.tkk.entity.Member;
import com.smu.tkk.repository.MemberRepository;
import com.smu.tkk.service.MemberService;
import jakarta.transaction.Transactional;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import jakarta.servlet.http.HttpSession;

import java.sql.SQLException;

@Controller
@RequiredArgsConstructor
@RequestMapping("/auth")
public class AuthController {

    private final MemberRepository memberRepository;
    private final MemberService memberService;

    /**
     * 로그인 화면
     * URL  : /auth/login  또는 /auth/login.do
     * View : templates/auth/login.html
     */

    // ✅ 아이디 중복확인 AJAX API
    @GetMapping("/check-id")
    @ResponseBody
    public String checkId(@RequestParam String loginId) throws SQLException {

        boolean exists =memberService.existsByLoginId(loginId);

        return exists ? "duplicate" : "ok";
    }
    @GetMapping("/find_id")
    public String showFindIdForm() {
        // 그냥 화면만 열어줌
        return "auth/find_id";
    }

    /** 아이디 찾기 처리 */
    @PostMapping("/find_id")
    public String findId(@RequestParam String nickname,
                         @RequestParam String email,
                         Model model) {

        // 닉네임 + 이메일로 회원 찾기 (서비스/레포지토리는 아래 참고)
        Member member = memberService.readByNicknameAndEmail(nickname, email);

        if (member != null) {
            // 찾음 → 아이디 내려주기
            model.addAttribute("foundId", member.getLoginId());
        } else {
            // 못 찾음 → 실패 플래그
            model.addAttribute("notFound", true);
        }

        // 필요하면 사용자가 입력했던 값 다시 채워주기
        model.addAttribute("nickname", nickname);
        model.addAttribute("email", email);

        // 같은 페이지로 다시 렌더링
        return "auth/find_id";
    }

    @GetMapping("/find_pw")
    public String showFindPwForm() {
        return "auth/find_pw";   // 위에 올린 템플릿 파일 이름
    }

    /** 비밀번호 찾기 처리 */
    @PostMapping("/find_pw")
    public String findPassword(@RequestParam("loginId") String loginId,
                               @RequestParam("nickname") String nickname,
                               @RequestParam("email") String email,
                               Model model) {

        // 🔎 아이디 + 이름 + 이메일이 모두 일치하는 회원 찾기
        Member member = memberService
                .readByLoginIdAndNicknameAndEmail(loginId, nickname, email);

        if (member != null) {
            // ⚠️ 실서비스에서는 비밀번호를 그대로 보여주면 안 되고,
            //     임시 비밀번호 발급 + 이메일 전송 등으로 처리해야 함.
            model.addAttribute("foundPw", member.getLoginPw());
        } else {
            model.addAttribute("notFound", true);
        }

        return "auth/find_pw";
    }

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
            Model model,
            RedirectAttributes rttr
    ) throws SQLException {

        // MEMBER 테이블에 아이디+비밀번호 조합이 존재하는지 검사

        Member member = memberService.login(loginId, loginPw);
        if (member == null) {
            model.addAttribute("error", "아이디 또는 비밀번호가 올바르지 않습니다.");
            return "auth/login"; // 로그인 실패 시 다시 로그인 페이지로
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
//    @PostMapping({"/join", "/join.do"})
//    public String join(
//            @RequestParam String loginId,
//            @RequestParam String loginPw,
//            @RequestParam String nickname,
//            @RequestParam(required = false) String email,
//            @RequestParam String gender,
//            @RequestParam String nationality,
//            RedirectAttributes rttr
//    ) throws SQLException {
//
//   /*     // 아이디 / 닉네임 중복 체크 (기존 레포 그대로 사용)
//        if (memberRepository.existsByLoginId(loginId)) {
//            rttr.addFlashAttribute("joinError", "이미 사용 중인 아이디입니다.");
//            rttr.addFlashAttribute("loginId", loginId);
//            rttr.addFlashAttribute("nickname", nickname);
//            rttr.addFlashAttribute("email", email);
//            return "redirect:/auth/join";
//        }*/
//
//        /*if (memberRepository.existsByNickname(nickname)) {
//            rttr.addFlashAttribute("joinError", "이미 사용 중인 닉네임입니다.");
//            rttr.addFlashAttribute("loginId", loginId);
//            rttr.addFlashAttribute("nickname", nickname);
//            rttr.addFlashAttribute("email", email);
//            return "redirect:/auth/join";
//        }*/
//
//        // 새 회원 엔티티 생성 (비번 평문 저장 - 더미데이터랑 맞춤)
//        Member member = new Member();
//        member.setLoginId(loginId);
//        member.setLoginPw(loginPw);
//        member.setNickname(nickname);
//        member.setEmail(email);
//        member.setGender(gender);
//        member.setNationality(nationality);
//
//        // 나머지 필드는 null / default 값 그대로 두면 됨 > gender,nationlity 없어서 12월 5일 수정함
//
//        memberService.register(member);
//
//        rttr.addFlashAttribute("joinSuccess", "회원가입이 완료되었습니다. 로그인해 주세요.");
//
//        return "redirect:/auth/login";
//    }
    /**
     * 회원 탈퇴
     * GET : /auth/delete
     */
    // 1) 세션 기반 - 추천 (setting.html은 이걸 호출)
    @Transactional  // 💥 트랜잭션 필수!
    @GetMapping("/delete-me")
    public String deleteMe(HttpSession session) {
        Member loginMember = (Member) session.getAttribute("loginMember");
        if (loginMember == null) {
            return "redirect:/auth/login";
        }

        Long memberId = loginMember.getId();
        System.out.println(">>> [DELETE-ME] memberId = " + memberId);

        memberService.deleteMember(memberId);
        System.out.println(">>> [DELETE-ME] memberRepository.deleteById() 실행됨");

        session.invalidate();
        System.out.println(">>> [DELETE-ME] 세션 만료 완료");

        return "redirect:/";
    }

}