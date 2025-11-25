package com.smu.tkk.serviceimp;

import com.smu.tkk.entity.TradePost;
import com.smu.tkk.entity.TradePostImage;
import com.smu.tkk.repository.TradePostImageRepository;
import com.smu.tkk.repository.TradePostRepository;
import com.smu.tkk.service.TradePostImageService;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Optional;

@Service
@RequiredArgsConstructor
@Transactional
public class TradePostImageServiceImp implements TradePostImageService {

        private final TradePostImageRepository tradePostImageRepository;
        private final TradePostRepository tradePostRepository;

        /** -------------------------------------------------------
         *  1. 특정 거래글의 이미지 목록 (sortOrder ASC, id ASC)
         * ------------------------------------------------------- */
        @Override
        public Page<TradePostImage> readAllByTradeId(Long tradeId) {
            return tradePostImageRepository.findAllByTradeId(
                    tradeId,
                    PageRequest.of(0, 50, Sort.by(Sort.Order.asc("sortOrder"),
                    Sort.Order.asc("id")))
            );
        }

        /** -------------------------------------------------------
         *  2. 대표 이미지 (sortOrder 최소)
         * ------------------------------------------------------- */
        @Override
        public Optional<TradePostImage> readOneImage(Long tradeId) {
            return tradePostImageRepository.findFirstByTradeIdOrderBySortOrderAscIdAsc(tradeId);
        }

        /** -------------------------------------------------------
         *  3. 이미지 단건 조회
         * ------------------------------------------------------- */
        @Override
        public Optional<TradePostImage> readOne(Long imageId) {
            return tradePostImageRepository.findById(imageId);
        }

        /** -------------------------------------------------------
         *  4. 이미지 추가
         * ------------------------------------------------------- */
        @Override
        public TradePostImage register(Long tradeId, String imageUrl) {

            Optional<TradePost> tradePostOpt = tradePostRepository.findById(tradeId);
            tradePostOpt
                    .orElseThrow(() -> new IllegalArgumentException("거래글이 존재하지 않습니다. id=" + tradeId));


            TradePostImage image = new TradePostImage();
            image.setTrade(tradePostOpt.get());
            image.setImageUrl(imageUrl);


            return tradePostImageRepository.save(image);
        }

        /** -------------------------------------------------------
         *  5. 이미지 삭제
         * ------------------------------------------------------- */
        @Override
        public boolean remove(Long imageId) {

            TradePostImage image = tradePostImageRepository.findById(imageId)
                    .orElseThrow(() -> new IllegalArgumentException("이미지가 존재하지 않습니다. id=" + imageId));

            tradePostImageRepository.delete(image);
            return true;
        }
    }