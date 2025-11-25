package com.smu.tkk.repository;

import com.smu.tkk.entity.TradeBookmark;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

public interface TradeBookmarkRepository extends JpaRepository<TradeBookmark,Long> {

    // 특정 글 찜 여부 */
    boolean existsByMemberIdAndTradeId(Long memberId, Long tradeId);

    Page<TradeBookmark> findByMemberId(Long memberId, Pageable pageable);

    // 특정 회원의 특정 찜 삭제
    void deleteByMemberIdAndTradeId(Long memberId, Long tradeId);
}
