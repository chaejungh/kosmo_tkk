package com.smu.tkk.controller.admin;

import com.smu.tkk.entity.AdminUser;
import com.smu.tkk.service.AdminAuthService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequiredArgsConstructor
@RequestMapping("/admin")
public class AdminLoginController {

    private final AdminAuthService adminAuthService;

    // 로그인 페이지
    @GetMapping("/login")
    public String loginForm(@RequestParam(value = "error", required = false) String error,
                            Model model) {

        if (error != null) {
            model.addAttribute("errorMessage", "아이디 또는 비밀번호가 올바르지 않습니다.");
        }
        return "admin/login"; // templates/admin/login.html
    }

    // 로그인 처리
    @PostMapping("/login")
    public String login(@RequestParam String loginId,
                        @RequestParam String loginPw,
                        HttpSession session) {

        AdminUser admin = adminAuthService.login(loginId, loginPw);
        if (admin == null) {
            return "redirect:/admin/login?error=1";
        }

        // 세션에 관리자 정보 저장
        session.setAttribute("adminId", admin.getAdminId());
        session.setAttribute("adminName", admin.getName());
        session.setAttribute("adminLoginId", admin.getLoginId());

        return "redirect:/admin"; // 관리자 메인으로 이동
    }

    // 로그아웃
    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/admin/login";
    }
}
