package com.smu.tkk.repository;

import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.annotation.Rollback;
import org.springframework.transaction.annotation.Transactional;

import static org.junit.jupiter.api.Assertions.*;
@SpringBootTest
@Rollback(value = false)
class BoardPostTagRepositoryTest {
    private BoardPostTagRepository boardPostTagRepository;
    @Transactional
    @Test
    void deleteById() {
        boardPostTagRepository.deleteById(1L);
    }
}