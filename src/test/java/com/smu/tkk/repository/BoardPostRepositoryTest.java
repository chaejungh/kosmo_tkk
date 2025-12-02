package com.smu.tkk.repository;

import com.smu.tkk.entity.BoardCategory;
import com.smu.tkk.entity.Member;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.test.annotation.Rollback;
import org.springframework.transaction.annotation.Transactional;

import java.util.Optional;
@Rollback(value = false)
@SpringBootTest
class BoardPostRepositoryTest {
    @Autowired
    private BoardPostRepository boardPostRepository;
    @Autowired
    private BoardLikeRepository boardLikeRepository;
    Sort sort= Sort.by("id").ascending();
    Pageable pageable =PageRequest.of(0,5,sort);
    @Autowired
    BoardCategoryRepository boardCategoryRepository;
    @Autowired
    MemberRepository memberRepository;

    @Transactional(readOnly = true)
    @Test
    void findAllByDeletedYn() {

        System.out.println(boardPostRepository.findAllByDeletedYn("N", pageable));

    }

    @Test
    void findAllByCategoryIdAndDeletedYn() {

        Optional<BoardCategory> category =boardCategoryRepository.findById((long)1);
//        Optional<BoardCategory> category = Optional.ofNullable(null );
        if (category.isPresent()) {
            System.out.println(boardPostRepository.findAllByCategoryIdAndDeletedYn(1L, "N", pageable));
        }
    }


    @Test
    void findAllByTitleContainingIgnoreCaseAndDeletedYn() {
        System.out.println(boardPostRepository.findAllByTitleContainingIgnoreCaseAndDeletedYn("게시글 00","N",pageable));
    }
    @Test
    @Transactional(readOnly = false)
    void updateAddLikeCnt() {
       // System.out.println(boardPostRepository.findById(1L));
        boardPostRepository.updateAddLikeCnt(1L);
        //System.out.println(boardPostRepository.findById(1L));

    }

    @Test
    void findAllByMemberIdAndDeletedYn() {
        Pageable pageable = PageRequest.of(0,5,sort);
        System.out.println(boardPostRepository.findAllByMemberIdAndDeletedYn(1L,"N",pageable).getContent());
    }

    @Test
    void findTop5ByCategoryIdAndDeletedYnOrderByLikeCountDesc() {
        System.out.println(boardPostRepository.findTop5ByCategoryIdAndDeletedYnOrderByLikeCountDesc(1L,"N"));
    }

    @Test
    void findTop5ByDeletedYnOrderByLikeCountDesc() {
        System.out.println(boardPostRepository.findTop5ByDeletedYnOrderByLikeCountDesc("N"));
    }

    @Test
    void findAllByMember_NicknameContainingIgnoreCaseAndDeletedYn() {
        System.out.println(boardPostRepository.findAllByMember_NicknameContainingIgnoreCaseAndDeletedYn("닉네임085","N",pageable).getContent());
    }
}