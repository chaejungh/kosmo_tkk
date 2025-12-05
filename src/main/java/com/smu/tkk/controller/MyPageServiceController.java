package com.smu.tkk.controller;

import com.smu.tkk.entity.Faq;
import com.smu.tkk.entity.Inquiry;
import com.smu.tkk.entity.Member;
import com.smu.tkk.entity.ServiceNotice;
import com.smu.tkk.service.FaqService;
import com.smu.tkk.service.InquiryService;
import com.smu.tkk.service.MemberService;
import com.smu.tkk.service.NoticeService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.sql.SQLException;
import java.util.List;

@Controller
@RequestMapping("/mypage/service")
@RequiredArgsConstructor
public class MyPageServiceController {

    private final NoticeService serviceNoticeService;
    private final InquiryService inquiryService;
    private final MemberService memberService;
    private final FaqService faqService;

    @GetMapping("/notice")
    public String noticeList(Model model,
                             @PageableDefault(size = 10, sort = "createdAt", direction = Sort.Direction.DESC)
                             Pageable pageable) throws SQLException {

        // 1. 전체 조회
        Page<ServiceNotice> noticeList = serviceNoticeService.readAll(pageable);
        model.addAttribute("noticeList", noticeList);

        return "mypage/service/notices";   // ← HTML
    }
        @GetMapping("/notice/{id}")
        public String noticeDetail(@PathVariable Long id, Model model) throws SQLException {

            // 2. 단일 조회
            ServiceNotice notice = serviceNoticeService.readById(id);
            model.addAttribute("notice", notice);

            return "mypage/service/notices_detail";  // ← 상세보기 HTML
        }

    @GetMapping("/faq")
    public String faqList(Model model, @PageableDefault(size = 10,sort = "sortOrder") Pageable pageable) throws SQLException {
        Page<Faq> faqList = faqService.readAll(pageable);

        model.addAttribute("faqList", faqList);

        return "mypage/service/faq";
    }

    @GetMapping("/faq/{id}")
    public String faqDetail(@PathVariable Long id, Model model) throws SQLException {
        Faq faq = faqService.readById(id);

        model.addAttribute("faq", faq);

        return "mypage/service/faq_detail";
    }

    @GetMapping("/{memberId}/inquiries")
    public String inquiryList(Model model,
                              @PathVariable Long memberId,
                              Pageable pageable) throws SQLException {
        //Long memberId = 1L; // 테스트용
        Page<Inquiry> inquiryList = inquiryService.readById(memberId, pageable);

        Member member = memberService.readOne(memberId);
        model.addAttribute("inquiryList", inquiryList.getContent());
        model.addAttribute("member", member);

        return "mypage/service/inquiries";
    }

//    @GetMapping("/setting")
//    public String settingsPage() {
//        return "mypage/service/setting";
//    }
    // 약관 페이지
    @GetMapping("/terms")
    public String termsPage() {
        return "mypage/service/terms";
    }

    @GetMapping("/privacy")
    public String privacyPage() {
        return "mypage/service/privacy";
    }

    @GetMapping("/logout")//로그아웃
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/";
    }
    @PostMapping("/updatePassword")
    public String updatePassword(@RequestParam Long memberId,
                                 @RequestParam String loginPw,
                                 HttpSession session) throws SQLException {

        Member member = memberService.readOne(memberId);
        if (member == null) {
            throw new IllegalArgumentException("해당 회원이 존재하지 않습니다.");
        }

        member.setLoginPw(loginPw);
        memberService.modify(member);

        // ✅ 세션 초기화 → 로그아웃 처리
        session.invalidate();

        // ✅ 로그인 페이지로 리다이렉트
        return "redirect:/login?passwordChanged=true";
    }
    @PostMapping("/updateEmail")
    public String updateEmail(@RequestParam Long memberId,
                              @RequestParam String email) throws SQLException {

        Member member = memberService.readOne(memberId);
        if (member == null) {
            throw new IllegalArgumentException("해당 회원이 존재하지 않습니다.");
        }

        member.setEmail(email);
        memberService.modify(member);

        // ✅ 다시 설정 페이지로 돌아가면서 메시지 표시
        return "redirect:/mypage/service/setting?emailUpdated=true";
    }
    @GetMapping("/setting")
    public String settingsPage(HttpSession session, Model model) throws SQLException {
        Long memberId = (Long) session.getAttribute("memberId");
        if (memberId != null) {
            Member member = memberService.readOne(memberId);
            model.addAttribute("member", member);
        }
        return "mypage/service/setting";
    }
}
