package com.smu.tkk.service;

import com.smu.tkk.entity.BoardComment;

public interface CommentService {

    // 1. 댓글 작성 (parentCommentId 가 null 이면 일반 댓글, 값 있으면 대댓글)
    BoardComment addComment(Long postId,
                            Long memberId,
                            String content,
                            Long parentCommentId);

    // 2. 댓글 삭제 (작성자만 삭제 가능, soft delete 가정)
    void deleteComment(Long commentId, Long memberId);
}