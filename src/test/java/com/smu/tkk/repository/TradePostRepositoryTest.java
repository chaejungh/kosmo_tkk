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
class TradePostRepositoryTest {
@Autowired
TradePostRepository tradePostRepository;
    @Test
    @Transactional
    void modify() {
        tradePostRepository.modify("OFF_SELL",1L);
    }

    @Test
    void findBySellerId() {
        Sort sort = Sort.by(Sort.Direction.ASC, "id");
        Pageable pageable = PageRequest.of(0, 5, sort);
        System.out.println(tradePostRepository.findBySellerId(1L,pageable).getContent());
    }
}