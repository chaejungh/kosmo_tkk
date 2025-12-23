package com.smu.tkk.repository;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.data.domain.Pageable;

import static org.junit.jupiter.api.Assertions.*;
@SpringBootTest
class TradeRepositoryTest {
    @Autowired
    TradeRepository tradeRepository;
    @Test
    void findAllByOrderByLikeCountDesc() {
        System.out.println(tradeRepository.findAllByOrderByCreatedAtDesc(Pageable.unpaged()).getContent());
    }
}