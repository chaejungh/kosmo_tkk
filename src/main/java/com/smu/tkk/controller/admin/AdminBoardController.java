package com.smu.tkk.controller.admin;

import com.smu.tkk.entity.BoardComment;
import com.smu.tkk.entity.BoardPost;
import com.smu.tkk.service.AdminBoardService;
import com.smu.tkk.service.BoardCategoryService;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/admin/boards")
@RequiredArgsConstructor
public class AdminBoardController {

    private final AdminBoardService adminBoardService;
    private final BoardCategoryService boardCategoryService;

    /**
     * 게시글 리스트
     *   /admin/boards?page=0&size=20&categoryId=1&keyword=테스트
     */
    @GetMapping
    public String list(@RequestParam(defaultValue = "0") int page,
                       @RequestParam(defaultValue = "20") int size,
                       @RequestParam(required = false) Long categoryId,
                       @RequestParam(required = false) String keyword,
                       Model model) {

        Pageable pageable = PageRequest.of(
                page,
                size,
                Sort.by(Sort.Direction.DESC, "createdAt")
        );

        Page<BoardPost> boards = adminBoardService.readPosts(pageable, categoryId, keyword);

        // ★ 템플릿에서 boards 로 사용하므로 이름을 맞춰줌
        model.addAttribute("boards", boards);

        // 검색 조건 유지용
        model.addAttribute("categoryId", categoryId);
        model.addAttribute("keyword", keyword);

        // 카테고리 드롭다운용
        model.addAttribute("categories", boardCategoryService.readAll(Pageable.unpaged()));

        return "admin/board_list";
    }

    /**
     * 게시글 상세 + 댓글 목록
     *   /admin/boards/{postId}
     */
    @GetMapping("/{postId}")
    public String detail(@PathVariable Long postId,
                         @RequestParam(defaultValue = "0") int page,
                         @RequestParam(defaultValue = "20") int size,
                         Model model) {

        BoardPost post = adminBoardService.readPost(postId);

        Pageable pageable = PageRequest.of(
                page,
                size,
                Sort.by(Sort.Direction.DESC, "createdAt")
        );

        Page<BoardComment> comments = adminBoardService.readComments(postId, pageable);

        model.addAttribute("post", post);
        model.addAttribute("comments", comments);
        model.addAttribute("pageable", pageable);

        return "admin/board_detail";
    }

    /**
     * 리스트 화면에서 상태 토글 (활성 <-> 비활성)
     *  - deletedYn 파라미터로 'Y' 또는 'N'을 넘김
     */
    @PostMapping("/{postId}/status")
    public String changeStatus(@PathVariable Long postId,
                               @RequestParam String deletedYn,
                               @RequestParam(required = false) Long categoryId,
                               @RequestParam(required = false) String keyword,
                               @RequestParam(defaultValue = "0") int page,
                               @RequestParam(defaultValue = "20") int size,
                               RedirectAttributes redirectAttributes) {

        adminBoardService.changeDeletedYn(postId, deletedYn);
        redirectAttributes.addFlashAttribute("message", "게시글 상태가 변경되었습니다.");

        // 기존 필터/페이지 유지
        redirectAttributes.addAttribute("page", page);
        redirectAttributes.addAttribute("size", size);
        if (categoryId != null) {
            redirectAttributes.addAttribute("categoryId", categoryId);
        }
        if (keyword != null && !keyword.isBlank()) {
            redirectAttributes.addAttribute("keyword", keyword);
        }

        return "redirect:/admin/boards";
    }

    /**
     * 게시글 비활성(삭제) – 상세 화면 등에서 사용
     */
    @PostMapping("/{postId}/delete")
    public String deletePost(@PathVariable Long postId,
                             RedirectAttributes redirectAttributes) {

        adminBoardService.softDeletePost(postId);
        redirectAttributes.addFlashAttribute("message", "게시글이 삭제(비활성화) 되었습니다.");

        return "redirect:/admin/boards";
    }

    /**
     * 게시글 복구 – 상세 화면에서 사용
     */
    @PostMapping("/{postId}/restore")
    public String restorePost(@PathVariable Long postId,
                              RedirectAttributes redirectAttributes) {

        adminBoardService.restorePost(postId);
        redirectAttributes.addFlashAttribute("message", "게시글이 복구되었습니다.");

        return "redirect:/admin/boards/" + postId;
    }

    /**
     * 댓글 비활성(삭제)
     */
    @PostMapping("/{postId}/comments/{commentId}/delete")
    public String deleteComment(@PathVariable Long postId,
                                @PathVariable Long commentId,
                                RedirectAttributes redirectAttributes) {

        adminBoardService.softDeleteComment(commentId);
        redirectAttributes.addFlashAttribute("message", "댓글이 삭제(비활성화) 되었습니다.");

        return "redirect:/admin/boards/" + postId;
    }
}
