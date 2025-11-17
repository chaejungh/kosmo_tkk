package com.smu.tkk.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class TradeController {

    // 거래 리스트
    @GetMapping("/trade")
    public String tradeList() {
        return "trade/trade_list";
    }

    // 거래 상세페이지 (예: /trade/1)
    @GetMapping("/trade/detail")
    public String tradeDetail() {
        return "trade/trade_detail";
    }
}