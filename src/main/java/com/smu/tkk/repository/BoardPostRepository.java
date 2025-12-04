package com.smu.tkk.repository;

import com.smu.tkk.entity.BoardPost;
import com.smu.tkk.entity.BoardCategory;
import com.smu.tkk.entity.Member;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.EntityGraph;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

public interface BoardPostRepository extends JpaRepository<BoardPost, Long> {

    // 삭제되지 않은 게시글만 최신순 전체 조회
    Page<BoardPost> findAllByDeletedYn(String deleteYn, Pageable pageable);

    // 카테고리별 게시글 목록 (삭제되지 않은 것만, 최신순)
    //Where category is Null
    @EntityGraph(attributePaths = {"category","member","member.memberNotificationSetting"})
    Page<BoardPost> findAllByCategoryIdAndDeletedYn(Long categoryId, String deletedYn, Pageable pageable);

    //Where category=null
//    List<BoardPost> findAllByCategoryAndDeletedYn(BoardCategory category,String deleteYn, Pageable pageable);

    // 작성자별 게시글 목록 (삭제되지 않은 것만, 최신순)

    Page<BoardPost> findAllByMemberIdAndDeletedYn(Long memberId, String deleteYn, Pageable pageable);
//
//    // 제목 검색 (키워드 포함, 삭제되지 않은 것만, 최신순)
    Page<BoardPost> findAllByTitleContainingIgnoreCaseAndDeletedYn(String keyword,String deleteYn,Pageable pageable);

    Page<BoardPost> findAllByMember_NicknameContainingIgnoreCaseAndDeletedYn(String nickname,String deleteYn,Pageable pageable);
//
//    // 단일 조회(삭제되지 않은 게시글만)
//    Optional<BoardPost> findByIdAndDeletedYn(Long id);

    //좋아요개수 업데이트
    @Modifying
    @Query(value = "UPDATE BoardPost b set b.likeCount=b.likeCount+1 WHERE b.id=:postId")
    void updateAddLikeCnt(long postId);

    // 현재 게시판(카테고리) 인기글 TOP5
    List<BoardPost> findTop5ByCategoryIdAndDeletedYnOrderByLikeCountDesc(
            Long categoryId, String deletedYn
    );

    // 전체 게시판 인기글 TOP5
    List<BoardPost> findTop5ByDeletedYnOrderByLikeCountDesc(String deletedYn);

}
