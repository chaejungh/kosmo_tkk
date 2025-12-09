package com.smu.tkk.controller.admin;

import com.smu.tkk.entity.Inquiry;
import com.smu.tkk.service.AdminInquiryService;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/admin/inquiries")
@RequiredArgsConstructor
public class AdminInquiryController {

    private final AdminInquiryService adminInquiryService;

    /**
     * 관리자 문의 목록
     * GET /admin/inquiries?page=0&size=20&keyword=로그인
     */
    @GetMapping
    public String list(@RequestParam(defaultValue = "0") int page,
                       @RequestParam(defaultValue = "20") int size,
                       @RequestParam(required = false) String keyword,
                       Model model) {

        Page<Inquiry> inquiryPage =
                adminInquiryService.getInquiryPage(page, size, keyword);

        model.addAttribute("inquiryPage", inquiryPage);
        model.addAttribute("currentPage", page);
        model.addAttribute("size", size);
        model.addAttribute("keyword", keyword);

        // 🔹 여기! "admin/inquiry/list" 가 아니라, 파일 이름에 맞춰서
        return "admin/inquiry_list";
    }

    /**
     * 문의 상세 + 답변 폼
     * GET /admin/inquiries/{id}
     */
    @GetMapping("/{id}")
    public String detail(@PathVariable Long id,
                         @ModelAttribute("msg") String msg,
                         Model model) {

        Inquiry inquiry = adminInquiryService.getInquiry(id);

        model.addAttribute("inquiry", inquiry);
        model.addAttribute("msg", msg);

        // 🔹 여기도 마찬가지
        return "admin/inquiry_detail";
    }

    /**
     * 답변 작성/수정
     * POST /admin/inquiries/{id}/answer
     */
    @PostMapping("/{id}/answer")
    public String answer(@PathVariable Long id,
                         @RequestParam("answer") String answer,
                         RedirectAttributes redirectAttributes) {

        adminInquiryService.answerInquiry(id, answer);
        redirectAttributes.addFlashAttribute("msg", "답변을 저장했습니다.");

        return "redirect:/admin/inquiries/" + id;
    }

    /**
     * 문의 삭제
     * POST /admin/inquiries/{id}/delete
     */
    @PostMapping("/{id}/delete")
    public String delete(@PathVariable Long id,
                         RedirectAttributes redirectAttributes) {

        adminInquiryService.deleteInquiry(id);
        redirectAttributes.addFlashAttribute("msg", "문의가 삭제되었습니다.");

        return "redirect:/admin/inquiries";
    }
}
