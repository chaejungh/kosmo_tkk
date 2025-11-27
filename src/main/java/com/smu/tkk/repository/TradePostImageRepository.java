package com.smu.tkk.repository;

import com.smu.tkk.entity.TradePostImage;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.Optional;

public interface TradePostImageRepository extends JpaRepository<TradePostImage, Long> {

    // -------------------------------------------------------
    // 1. 기존 기능: 이미지 URL 수정 (절대 삭제 X)
    // -------------------------------------------------------
    @Modifying
    @Query("update TradePostImage t set t.imageUrl = :img where t.id = :imgId")
    int modifyImg(@Param("img") String img, @Param("imgId") Long imgId);


    // -------------------------------------------------------
    // 2. 특정 거래글의 이미지 목록 (정렬은 Service에서 처리)
    // -------------------------------------------------------
    Page<TradePostImage> findAllByTradeId(Long tradeId, Pageable pageable);


    // -------------------------------------------------------
    // 3. 대표 이미지 (정렬: sortOrder ASC → id ASC)
    //    ★ 이 메서드가 서비스에서 사용 중
    // -------------------------------------------------------
    Optional<TradePostImage> findFirstByTradeIdOrderBySortOrderAscIdAsc(Long tradeId);


    // -------------------------------------------------------
    // 4. 단일 imageId 로 조회 (Jpa 기본 제공으로 충분하지만 유지 가능)
    // -------------------------------------------------------
    Optional<TradePostImage> findById(Long imageId);
}