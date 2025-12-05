package com.smu.tkk.repository;

import com.smu.tkk.entity.BoardComment;
import org.springframework.data.domain.Page;        // 🔹 새로 추가
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import java.sql.SQLException;
import java.util.List;

public interface BoardCommentRepository extends JpaRepository<BoardComment, Long> {

    // 기존 코드들 그대로 유지
//    // 3. 특정 게시글의 댓글 목록 조회
//    List<BoardComment> readByPost(Long postId, Pageable pageable) throws SQLException;

    List<BoardComment> findByPostId(Long postId, Pageable pageable);

    // 댓글 개수 조회
    long countByPostId(Long postId);

    // 삭제 여부까지 함께 보는 리스트 조회
    List<BoardComment> findByPostIdAndDeletedYn(Long postId, String deletedYn, Pageable pageable);

    // 🔥 AdminBoardServiceImp.readComments(...) 에서 사용하는 페이징 메서드
    Page<BoardComment> findAllByPostId(Long postId, Pageable pageable);
}
