package com.smu.tkk.controller;

import com.smu.tkk.entity.Member;
import com.smu.tkk.entity.PopupBookmark;
import com.smu.tkk.entity.StoreBookmark;
import com.smu.tkk.service.MemberService;
import com.smu.tkk.service.PopupService;
import com.smu.tkk.service.StoreService;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.sql.SQLException;

@Controller
@RequestMapping("/mypage")     // ① /mypage로 시작하도록!
@RequiredArgsConstructor
public class MyPageBookmarkController {
    private final StoreService storeService;
    private final MemberService memberService;
    private final PopupService popupService;

    @GetMapping("/{memberId}/stores")     // ② /stores → 최종 URL: /mypage/stores
    public String storeBookmarksPage(
            @PathVariable Long memberId, Model model,
            @PageableDefault(size = 10,sort = "createdAt") Pageable pageable
            ) throws SQLException {
        Page<StoreBookmark> storeBookmarks = storeService.myBookmarks(memberId, pageable);

        Member member = memberService.readOne(memberId);

        model.addAttribute("storeBookmarks", storeBookmarks);
        model.addAttribute("member", member);

        return "mypage/stores/store_bookmarks";
    }

    @GetMapping("/{memberId}/popups")
    public String popupBookmarksPage(
            @PathVariable Long memberId, Model model,
            @PageableDefault(size = 10, sort = "createdAt") Pageable pageable
    ) throws SQLException {
        Page<PopupBookmark> popupBookmarks = popupService.myBookmarks(memberId, pageable);

        Member member = memberService.readOne(memberId);

        model.addAttribute("popupBookmarks", popupBookmarks);
        model.addAttribute("member", member);

        return "mypage/stores/popups";
    }
}
