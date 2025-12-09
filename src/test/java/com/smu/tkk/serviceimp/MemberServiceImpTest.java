package com.smu.tkk.serviceimp;

import com.smu.tkk.service.MemberService;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.annotation.Rollback;
import org.springframework.transaction.annotation.Transactional;

import static org.junit.jupiter.api.Assertions.*;
@SpringBootTest
@Rollback(value = false)
class MemberServiceImpTest {
    @Autowired
    private MemberService memberServiceImp;
    @Test
    @Transactional
    void deleteMember() {
        memberServiceImp.deleteMember(30L);
    }
}