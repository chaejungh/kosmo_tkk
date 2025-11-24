package com.smu.tkk.repository;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.sql.SQLException;

import static org.junit.jupiter.api.Assertions.*;
@SpringBootTest
class BoardPostImageRepositoryTest {
    @Autowired
    BoardPostImageRepository boardPostImageRepository;
    @Test
    void findAllByPostId() throws SQLException {
        System.out.println(boardPostImageRepository.findAllByPostId(1L));
    }
}