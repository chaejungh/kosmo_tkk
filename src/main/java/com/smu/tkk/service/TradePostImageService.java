package com.smu.tkk.service;

import com.smu.tkk.entity.TradePostImage;
import org.springframework.data.domain.Page;

import java.util.List;
import java.util.Optional;

public interface TradePostImageService {

    Page<TradePostImage> readAllByTradeId(Long tradeId);

    Optional<TradePostImage> readOneImage(Long tradeId);

    Optional<TradePostImage> readOne(Long imageId);

    TradePostImage register(Long tradeId, String imageUrl);

    boolean remove(Long imageId);

    /** 🔥 갤러리용 이미지 전체조회 (Page 아닌 List) */
    List<TradePostImage> readAllList(Long tradeId);
}