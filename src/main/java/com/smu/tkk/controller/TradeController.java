package com.smu.tkk.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class TradeController {

    // 굿즈거래 목록
    @GetMapping("/trade")
    public String tradeList() {
        return "trade/trade_list";   // templates/trade/trade_list.html
    }

    // 글쓰기 페이지
    @GetMapping("/trade/write")
    public String tradeWrite() {
        return "trade/trade_write";  // templates/trade/trade_write.html
    }
}