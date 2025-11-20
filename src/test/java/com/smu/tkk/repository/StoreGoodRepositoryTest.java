package com.smu.tkk.repository;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import static org.junit.jupiter.api.Assertions.*;
@SpringBootTest
class StoreGoodRepositoryTest {
    @Autowired
    private StoreGoodRepository storeGoodRepository;
    @Test
    void findByStoreId() {
        System.out.println(storeGoodRepository.findByStoreId(1L));
    }
}