package com.smu.tkk.repository;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.test.annotation.Rollback;
import org.springframework.transaction.annotation.Transactional;

import static org.junit.jupiter.api.Assertions.*;
@Rollback(value = false)
@SpringBootTest
class TradeChatMessageRepositoryTest {

    @Autowired
    TradeChatMessageRepository tradeChatMessageRepository;
    @Test
    void findByRoomId() {
        Sort sort= Sort.by("id").ascending();
        Pageable pageable = PageRequest.of(0,5,sort);
        System.out.println(tradeChatMessageRepository.findByRoomId(1L, pageable));
    }

    @Test
    @Transactional
    void modifyRead() {
        System.out.println(tradeChatMessageRepository.modifyRead("Y",1L,2L));
    }
}