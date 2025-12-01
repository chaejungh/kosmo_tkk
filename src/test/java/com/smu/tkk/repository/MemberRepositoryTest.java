package com.smu.tkk.repository;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.annotation.Rollback;
import org.springframework.transaction.annotation.Transactional;

import static org.junit.jupiter.api.Assertions.*;
@Rollback(value = false)
@SpringBootTest

class MemberRepositoryTest {
    @Autowired
    private MemberRepository memberRepository;

    @Test
    void findAll(){
        System.out.println(memberRepository.findAll());
    }

    @Test
    void existsByLoginId() {
        System.out.println(
                memberRepository.existsByLoginId("user001")
        );
    }

    @Test
    void existsByNickname() {
    }

    @Test
    void existsByLoginIdAndLoginPw() {
        System.out.println(memberRepository.existsByLoginIdAndLoginPw("user001","pw001"));
    }
    @Test
    void insertImage(){

//        memberRepository.save();
    }

    @Test
    @Transactional
    void update() {
        System.out.println(memberRepository.update("user0001","pw0001","닉네임0001",null,"안녕하세요 유저 1입니다.","chaejungh@gmai.com",1L));
    }

    @Test
    @Transactional
    void updateImg() {
        System.out.println(memberRepository.updateImg("https://example.com/profile/user001.png",1L));
    }

    @Test
    void findByLoginIdAndLoginPw() {
        System.out.println(memberRepository.findByLoginIdAndLoginPw("user001","pw001"));
    }
}