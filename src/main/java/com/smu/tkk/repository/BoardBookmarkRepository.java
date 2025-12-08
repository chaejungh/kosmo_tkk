package com.smu.tkk.repository;

import com.smu.tkk.entity.BoardBookmark;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface BoardBookmarkRepository extends JpaRepository<BoardBookmark,Long> {
    void deleteByMemberId(Long memberId);

    /*    // 특정 회원이 특정 게시글을 북마크 했는지 여부
    boolean existsByMemberAndPost(Member member, BoardPost post);

    // 특정 회원 + 게시글 조합의 북마크 한 건 조회
    Optional<BoardBookmark> findByMemberAndPost(Member member, BoardPost post);

    // 특정 회원 + 게시글 북마크 삭제
    void deleteByMemberAndPost(Member member, BoardPost post);*/

    // 이미 북마크 했는지 여부 (중복 방지용)
    boolean existsByPostIdAndMemberId(Long postId, Long userId);

    // postId + userId 조합의 북마크 한 건 가져오기
    Optional<BoardBookmark> findByPostIdAndMemberId(Long postId, Long userId);

    // 한 회원이 북마크한 게시글들 전부
    Page<BoardBookmark> findByMemberId(Long memberId, Pageable pageable);

    // 해당 게시글을 북마크한 사람들 목록 (필요하면 사용)
    //List<BoardBookmark> findByPostId(Long postId);

    // 게시글이 받은 북마크 개수 (인기글 정렬 등에 사용)
    //long countByPost(BoardPost post);
    //long countByPostId(Long postId);

}
