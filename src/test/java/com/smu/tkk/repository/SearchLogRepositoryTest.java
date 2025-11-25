package com.smu.tkk.repository;

import com.smu.tkk.entity.Member;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.test.annotation.Rollback;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDate;

import static org.junit.jupiter.api.Assertions.*;
@Rollback(false)
@SpringBootTest
class SearchLogRepositoryTest {
    @Autowired
    private SearchLogRepository searchLogRepository;
    @Autowired
    private MemberRepository memberRepository;
    @Test
    void findByMember_Id() {
        Sort sort= Sort.by("id").ascending();
        Pageable pageable =PageRequest.of(0,5,sort);
        System.out.println(searchLogRepository.findByMember_Id((long)1,Pageable .unpaged()));
    }

    @Test
    @Transactional
    void deleteByMember_Id() {
        int deletedCount = searchLogRepository.deleteByMemberId(1L);
        if (deletedCount==1){
            System.out.println("deleted");
        }else {
            System.out.println("not deleted");
        }
    }

    @Test
    void testReadTopByCreatedAtBefore() {
        Pageable pageable= PageRequest.of(0,5);
        //LocalDate date=LocalDate.parse("2025-11-09");
        String date="2025-11-09";
        System.out.println(searchLogRepository.readTopByCreatedAtBefore(date,pageable));
    }

    @Test
    @Transactional
    void testDeleteByMember_Id() {
        Member member=memberRepository.findById((long)1).get();
        searchLogRepository.deleteByMember(member);
    }
}