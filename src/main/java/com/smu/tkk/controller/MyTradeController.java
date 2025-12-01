package com.smu.tkk.controller;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/mypage")   // 기본 URL /mypage
@RequiredArgsConstructor
public class MyTradeController {

    // 내가 쓴 거래 글 페이지
    @GetMapping("/trade/mine")
    public String myTradePosts() {
        return "mypage/trade/my_trade_posts";

    }

    @GetMapping("/trade/wishlist")
    public String myTradeWishlist() {
        return "mypage/trade/my_trade_bookmarks";
    }
}
