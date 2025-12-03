package com.smu.tkk.controller;

import com.smu.tkk.entity.BoardLike;
import com.smu.tkk.service.BoardLikeService;
import com.smu.tkk.service.BoardService;
import com.smu.tkk.service.MemberNotificationSettingService;
import com.smu.tkk.service.NotificationService;
import lombok.RequiredArgsConstructor;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@RestController
@RequiredArgsConstructor
@RequestMapping("/api/board-like")
public class BoardLikeApiController {

    private final BoardLikeService boardLikeService;
    private final BoardService boardService;
    private final MemberNotificationSettingService memberNotificationSettingService;
    private final NotificationService notificationService;

    // ★ toggle + 현재 카운트 리턴
    @PostMapping("/{postId}/toggle")
    public LikeResponse toggle(@PathVariable Long postId,
                               @RequestParam Long memberId, Model model) throws Exception {

        model.addAttribute("postId", postId);
        model.addAttribute("memberId", memberId);


        // 이미 누른 상태면 제거, 아니면 등록 (서비스에 맞게 구현)
        BoardLike current = boardLikeService.readlikecount(postId, memberId);

        boolean isNewLike = false;

        if (current.getId() != null) {
            boardLikeService.removeOne(postId, memberId);
        } else {
            boardLikeService.registerOne(postId, memberId);
        }

        // 다시 읽어서 최신 카운트/상태 리턴
        BoardLike result = boardLikeService.readlikecount(postId, memberId);

        boolean liked = result.getId() != null;

        if (isNewLike) {
            var post = boardService.readOne(postId);
            Long writerId = post.getMember().getId();

            var settingOpt = memberNotificationSettingService.get(writerId);
            if (settingOpt.isPresent() && "Y".equals(settingOpt.get().getLikeYn())) {
                notificationService.create(
                        writerId,
                        "LIKE",
                        "회원님 게시글에 좋아요가 눌렸습니다.",
                        "BOARD",
                        postId
                );
            }
        }


        return new LikeResponse(result.getLikeCount(), liked);


    }

    public record LikeResponse(int likeCount, boolean liked) {}
}
