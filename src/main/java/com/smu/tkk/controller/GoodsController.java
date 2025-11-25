package com.smu.tkk.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/goods")
public class
GoodsController {

    /**
     * 굿즈 매장 지도 페이지
     * URL  : /goods/map
     * View : templates/goods/shop_map.html
     */
    @GetMapping("/map")
    public String shopMap() {
        return "goods/shop_map";
    }

    // 필요하면 나중에 /goods/detail, /goods/list 등 추가하면 돼.
}