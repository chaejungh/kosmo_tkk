package com.smu.tkk.service;

import com.smu.tkk.entity.PopupBookmark;
import com.smu.tkk.entity.PopupGood;
import com.smu.tkk.entity.PopupStore;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.sql.SQLException;
import java.time.LocalDate;
import java.util.List;

public interface PopupService {

    // 1. 팝업 스토어 전체 조회
    Page<PopupStore> readAll(Pageable pageable) throws SQLException;

    // 2. 팝업 하나 조회
    PopupStore readOne(Long popupId) throws SQLException;

    // 3. 진행 중인 팝업 목록
    List<PopupStore> active(LocalDate today) throws SQLException;

    // 4. 특정 팝업의 굿즈 목록
    List<PopupGood> goods(Long popupId, Pageable pageable) throws SQLException;

    // 6. 북마크 토글
    boolean togglePopupBookmark(Long memberId, Long popupId);

    // 7. 북마크 여부
    boolean isPopupBookmarked(Long memberId, Long popupId);

    // 8. 내 팝업 북마크 목록
    Page<PopupBookmark> myBookmarks(Long memberId, Pageable pageable);
}
