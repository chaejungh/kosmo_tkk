package com.smu.tkk.controller;

import com.smu.tkk.entity.Member;
import com.smu.tkk.service.EmailVerificationService;
import jakarta.mail.MessagingException;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequiredArgsConstructor
@RequestMapping("/auth")
public class EmailVerificationController {

    private final EmailVerificationService emailVerificationService;

    /** 회원가입 + 이메일 인증코드 발송 */
    @PostMapping("/join")
    public String join(Member member, Model model) throws MessagingException {
        System.out.println(member);
        Member saved = emailVerificationService.registerNewMember(member);

        model.addAttribute("email", saved.getEmail());
        return "auth/join_verify";
    }

    /** 인증코드 검증 */
    @PostMapping("/verify")
    public String verify(
            @RequestParam String email,
            @RequestParam String code,
            Model model,
            HttpSession session,
            RedirectAttributes redirect

    ) {
        boolean success = emailVerificationService.verifyEmail(email, code);

        if (success) {

            // ⭐ 이메일로 회원정보 다시 조회 (세션 저장용)
            Member member = emailVerificationService.findByEmail(email);

            // ⭐ 자동 로그인 처리 (LoginController 와 동일하게)
            session.setAttribute("loginMember", member);
            session.setAttribute("memberId", member.getId());

            // ⭐ redirect 시에는 반드시 RedirectAttributes 사용해야 함
            redirect.addFlashAttribute("msg", "이메일 인증이 완료되었습니다!");
            return "redirect:/";

        } else {
            model.addAttribute("msg", "잘못된 인증코드입니다.");
            model.addAttribute("email",email);
            return "auth/join_verify";
        }
    }

    @PostMapping("/send-code")
    @ResponseBody
    public String sendCode(@RequestParam String email) throws MessagingException {
        emailVerificationService.sendVerificationCode(email);
        return "OK";
    }

}
