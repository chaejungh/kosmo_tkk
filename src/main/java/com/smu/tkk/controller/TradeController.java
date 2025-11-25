package com.smu.tkk.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class TradeController {

    /**
     * 거래 글 리스트
     * 예) /trade/list.do?page=1&pageLimit=20&sort=createAt
     */
    @GetMapping("/trade/list.do")
    public String tradeList(@RequestParam(defaultValue = "1") int page,
                            @RequestParam(defaultValue = "20") int pageLimit,
                            @RequestParam(defaultValue = "createAt") String sort) {

        // TODO: 나중에 page/pageLimit/sort 사용해서 서비스 붙이면 됨
        return "trade/trade_list";
    }

    /**
     * 기존 /trade 진입 시 리스트로 리다이렉트 (호환용)
     */
    @GetMapping("/trade")
    public String legacyTradeList() {
        return "redirect:/trade/list.do?page=1&pageLimit=20&sort=createAt";
    }

    /**
     * 거래 상세
     * 예) /trade/10/article/detail.do
     */
    @GetMapping("/trade/{tradePostId}/article/detail.do")
    public String tradeDetail(@PathVariable("tradePostId") Long tradePostId) {
        // TODO: tradePostId 사용해서 상세 조회 서비스 붙이면 됨
        return "trade/trade_detail";
    }

    /**
     * 기존 /trade/detail 도 그대로 살리기 (혹시 다른 데서 쓰는 경우)
     */
    @GetMapping("/trade/detail")
    public String legacyTradeDetail() {
        return "trade/trade_detail";
    }
}