package com.smu.tkk.serviceimp;

import com.smu.tkk.entity.TradePostImage;
import com.smu.tkk.repository.TradePostImageRepository;
import com.smu.tkk.service.TradePostImageService;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

@Service
@RequiredArgsConstructor
@Transactional(readOnly = true)
public class TradePostImageServiceImp implements TradePostImageService {

    private final TradePostImageRepository tradePostImageRepository;

    @Override
    public Page<TradePostImage> readAllByTradeId(Long tradeId) {
        return tradePostImageRepository.findAllByTradeId(tradeId, PageRequest.of(0, 50));
    }

    @Override
    public Optional<TradePostImage> readOneImage(Long tradeId) {
        return tradePostImageRepository.findFirstByTradeIdOrderBySortOrderAscIdAsc(tradeId);
    }

    @Override
    public Optional<TradePostImage> readOne(Long imageId) {
        return tradePostImageRepository.findById(imageId);
    }

    @Override
    @Transactional
    public TradePostImage register(Long tradeId, String imageUrl) {
        TradePostImage img = new TradePostImage();
        img.setTradeId(tradeId);
        img.setImageUrl(imageUrl);
        img.setSortOrder(1L);
        return tradePostImageRepository.save(img);
    }

    @Override
    @Transactional
    public boolean remove(Long imageId) {
        if (!tradePostImageRepository.existsById(imageId)) return false;
        tradePostImageRepository.deleteById(imageId);
        return true;
    }

    @Override
    public List<TradePostImage> readAllList(Long tradeId) {
        return tradePostImageRepository.findAllListByTradeId(tradeId);
    }

    /** ✅ 여러 글 대표(첫) 이미지 Map 만들기: tradeId -> imageUrl */
    @Override
    public Map<Long, String> readThumbMap(List<Long> tradeIds) {
        Map<Long, String> result = new LinkedHashMap<>();
        if (tradeIds == null || tradeIds.isEmpty()) return result;

        List<TradePostImage> images =
                tradePostImageRepository.findAllByTradeIdInOrderByTradeIdAscSortOrderAscIdAsc(tradeIds);

        for (TradePostImage img : images) {
            if (img == null) continue;
            Long tradeId = img.getTradeId();
            if (tradeId == null) continue;

            // tradeId 당 "첫 번째" 이미지만
            result.putIfAbsent(tradeId, img.getImageUrl());
        }
        return result;
    }
}