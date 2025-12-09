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
@RequestMapping("/admin/members")
@RequiredArgsConstructor
public class AdminMemberController {

    private final AdminMemberService adminMemberService;

    /**
     * 회원 리스트
     *   /admin/members?page=0&size=20&keyword=user
     */
    @GetMapping
    public String list(@RequestParam(defaultValue = "0") int page,
                       @RequestParam(defaultValue = "20") int size,
                       @RequestParam(required = false) String keyword,
                       Model model) {

        Pageable pageable = PageRequest.of(
                page,
                size,
                Sort.by(Sort.Direction.DESC, "id") // 필요하면 createdAt 으로 변경
        );

        Page<Member> members = adminMemberService.readMembers(pageable, keyword);

        // member_list.html 에서 쓰라고 넉넉하게 넣어줌
        model.addAttribute("members", members);  // 리스트
        model.addAttribute("page", members);     // 페이지 정보
        model.addAttribute("keyword", keyword);  // 검색어

        return "admin/member_list";
    }

    /**
     * 회원 상세
     *   /admin/members/{memberId}
     */
    @GetMapping("/{memberId}")
    public String detail(@PathVariable Long memberId, Model model) {
        Member member = adminMemberService.readMember(memberId);
        model.addAttribute("member", member);
        return "admin/member_detail";
    }

    /**
     * 회원 상태 변경 (활성 / 비활성)
     *   /admin/members/{memberId}/status
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
     *   /admin/members/{memberId}/level
     */
    @PostMapping("/{memberId}/level")
    public String changeLevel(@PathVariable Long memberId,
                              @RequestParam Integer userLevel,
                              RedirectAttributes redirectAttributes) {

        adminMemberService.changeMemberLevel(memberId, userLevel);
        redirectAttributes.addFlashAttribute("message", "회원 등급이 변경되었습니다.");

        return "redirect:/admin/members/" + memberId;
    }
}
