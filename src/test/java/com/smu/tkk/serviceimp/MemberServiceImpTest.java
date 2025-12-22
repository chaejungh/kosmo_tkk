package com.smu.tkk.serviceimp;

import com.smu.tkk.service.MemberService;
import jakarta.annotation.PostConstruct;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.core.env.Environment;
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
    @Autowired
    Environment env;

    @PostConstruct
    public void checkMailProps() {
        System.out.println("spring.mail.host = " + env.getProperty("spring.mail.host"));
        System.out.println("spring.mail.port = " + env.getProperty("spring.mail.port"));
    }
}
