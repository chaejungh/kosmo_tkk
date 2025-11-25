package com.smu.tkk.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

@Controller
public class BoardController {

    /**
     * 자유게시판 리스트
     * 예) /free/1/list.do
     */
    @GetMapping("/free/{memberId}/list.do")
    public String freeBoardList(@PathVariable("memberId") Long memberId) {
        // TODO: memberId 사용해서 내가 쓴 글, 권한 등 나중에 서비스 붙이면 됨
        // 일단은 게시판 리스트 화면만 보여주자.
        return "board/board_list";   // 이미 사용하던 템플릿 이름 기준
    }

    /**
     * 기존 /board로 들어오는 요청 호환용
     * -> 기본값 memberId=1의 자유게시판으로 리다이렉트
     */
    @GetMapping("/board")
    public String legacyBoardRoot() {
        return "redirect:/free/1/list.do";
    }
}