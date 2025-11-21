package com.smu.tkk.service;

import com.smu.tkk.entity.*;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.math.BigDecimal;
import java.sql.SQLException;
import java.util.List;

/**
 * 매장/지도 서비스 (엔터티 직접 사용)
 * - 좌표: Store.latitude / Store.longitude (BigDecimal)
 */
public interface StoreService {

    // 1. 매장 전체 조회(레파지토리 완료)
    Page<Store> readAll(Pageable pageable) throws SQLException;

    // 2. 매장 상세 */(레파지토리 완료)
    Store readOne(Long storeId) throws SQLException;

    // 3. 통합 검색(이름/주소/지역 중 구현 시 선택/병합) */
    List<Store> readByKeyword(String keyword,Pageable pageable) throws SQLException;

    // 4. 매장 굿즈 목록 */(레파지토리 완료)
    List<StoreGood> goods(Long storeId, Pageable pageable);

    // 5. 북마크 토글: true=북마크됨, false=해제됨 */
    boolean toggleBookmark(Long memberId, Long storeId);

    // 6. 북마크 여부 */
    boolean isBookmarked(Long memberId, Long storeId);

    // 7. 내 매장 북마크 목록 */
    Page<StoreBookmark> myBookmarks(Long memberId, Pageable pageable);

    // 8. 좌표 기준 반경 km 이내 매장 (좌표 기준 근처찾기) */
    List<Store> near(BigDecimal lat, BigDecimal lng, double km) throws SQLException;
}
