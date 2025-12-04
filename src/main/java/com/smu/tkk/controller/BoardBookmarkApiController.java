package com.smu.tkk.controller;

import com.smu.tkk.entity.BoardBookmark;
import com.smu.tkk.service.BoardBookmarkService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

@RestController
@RequiredArgsConstructor
@RequestMapping("/api/board-bookmark")
public class BoardBookmarkApiController {

    private final BoardBookmarkService boardBookmarkService;

    /**
     * 북마크 토글 API
     *  - 이미 북마크 상태면 → 삭제 후 bookmarked=false
     *  - 아니면 새로 등록 → bookmarked=true
     */
    @PostMapping("/{postId}/toggle")
    public BookmarkToggleResponse toggleBookmark(
            @PathVariable Long postId,
            @RequestParam Long memberId
    ) throws Exception {

        boolean bookmarked = boardBookmarkService.toggle(postId, memberId);

        return new BookmarkToggleResponse(bookmarked);
    }

    // 응답 JSON: { "bookmarked": true/false }
    public record BookmarkToggleResponse(boolean bookmarked) {}
}
