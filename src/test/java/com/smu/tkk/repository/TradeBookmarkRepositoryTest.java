package com.smu.tkk.repository;

import com.smu.tkk.entity.TradeBookmark;
import com.smu.tkk.entity.TradePost;
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
class TradeBookmarkRepositoryTest {
@Autowired
TradeBookmarkRepository tradeBookmarkRepository;
TradePostRepository tradePostRepository;
MemberRepository memberRepository;

    @Test
    void existsByMemberIdAndTradeId() {
        System.out.println(tradeBookmarkRepository.existsByMemberIdAndTradeId(1L,1L));
        System.out.println(tradeBookmarkRepository.existsByMemberIdAndTradeId(1L,4L));
    }

    @Test
    void findByMemberId() {
//        Sort sort= Sort.by("id").ascending();
//        Pageable pageable = PageRequest.of(0,5,sort);
        System.out.println(tradeBookmarkRepository.findByMemberId(1L));
    }

    @Test
    @Transactional
    void register(){
        TradeBookmark tradeBookmark = new TradeBookmark();
        tradeBookmark.setCreatedAt(LocalDate.now());
        tradeBookmark.setMemberId(1L);
        tradeBookmark.setTradeId(10L);
        tradeBookmarkRepository.save(tradeBookmark);

    }

//    @Test
//    @Transactional
//    void deleteByMemberIdAndTradeId() {
//        tradeBookmarkRepository.deleteByMemberIdAndTradeId(1L,1L);
//    }

}