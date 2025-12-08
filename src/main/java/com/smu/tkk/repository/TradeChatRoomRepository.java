package com.smu.tkk.repository;

import com.smu.tkk.entity.TradeChatRoom;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;
import java.util.Optional;

public interface TradeChatRoomRepository extends JpaRepository<TradeChatRoom, Long> {

    // 내가 속한 채팅방 목록
    @Query("""
        SELECT r FROM TradeChatRoom r
        WHERE r.buyerId= :memberId OR r.sellerId=:memberId
            ORDER BY r.lastMessageAt desc
    """)
    Page<TradeChatRoom> findBySellerIdOrBuyerId(Long memberId,Pageable pageable);
    List<TradeChatRoom> findBySellerId(Long memberId);

    TradeChatRoom findByTradeIdAndBuyerId(Long tradeId, Long buyerId);

    @Override
    Optional<TradeChatRoom> findById(Long roomId);

    // 🔥 특정 거래글에 열린 채팅방 개수 (몇 명이 채팅 걸었는지)
    long countByTradeId(Long tradeId);
}
