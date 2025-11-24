package com.smu.tkk.repository;

import com.smu.tkk.entity.Store;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface StoreRepository extends JpaRepository<Store, Long> {


    List<Store> findTop20ByNameContainingIgnoreCaseOrRegionNameContainingIgnoreCase(
            String nameKeyword,
            String regionKeyword
    );
}
