package com.smu.tkk.repository;

import com.smu.tkk.entity.TradeChatRoom;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDate;

import static org.junit.jupiter.api.Assertions.*;
@SpringBootTest
class TradeChatRoomRepositoryTest {

    @Autowired
    TradeChatRoomRepository tradeChatRoomRepository;

    @Test
    void findByMemberId() {
        Sort sort= Sort.by("id").ascending();
        Pageable pageable = PageRequest.of(0,5,sort);
        System.out.println(tradeChatRoomRepository.findByMemberId(1L, pageable));
    }

    @Test
    @Transactional
    void register(){
        TradeChatRoom tradeChatRoom=new TradeChatRoom();
        tradeChatRoom.setCreatedAt(LocalDate.now());
        tradeChatRoom.setMemberId(1L);
        tradeChatRoom.setTradeId(21L);
        tradeChatRoom.setType("SELLER");
        tradeChatRoom.setLastMessageAt(LocalDate.now());
        tradeChatRoom.setCreatedAt(LocalDate.now());
        tradeChatRoomRepository.save(tradeChatRoom);
    }
}