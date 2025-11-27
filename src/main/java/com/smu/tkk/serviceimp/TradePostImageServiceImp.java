package com.smu.tkk.serviceimp;

import com.smu.tkk.entity.TradePost;
import com.smu.tkk.entity.TradePostImage;
import com.smu.tkk.repository.TradePostImageRepository;
import com.smu.tkk.repository.TradePostRepository;
import com.smu.tkk.service.TradePostImageService;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.*;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
@Transactional
public class TradePostImageServiceImp implements TradePostImageService {

    private final TradePostImageRepository tradePostImageRepository;
    private final TradePostRepository tradePostRepository;

    @Override
    public Page<TradePostImage> readAllByTradeId(Long tradeId) {
        return tradePostImageRepository.findAllByTradeId(
                tradeId,
                PageRequest.of(0, 50,
                        Sort.by(
                                Sort.Order.asc("sortOrder"),
                                Sort.Order.asc("id")
                        )
                )
        );
    }

    @Override
    public Optional<TradePostImage> readOneImage(Long tradeId) {
        return tradePostImageRepository
                .findFirstByTradeIdOrderBySortOrderAscIdAsc(tradeId);
    }

    @Override
    public Optional<TradePostImage> readOne(Long imageId) {
        return tradePostImageRepository.findById(imageId);
    }

    @Override
    public TradePostImage register(Long tradeId, String imageUrl) {

        TradePost tradePost = tradePostRepository.findById(tradeId)
                .orElseThrow(() ->
                        new IllegalArgumentException("거래글이 존재하지 않습니다. id=" + tradeId)
                );

        TradePostImage image = new TradePostImage();
        image.setTrade(tradePost);
        image.setTradeId(tradeId);
        image.setImageUrl(imageUrl);
        image.setSortOrder(1L);

        return tradePostImageRepository.save(image);
    }

    @Override
    public boolean remove(Long imageId) {

        TradePostImage image = tradePostImageRepository.findById(imageId)
                .orElseThrow(() ->
                        new IllegalArgumentException("이미지가 존재하지 않습니다. id=" + imageId)
                );

        tradePostImageRepository.delete(image);
        return true;
    }

    /** 🔥 갤러리용 이미지 전체 조회 */
    @Override
    public List<TradePostImage> readAllList(Long tradeId) {
        return tradePostImageRepository.findAllListByTradeId(tradeId);
    }
}