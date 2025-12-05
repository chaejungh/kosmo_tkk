package com.smu.tkk.controller;

import com.smu.tkk.entity.Member;
import com.smu.tkk.service.AdminMemberService;
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
@RequestMapping("/admin/members")
public class AdminMemberController {

    private final AdminMemberService adminMemberService;

    @GetMapping
    public String list(@RequestParam(defaultValue = "0") int page,
                       @RequestParam(defaultValue = "20") int size,
                       @RequestParam(required = false) String keyword,
                       Model model) {

        Pageable pageable = PageRequest.of(page, size,
                Sort.by(Sort.Direction.DESC, "createdAt"));

        Page<Member> members = adminMemberService.readAll(pageable, keyword);

        model.addAttribute("members", members);
        model.addAttribute("keyword", keyword);

        return "admin/member_list";
    }

    @GetMapping("/{memberId}")
    public String detail(@PathVariable Long memberId, Model model) {
        Member member = adminMemberService.readOne(memberId);
        model.addAttribute("member", member);
        return "admin/member_detail";
    }

    @PostMapping("/{memberId}/status")
    public String changeStatus(@PathVariable Long memberId,
                               @RequestParam String deletedYn,
                               RedirectAttributes redirectAttributes) {

        adminMemberService.changeDeletedYn(memberId, deletedYn);
        redirectAttributes.addFlashAttribute("message", "회원 상태가 변경되었습니다.");
        return "redirect:/admin/members/" + memberId;
    }

    @PostMapping("/{memberId}/level")
    public String changeLevel(@PathVariable Long memberId,
                              @RequestParam Integer userLevel,
                              RedirectAttributes redirectAttributes) {

        adminMemberService.changeUserLevel(memberId, userLevel);
        redirectAttributes.addFlashAttribute("message", "회원 등급이 변경되었습니다.");
        return "redirect:/admin/members/" + memberId;
    }
}
