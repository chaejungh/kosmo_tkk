package com.smu.tkk.repository;

import com.smu.tkk.entity.BoardBookmark;
import com.smu.tkk.entity.BoardPost;
import com.smu.tkk.entity.Member;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.orm.jpa.TestEntityManager;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;

import static org.assertj.core.api.Assertions.assertThat;
import static org.junit.jupiter.api.Assertions.*;
@SpringBootTest
class BoardBookmarkRepositoryTest {
    @Autowired
    private BoardBookmarkRepository boardBookmarkRepository;

    @Autowired
    private MemberRepository memberRepository;

    TestEntityManager em;
    private Member member1;
    private Member member2;
    private BoardPost post1;
    private BoardPost post2;


    @Transactional(readOnly = true)

    @Test
    void findAllByMember() {
        Sort sort = Sort.by(Sort.Direction.ASC, "id");
        Pageable pageable = PageRequest.of(0, 5, sort);

//        // 1) 테스트용 회원이 없으면 여기서 바로 에러 던지게
//        Member member = memberRepository.findById((long)1)
//                .orElseThrow(() -> new IllegalStateException("id=1 회원이 없습니다. 회원을 먼저 넣어주세요."));

        // 2) 북마크 조회
        var bookmarks = boardBookmarkRepository.findByMemberId(1L, pageable);

        // 3) 확인
        System.out.println("bookmark size = " + bookmarks.size());
        bookmarks.forEach(System.out::println);
    }


    @Test
    void countByPost() {
        long countPost1 = boardBookmarkRepository.countByPostId(1L);

        long countPost2 = boardBookmarkRepository.countByPostId(2L);
        System.out.println(countPost1);
        System.out.println(countPost2);

    }

    @Test
    void existsByPostIdAndMemberId() {
        System.out.println(boardBookmarkRepository.existsByPostIdAndMemberId(1L,1L));
        System.out.println(boardBookmarkRepository.existsByPostIdAndMemberId(1L,7L));
    }

    @Test
    void findByPostIdAndMemberId() {
        Optional<BoardBookmark> boardBookmarkOpt=boardBookmarkRepository.findByPostIdAndMemberId(1L,1L);
        boardBookmarkOpt.ifPresent((bb)->{
            System.out.println(bb);
        });
    }

    @Test
    void findByPostId() {
        List<BoardBookmark> bookmarks=boardBookmarkRepository.findByPostId(1L);
        System.out.println(bookmarks);
    }

//    void findAll(){
//        System.out.println(boardBookmarkRepository.findAll());
//    };

}