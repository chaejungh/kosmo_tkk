package com.smu.tkk.service;

import com.smu.tkk.entity.BoardComment;
import org.springframework.data.domain.Pageable;

import java.sql.SQLException;
import java.util.List;

/**
 * 댓글 서비스
 *
 * - 댓글 등록
 * - 댓글 삭제
 * - 댓글 목록 조회
 * - 대댓글(답글) 등록
 */
public interface CommentService {

    // 1. 댓글 등록
    boolean register(BoardComment comment) throws SQLException, IllegalArgumentException;

    // 2. 댓글 삭제
    boolean remove(Long commentId) throws SQLException;

    // 3. 특정 게시글의 댓글 목록 조회
    List<BoardComment> readByPost(Long postId, Pageable pageable) throws SQLException;

    long countByPostId(Long postId) throws SQLException;

}