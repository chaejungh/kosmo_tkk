package com.smu.tkk.repository;

import com.smu.tkk.entity.BoardPostTag;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;

public interface BoardPostTagRepository extends JpaRepository<BoardPostTag, Long> {

    List<BoardPostTag> findByPostId(Long postId);

    boolean existsByPostIdAndTagId(Long postId, Long tagId);

    Optional<Object> findByPostIdAndTagId(Long postId, Long tagId);
}