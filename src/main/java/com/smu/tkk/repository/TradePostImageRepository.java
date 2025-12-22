package com.smu.tkk.repository;

import com.smu.tkk.entity.TradePostImage;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;
import java.util.Optional;

public interface TradePostImageRepository extends JpaRepository<TradePostImage, Long> {

    // 1) 이미지 URL 수정
    @Modifying
    @Query("update TradePostImage t set t.imageUrl = :img where t.id = :imgId")
    int modifyImg(@Param("img") String img, @Param("imgId") Long imgId);

    // 2) 거래글의 이미지 목록 (페이징)
    Page<TradePostImage> findAllByTradeId(Long tradeId, Pageable pageable);

    // 3) 대표 이미지 (정렬: sortOrder ASC → id ASC)
    Optional<TradePostImage> findFirstByTradeIdOrderBySortOrderAscIdAsc(Long tradeId);

    // 4) 단일 조회
    Optional<TradePostImage> findById(Long imageId);

    // 5) 갤러리용 전체 이미지 목록 (List)  ✅ 기존 메서드 이름이 위험해서 @Query로 확실히 보장
    @Query("select t from TradePostImage t where t.tradeId = :tradeId order by t.sortOrder asc, t.id asc")
    List<TradePostImage> findAllListByTradeId(@Param("tradeId") Long tradeId);

    // ✅ 핵심: 리스트 화면 썸네일을 tradeId 여러개 한방에 가져오기
    List<TradePostImage> findAllByTradeIdInOrderByTradeIdAscSortOrderAscIdAsc(List<Long> tradeIds);
}