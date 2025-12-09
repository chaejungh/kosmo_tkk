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

    // 🔥 거래 상태(status) 변경
    @Modifying
    @Transactional
    @Query("UPDATE TradePost t SET t.status = :status WHERE t.id = :postId")
    int modify(@Param("status") String status, @Param("postId") Long postId);

    // 🔥 삭제되지 않은 글만 (deletedYn IS NULL OR 'N')
    Page<TradePost> findByDeletedYnIsNullOrDeletedYn(String deletedYn, Pageable pageable);

    // 🔍 검색 (삭제된 글 제외)
    @Query("""
           SELECT t
           FROM TradePost t
           WHERE (t.deletedYn IS NULL OR t.deletedYn = 'N')
             AND (
                    LOWER(t.title)     LIKE LOWER(CONCAT('%', :keyword, '%'))
                 OR t.content          LIKE CONCAT('%', :keyword, '%')
                 OR LOWER(t.region)    LIKE LOWER(CONCAT('%', :keyword, '%'))
                 OR LOWER(t.goodsName) LIKE LOWER(CONCAT('%', :keyword, '%'))
             )
           """)
    Page<TradePost> search(@Param("keyword") String keyword, Pageable pageable);

    // 마이페이지용
    Page<TradePost> findBySellerId(Long sellerId, Pageable pageable);
}
