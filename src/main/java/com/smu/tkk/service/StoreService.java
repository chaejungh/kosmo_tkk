package com.smu.tkk.service;

import com.smu.tkk.entity.Store;
import com.smu.tkk.entity.StoreBookmark;
import com.smu.tkk.entity.StoreGood;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;

/**
 * 매장/지도 서비스 (엔터티 직접 사용)
 * - 좌표: Store.latitude / Store.longitude (BigDecimal)
 */
public interface StoreService {

    /** 매장 목록 */
    Page<Store> list(Pageable pageable);

    /** 매장 상세 */
    Store get(Long storeId);

    /** 통합 검색(이름/주소/지역 중 구현 시 선택/병합) */
    Page<Store> search(String keyword, Pageable pageable);

    /** 매장 굿즈 목록 */
    List<StoreGood> goods(Long storeId);

    /** 북마크 토글: true=북마크됨, false=해제됨 */
    boolean toggleBookmark(Long memberId, Long storeId);

    /** 북마크 여부 */
    boolean isBookmarked(Long memberId, Long storeId);

    /** 내 매장 북마크 목록 */
    Page<StoreBookmark> myBookmarks(Long memberId, Pageable pageable);
}
