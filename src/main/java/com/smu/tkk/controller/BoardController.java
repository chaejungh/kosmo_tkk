package com.smu.tkk.controller;

import com.smu.tkk.dto.BoardWriteValid;
import com.smu.tkk.entity.*;
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
import com.smu.tkk.service.CommentService;
import org.springframework.data.domain.PageRequest;
import com.smu.tkk.entity.BoardComment;





import java.sql.SQLException;
import java.util.List;
@RequiredArgsConstructor
@Controller
public class BoardController {
    private final BoardService boardService;
    private final BoardLikeService boardLikeService;
    private final MemberService memberService;
    private final CommentService commentService;


    // 리스트 컨트롤러 ---------------------------------------------

    @GetMapping("/mcboard/list.do")
    public String mcBoardList(
            Model model,
            HttpSession session,
            @PageableDefault(page = 0,size = 10,sort = "createdAt",direction = Sort.Direction.DESC) Pageable pageable
    ) throws SQLException {

        Long categoryId = 1L; // 내 새끼 자랑
        return renderBoardList(
                categoryId,
                "board/mcboard_list",
                model,
                session,
                pageable,
                null          // ★ 검색어 없음 → 일반 리스트
        );
    }
    @GetMapping("/cosplayboard/list.do")
    public String cosplayBoardList(
            Model model,
            HttpSession session,
            @PageableDefault(page = 0,size = 10,sort = "createdAt",direction = Sort.Direction.DESC) Pageable pageable)
            throws SQLException {

        Long categoryId = 2L; // 코스프레
        return renderBoardList(
                categoryId,
                "board/cosplayboard_list",
                model,
                session,
                pageable,
                null          // ★ 검색어 없음 → 일반 리스트
        );
    }
    @GetMapping("/freeboard/list.do")
    public String freeBoardList(
            Model model,
            HttpSession session,
            @PageableDefault(page = 0,size = 10,sort = "createdAt",direction = Sort.Direction.DESC) Pageable pageable)
            throws SQLException {

        Long categoryId = 3L; // 자유
        return renderBoardList(
                categoryId,
                "board/freeboard_list",
                model,
                session,
                pageable,
                null          // ★ 검색어 없음 → 일반 리스트
        );
    }

    // 디테일 컨트롤러 ---------------------------------------------


    @GetMapping("/mcboard/{memberId}/article/{postId}/detail.do")
    public String mcBoardDetail(
            @PathVariable Long memberId,
            @PathVariable Long postId,
            Model model) throws Exception {

        BoardPost post = boardService.readOne(postId);
        boardService.increaseViewCount(postId);
        BoardLike likeInfo = boardLikeService.readlikecount(postId, memberId);

        List<BoardComment> commentList =
                commentService.readByPost(postId, PageRequest.of(0, 100));

        // 🔥 댓글 개수 조회 추가
        long commentCount = commentService.countByPostId(postId);
        model.addAttribute("commentCount", commentCount);

        model.addAttribute("memberId", memberId);
        model.addAttribute("post", post);
        model.addAttribute("likeInfo", likeInfo);

        model.addAttribute("commentList", commentList);
        model.addAttribute("commentCount", commentCount);   // 🔥 추가된 부분
        post.setCommentCount(commentService.countByPostId(post.getId()));

        return "board/mcboard_detail";
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

    //    검색 ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
    @PostMapping("/mcboard/list.do")
    public String mcBoardSearch(
            Model model,
            HttpSession session,
            @RequestParam(name = "search") String search,
            @PageableDefault(page = 0,size = 10,sort = "createdAt",direction = Sort.Direction.DESC) Pageable pageable
    ) throws SQLException {

        Long categoryId = 1L; // 내 새끼 자랑
        return renderBoardList(
                categoryId,
                "board/mcboard_list",
                model,
                session,
                pageable,
                search        // ★ 검색어 전달
        );
    }
    @PostMapping("/cosplayboard/list.do")
    public String cosplayBoardSearch(
            Model model,
            HttpSession session,
            @RequestParam(name = "search") String search,
            @PageableDefault(page = 0,size = 10,sort = "createdAt",direction = Sort.Direction.DESC) Pageable pageable
    ) throws SQLException {

        Long categoryId = 2L; // 내 새끼 자랑
        return renderBoardList(
                categoryId,
                "board/cosplayboard_list",
                model,
                session,
                pageable,
                search        // ★ 검색어 전달
        );
    }
    @PostMapping("/freeboard/list.do")
    public String freeBoardSearch(
            Model model,
            HttpSession session,
            @RequestParam(name = "search") String search,
            @PageableDefault(page = 0,size = 10,sort = "createdAt",direction = Sort.Direction.DESC) Pageable pageable
    ) throws SQLException {

        Long categoryId = 3L; // 내 새끼 자랑
        return renderBoardList(
                categoryId,
                "board/freeboard_list",
                model,
                session,
                pageable,
                search        // ★ 검색어 전달
        );
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



//    글쓰기 ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
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

//    리스트 출력시 공통 메서드
// ✅ 공통 리스트 + 검색 처리 메서드
    private String renderBoardList(
            Long categoryId,
            String viewName,              // 예: "board/mcboard_list"
            Model model,
            HttpSession session,
            Pageable pageable,
            String search                 // 검색어 (없으면 null/빈문자)
    ) throws SQLException {

        // 1) 목록 or 검색 결과
        Page<BoardPost> posts;
        if (search != null && !search.isBlank()) {
            // 🔍 검색일 때
            posts = boardService.readByKeyword(search, pageable);
            // 필요하면 categoryId까지 걸러주는 메서드로 바꿔도 됨
            // posts = boardService.readByKeywordInCategory(categoryId, search, sortedPageable);
        } else {
            // 일반 리스트일 때
            posts = boardService.readByCategory(categoryId, pageable);
        }
        // 🔥 각 게시글마다 댓글 개수 세팅
        for (BoardPost post : posts.getContent()) {
            long commentCount = commentService.countByPostId(post.getId());
            post.setCommentCount(commentCount);
        }
        for (BoardPost post : posts.getContent()) {
            long commentCount = commentService.countByPostId(post.getId());
            post.setCommentCount(commentCount);
        }

        // 2) 인기글 TOP5
        List<BoardPost> hotCurrentBoard = boardService.getHotPostsInCategory(categoryId);
        List<BoardPost> hotAllBoard = boardService.getHotPostsAll();

        //UI 표시용 (뺴도 됨)
        String sortType = "latest"; // 기본값: 최신순
        Sort sort = pageable.getSort();
        Sort.Order likeOrder = sort.getOrderFor("likeCount");
        if (likeOrder != null && likeOrder.isDescending()) {
            sortType = "popular";
        }
        // 3) 공통 모델 세팅
        Long memberId = (Long) session.getAttribute("memberId");
        model.addAttribute("memberId", memberId);
        model.addAttribute("posts", posts);
        model.addAttribute("hotCurrentBoard", hotCurrentBoard);
        model.addAttribute("hotAllBoard", hotAllBoard);
        model.addAttribute("sortType", sortType);
        model.addAttribute("search", search);

        return viewName;
    }
    // =============================
// 댓글 등록
// =============================
    @PostMapping("/mcboard/{memberId}/article/{postId}/comment/write.do")
    public String writeComment(
            @PathVariable Long memberId,
            @PathVariable Long postId,
            @RequestParam("content") String content
    ) throws Exception {



        // 2️⃣ 댓글 객체 생성
        BoardComment comment = new BoardComment();
        comment.setContent(content);

        // 3️⃣ 댓글 작성자 넣기
          // ★ 로그인한 사용자 ID (URL에서 받음)
        comment.setMemberId(memberId);

        // 4️⃣ 어떤 게시글에 달린 댓글인지 지정
        comment.setPostId(postId);

        // 5️⃣ 저장
        commentService.register(comment);

        // 6️⃣ 다시 원래 화면으로 돌아가기
        return "redirect:/mcboard/" + memberId + "/article/" + postId + "/detail.do";
    }

    // =============================
// 댓글 삭제
// =============================
    @GetMapping("/mcboard/{memberId}/article/{postId}/comment/{commentId}/delete.do")
    public String deleteComment(
            @PathVariable Long memberId,
            @PathVariable Long postId,
            @PathVariable Long commentId
    ) throws Exception {

        commentService.remove(commentId);

        return "redirect:/mcboard/" + memberId + "/article/" + postId + "/detail.do";
    }

}
