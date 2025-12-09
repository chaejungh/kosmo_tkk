package com.smu.tkk.service;

import com.smu.tkk.entity.Member;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.sql.SQLException;

import static org.junit.jupiter.api.Assertions.*;
@SpringBootTest
class MemberServiceTest {
@Autowired
MemberService memberService;
    @Test
    void login() throws SQLException {
        Member member = memberService.login("user001","pw001");
        System.out.print(member);
    }
}