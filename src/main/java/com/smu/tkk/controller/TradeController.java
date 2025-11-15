package com.smu.tkk.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/trade")
public class TradeController {

    /**
     * 굿즈거래 리스트
     * URL  : /trade
     * View : templates/trade/trade_list.html
     */
    @GetMapping("")
    public String tradeList() {
        return "trade/trade_list";
    }

    /**
     * 굿즈거래 상세
     * URL  : /trade/detail
     * View : templates/trade/trade_detail.html
     */
    @GetMapping("/detail")
    public String tradeDetail() {
        return "trade/trade_detail";
    }

    /**
     * 굿즈거래 글쓰기
     * URL  : /trade/write
     * View : templates/trade/trade_write.html
     */
    @GetMapping("/write")
    public String tradeWrite() {
        return "trade/trade_write";
    }
}