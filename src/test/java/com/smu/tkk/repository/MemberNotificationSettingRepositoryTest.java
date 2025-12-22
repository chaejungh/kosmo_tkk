package com.smu.tkk.repository;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.annotation.Rollback;
import org.springframework.transaction.annotation.Transactional;

import static org.junit.jupiter.api.Assertions.*;
@Rollback(value = false)
@SpringBootTest
class MemberNotificationSettingRepositoryTest {
    @Autowired
    MemberNotificationSettingRepository memberNotificationSettingRepository;


//    @Test
//    @Transactional
//    void update() {
//        System.out.println(memberNotificationSettingRepository.update(1L,"Y","Y","Y","Y"));
//    }
}