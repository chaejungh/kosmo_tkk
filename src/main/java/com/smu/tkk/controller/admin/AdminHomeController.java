package com.smu.tkk.controller.admin;

import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class AdminHomeController {

    @GetMapping
    public String adminHome(HttpSession session, Model model) {

        Object adminName = session.getAttribute("adminName");
        model.addAttribute("adminName", adminName != null ? adminName : "관리자");

        return "admin/dashboard"; // templates/admin/dashboard.html
    }
}
