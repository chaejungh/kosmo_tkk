package com.smu.tkk.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/mypage")
public class MypageController {

    /**
     * 마이페이지 메인
     * URL  : /mypage
     * View : templates/mypage/mypage_main.html
     */
    @GetMapping("")
    public String mypageMain() {
        return "mypage/mypage_main";
    }

    /**
     * 프로필 / 기본 정보
     * URL  : /mypage/profile
     * View : templates/mypage/profile.html
     */
    @GetMapping("/profile")
    public String profile() {
        return "mypage/profile";
    }

    /**
     * 설정 (알림, 계정 관리 등)
     * URL  : /mypage/settings
     * View : templates/mypage/settings.html
     */
    @GetMapping("/settings")
    public String settings() {
        return "mypage/settings";
    }

    /**
     * 내가 쓴 덕질게시판 글
     * URL  : /mypage/posts/board
     * View : templates/mypage/posts/board.html
     */
    @GetMapping("/posts/board")
    public String myBoardPosts() {
        return "mypage/posts/board";
    }

    /**
     * 내가 쓴 굿즈거래 글
     * URL  : /mypage/posts/trade
     * View : templates/mypage/posts/trade.html
     */
    @GetMapping("/posts/trade")
    public String myTradePosts() {
        return "mypage/posts/trade";
    }

    /**
     * 즐겨찾기한 굿즈/매장
     * URL  : /mypage/favorites
     * View : templates/mypage/favorites/favorites.html
     */
    @GetMapping("/favorites")
    public String favorites() {
        return "mypage/favorites/favorites";
    }

    /**
     * 좋아요 한 게시글
     * URL  : /mypage/favorites/likes
     * View : templates/mypage/favorites/likes.html
     */
    @GetMapping("/favorites/likes")
    public String likes() {
        return "mypage/favorites/likes";
    }

    /**
     * 북마크한 매장 리스트
     * URL  : /mypage/bookmarks
     * View : templates/mypage/bookmarks/bookmarks.html
     */
    @GetMapping("/bookmarks")
    public String bookmarks() {
        return "mypage/bookmarks/bookmarks";
    }

    /**
     * 공지사항
     * URL  : /mypage/notices
     * View : templates/mypage/service/notices.html
     */
    @GetMapping("/notices")
    public String notices() {
        return "mypage/service/notices";
    }

    /**
     * 문의 내역 / 문의하기
     * URL  : /mypage/inquiries
     * View : templates/mypage/service/inquiries.html
     */
    @GetMapping("/inquiries")
    public String inquiries() {
        return "mypage/service/inquiries";
    }
}