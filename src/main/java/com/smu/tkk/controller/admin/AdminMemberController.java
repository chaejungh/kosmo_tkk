package com.smu.tkk.controller.admin;

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
@RequestMapping("/admin/members")
@RequiredArgsConstructor
public class AdminMemberController {

    private final AdminMemberService adminMemberService;

    /**
     * 회원 리스트
     *   /admin/members?page=0&size=20&keyword=jihyeong
     */
    @GetMapping
    public String list(@RequestParam(defaultValue = "0") int page,
                       @RequestParam(defaultValue = "20") int size,
                       @RequestParam(required = false) String keyword,
                       Model model) {

        Pageable pageable = PageRequest.of(
                page,
                size,
                Sort.by(Sort.Direction.DESC, "createdAt")
        );

        Page<Member> members = adminMemberService.readMembers(pageable, keyword);

        model.addAttribute("members", members);
        model.addAttribute("keyword", keyword);

        return "admin/member_list";
    }

    /**
     * 회원 상세
     *   /admin/members/{memberId}
     */
    @GetMapping("/{memberId}")
    public String detail(@PathVariable Long memberId,
                         Model model) {

        Member member = adminMemberService.readMember(memberId);
        model.addAttribute("member", member);

        return "admin/member_detail";
    }

    /**
     * 회원 상태 변경 (정상/탈퇴)
     *   deletedYn = Y / N
     */
    @PostMapping("/{memberId}/status")
    public String changeStatus(@PathVariable Long memberId,
                               @RequestParam String deletedYn,
                               RedirectAttributes redirectAttributes) {

        adminMemberService.changeMemberStatus(memberId, deletedYn);
        redirectAttributes.addFlashAttribute("message", "회원 상태가 변경되었습니다.");

        return "redirect:/admin/members/" + memberId;
    }

    /**
     * 회원 등급 변경
     *   userLevel : 0(일반), 1(운영진), 2(관리자) ... 이런 식으로 사용한다고 가정
     */
    @PostMapping("/{memberId}/level")
    public String changeLevel(@PathVariable Long memberId,
                              @RequestParam Long userLevel,   // 🔥 Integer → Long
                              RedirectAttributes redirectAttributes) {

        adminMemberService.changeMemberLevel(memberId, userLevel);
        redirectAttributes.addFlashAttribute("message", "회원 등급이 변경되었습니다.");

        return "redirect:/admin/members/" + memberId;
    }
}
