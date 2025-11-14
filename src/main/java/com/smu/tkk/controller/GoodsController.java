package com.smu.tkk.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/goods")
public class GoodsController {

    // /goods, /goods/, /goods/map, /goods/shop_map 전부 동일 템플릿 반환
    @GetMapping({"", "/", "map", "shop_map"})
    public String showMap() {
        return "goods/shop_map"; // src/main/resources/templates/goods/shop_map.html
    }
}
