package com.smu.tkk.controller;

import com.smu.tkk.entity.BoardLike;
import com.smu.tkk.service.BoardLikeService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

@RestController
@RequiredArgsConstructor
@RequestMapping("/api/board-like")
public class BoardLikeApiController {

    private final BoardLikeService boardLikeService;

    // ★ toggle + 현재 카운트 리턴
    @PostMapping("/{postId}/toggle")
    public LikeResponse toggle(@PathVariable Long postId,
                               @RequestParam Long memberId) throws Exception {

        // 이미 누른 상태면 제거, 아니면 등록 (서비스에 맞게 구현)
        BoardLike current = boardLikeService.readlikecount(postId, memberId);
        if (current.getId() != null) {
            boardLikeService.removeOne(postId, memberId);
        } else {
            boardLikeService.registerOne(postId, memberId);
        }

        // 다시 읽어서 최신 카운트/상태 리턴
        BoardLike result = boardLikeService.readlikecount(postId, memberId);

        boolean liked = result.getId() != null;
        return new LikeResponse(result.getLikeCount(), liked);
    }

    public record LikeResponse(int likeCount, boolean liked) {}
}
