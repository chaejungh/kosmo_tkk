package com.smu.tkk.serviceimp;

import com.smu.tkk.service.TradeBookmarkService;


import com.smu.tkk.entity.TradeBookmark;
import com.smu.tkk.repository.TradeBookmarkRepository;
import com.smu.tkk.service.TradeBookmarkService;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDate;

@Service
    @RequiredArgsConstructor
    @Transactional
public class TradeBookmarkServiceImp implements TradeBookmarkService {

        private final TradeBookmarkRepository tradeBookmarkRepository;

        /**
         * 1. 찜 추가 (이미 있으면 기존 반환)
         */
        @Override
        public TradeBookmark register(Long memberId, Long tradeId) {

            // 이미 존재하면 기존 엔터티 반환
            boolean exists = tradeBookmarkRepository.existsByMemberIdAndTradeId(memberId, tradeId);
            if (exists) {
                // 기존 엔터티 찾아서 반환하는게 자연스러움
                return tradeBookmarkRepository.findByMemberId(memberId, Pageable.unpaged())
                        .stream()
                        .filter(b -> b.getTrade().getId().equals(tradeId))
                        .findFirst()
                        .orElseThrow(() -> new IllegalStateException("Bookmark exists but not found"));
            }

            // 신규 생성
            TradeBookmark bookmark = new TradeBookmark();
            bookmark.setMemberId(memberId);
            bookmark.setTradeId(tradeId);
            bookmark.setCreatedAt(LocalDate.now());

            return tradeBookmarkRepository.save(bookmark);
        }

        /**
         * 2. 찜 삭제 (없어도 예외 없이 처리)
         */
        @Override
        public boolean remove(Long memberId, Long tradeId) {
            boolean exists = tradeBookmarkRepository.existsByMemberIdAndTradeId(memberId, tradeId);

            tradeBookmarkRepository.deleteByMemberIdAndTradeId(memberId, tradeId);

            return exists; // 삭제된 경우 true, 원래 없었으면 false
        }

        /**
         * 3. 특정 글 찜 여부
         */
        @Override
        public boolean isBookmarked(Long memberId, Long tradeId) {
            return tradeBookmarkRepository.existsByMemberIdAndTradeId(memberId, tradeId);
        }

        /**
         * 4. 내 찜 목록
         */
        @Override
        public Page<TradeBookmark> readById(Long memberId, Pageable pageable) {
            return tradeBookmarkRepository.findByMemberId(memberId, pageable);
        }
    }
