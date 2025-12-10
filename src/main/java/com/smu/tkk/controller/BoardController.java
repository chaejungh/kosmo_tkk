package com.smu.tkk.controller;

import com.smu.tkk.dto.BoardWriteValid;
import com.smu.tkk.entity.*;
import com.smu.tkk.repository.BoardPostImageRepository;
import com.smu.tkk.service.*;
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
import com.smu.tkk.entity.BoardComment;





import java.sql.SQLException;
import java.util.List;
import java.util.Optional;
import java.util.Set;

@RequiredArgsConstructor
@Controller
public class BoardController {
    private final BoardService boardService;
    private final BoardLikeService boardLikeService;
    private final BoardBookmarkService boardBookmarkService;
    private final CommentService commentService;



    // 리스트 컨트롤러 ---------------------------------------------

    @GetMapping("/board/{categoryId}/list.do")
    public String boardList(
            @PathVariable Long categoryId,
            Model model,
            HttpSession session,
            @PageableDefault(page = 0,size = 10,sort = "createdAt",direction = Sort.Direction.DESC) Pageable pageable
    ) throws SQLException {

        return renderBoardList(
                categoryId,
                "board/board_list",
                model,
                session,
                pageable,
                null          // ★ 검색어 없음 → 일반 리스트
        );
    }

    // 디테일 컨트롤러 ---------------------------------------------


    @GetMapping("/board/{memberId}/article/{postId}/detail.do")
    public String boardDetail(@PathVariable Long memberId,
                                @PathVariable Long postId,
                                Model model) throws Exception {
        BoardPost post = boardService.readOne(postId);
        boardService.increaseViewCount(postId);
        BoardLike likeInfo = boardLikeService.readlikecount(postId, memberId);

        boolean isLiked = boardService.isLiked(memberId,postId);
        if (isLiked){
            model.addAttribute("isLiked",isLiked);
        }
        boolean bookmarked = boardBookmarkService.toggle(postId,memberId);

        List<BoardComment> commentList =
                commentService.readByPost(postId, PageRequest.of(0, 100));

        // 표지 이미지
        Optional<BoardPostImage> coverOpt = boardService.readOneImg(postId);
        String coverUrl = coverOpt.map(BoardPostImage::getImageUrl)
                .orElse("/images/dummy/noimg.png");
        Long coverImageId = coverOpt.map(BoardPostImage::getId).orElse(0L);
        model.addAttribute("coverImageId", coverImageId);

        // 🔥 댓글 개수 조회 추가
        long commentCount = commentService.countByPostId(postId);
        model.addAttribute("commentCount", commentCount);
        model.addAttribute("coverUrl", coverUrl);
        model.addAttribute("memberId", memberId);
        model.addAttribute("post", post);
        model.addAttribute("likeInfo", likeInfo);  // ← html 에서 사용
        model.addAttribute("bookmarked",bookmarked);
        model.addAttribute("commentList", commentList);
        model.addAttribute("commentCount", commentCount);   // 🔥 추가된 부분
        post.setCommentCount(commentService.countByPostId(post.getId()));

        return "board/board_detail"; // 상세 템플릿 이름
    }

    /* ===============================================================
      🔥 이미지 상세
      ============================================================== */
    @GetMapping("/board/{postId}/img/{imageId}/detail.do")
    public String imageDetail(@PathVariable Long postId,
                              @PathVariable Long imageId,
                              Model model) throws SQLException {

        List<BoardPostImage> imageList = boardService.readImages(postId);

        if (imageList == null || imageList.isEmpty()) {
            BoardPostImage dummy = new BoardPostImage();
            dummy.setId(0L);
            dummy.setImageUrl("/images/dummy/noimg.png");
            imageList = List.of(dummy);
        }

        final Long targetImageId = imageId;

        boolean exists = imageList.stream()
                .anyMatch(i -> i.getId().equals(targetImageId));

        Long validImageId = exists ? imageId : imageList.get(0).getId();

        int activeIndex = 0;
        for (int i = 0; i < imageList.size(); i++) {
            if (imageList.get(i).getId().equals(validImageId)) {
                activeIndex = i;
                break;
            }
        }

        model.addAttribute("imageList", imageList);
        model.addAttribute("activeIndex", activeIndex);

        return "trade/trade_image_detail";
    }
    // =============================
// 게시글 수정 폼
// =============================
    @GetMapping("/board/{memberId}/article/{postId}/edit.do")
    public String editForm(@PathVariable Long memberId,
                           @PathVariable Long postId,
                           HttpSession session,
                           Model model) throws Exception {


        // 게시글 조회
        BoardPost post = boardService.readOne(postId);
        if (post == null) {
            return "redirect:/board/1/list.do"; // 없으면 대략 리스트로
        }

        //  작성자 본인인지 한 번 더 확인
        if (!post.getMemberId().equals(memberId)) {
            return "redirect:/board/not-allowed";
        }

        // 폼 바인딩용 DTO 세팅 (BoardWriteValid 기준)
        BoardWriteValid form = new BoardWriteValid();
        form.setTitle(post.getTitle());
        form.setContent(post.getContent());
        // 카테고리 선택값이 필요하면
        form.setCategoryId(post.getCategory().getId());
        model.addAttribute("memberId", memberId);
        model.addAttribute("postId", postId);
        model.addAttribute("categoryId", post.getCategory().getId());
        model.addAttribute("boardWriteValid", form);
        model.addAttribute("mode", "edit");

        // 👉 별도 템플릿을 쓰면 "board/board_edit",
        //    기존 작성 폼 재사용이면 "board/board_write" 로 맞춰서 사용
        return "board/board_write";
    }
// =============================
// 게시글 수정 처리
// =============================
    @PostMapping("/board/{memberId}/article/{postId}/edit.do")
    public String editSubmit(@PathVariable Long memberId,
                             @PathVariable Long postId,
                             @Valid BoardWriteValid boardWriteValid,
                             BindingResult bindingResult,
                             @RequestParam("categoryId") Long categoryId,
                             HttpSession session,
                             Model model) throws Exception {


        BoardPost post = boardService.readOne(postId);
        if (post == null || !post.getMemberId().equals(memberId)) {
            return "redirect:/board/not-allowed";
        }

        // 유효성 에러 있으면 다시 폼으로
        if (bindingResult.hasErrors()) {
            model.addAttribute("memberId", memberId);
            model.addAttribute("postId", postId);
            model.addAttribute("categoryId", categoryId);
            return "board/board_write";
        }

        // 변경 값 세팅
        post.setCategoryId(categoryId);
        post.setTitle(boardWriteValid.getTitle());
        post.setContent(boardWriteValid.getContent());
        post.setDeletedYn("N");
        // 카테고리 변경 허용이면 여기서 바꿔주기
        if (!post.getCategory().getId().equals(categoryId)) {
            BoardCategory category = new BoardCategory();
            category.setId(categoryId);
            post.setCategory(category);
        }

        boolean success = boardService.modify(post);
        if (!success) {
            model.addAttribute("errorMessage", "게시글 수정에 실패했습니다.");
            model.addAttribute("memberId", memberId);
            model.addAttribute("postId", postId);
            return "board/board_write";
        }

        // 수정 후 상세로 이동
        return "redirect:/board/" + memberId + "/article/" + postId + "/detail.do";
    }

    // =============================
// 게시글 삭제
// =============================
    @GetMapping("/board/{memberId}/article/{postId}/delete.do")
    public String deletePost(@SessionAttribute(name = "memberId",required = false) Long memberId,
                             @PathVariable Long postId,
                             HttpSession session) throws Exception {


        BoardPost post = boardService.readOne(postId);
        if (post == null || !post.getMemberId().equals(memberId)) {
            return "redirect:/board/not-allowed";
        }

        Long categoryId = post.getCategoryId();

        boardService.remove(postId);  // 내부에서 deleted_yn = 'Y' 소프트 삭제라고 가정

        // 삭제 후 해당 카테고리 리스트로 이동
        return "redirect:/board/" + categoryId + "/list.do";
    }

    //    검색 ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
    @PostMapping("/board/list.do")
    public String boardSearch(
            Model model,
            HttpSession session,
            @RequestParam(name = "search") String search,
            @PageableDefault(page = 0,size = 10,sort = "createdAt",direction = Sort.Direction.DESC) Pageable pageable
    ) throws SQLException {

        Long categoryId = 1L; // 내 새끼 자랑
        return renderBoardList(
                categoryId,
                "board/board_list",
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

        return "redirect:/board/1/list.do";
    }



//    글쓰기 ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
    @GetMapping("/board/{memberId}/write")
    public String writeForm(
            @Valid BoardWriteValid boardWriteValid,
            BindingResult bindingResult,
            @PathVariable Long memberId,
            Model model) {
        model.addAttribute("memberId",memberId);
        model.addAttribute("mode", "create");
        return "board/board_write";
    }

    @PostMapping("/board/{memberId}/write")
    public String writeFormSubmit(
        @Valid BoardWriteValid boardWriteValid,
        BindingResult bindingResult,
        @RequestParam(name = "images", required = false)
        List<MultipartFile> images,
        @RequestParam(name = "categoryId") Long categoryId,
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

            // 1) 게시글 저장
            boardService.createPostWithImages(boardPost, images);

            boolean execute =  boardService.register(boardPost);
            if (!execute){
                return "board/board_write";
            };
            return "redirect:/board/"+categoryId+"/list.do";
    }

//    리스트 출력시 공통 메서드
// ✅ 공통 리스트 + 검색 처리 메서드
    private String renderBoardList(
            Long categoryId,
            String viewName,              // 예: "board/board_list"
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
        model.addAttribute("categoryId", categoryId);
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
    @PostMapping("/board/{memberId}/article/{postId}/comment/write.do")
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
        return "redirect:/board/" + memberId + "/article/" + postId + "/detail.do";
    }

    // =============================
// 댓글 삭제
// =============================
    @GetMapping("/board/{memberId}/article/{postId}/comment/{commentId}/delete.do")
    public String deleteComment(
            @PathVariable Long memberId,
            @PathVariable Long postId,
            @PathVariable Long commentId
    ) throws Exception {

        commentService.remove(commentId);

        return "redirect:/board/" + memberId + "/article/" + postId + "/detail.do";
    }
}
