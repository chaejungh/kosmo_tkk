package com.smu.tkk.controller;

import com.smu.tkk.entity.TradePost;
import com.smu.tkk.service.TradeService;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/mypage")   // 기본 URL /mypage
@RequiredArgsConstructor
public class MyTradeController {

    private final TradeService tradeService;
    // 내가 쓴 거래 글 페이지
    @GetMapping("/{memberId}/trade/mine")
    public String myTradePosts(
            @PathVariable Long memberId, Model model, @PageableDefault Pageable pageable
    ) {
        Page<TradePost> tradePost = tradeService.readBySellerId(memberId, pageable);

        model.addAttribute("tradePost", tradePost);
        model.addAttribute("memberId", memberId);

        return "mypage/trade/my_trade_posts";

    }

    @GetMapping("/trade/wishlist")
    public String myTradeWishlist() {
        return "mypage/trade/my_trade_bookmarks";
    }
}
