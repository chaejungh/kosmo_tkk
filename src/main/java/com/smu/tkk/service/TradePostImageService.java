package com.smu.tkk.service;

import com.smu.tkk.entity.TradePostImage;
import org.springframework.data.domain.Page;

import java.util.List;
import java.util.Optional;

/**
 * 거래글 이미지 서비스
 * - TradePostImage.trade, sortOrder 활용
 */
public interface TradePostImageService {

    // 1. 특정 거래글의 이미지 목록 (정렬: sortOrder ASC, id ASC 권장) */(레파지토리 완료)
    Page<TradePostImage> readAllByTradeId(Long tradeId);

    // 2. 대표(커버) 이미지(예: sortOrder 최소) */ (레파지토리 완료)
    Optional<TradePostImage> readOneImage(Long tradeId);

    // 3. 이미지 단건 조회 */(레파지토리 완료)
    Optional<TradePostImage> readOne(Long imageId);

}
