package com.smu.tkk.controller;

import com.smu.tkk.dto.BoardWriteValid;
import com.smu.tkk.entity.BoardCategory;
import com.smu.tkk.entity.BoardLike;
import com.smu.tkk.entity.BoardPost;
import com.smu.tkk.entity.Member;
import com.smu.tkk.service.BoardLikeService;
import com.smu.tkk.service.BoardService;
import com.smu.tkk.service.MemberService;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.sql.SQLException;
import java.util.List;
@RequiredArgsConstructor
@Controller
public class BoardController {
    private final BoardService boardService;
    private final BoardLikeService boardLikeService;
    private final MemberService memberService;

    // 리스트 컨트롤러 ---------------------------------------------

    @GetMapping("/mcboard/list.do")
    public String mcBoardList(
            Model model,
            HttpSession session,
            @PageableDefault(page = 0,size = 10) Pageable pageable,
            @RequestParam(name = "sortType",defaultValue = "latest")String sortType) throws SQLException {

        // TODO: memberId 사용해서 내가 쓴 글, 권한 등 나중에 서비스 붙이면 됨
        // 일단은 게시판 리스트 화면만 보여주자.
        Long categoryId=1L;//카테고리아이디 1== mcBoard

        Sort sort = switch (sortType){
            case "popular" -> Sort.by(Sort.Direction.DESC, "likeCount");
            default -> Sort.by(Sort.Direction.DESC, "createdAt");
        };

        Pageable sortedPageable = PageRequest.of(
                pageable.getPageNumber(),
                pageable.getPageSize(),
                sort
        );



        Page<BoardPost> posts = boardService.readByCategory(categoryId,sortedPageable);
        // 2) 현재 게시판 인기글 TOP5  (왼쪽)
        List<BoardPost> hotCurrentBoard = boardService.getHotPostsInCategory(categoryId);

        // 3) 전체 게시판 인기글 TOP5   (오른쪽)
        List<BoardPost> hotAllBoard = boardService.getHotPostsAll();

        Long memberId = (Long) session.getAttribute("memberId");
        model.addAttribute("memberId",memberId);
        model.addAttribute("posts", posts); // ★ 타임리프에서 ${posts}로 사용
        model.addAttribute("hotCurrentBoard", hotCurrentBoard);//현재게시판기준 핫글
        model.addAttribute("hotAllBoard", hotAllBoard);//전체게시판기준 핫글
        model.addAttribute("sortType",sortType);
        return "board/mcboard_list";   // 이미 사용하던 템플릿 이름 기준
    }
    @GetMapping("/cosplayboard/list.do")
    public String cosplayBoardList(
            Model model,
            HttpSession session,
            @PageableDefault(page = 0,size = 10) Pageable pageable,
            @RequestParam(name = "sortType",defaultValue = "latest")String sortType) throws SQLException{
        // TODO: memberId 사용해서 내가 쓴 글, 권한 등 나중에 서비스 붙이면 됨
        // 일단은 게시판 리스트 화면만 보여주자.
        Long categoryId=2L;//카테고리아이디 2== cosplayboard

        Sort sort = switch (sortType){
            case "popular" -> Sort.by(Sort.Direction.DESC, "likeCount");
            default -> Sort.by(Sort.Direction.DESC, "createdAt");
        };

        Pageable sortedPageable = PageRequest.of(
                pageable.getPageNumber(),
                pageable.getPageSize(),
                sort
        );

        Page<BoardPost> posts = boardService.readByCategory(categoryId,sortedPageable);
        // 2) 현재 게시판 인기글 TOP5  (왼쪽)
        List<BoardPost> hotCurrentBoard = boardService.getHotPostsInCategory(categoryId);

        // 3) 전체 게시판 인기글 TOP5   (오른쪽)
        List<BoardPost> hotAllBoard = boardService.getHotPostsAll();

        Long memberId = (Long) session.getAttribute("memberId");
        model.addAttribute("memberId",memberId);
        model.addAttribute("posts", posts); // ★ 타임리프에서 ${posts}로 사용
        model.addAttribute("hotCurrentBoard", hotCurrentBoard);//현재게시판기준 핫글
        model.addAttribute("hotAllBoard", hotAllBoard);//전체게시판기준 핫글
        model.addAttribute("sortType",sortType);
        return "board/cosplayboard_list";   // 이미 사용하던 템플릿 이름 기준
    }
    @GetMapping("/freeboard/list.do")
    public String freeBoardList(
            Model model,
            HttpSession session,
            @PageableDefault(page = 0,size = 10) Pageable pageable,
            @RequestParam(name = "sortType",defaultValue = "latest")String sortType) throws SQLException {
        // TODO: memberId 사용해서 내가 쓴 글, 권한 등 나중에 서비스 붙이면 됨
        // 일단은 게시판 리스트 화면만 보여주자.
        Long categoryId=3L;//카테고리아이디 3== freeboard

        Sort sort = switch (sortType){
            case "popular" -> Sort.by(Sort.Direction.DESC, "likeCount");
            default -> Sort.by(Sort.Direction.DESC, "createdAt");
        };

        Pageable sortedPageable = PageRequest.of(
                pageable.getPageNumber(),
                pageable.getPageSize(),
                sort
        );
        Page<BoardPost> posts = boardService.readByCategory(categoryId,sortedPageable);
        // 2) 현재 게시판 인기글 TOP5  (왼쪽)
        List<BoardPost> hotCurrentBoard = boardService.getHotPostsInCategory(categoryId);

        // 3) 전체 게시판 인기글 TOP5   (오른쪽)
        List<BoardPost> hotAllBoard = boardService.getHotPostsAll();

        Long memberId = (Long) session.getAttribute("memberId");
        model.addAttribute("memberId",memberId);
        model.addAttribute("posts", posts); // ★ 타임리프에서 ${posts}로 사용
        model.addAttribute("hotCurrentBoard", hotCurrentBoard);//현재게시판기준 핫글
        model.addAttribute("hotAllBoard", hotAllBoard);//전체게시판기준 핫글
        model.addAttribute("sortType",sortType);
        return "board/freeboard_list";   // 이미 사용하던 템플릿 이름 기준
    }

    // 디테일 컨트롤러 ---------------------------------------------


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
                                Model model) throws Exception {
        BoardPost post = boardService.readOne(postId);
        BoardLike likeInfo = boardLikeService.readlikecount(postId, memberId);
        model.addAttribute("memberId", memberId);
        model.addAttribute("post", post);
        model.addAttribute("likeInfo", likeInfo);  // ← html 에서 사용
        return "board/cosplayboard_detail"; // 상세 템플릿 이름
    }
    @GetMapping("/freeboard/{memberId}/article/{postId}/detail.do")
    public String freeBoardDetail(@PathVariable Long memberId,
                                @PathVariable Long postId,
                                Model model) throws Exception {
        BoardPost post = boardService.readOne(postId);
        BoardLike likeInfo = boardLikeService.readlikecount(postId, memberId);
        model.addAttribute("memberId", memberId);
        model.addAttribute("post", post);
        model.addAttribute("likeInfo", likeInfo);  // ← html 에서 사용
        return "board/freeboard_detail"; // 상세 템플릿 이름
    }

// 비회원 화면

    @GetMapping("/board/not-allowed")
    public String boardNotAllowed(){
        return "board/not_allowed";
    }

    /**
     * 기존 /board로 들어오는 요청 호환용
     * -> 기본값 memberId의 자유게시판으로 리다이렉트
     */
    @GetMapping("/board")
    public String legacyBoardRoot() {

        return "redirect:/mcboard/list.do";
    }

    @GetMapping("/board/{memberId}/write")
    public String writeForm(
            @Valid BoardWriteValid boardWriteValid,
            BindingResult bindingResult,
            @PathVariable Long memberId,
            Model model) {
        model.addAttribute("memberId",memberId);
        return "board/board_write";
    }

    @PostMapping("/board/{memberId}/write")
    public String writeFormSubmit(
        @Valid BoardWriteValid boardWriteValid,
        BindingResult bindingResult,
        @RequestParam(name = "images", required = false)
        List<MultipartFile> images,
        @RequestParam(name = "category") Long categoryId,
        HttpSession session,
        @SessionAttribute(name = "memberId",required = false) Long memberId
    ) throws SQLException {
            if (memberId == null) {
                return "redirect:/auth/login";
            }
            if(bindingResult.hasErrors()){ //valid 를 사용하려면 양식인척 해야함
                //System.out.println("유효성 검사 문제 발생");
                return "board/board_write";
            }

            BoardPost boardPost = new BoardPost();
            boardPost.setMemberId(memberId);
            boardPost.setCategoryId(categoryId);
            boardPost.setTitle(boardWriteValid.getTitle());
            boardPost.setContent(boardWriteValid.getContent());
            boardPost.setDeletedYn("N");
//            boardPost.setBoardPostImages();
            // 1) 게시글 저장
            boolean execute =  boardService.register(boardPost);
            if (!execute){
                return "board/board_write";
            };
            return "redirect:/mcboard/list.do";
    }

}
