package com.smu.tkk.serviceimp;

import com.smu.tkk.entity.Store;
import com.smu.tkk.entity.StoreBookmark;
import com.smu.tkk.entity.StoreGood;
import com.smu.tkk.repository.StoreBookmarkRepository;
import com.smu.tkk.repository.StoreGoodRepository;
import com.smu.tkk.repository.StoreRepository;
import com.smu.tkk.service.StoreService;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.sql.SQLException;
import java.util.List;

    @Service
    @RequiredArgsConstructor
    public class StoreServiceImp implements StoreService {

        private final StoreRepository storeRepository;
        private final StoreGoodRepository storeGoodRepository;
        private final StoreBookmarkRepository storeBookmarkRepository;

        /** -------------------------------------------------------
          1. 매장 전체 조회
         * ------------------------------------------------------- */
        @Override
        public Page<Store> readAll(Pageable pageable) throws SQLException {
            return storeRepository.findAll(pageable);
        }

        /** -------------------------------------------------------
          2. 매장 상세 조회
         * ------------------------------------------------------- */
        @Override
        public Store readOne(Long storeId) throws SQLException {
            return storeRepository.findById(storeId)
                    .orElseThrow(() -> new IllegalArgumentException("존재하지 않는 매장입니다."));
        }

        /** -------------------------------------------------------
          3. 매장 굿즈 조회
         * ------------------------------------------------------- */
        @Override
        public List<StoreGood> goods(Long storeId, Pageable pageable) {
            return storeGoodRepository.findByStoreId(storeId);
        }

        /** -------------------------------------------------------
          4. 북마크 토글 (있으면 삭제 / 없으면 등록)
         * ------------------------------------------------------- */
        @Override
        public boolean toggleBookmark(Long memberId, Long storeId) {

            var optionalBookmark =
                    storeBookmarkRepository.findByMemberIdAndStoreId(memberId, storeId);

            // 🔹 이미 북마크가 존재하면 → 삭제(해제)
            if (optionalBookmark.isPresent()) {
                storeBookmarkRepository.delete(optionalBookmark.get());
                return false; // false = 북마크 해제됨
            }

            // 🔹 없으면 → 새로 생성
            StoreBookmark bookmark = new StoreBookmark();
            bookmark.setMemberId(memberId);
            bookmark.setStoreId(storeId);

            storeBookmarkRepository.save(bookmark);

            return true; // true = 북마크됨
        }

        /** -------------------------------------------------------
          5. 북마크 여부 확인
         * ------------------------------------------------------- */
        @Override
        public boolean isBookmarked(Long memberId, Long storeId) {
            return storeBookmarkRepository.existsByMemberIdAndStoreId(memberId, storeId);
        }

        /** -------------------------------------------------------
          6. 내 북마크 리스트
         * ------------------------------------------------------- */
        @Override
        public Page<StoreBookmark> myBookmarks(Long memberId, Pageable pageable) {
            return storeBookmarkRepository.findByMemberId(memberId, pageable);
        }
    }
