package com.smu.tkk.service;

import com.smu.tkk.entity.BoardComment;
import com.smu.tkk.entity.BoardPost;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

public interface AdminBoardService {

    // 게시글 목록 (카테고리 + 키워드 검색)
    Page<BoardPost> readPosts(Pageable pageable, Long categoryId, String keyword);

    // 게시글 한 건
    BoardPost readPost(Long postId);

    // 게시글별 댓글 목록
    Page<BoardComment> readComments(Long postId, Pageable pageable);

    // 게시글 비활성(삭제)
    void softDeletePost(Long postId);

    // 게시글 복구
    void restorePost(Long postId);

    // 댓글 비활성(삭제)
    void softDeleteComment(Long commentId);

    // 🔥 리스트 화면에서 Y/N 토글용
    void changeDeletedYn(Long postId, String deletedYn);
}
