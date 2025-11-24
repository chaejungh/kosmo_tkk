package com.smu.tkk.repository;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;

import static org.junit.jupiter.api.Assertions.*;
@SpringBootTest
class TradeChatMessageRepositoryTest {

    @Autowired
    TradeChatMessageRepository tradeChatMessageRepository;
    @Test
    void findByMemberIdAndReadYn() {
        Sort sort= Sort.by("id").ascending();
        Pageable pageable = PageRequest.of(0,5,sort);
        System.out.println(tradeChatMessageRepository.findByMemberIdAndReadYn(1L,"N", pageable));
    }
}