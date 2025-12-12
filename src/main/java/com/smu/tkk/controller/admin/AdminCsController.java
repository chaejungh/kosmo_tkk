package com.smu.tkk.controller.admin;

import com.smu.tkk.entity.Inquiry;
import com.smu.tkk.service.AdminCsService;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequiredArgsConstructor
@RequestMapping("/admin/cs")
public class AdminCsController {

    private final AdminCsService adminCsService;

    // ▽ 문의 목록
    @GetMapping("/inquiries")
    public String inquiries(@RequestParam(defaultValue = "0") int page,
                            @RequestParam(defaultValue = "20") int size,
                            @RequestParam(required = false) String status,
                            Model model) {

        Pageable pageable = PageRequest.of(
                page,
                size,
                Sort.by(Sort.Direction.DESC, "createdAt")  // Inquiry 엔티티에 createdAt 필드 있다고 가정
        );

        Page<Inquiry> inquiries = adminCsService.readInquiries(pageable, status);

        model.addAttribute("inquiries", inquiries);
        model.addAttribute("status", status);

        return "admin/inquiry_list"; // templates/admin/inquiry_list.html
    }

    // ▽ 문의 상세
    @GetMapping("/inquiries/{id}")
    public String inquiryDetail(@PathVariable("id") Integer id, Model model) {
        Inquiry inquiry = adminCsService.readInquiry(id);
        model.addAttribute("inquiry", inquiry);
        return "admin/inquiry_detail"; // templates/admin/inquiry_detail.html
    }

    // ▽ 문의 답변 등록
    @PostMapping("/inquiries/{id}/answer")
    public String answerInquiry(@PathVariable("id") Integer id,
                                @RequestParam String answerContent,
                                @SessionAttribute(name = "adminName", required = false) String adminName,
                                RedirectAttributes redirectAttributes) {

        if (adminName == null || adminName.isBlank()) {
            adminName = "ADMIN"; // 세션에 없으면 임시로 ADMIN 이름 사용
        }

        adminCsService.answerInquiry(id, answerContent, adminName);
        redirectAttributes.addFlashAttribute("message", "문의에 대한 답변이 (논리상) 처리되었습니다. Inquiry 엔티티에 맞게 필드만 나중에 채우면 돼.");

        return "redirect:/admin/cs/inquiries/" + id;
    }
}
