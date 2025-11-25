package com.smu.tkk.repository;

import com.smu.tkk.entity.PopupGood;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface PopupGoodRepository extends JpaRepository<PopupGood,Integer> {
    Page<PopupGood> findByPopupId(Long popupId, Pageable pageable);
}
