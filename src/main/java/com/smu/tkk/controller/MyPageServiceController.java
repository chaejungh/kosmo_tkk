package com.smu.tkk.controller;

import com.smu.tkk.entity.ServiceNotice;
import com.smu.tkk.service.NoticeService;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.sql.SQLException;

@Controller
@RequestMapping("/mypage/service")
@RequiredArgsConstructor
public class ServiceNoticeController {

    private final NoticeService serviceNoticeService;

    @GetMapping("/notice")
    public String noticeList(Model model,
                             @PageableDefault(size = 10, sort = "createdAt", direction = Sort.Direction.DESC)
                             Pageable pageable) throws SQLException {

        // 1. 전체 조회
        Page<ServiceNotice> noticeList = serviceNoticeService.readAll(pageable);
        model.addAttribute("noticeList", noticeList);

        return "mypage/service/notices";   // ← HTML
    }
    @GetMapping("/faq")
    public String faqList() {
        return "mypage/service/faq";
    }

    @GetMapping("/inquiries")
    public String inquiryList() {
        return "mypage/service/inquiries";
    }
        /*@GetMapping("/notice/{id}")
        public String noticeDetail(@PathVariable Long id, Model model) throws SQLException {

            // 2. 단일 조회
            ServiceNotice notice = serviceNoticeService.readById(id);
            model.addAttribute("notice", notice);

            return "mypage/service/notices_detail";  // ← 상세보기 HTML
        }*/

    // 자주 묻는 질문
}
