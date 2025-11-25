package com.smu.tkk.serviceimp;

import com.smu.tkk.entity.TradePost;
import com.smu.tkk.entity.TradePostImage;
import com.smu.tkk.repository.TradePostImageRepository;
import com.smu.tkk.repository.TradePostRepository;
import com.smu.tkk.service.TradeService;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

    @Service
    @RequiredArgsConstructor
    @Transactional
    public class TradeServiceImp implements TradeService {

        private final TradePostRepository tradePostRepository;
        private final TradePostImageRepository tradePostImageRepository;

        /** -------------------------------------------------------
         *  1. 거래글 작성
         * ------------------------------------------------------- */
        @Override
        public TradePost registerTradePost(TradePost tradePost) {
            return tradePostRepository.save(tradePost);
        }

        /** -------------------------------------------------------
         *  2. 거래글 수정
         * ------------------------------------------------------- */
        @Override
        public TradePost modifyTradePost(TradePost tradePost) {

            TradePost existing = tradePostRepository.findById((tradePost.getSellerId()))
                    .orElseThrow(() -> new IllegalArgumentException("거래글이 존재하지 않습니다. id=" + tradePost.getId()));

            existing.setTitle(tradePost.getTitle());
            existing.setContent(tradePost.getContent());
            existing.setPrice(tradePost.getPrice());
            // 필요 시 상태(status) 등 다른 필드도 수정

            return tradePostRepository.save(existing);
        }

        /** -------------------------------------------------------
         *  3. 거래글 삭제
         * ------------------------------------------------------- */
        @Override
        public TradePost removeTradePost(TradePost tradePostId) {

            TradePost existing = tradePostRepository.findById((tradePostId.getId()))
                    .orElseThrow(() -> new IllegalArgumentException("거래글이 존재하지 않습니다. id=" + tradePostId.getId()));

            tradePostRepository.delete(existing);

            return existing;
        }

        /** -------------------------------------------------------
         *  4. 거래글 단일 조회
         * ------------------------------------------------------- */
        @Override
        public TradePost readOneTradePost(TradePost tradePost) {
            return tradePostRepository.findById((tradePost.getId()))
                    .orElseThrow(() -> new IllegalArgumentException("거래글이 존재하지 않습니다. id=" + tradePost.getId()));
        }

        /** -------------------------------------------------------
         *  5. 거래글 전체 조회 (페이징)
         * ------------------------------------------------------- */
        @Override
        public Page<TradePost> readAll(Pageable pageable) {
            return tradePostRepository.findAll(pageable);
        }

        /** -------------------------------------------------------
         *  6. 거래 상태 변경
         * ------------------------------------------------------- */
        @Override
        public TradePost modifyTradepost(TradePost tradePostId, TradePost tradePostStatus) {

            TradePost existing = tradePostRepository.findById((tradePostId.getId()))
                    .orElseThrow(() -> new IllegalArgumentException("거래글이 존재하지 않습니다. id=" + tradePostId.getId()));

            existing.setStatus(tradePostStatus.getStatus()); // 상태만 변경
            return tradePostRepository.save(existing);
        }

    }
