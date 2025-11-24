package com.smu.tkk.repository;

import com.smu.tkk.entity.Store;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface StoreRepository extends JpaRepository<Store, Long> {

    // 이미 있는 메서드들 …

    // 이름 또는 지역명에 키워드가 포함된 매장 20개까지
    List<Store> findTop20ByNameContainingIgnoreCaseOrRegionNameContainingIgnoreCase(
            String nameKeyword,
            String regionKeyword
    );
}
