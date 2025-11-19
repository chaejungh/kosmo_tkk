package com.smu.tkk.repository;

import com.smu.tkk.entity.BoardLike;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.Optional;

import static org.junit.jupiter.api.Assertions.*;
@SpringBootTest
class BoardLikeRepositoryTest {
    @Autowired
    private BoardLikeRepository boardLikeRepository;

    @Test
    void findByPostIdAndUserId() {
        Optional<BoardLike> boardLike = boardLikeRepository.findByPostIdAndMemberId(1L, 1L);
    }

    @Test
    void existsByPostIdAndUserId() {

    }

    @Test
    void countByPostId() {

    }
}