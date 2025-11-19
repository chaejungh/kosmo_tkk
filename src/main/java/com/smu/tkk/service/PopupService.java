package com.smu.tkk.service;

import com.smu.tkk.entity.PopupBookmark;
import com.smu.tkk.entity.PopupGood;
import com.smu.tkk.entity.PopupStore;
import com.smu.tkk.entity.StoreBookmark;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.math.BigDecimal;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.List;

public interface PopupService {
    // ===== 기존 =====
    List<PopupStore> readAll() throws SQLException;
    PopupStore readOne(int popup_id) throws SQLException;

    // ===== 추가 =====
    /** today가 시작~종료일 사이인 진행 중 팝업 */
    List<PopupStore> active(LocalDate today) throws SQLException;

    /** 팝업의 굿즈 목록 */
    List<PopupGood> goods(int popup_id) throws SQLException;

    /** 좌표 기준 반경 km 이내 팝업 (간단 근처찾기) */
    List<PopupStore> near(BigDecimal lat, BigDecimal lng, double km) throws SQLException;

    /** 북마크 토글: true=북마크됨, false=해제됨 */
    boolean toggleBookmark(Long memberId, Long popupId);

    /** 북마크 여부 */
    boolean isBookmarked(Long memberId, Long popupId);

    /** 내 매장 북마크 목록 */
    Page<PopupBookmark> myBookmarks(Long memberId, Pageable pageable);
}
