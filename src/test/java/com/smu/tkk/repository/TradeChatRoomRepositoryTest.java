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
import java.time.LocalDateTime;

@SpringBootTest
class TradeChatRoomRepositoryTest {

    @Autowired
    TradeChatRoomRepository tradeChatRoomRepository;



    @Test
    @Transactional
    void register(){
        TradeChatRoom tradeChatRoom=new TradeChatRoom();
        tradeChatRoom.setCreatedAt(LocalDateTime.now());
        tradeChatRoom.setSellerId(1L);
        tradeChatRoom.setBuyerId(2L);
        tradeChatRoom.setTradeId(21L);
        tradeChatRoom.setLastMessageAt(LocalDateTime.now());
        tradeChatRoom.setCreatedAt(LocalDateTime.now());
        tradeChatRoomRepository.save(tradeChatRoom);
    }

    @Test
    void findBySellerIdOrBuyerId() {
        Sort sort= Sort.by("id").ascending();
        Pageable pageable = PageRequest.of(0,5,sort);
        System.out.println(tradeChatRoomRepository.findBySellerIdOrBuyerId(1L));
    }

    @Test
    void findById() {
        System.out.println(tradeChatRoomRepository.findById(1L).get());
    }


    @Test
    void findByBuyerIdAndBuyerLeftYn() {
        System.out.println(tradeChatRoomRepository.findByBuyerIdAndBuyerLeftYn(21L,"N"));
    }

    @Test
    void findByTrade_SellerIdAndSellerLeftYn() {
        System.out.println(tradeChatRoomRepository.findByTrade_SellerIdAndSellerLeftYn(1L,"N"));
    }
}