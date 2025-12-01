package com.smu.tkk.repository;

import com.smu.tkk.entity.TradeBookmark;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;

public interface TradeBookmarkRepository extends JpaRepository<TradeBookmark, Long> {

    boolean existsByMemberIdAndTradeId(Long memberId, Long tradeId);

    Optional<TradeBookmark> findByMemberIdAndTradeId(Long memberId, Long tradeId);

    List<TradeBookmark> findAllByMemberId(Long memberId);

    Optional<TradeBookmark> findByMemberId(Long memberId);

    Page<TradeBookmark> findByMemberId(Long memberId, Pageable pageable);
}