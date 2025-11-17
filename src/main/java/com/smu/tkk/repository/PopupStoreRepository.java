package com.smu.tkk.repository;

import com.smu.tkk.entity.PopupStore;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface PopupStoreRepository extends JpaRepository<PopupStore,Integer> {
    //List<PopupStore> active(LocalDate today) throws SQLException; 쿼리로 작성
}
