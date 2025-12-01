package com.smu.tkk.serviceimp;

import com.smu.tkk.dto.TradePostListDto;
import com.smu.tkk.entity.TradePost;
import com.smu.tkk.entity.TradePostImage;
import com.smu.tkk.repository.TradePostImageRepository;
import com.smu.tkk.repository.TradePostRepository;
import com.smu.tkk.service.TradeService;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class TradeServiceImp implements TradeService {

    private final TradePostRepository tradePostRepository;
    private final TradePostImageRepository tradePostImageRepository;

    /* =========================================================
       🔵 기존 기능 (절대 삭제 X)
       ========================================================= */
    @Override
    public TradePost registerTradePost(TradePost tradePost) {
        return tradePostRepository.save(tradePost);
    }

    @Override
    public TradePost modifyTradePost(TradePost tradePost) {
        return tradePostRepository.save(tradePost);
    }

    @Override
    public TradePost removeTradePost(TradePost tradePost) {
        tradePostRepository.delete(tradePost);
        return tradePost;
    }

    @Override
    public TradePost readOneTradePost(TradePost tradePost) {
        return tradePostRepository.findById(tradePost.getId()).orElse(null);
    }

    @Override
    public Page<TradePost> readAll(Pageable pageable) {
        return tradePostRepository.findAll(pageable);
    }

    @Override
    public TradePost modifyTradepost(TradePost tradePostId, TradePost tradePostStatus) {
        tradePostId.setStatus(tradePostStatus.getStatus());
        return tradePostRepository.save(tradePostId);
    }

    @Override
    public void register(TradePost post) {
    }

    @Override
    public Page<TradePost> readBySellerId(Long sellerId, Pageable pageable) {

        return tradePostRepository.findBySellerId(sellerId,pageable);
    }

    @Override
    public TradePost readOneTradePostById(Long tradeId) {
        return tradePostRepository.findById(tradeId).orElse(null);
    }

    /* =========================================================
       🔵 DTO 변환 목록 (기존 추가했던 기능)
       ========================================================= */
    @Override
    public Page<TradePostListDto> readAllListDto(Pageable pageable) {

        Page<TradePost> page = tradePostRepository.findAll(pageable);

        return page.map(post -> {
            // 대표 이미지
            Optional<TradePostImage> imgOpt =
                    tradePostImageRepository.findFirstByTradeIdOrderBySortOrderAscIdAsc(post.getId());

            String thumbnail = imgOpt
                    .map(TradePostImage::getImageUrl)
                    .orElse("/images/dummy/noimg.png");

            // 시간 표시
            String timeAgo = calcTimeAgo(post.getCreatedAt());

            return new TradePostListDto(post, thumbnail, timeAgo);
        });
    }


    /* =========================================================
       🔥 새로 추가 — 검색 기능
       ========================================================= */
    @Override
    public Page<TradePost> search(String keyword, Pageable pageable) {

        return tradePostRepository.search(keyword, pageable);
    }


    /* =========================================================
       🔧 유틸 : 시간 계산
       ========================================================= */
    private String calcTimeAgo(LocalDate createdAt) {
        if (createdAt == null) return "방금 전";

        long days = ChronoUnit.DAYS.between(createdAt, LocalDate.now());

        if (days < 1) return "오늘";
        if (days == 1) return "1일 전";
        return days + "일 전";
    }
}