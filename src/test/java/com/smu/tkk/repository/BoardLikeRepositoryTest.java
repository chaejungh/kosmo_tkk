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
    void existsByPostIdAndUserId() {

    }

    @Test
    void countByPostId() {

    }


    @Test
    void findPostsByMemberId() {
        Sort sort= Sort.by("id").ascending();
        Pageable pageable =PageRequest.of(0,5,sort);
       // System.out.println(boardLikeRepository.findPostsByMemberId(1L,pageable));
    }

    @Test
    @Transactional
    void findByMember_Id() {
        Pageable pageable =PageRequest.of(0,10,Sort.by("id").ascending());
        Page<BoardPost> boardPostPage = boardLikeRepository.findByMember_Id(2L, pageable);

        //System.out.println(boardPostPage.getContent());
        for(BoardPost boardPost:boardPostPage.getContent()){
            System.out.println(boardPost);
            System.out.println(boardPost.getBoardLikes());
        }
//       List<BoardPost> findByMember_Id= boardLikeRepository.findByMember_Id(1L);
//        System.out.println(findByMember_Id);
    }
}