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
        WHERE (r.buyerId= :memberId OR r.sellerId=:memberId) and (r.buyerLeftYn='N'and r.sellerLeftYn='N')
            ORDER BY r.lastMessageAt desc
    """)
    List<TradeChatRoom> findBySellerIdOrBuyerId(Long memberId);
    List<TradeChatRoom> findBySellerId(Long memberId);

    // 구매자 기준: 내가 buyer이면서, 아직 나가지 않은 방
    List<TradeChatRoom> findByBuyerIdAndBuyerLeftYn(Long memberId, String buyerLeftYn);

    // 판매자 기준: 내가 seller이면서, 아직 나가지 않은 방
    List<TradeChatRoom> findByTrade_SellerIdAndSellerLeftYn(Long sellerId, String sellerLeftYn);

    TradeChatRoom findByTradeIdAndBuyerId(Long tradeId, Long buyerId);

    @Override
    Optional<TradeChatRoom> findById(Long roomId);

    // 🔥 특정 거래글에 열린 채팅방 개수 (몇 명이 채팅 걸었는지)
    long countByTradeId(Long tradeId);
}
