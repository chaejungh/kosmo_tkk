package com.smu.tkk.repository;

import com.smu.tkk.entity.BoardPost;
import com.smu.tkk.entity.BoardReport;
import com.smu.tkk.entity.Member;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.annotation.Rollback;
import org.springframework.transaction.annotation.Transactional;

import static org.junit.jupiter.api.Assertions.*;
@Rollback(value = false)
@SpringBootTest
class BoardReportRepositoryTest {
    @Autowired
    BoardReportRepository boardReportRepository;
    @Test
    @Transactional
    void insert(){
        BoardReport boardReport = new BoardReport();
//        boardReport.setId(141L);
        Member member = new Member();
        member.setId(1L);
        BoardPost post = new BoardPost();
        post.setId(1L);
        boardReport.setReporter(member);
        boardReport.setPost(post);

        System.out.println(boardReportRepository.save(boardReport));

    }
    @Test
    void findAll(){
        System.out.println(boardReportRepository.findAll());
    }
}