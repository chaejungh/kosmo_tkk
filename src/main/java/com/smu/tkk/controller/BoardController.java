package com.smu.tkk.controller;

import com.smu.tkk.entity.BoardLike;
import com.smu.tkk.entity.BoardPost;
import com.smu.tkk.service.BoardLikeService;
import com.smu.tkk.service.BoardService;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import java.sql.SQLException;
import java.util.List;
@RequiredArgsConstructor
@Controller
public class BoardController {
    private final BoardService boardService;
    private final BoardLikeService boardLikeService;
    /**
     * 자유게시판 리스트
     * 예) /free/1/list.do
     */
    @GetMapping("/mcboard/{memberId}/list.do")
    public String mcBoardList(
            @PathVariable("memberId") Long memberId, Model model,
            @PageableDefault(page = 0,size = 5, sort = "createdAt",direction = Sort.Direction.DESC) Pageable pageable) throws SQLException {

        // TODO: memberId 사용해서 내가 쓴 글, 권한 등 나중에 서비스 붙이면 됨
        // 일단은 게시판 리스트 화면만 보여주자.
        Long categoryId=1L;//카테고리아이디 1== mcBoard
        Page<BoardPost> posts = boardService.readByCategory(categoryId,pageable);


        // 2) 현재 게시판 인기글 TOP5  (왼쪽)
        List<BoardPost> hotCurrentBoard = boardService.getHotPostsInCategory(categoryId);

        // 3) 전체 게시판 인기글 TOP5   (오른쪽)
        List<BoardPost> hotAllBoard = boardService.getHotPostsAll();


        model.addAttribute("memberId", memberId);
        model.addAttribute("posts", posts); // ★ 타임리프에서 ${posts}로 사용
        model.addAttribute("hotCurrentBoard", hotCurrentBoard);//현재게시판기준 핫글
        model.addAttribute("hotAllBoard", hotAllBoard);//전체게시판기준 핫글

        return "board/mcboard_list";   // 이미 사용하던 템플릿 이름 기준
    }
    @GetMapping("/cosplayboard/{memberId}/list.do")
    public String cosplayBoardList(
            @PathVariable("memberId") Long memberId, Model model,
            @PageableDefault(page = 0,size = 5, sort = "createdAt",direction = Sort.Direction.DESC) Pageable pageable) throws SQLException{
        // TODO: memberId 사용해서 내가 쓴 글, 권한 등 나중에 서비스 붙이면 됨
        // 일단은 게시판 리스트 화면만 보여주자.
        Long categoryId=2L;//카테고리아이디 2== cosplayboard
        Page<BoardPost> posts = boardService.readByCategory(categoryId,pageable);
        // 2) 현재 게시판 인기글 TOP5  (왼쪽)
        List<BoardPost> hotCurrentBoard = boardService.getHotPostsInCategory(categoryId);

        // 3) 전체 게시판 인기글 TOP5   (오른쪽)
        List<BoardPost> hotAllBoard = boardService.getHotPostsAll();

        model.addAttribute("memberId", memberId);
        model.addAttribute("posts", posts); // ★ 타임리프에서 ${posts}로 사용
        model.addAttribute("hotCurrentBoard", hotCurrentBoard);//현재게시판기준 핫글
        model.addAttribute("hotAllBoard", hotAllBoard);//전체게시판기준 핫글
        return "board/cosplayboard_list";   // 이미 사용하던 템플릿 이름 기준
    }
    @GetMapping("/freeboard/{memberId}/list.do")
    public String freeBoardList(@PathVariable("memberId") Long memberId, Model model, Pageable pageable) throws SQLException {
        // TODO: memberId 사용해서 내가 쓴 글, 권한 등 나중에 서비스 붙이면 됨
        // 일단은 게시판 리스트 화면만 보여주자.
        Long categoryId=3L;//카테고리아이디 3== freeboard
        Page<BoardPost> posts = boardService.readByCategory(categoryId,pageable);
        // 2) 현재 게시판 인기글 TOP5  (왼쪽)
        List<BoardPost> hotCurrentBoard = boardService.getHotPostsInCategory(categoryId);

        // 3) 전체 게시판 인기글 TOP5   (오른쪽)
        List<BoardPost> hotAllBoard = boardService.getHotPostsAll();
        model.addAttribute("memberId", memberId);
        model.addAttribute("posts", posts); // ★ 타임리프에서 ${posts}로 사용
        model.addAttribute("hotCurrentBoard", hotCurrentBoard);//현재게시판기준 핫글
        model.addAttribute("hotAllBoard", hotAllBoard);//전체게시판기준 핫글
        return "board/freeboard_list";   // 이미 사용하던 템플릿 이름 기준
    }


    @GetMapping("/mcboard/{memberId}/article/{postId}/detail.do")
    public String mcBoardDetail(@PathVariable Long memberId,
                                @PathVariable Long postId,
                                Model model) throws Exception {
        BoardPost post = boardService.readOne(postId);

        BoardLike likeInfo = boardLikeService.readlikecount(postId, memberId);

        model.addAttribute("memberId", memberId);
        model.addAttribute("post", post);
        model.addAttribute("likeInfo", likeInfo);  // ← html 에서 사용

        return "board/mcboard_detail"; // 상세 템플릿 이름
    }
    @GetMapping("/cosplayboard/{memberId}/article/{postId}/detail.do")
    public String cosplayBoardDetail(@PathVariable Long memberId,
                                @PathVariable Long postId,
                                Model model) throws SQLException {
        BoardPost post = boardService.readOne(postId);

        model.addAttribute("memberId", memberId);
        model.addAttribute("post", post);

        return "board/cosplayboard_detail"; // 상세 템플릿 이름
    }
    @GetMapping("/freeboard/{memberId}/article/{postId}/detail.do")
    public String freeBoardDetail(@PathVariable Long memberId,
                                @PathVariable Long postId,
                                Model model) throws SQLException {
        BoardPost post = boardService.readOne(postId);

        model.addAttribute("memberId", memberId);
        model.addAttribute("post", post);

        return "board/freeboard_detail"; // 상세 템플릿 이름
    }


    /**
     * 기존 /board로 들어오는 요청 호환용
     * -> 기본값 memberId=1의 자유게시판으로 리다이렉트
     */
    @GetMapping("/board")
    public String legacyBoardRoot() {
        return "redirect:/mcboard/1/list.do";
    }

    @GetMapping("/board/{memberId}/write")
    public String writeForm(@PathVariable Long memberId) {
        // ...
        return "board/board_write";
    }

}
