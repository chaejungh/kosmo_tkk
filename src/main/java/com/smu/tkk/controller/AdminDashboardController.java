package com.smu.tkk.controller;

import com.smu.tkk.service.AdminDashboardService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequiredArgsConstructor
@RequestMapping("/admin")
public class AdminDashboardController {

    private final AdminDashboardService adminDashboardService;

    @GetMapping({"", "/", "/dashboard"})
    public String dashboard(Model model) {

        model.addAttribute("totalMembers", adminDashboardService.countMembers());
        model.addAttribute("totalStores", adminDashboardService.countStores());
        model.addAttribute("totalPopupStores", adminDashboardService.countPopupStores());
        model.addAttribute("totalBoardPosts", adminDashboardService.countBoardPosts());

        model.addAttribute("latestMembers", adminDashboardService.getLatestMembers(5));
        model.addAttribute("latestPosts", adminDashboardService.getLatestPosts(5));

        return "admin/dashboard";
    }
}
