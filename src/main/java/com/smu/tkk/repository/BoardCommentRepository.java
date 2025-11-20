package com.smu.tkk.repository;

import com.smu.tkk.entity.BoardComment;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import java.sql.SQLException;
import java.util.List;

public interface BoardCommentRepository extends JpaRepository<BoardComment, Long> {
//    // 3. 특정 게시글의 댓글 목록 조회
//    List<BoardComment> readByPost(Long postId, Pageable pageable) throws SQLException;
    List<BoardComment> findByPostId(Long postId, Pageable pageable);

}