package com.smu.tkk.repository;

import com.smu.tkk.entity.TradeBookmark;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;
import java.util.Optional;

public interface TradeBookmarkRepository extends JpaRepository<TradeBookmark, Long> {
    void deleteByMemberId(Long memberId);

    boolean existsByMemberIdAndTradeId(Long memberId, Long tradeId);

    Optional<TradeBookmark> findByMemberIdAndTradeId(Long memberId, Long tradeId);

    List<TradeBookmark> findAllByMemberId(Long memberId);

    List<TradeBookmark> findByTradeId(Long tradeId);
    Optional<TradeBookmark> findByMemberId(Long memberId);

    Page<TradeBookmark> findByMemberId(Long memberId, Pageable pageable);

    // 🔥 특정 거래글이 찜(하트) 몇 개인지
    @Query("select count(b) from TradeBookmark b where b.tradeId = :tradeId")
    long countLikeCountByTradeId(Long tradeId);

    // 🔥 특정 거래글을 찜한 사람들의 memberId 목록
    @Query("select b.memberId from TradeBookmark b where b.tradeId = :tradeId")
    List<Long> findMemberIdsByTradeId(@Param("tradeId") Long tradeId);

}