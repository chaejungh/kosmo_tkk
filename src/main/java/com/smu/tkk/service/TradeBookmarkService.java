package com.smu.tkk.service;

import com.smu.tkk.entity.TradeBookmark;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

/**
 * 거래글 찜(북마크) 서비스 (엔터티 직접 사용)
 * - TradeBookmark.member, TradeBookmark.trade(=TradePost) 사용
 */
public interface TradeBookmarkService {

    // 1. 찜 추가 (이미 있으면 기존 엔터티 반환 권장) */
    TradeBookmark register(Long memberId, Long tradeId);

    // 2. 찜 삭제 (없어도 예외 없이 처리 권장) */
    boolean remove(Long memberId, Long tradeId);

    // 3. 특정 글 찜 여부 */
    boolean isBookmarked(Long memberId, Long tradeId);

    // 4. 내 찜 목록 */
    Page<TradeBookmark> readById(Long memberId, Pageable pageable);
}
