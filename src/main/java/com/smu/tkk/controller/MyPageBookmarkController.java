package com.smu.tkk.controller;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/mypage")     // ① /mypage로 시작하도록!
@RequiredArgsConstructor
public class MyPageBookmarkController {

    @GetMapping("/stores")     // ② /stores → 최종 URL: /mypage/stores
    public String storeBookmarksPage() {
        return "mypage/stores/store_bookmarks";
    }
}
