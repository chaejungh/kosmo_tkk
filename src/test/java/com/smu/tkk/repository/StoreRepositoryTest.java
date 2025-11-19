package com.smu.tkk.repository;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.data.domain.Pageable;
import org.springframework.transaction.annotation.Transactional;

import static org.junit.jupiter.api.Assertions.*;
@SpringBootTest
class StoreRepositoryTest {
    @Autowired
    private StoreRepository storeRepository;
    @Test
    @Transactional
    void findAll(){

        Pageable pageable = Pageable.ofSize(10);
        System.out.println(storeRepository.findAll(pageable).getContent());
    };
}