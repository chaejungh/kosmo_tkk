package com.smu.tkk.repository;

import com.smu.tkk.entity.TradeChatRoom;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

public interface TradeChatRoomRepository extends JpaRepository<TradeChatRoom, Long> {

    // 내가 속한 채팅방 목록
    Page<TradeChatRoom> findByMemberId(Long memberId, Pageable pageable);

    // 🔥 특정 거래글에 열린 채팅방 개수 (몇 명이 채팅 걸었는지)
    long countByTradeId(Long tradeId);
}