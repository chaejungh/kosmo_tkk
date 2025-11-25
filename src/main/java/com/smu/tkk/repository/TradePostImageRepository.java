package com.smu.tkk.repository;

import com.smu.tkk.entity.TradePostImage;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;


import java.util.Optional;

public interface TradePostImageRepository extends JpaRepository<TradePostImage,Long> {
    @Modifying
    @Query(value = "update TradePostImage t set t.imageUrl=:img where t.id=:imgId")
    int modifyImg(String img,Long imgId);
    //특정거래글의 이미지목록
    Page<TradePostImage> findAllByTradeId(Long tradeId, Pageable pageable);

    //대표이미지
    TradePostImage findFirstByTradeIdOrderByIdAsc(Long tradeId);
    Optional<TradePostImage> findFirstByTradeIdOrderBySortOrderAscIdAsc(Long tradeId);
}
