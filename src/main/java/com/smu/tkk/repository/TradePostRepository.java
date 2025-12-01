package com.smu.tkk.repository;

import com.smu.tkk.entity.TradePost;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

public interface TradePostRepository extends JpaRepository<TradePost, Long> {

    // ==========================================================
    // 🔥 거래 상태(status) 변경
    // ==========================================================
    @Modifying
    @Transactional
    @Query("UPDATE TradePost t SET t.status = :status WHERE t.id = :postId")
    int modify(@Param("status") String status, @Param("postId") Long postId);


    // ==========================================================
    // 🔍 검색 기능 (제목 + 내용 + 지역 + 굿즈명)
    // ※ content는 CLOB이라 LOWER() 적용하면 오류 → LOWER 제거 (중요)
    // ==========================================================
    @Query("""
            SELECT t
            FROM TradePost t
            WHERE LOWER(t.title)      LIKE LOWER(CONCAT('%', :keyword, '%'))
               OR t.content           LIKE CONCAT('%', :keyword, '%')
               OR LOWER(t.region)     LIKE LOWER(CONCAT('%', :keyword, '%'))
               OR LOWER(t.goodsName)  LIKE LOWER(CONCAT('%', :keyword, '%'))
            """)
    Page<TradePost> search(@Param("keyword") String keyword, Pageable pageable);

    Page<TradePost> findBySellerId(Long sellerId, Pageable pageable);
}