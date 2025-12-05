package com.smu.tkk.repository;

import com.smu.tkk.entity.BoardPost;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.EntityGraph;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface BoardPostRepository extends JpaRepository<BoardPost, Long> {

    /**
     * 삭제 여부로 전체 게시글 조회 (최신순)
     */
    Page<BoardPost> findAllByDeletedYn(String deletedYn, Pageable pageable);

    /**
     * 카테고리별 게시글 목록 (삭제되지 않은 것만, 최신순)
     * categoryId 컬럼 기반 + 연관 엔티티 fetch
     */
    @EntityGraph(attributePaths = {"category", "member", "member.memberNotificationSetting"})
    Page<BoardPost> findAllByCategoryIdAndDeletedYn(Long categoryId, String deletedYn, Pageable pageable);

    /**
     * 작성자별 게시글 목록 (삭제되지 않은 것만, 최신순)
     */
    Page<BoardPost> findAllByMemberIdAndDeletedYn(Long memberId, String deletedYn, Pageable pageable);

    /**
     * 제목 키워드 검색 (대소문자 무시, 삭제되지 않은 것만, 최신순)
     */
    Page<BoardPost> findAllByTitleContainingIgnoreCaseAndDeletedYn(String keyword, String deletedYn, Pageable pageable);

    /**
     * 작성자 닉네임 검색 (대소문자 무시, 삭제되지 않은 것만, 최신순)
     */
    Page<BoardPost> findAllByMember_NicknameContainingIgnoreCaseAndDeletedYn(String nickname, String deletedYn, Pageable pageable);

    /**
     * 좋아요 개수 +1
     */
    @Modifying
    @Query("UPDATE BoardPost b SET b.likeCount = b.likeCount + 1 WHERE b.id = :postId")
    void updateAddLikeCnt(@Param("postId") long postId);

    /**
     * 현재 게시판(카테고리) 인기글 TOP5
     */
    List<BoardPost> findTop5ByCategoryIdAndDeletedYnOrderByLikeCountDesc(Long categoryId, String deletedYn);

    /**
     * 전체 게시판 인기글 TOP5
     */
    List<BoardPost> findTop5ByDeletedYnOrderByLikeCountDesc(String deletedYn);

    /**
     * 🔥 관리자용 검색 (카테고리 + 제목 키워드)
     *  - categoryId 가 null 이면 전체
     *  - keyword 가 null 이거나 빈 문자열이면 제목 필터 없이 전체
     *  - 필요하면 AdminBoardService 에서 이 메서드 써서 한 줄로 정리할 수도 있음
     *
     *  ※ deletedYn 조건까지 넣고 싶으면 and p.deletedYn = 'N' 추가하면 됨
     */
    @Query("""
        select p
        from BoardPost p
        where (:categoryId is null or p.categoryId = :categoryId)
          and (
                :keyword is null
                or :keyword = ''
                or lower(p.title) like lower(concat('%', :keyword, '%'))
          )
        order by p.createdAt desc
        """)
    Page<BoardPost> searchForAdmin(@Param("categoryId") Long categoryId,
                                   @Param("keyword") String keyword,
                                   Pageable pageable);

}
