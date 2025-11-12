package com.smu.tkk.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/goods")
public class GoodsController {
    @GetMapping("/")
    public String home(){
        return "goods/index";
    }
}
