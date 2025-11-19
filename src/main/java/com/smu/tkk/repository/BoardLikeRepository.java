package com.smu.tkk.repository;

import com.smu.tkk.entity.BoardLike;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface BoardLikeRepository extends JpaRepository<BoardLike, Long> {
    Optional<BoardLike> findByPostIdAndMemberId(Long postId, Long userId);
    boolean existsByPostIdAndMemberId(Long postId, Long userId);
    long countByPostId(Long postId);
}