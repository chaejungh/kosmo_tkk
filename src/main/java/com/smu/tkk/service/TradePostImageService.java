package com.smu.tkk.service;

import com.smu.tkk.entity.TradePostImage;
import org.springframework.data.domain.Page;
import java.util.Optional;

public interface TradePostImageService {

    /** 1) 특정 거래글 이미지 전체 조회 */
    Page<TradePostImage> readAllByTradeId(Long tradeId);

    /** 2) 대표 이미지(가장 sortOrder가 작은 1장) */
    Optional<TradePostImage> readOneImage(Long tradeId);

    /** 3) 이미지 단건 조회 */
    Optional<TradePostImage> readOne(Long imageId);

    /** 4) 이미지 등록 */
    TradePostImage register(Long tradeId, String imageUrl);

    /** 5) 이미지 삭제 */
    boolean remove(Long imageId);

    /** 6) 컨트롤러에서 사용하는 단일 이미지 조회 (Optional이 아닌 직접 리턴) */
    TradePostImage readOneImageById(Long imageId);
}