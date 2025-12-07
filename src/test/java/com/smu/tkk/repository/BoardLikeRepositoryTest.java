package com.smu.tkk.repository;

import com.smu.tkk.entity.BoardLike;
import com.smu.tkk.entity.BoardPost;
import jakarta.transaction.Transactional;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;

import java.util.List;
import java.util.Optional;

import static org.junit.jupiter.api.Assertions.*;
@SpringBootTest
class BoardLikeRepositoryTest {
    @Autowired
    private BoardLikeRepository boardLikeRepository;

    @Test
    void existsByPostIdAndMemberId() {
        System.out.println(boardLikeRepository.existsByPostIdAndMemberId(1L,1L));
        System.out.println(boardLikeRepository.existsByPostIdAndMemberId(1L,11L));
    }

//    @Test
//    @Transactional
//    void findByMember_Id() {//특정 멤버가 좋아요한 게시글 목록 조회
//        Pageable pageable =PageRequest.of(0,10,Sort.by("id").ascending());
//        Page<BoardPost> boardPostPage = boardLikeRepository.findByMember_Id(2L, pageable);
//
//        for(BoardPost boardPost:boardPostPage.getContent()){
//            System.out.println(boardPost);
//            System.out.println(boardPost.getBoardLikes());
//        }
//    }
    @Test
    void countByPostId() {
        int countPost1 = boardLikeRepository.countByPostId(10L);
        System.out.println(countPost1);
    }
}