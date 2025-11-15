package com.smu.tkk.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/board")
public class BoardController {

    /**
     * 덕질게시판 리스트
     * URL  : /board
     * View : templates/board/board_list.html
     */
    @GetMapping("")
    public String boardList() {
        return "board/board_list";
    }

    /**
     * 덕질게시판 상세
     * URL  : /board/detail
     * View : templates/board/board_detail.html
     */
    @GetMapping("/detail")
    public String boardDetail() {
        return "board/board_detail";
    }

    /**
     * 덕질게시판 글쓰기
     * URL  : /board/write
     * View : templates/board/board_write.html
     */
    @GetMapping("/write")
    public String boardWrite() {
        return "board/board_write";
    }
}