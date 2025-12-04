package com.smu.tkk.repository;

import com.smu.tkk.entity.BoardLike;
import com.smu.tkk.entity.BoardPost;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;
import java.util.Optional;

public interface BoardLikeRepository extends JpaRepository<BoardLike, Long> {

    //SELECT * FROM BOARD_POST WHERE POST_ID IN (SELECT POST_ID FROM BOARD_POST_LIKE WHERE MEMBER_ID=?)
    //SELECT * FROM BoardPost b Join Fetch b.boardLikes l WHERE l.member.id=?

//    Page<BoardPost> findByMember_Id(Long memberId, Pageable pageable);
//    List<BoardPost> findByMember_Id(Long memberId);

    //@Query(value = "SELECT b FROM BoardPost b Join Fetch b.boardLikes l WHERE l.member.id=:memberId")
    //Page<BoardPost> findByMember_Id(Long memberId,Pageable pageable);
    //좋아요 한 게시글 조회
    Page<BoardLike> findByMemberId(Long userId, Pageable pageable);

    // 멤버가 누른 좋아요가 있는지 찾기
    Optional<BoardLike> findByPostIdAndMemberId(Long postId, Long userId);

    boolean existsByPostIdAndMemberId(Long postId, Long userId);

    int countByPostId(Long postId);

}