package com.smu.tkk.controller.admin;

import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class AdminHomeController {

    @GetMapping("/admin/home")
    public String adminHome(HttpSession session, Model model) {
        // 원래 있던 코드 그대로 두면 됨
        return "admin/home"; // 너희가 쓰는 뷰 이름 유지
    }
}
