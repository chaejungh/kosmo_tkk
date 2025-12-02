package com.smu.tkk.repository;

import com.smu.tkk.entity.PopupGood;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface PopupGoodRepository extends JpaRepository<PopupGood, Long> {

    /**
     * popup_id 로 굿즈 목록 조회 (한 팝업에 속한 굿즈들)
     */
    @Query("SELECT g FROM PopupGood g WHERE g.popup.id = :popupId")
    Page<PopupGood> findByPopupId(@Param("popupId") Long popupId, Pageable pageable);
}
