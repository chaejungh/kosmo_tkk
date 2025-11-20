package com.smu.tkk.repository;

import com.smu.tkk.entity.StoreGood;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface StoreGoodRepository extends JpaRepository<StoreGood,Integer> {
    //SELECT * FROM store_good WHERE store_id = ?
    List<StoreGood> findByStoreId(long storeId);
}
