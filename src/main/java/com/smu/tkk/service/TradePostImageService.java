package com.smu.tkk.service;

import com.smu.tkk.entity.TradePostImage;

import java.util.List;
import java.util.Optional;

/**
 * 거래글 이미지 서비스
 * - TradePostImage.trade, sortOrder 활용
 */
public interface TradePostImageService {

    /** 특정 거래글의 이미지 목록 (정렬: sortOrder ASC, id ASC 권장) */
    List<TradePostImage> listByTrade(Long tradeId);

    /** 대표(커버) 이미지(예: sortOrder 최소) */
    Optional<TradePostImage> getCover(Long tradeId);

    /** 단건 조회 */
    Optional<TradePostImage> get(Long imageId);

    /** 추가 */
    TradePostImage add(Long tradeId, String imageUrl, Long sortOrder);

    /** 삭제 */
    void remove(Long imageId);

    /** 정렬 재배치 (imageId 순서대로 sortOrder 재설정) */
    void reorder(Long tradeId, List<Long> orderedImageIds);
}
