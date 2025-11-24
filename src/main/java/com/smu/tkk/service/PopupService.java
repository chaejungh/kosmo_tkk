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
    // 1. 팝업 스토어 전체 조회(레파지토리 완료)
    List<PopupStore> readAll(Pageable pageable) throws SQLException;

    // 2. 팝업 상세 조회 (단일)(레파지토리 완료)
    PopupStore readOne(Long popupId) throws SQLException;

    // 3. 진행 중인 팝업 (레파지토리 완료)
    /** today가 시작~종료일 사이인 진행 중 팝업 */
    List<PopupStore> active(LocalDate today) throws SQLException;

    // 4. 팝업의 굿즈 목록 */(레파지토리 완료)
    List<PopupGood> goods(Long popupId, Pageable pageable) throws SQLException;

    // 5. 좌표 기준 반경 km 이내 팝업 (좌표 기준 근처찾기) */ (레파지토리 완료)
    List<PopupStore> near(BigDecimal lat, BigDecimal lng, double km) throws SQLException;

    // 6. 북마크 토글: true=북마크됨, false=해제됨 */(레파지토리 완료)
    boolean togglePopupBookmark(Long memberId, Long popupId);

    // 7. 북마크 여부 */ (레파지토리 완료)
    boolean isPopupBookmarked(Long memberId, Long popupId);

    // 8. 내 매장 북마크 목록 */(레파지토리 완료)
    Page<PopupBookmark> myBookmarks(Long memberId, Pageable pageable);
}
