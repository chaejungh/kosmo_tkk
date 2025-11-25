//package com.smu.tkk.controller;
//
//import com.smu.tkk.entity.BoardPost;
//import com.smu.tkk.entity.BoardCategory;
//import com.smu.tkk.service.BoardService;
//import lombok.RequiredArgsConstructor;
//import org.springframework.data.domain.PageRequest;
//import org.springframework.data.domain.Pageable;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.*;
//
//import java.sql.SQLException;
//import java.util.List;
//
//@Controller
//@RequiredArgsConstructor
//public class BoardController {
//
//    private final BoardService boardService;
//
//    /* ================== 1. 게시글 목록 페이지 ================== */
//    @GetMapping("/board")
//    public String boardList(@RequestParam(defaultValue = "1") int page,
//                            @RequestParam(required = false) String keyword,
//                            @RequestParam(required = false) Long categoryId,
//                            Model model) throws SQLException {
//
//        int size = 10;                                  // 한 페이지 게시글 개수
//        Pageable pageable = PageRequest.of(page - 1, size);
//
//        List<BoardPost> posts;
//
//        // 검색 우선
//        if (keyword != null && !keyword.isBlank()) {
//            posts = boardService.readByKeyword(keyword);
//        }
//        // 카테고리 필터
//        else if (categoryId != null) {
//            posts = boardService.readByCategory(categoryId);
//        }
//        // 기본: 전체 목록 (페이징)
//        else {
//            posts = boardService.readAll(pageable);
//        }
//
//        // 카테고리 목록 (필요 없으면 안 써도 됨)
//        List<BoardCategory> categories = boardService.readAllCategories();
//
//        model.addAttribute("posts", posts);
//        model.addAttribute("categories", categories);
//        model.addAttribute("currentPage", page);
//        model.addAttribute("keyword", keyword);
//        model.addAttribute("categoryId", categoryId);
//
//        // 이미 있는 템플릿 이름
//        return "board/board_list";
//    }
//
//    /* ================== 2. 게시글 상세 페이지 ================== */
//    @GetMapping("/board/{postId}")
//    public String boardDetail(@PathVariable Long postId, Model model) throws SQLException {
//
//        BoardPost post = boardService.readOne(postId);          // 글 본문
//        model.addAttribute("post", post);
//
//        // 이미지 / 태그도 화면에서 쓸 수 있게 추가
//        model.addAttribute("images", boardService.readImages(postId));
//        model.addAttribute("tags", boardService.readTagsByPost(postId));
//
//        return "board/board_detail";
//    }
//
//    /* ================== 3. 글쓰기 페이지 (GET) ================== */
//    @GetMapping("/board/write")
//    public String writeForm(Model model) throws SQLException {
//
//        model.addAttribute("post", new BoardPost());             // 폼 바인딩용
//        model.addAttribute("categories", boardService.readAllCategories());
//
//        return "board/board_write";
//    }
//
//    /* ================== 4. 글쓰기 처리 (POST) ================== */
//    @PostMapping("/board/write")
//    public String writeSubmit(@ModelAttribute BoardPost post) throws SQLException {
//
//        // BoardService의 register 사용 (이미 있는 메소드)
//        boardService.register(post);
//
//        return "redirect:/board";
//    }
//
//    /* ================== 5. 글 수정 폼 (선택사항) ================== */
//    @GetMapping("/board/edit/{postId}")
//    public String editForm(@PathVariable Long postId, Model model) throws SQLException {
//
//        BoardPost post = boardService.readOne(postId);
//
//        model.addAttribute("post", post);
//        model.addAttribute("categories", boardService.readAllCategories());
//
//        // 수정 화면도 글쓰기 화면 재사용하면 편함
//        return "board/{memberId}/write";
//    }
//
//    /* ================== 6. 글 수정 처리 ================== */
//    @PostMapping("/board/edit/{postId}")
//    public String editSubmit(@PathVariable Long postId,
//                             @ModelAttribute BoardPost post) throws SQLException {
//
//        // post 안에 id 필드가 이미 바인딩된다고 가정 (hidden input 등)
//        boardService.modify(post);
//
//        return "redirect:/board/" + postId;
//    }
//
//    /* ================== 7. 글 삭제 ================== */
//    @PostMapping("/board/delete/{postId}")
//    public String deletePost(@PathVariable Long postId) throws SQLException {
//
//        boardService.remove(postId);
//        return "redirect:/board";
//    }
//}