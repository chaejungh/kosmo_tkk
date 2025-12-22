package com.smu.tkk.repository;

import com.smu.tkk.entity.TradePost;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface TradeRepository extends JpaRepository<TradePost, Long> {

    Page<TradePost> findAllByOrderByLikeCountDesc(Pageable pageable);
    Page<TradePost> findAllByOrderByViewCountDesc(Pageable pageable);
    Page<TradePost> findAllByOrderByCreatedAtDesc(Pageable pageable);

    // ✅ 판매자 글 목록 최신순 (너 에러났던 메서드)
    Page<TradePost> findAllBySellerIdOrderByCreatedAtDesc(Long sellerId, Pageable pageable);

    // ✅ 검색 (너 에러났던 메서드)
    @Query("""
        select t
        from TradePost t
        where (t.deletedYn is null or t.deletedYn = 'N')
          and (
               lower(t.title) like lower(concat('%', :keyword, '%'))
            or lower(t.goodsName) like lower(concat('%', :keyword, '%'))
            or lower(t.region) like lower(concat('%', :keyword, '%'))
          )
        """)
    Page<TradePost> search(@Param("keyword") String keyword, Pageable pageable);
}