package com.smu.tkk.controller;

import com.smu.tkk.entity.BoardLike;
import com.smu.tkk.entity.BoardPost;
import com.smu.tkk.service.BoardService;
import com.smu.tkk.service.NoticeService;
import lombok.AllArgsConstructor;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.sql.SQLException;
import java.util.List;

@Controller
@RequestMapping("/mypage")
@AllArgsConstructor(onConstructor_ = @Autowired)
public class MypageController {

    /**
     * =========================
     * 마이페이지 메인
     * URL : /mypage/{memberId}/
     * View: templates/mypage/mypage_main.html
     * =========================
     */
    private final BoardService boardService;
//    @Autowired
//    public MypageController(BoardService boardService) {
//        this.boardService = boardService;
//    }

    @GetMapping("/{memberId}/")
    public String mypageMainWithId(@PathVariable("memberId") Long memberId) {
        // TODO: memberId로 내 정보/찜 리스트 등 나중에 로딩
        return "mypage/mypage_main";
    }

    /**
     * 기존 /mypage 진입은 임시로 memberId=1로 리다이렉트
     * 나중에 로그인/세션 붙이면 현재 로그인한 회원 ID로 바꿔주면 됨.
     */
    @GetMapping
    public String legacyMypageMain() {
        return "redirect:/mypage/1/";
    }

    /* ======= 아래는 서비스/FAQ/문의 등 기존 URL 그대로 사용 ======= */
    @GetMapping("/posts")
    public String myPosts(
            Model model,
            @PageableDefault(size = 10, page = 0, sort = "createdAt", direction = Sort.Direction.DESC) Pageable pageable
    ) throws SQLException {
        Long loginMemberId = 1L;
        String yN = "N";
        Page<BoardPost> boardsPage = boardService.readByUser(loginMemberId, yN, pageable);
        model.addAttribute("boardsPage", boardsPage);
        return "mypage/board/my_board_posts";
    }

    @GetMapping("/likes")
    public String myPostLike(Model model, Pageable pageable) throws SQLException {
        Long loginMemberId = 1L;
        Page<BoardLike> boardLikes = boardService.readByLike(loginMemberId, pageable);//좋아요한 게시글 목록
        model.addAttribute("boardLikes", boardLikes);
        model.addAttribute("memberId", loginMemberId);
        return "mypage/board/likes";
    }
}
