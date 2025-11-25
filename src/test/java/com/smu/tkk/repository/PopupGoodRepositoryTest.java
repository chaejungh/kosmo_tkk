package com.smu.tkk.repository;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import static org.junit.jupiter.api.Assertions.*;
@SpringBootTest
class PopupGoodRepositoryTest {
@Autowired
PopupGoodRepository popupGoodRepository;
    @Test
    void findAllByPopupId() {
        System.out.println(popupGoodRepository.findAllByPopupId(1L));
    }
}