package com.smu.tkk.repository;

import com.smu.tkk.entity.BoardPost;
import com.smu.tkk.entity.BoardCategory;
import com.smu.tkk.entity.Member;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;

public interface BoardPostRepository extends JpaRepository<BoardPost, Long> {

    // 삭제되지 않은 게시글만 최신순 전체 조회
    List<BoardPost> findAllByDeletedYnFalseOrderByCreatedAtDesc();

    // 카테고리별 게시글 목록 (삭제되지 않은 것만, 최신순)
    List<BoardPost> findAllByCategoryAndDeletedYnFalseOrderByCreatedAtDesc(BoardCategory category);

    // 작성자별 게시글 목록 (삭제되지 않은 것만, 최신순)
    List<BoardPost> findAllByMemberAndDeletedYnFalseOrderByCreatedAtDesc(Member member);

    // 제목 검색 (키워드 포함, 삭제되지 않은 것만, 최신순)
    List<BoardPost> findAllByTitleContainingIgnoreCaseAndDeletedYnFalseOrderByCreatedAtDesc(String keyword);

    // 단일 조회(삭제되지 않은 게시글만)
    Optional<BoardPost> findByIdAndDeletedYnFalse(Long id);
}
