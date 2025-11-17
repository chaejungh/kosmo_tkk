package com.smu.tkk.repository;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import static org.junit.jupiter.api.Assertions.*;
@SpringBootTest

class MemberRepositoryTest {
    @Autowired
    private MemberRepository memberRepository;

    @Test
    void findAll(){
        System.out.println(memberRepository.findAll());
    }

}