package com.smu.tkk.controller;

import com.smu.tkk.entity.Inquiry;
import com.smu.tkk.repository.InquiryRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;
import java.time.LocalDateTime;

@Controller
@RequiredArgsConstructor
@RequestMapping("/help")
public class InquiryController {

    private final InquiryRepository inquiryRepository;

    /** 문의 목록 */
    @GetMapping("/list.do")
    public String list(Model model) {
        model.addAttribute("inquiryList",
                inquiryRepository.findAll(PageRequest.of(0, 50)));
        return "mypage/service/inquiries";
    }

    /** 문의 상세 */
    @GetMapping("/{id}/detail.do")
    public String detail(@PathVariable Integer id, Model model) {
        Inquiry inquiry = inquiryRepository.findById(id).orElse(null);
        model.addAttribute("inquiry", inquiry);
        return "mypage/service/inquiry_detail";
    }

    /** 문의 작성 화면 */
    @GetMapping("/write.do")
    public String writeForm() {
        return "mypage/service/inquiry_write";
    }

    /** 문의 작성 처리 */
    @PostMapping("/write.do")
    public String writeSubmit(@ModelAttribute Inquiry inquiry,@SessionAttribute Long memberId ) {
        if (memberId==null){
            return "redirect:/board/not-allowed";
        }

        inquiry.setMemberId(memberId);
        inquiry.setStatus("WAIT");    // 기본 상태
        inquiry.setCreatedAt(LocalDate.now());
        inquiryRepository.save(inquiry);

        return "redirect:/help/list.do";
    }
}