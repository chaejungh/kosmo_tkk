package com.smu.tkk.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MypageController {

    /** =========================
     *  내정보 메인 (마이페이지 메인)
     *  ========================= */
    @GetMapping("/mypage")
    public String mypageMain() {
        // templates/mypage/mypage_main.html
        return "mypage/mypage_main";
    }

    /** =========================
     *  섹션1: 나의 활동
     *  ========================= */

    // 내가 쓴 글
    @GetMapping("/mypage/posts")
    public String myPosts() {
        // 예: templates/mypage/posts/my_posts.html
        return "mypage/posts/my_posts";
    }

    // 좋아요 한 글
    @GetMapping("/mypage/likes")
    public String myLikes() {
        // 예: templates/mypage/favorites/likes.html
        return "mypage/favorites/likes";
    }

    // 북마크 모음
    @GetMapping("/mypage/bookmarks")
    public String myBookmarks() {
        // 예: templates/mypage/bookmarks/bookmarks.html
        return "mypage/bookmarks/bookmarks";
    }

    /** =========================
     *  섹션2: 굿즈 거래
     *  ========================= */

    // 내가 올린 거래 글
    @GetMapping("/mypage/trade/mine")
    public String myTradePosts() {
        // 예: templates/mypage/posts/trade.html
        return "mypage/posts/trade";
    }

    // 찜한 거래글
    @GetMapping("/mypage/trade/wishlist")
    public String myTradeWishlist() {
        // 예: templates/mypage/favorites/wishlist.html
        return "mypage/favorites/wishlist";
    }

    // 거래 채팅방 (메뉴에 있으면 쓸 예정, 없으면 나중에 연결)
    @GetMapping("/mypage/trade/chat")
    public String myTradeChatRooms() {
        // 아직 화면 없으면 임시로 mypage_main에 붙여두고,
        // 나중에 templates/mypage/trade/chat.html 만들면 거기로 변경
        return "mypage/mypage_main";
    }

    /** =========================
     *  섹션3: 매장 & 팝업
     *  ========================= */

    // 찜한 매장
    @GetMapping("/mypage/stores")
    public String myFavoriteStores() {
        // 예: templates/mypage/favorites/stores.html
        return "mypage/favorites/stores";
    }

    // 찜한 팝업스토어
    @GetMapping("/mypage/popups")
    public String myFavoritePopups() {
        // 예: templates/mypage/favorites/popups.html
        return "mypage/favorites/popups";
    }

    /** =========================
     *  섹션5: 설정 · 고객센터 (마이페이지 안 메뉴)
     *  ========================= */

    // 계정 · 알림 설정
    @GetMapping("/mypage/settings")
    public String mySettings() {
        // 예: templates/mypage/settings.html
        return "mypage/settings";
    }

    /** =========================
     *  공지사항 / FAQ / 1:1 문의
     *  (URL은 /mypage 가 아닌 /notice, /faq, /inquiry 라서
     *   @GetMapping을 이렇게 따로 뺀 거야)
     *  ========================= */

    // 공지사항 목록
    @GetMapping("/notice")
    public String noticeList() {
        // 예: templates/mypage/service/notices.html
        return "mypage/service/notices";
    }

    // 자주 묻는 질문
    @GetMapping("/faq")
    public String faqList() {
        // 예: templates/mypage/service/faq.html
        return "mypage/service/faq";
    }

    // 1:1 문의
    @GetMapping("/inquiry")
    public String inquiryList() {
        // 예: templates/mypage/service/inquiries.html
        return "mypage/service/inquiries";
    }
}