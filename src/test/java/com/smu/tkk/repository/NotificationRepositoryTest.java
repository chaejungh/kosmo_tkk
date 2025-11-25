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
class NotificationRepositoryTest {
    @Autowired
    NotificationRepository notificationRepository;
    @Test
    void findByMemberIdAndReadYn() {
        Sort sort= Sort.by("id").ascending();
        Pageable pageable = PageRequest.of(0,5,sort);
        System.out.println(notificationRepository.findByMemberIdAndReadYn(1L,"N", pageable));
    }

    @Test
    @Transactional
    void modifyRead() {
        System.out.println(notificationRepository.modifyRead("Y",1L));
    }
}