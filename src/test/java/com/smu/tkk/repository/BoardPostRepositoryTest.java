package com.smu.tkk.repository;

import com.smu.tkk.entity.BoardCategory;
import com.smu.tkk.entity.Member;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.transaction.annotation.Transactional;

import java.util.Optional;

@SpringBootTest
class BoardPostRepositoryTest {
    @Autowired
    private BoardPostRepository boardPostRepository;

    Sort sort= Sort.by("id").ascending();
    Pageable pageable =PageRequest.of(0,5,sort);

    @Transactional(readOnly = true)
    @Test
    void findAllByDeletedYn() {

        System.out.println(boardPostRepository.findAllByDeletedYn("N", pageable));

    }

    @Autowired
    BoardCategoryRepository boardCategoryRepository;
    @Test
    void findAllByCategoryAndDeletedYn() {

        Optional<BoardCategory> category =boardCategoryRepository.findById((long)1);
//        Optional<BoardCategory> category = Optional.ofNullable(null );
        if (category.isPresent()) {
            System.out.println(boardPostRepository.findAllByCategoryAndDeletedYn(category.get(), "N", pageable));
        }
    }

    @Autowired
    MemberRepository memberRepository;
    @Test
    void findAllByMemberAndDeletedYn() {
        Optional<Member> member = memberRepository.findById((long)1);
        if(member.isPresent()){
            System.out.println(boardPostRepository.findAllByMemberAndDeletedYn(member.get(),"N",pageable));
        }
    }

    @Test
    void findAllByTitleContainingIgnoreCaseAndDeletedYn() {

        System.out.println(boardPostRepository.findAllByTitleContainingIgnoreCaseAndDeletedYn("게시글 00","N",pageable));


    }
}