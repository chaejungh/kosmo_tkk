package com.smu.tkk.service;

import com.smu.tkk.entity.TradePostImage;
import org.springframework.data.domain.Page;

import java.util.List;
import java.util.Map;
import java.util.Optional;

public interface TradePostImageService {

    Page<TradePostImage> readAllByTradeId(Long tradeId);

    Optional<TradePostImage> readOneImage(Long tradeId);

    Optional<TradePostImage> readOne(Long imageId);

    TradePostImage register(Long tradeId, String imageUrl);

    boolean remove(Long imageId);

    List<TradePostImage> readAllList(Long tradeId);

    // ✅ 리스트 썸네일 맵 (tradeId -> imageUrl)
    Map<Long, String> readThumbMap(List<Long> tradeIds);
}