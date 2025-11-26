package com.smu.tkk.controller;

import com.smu.tkk.entity.Inquiry;
import com.smu.tkk.repository.InquiryRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequiredArgsConstructor
public class InquiryController {

    private final InquiryRepository inquiryRepository;

    /**
     * 문의 목록
     * URL : /help/list.do
     */
    @GetMapping("/help/list.do")
    public String list(Model model) {

        var inquiries = inquiryRepository.findAll(PageRequest.of(0, 20));

        model.addAttribute("inquiryList", inquiries);

        return "mypage/service/inquiries";
    }

    /**
     * 문의 상세
     * URL : /help/{id}/detail.do
     */
    @GetMapping("/help/{id}/detail.do")
    public String detail(@PathVariable Integer id, Model model) {

        Inquiry inquiry = inquiryRepository.findById(id)
                .orElse(null);

        model.addAttribute("inquiry", inquiry);

        return "mypage/service/inquiry-detail";
    }
}