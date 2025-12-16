package com.smu.tkk.repository;

import com.smu.tkk.dto.GoodsSearchRow;
import com.smu.tkk.entity.StoreGood;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface StoreGoodRepository extends JpaRepository<StoreGood, Long> {

    // ✅ 매장 전체 굿즈 (작품/캐릭터 순)
    List<StoreGood> findByStoreIdOrderByWorkNameAscCharacterNameAsc(Long storeId);

    // ✅ 매장 내 검색 (keyword는 "%키워드%" 형태로 넘겨야 함)
    @Query("""
           select g from StoreGood g
           where g.storeId = :storeId
           and (
                lower(g.workName) like lower(:keyword)
             or lower(g.characterName) like lower(:keyword)
             or lower(g.name) like lower(:keyword)
           )
           order by g.workName asc, g.characterName asc
           """)
    List<StoreGood> searchInStore(@Param("storeId") Long storeId,
                                  @Param("keyword") String keyword);

    // ✅ 혹시 기존 코드 호환용
    List<StoreGood> findByStoreId(long storeId);

    // ============================================================
    // ✅ 홈 "재고 검색" : 전체 매장 통합 검색 (페이지)
    //    - kw가 null/빈값이면 전체
    //    - store.name, store.address + goods 이름/작품/캐릭 검색
    // ============================================================
    @Query(
            value = """
            SELECT
              s.store_id      AS storeId,
              s.name          AS storeName,
              s.address       AS storeAddress,
              g.goods_id      AS goodsId,
              g.name          AS goodsName,
              g.price         AS price,
              g.stock_qty     AS stockQty,
              g.thumbnail_url AS thumbnailUrl
            FROM store_goods g
            JOIN store s ON s.store_id = g.store_id
            WHERE
              (:kw IS NULL OR :kw = '' OR
               g.name LIKE CONCAT('%', :kw, '%') OR
               g.work_name LIKE CONCAT('%', :kw, '%') OR
               g.character_name LIKE CONCAT('%', :kw, '%') OR
               s.name LIKE CONCAT('%', :kw, '%') OR
               s.address LIKE CONCAT('%', :kw, '%'))
            ORDER BY g.goods_id DESC
            """,
            countQuery = """
            SELECT COUNT(*)
            FROM store_goods g
            JOIN store s ON s.store_id = g.store_id
            WHERE
              (:kw IS NULL OR :kw = '' OR
               g.name LIKE CONCAT('%', :kw, '%') OR
               g.work_name LIKE CONCAT('%', :kw, '%') OR
               g.character_name LIKE CONCAT('%', :kw, '%') OR
               s.name LIKE CONCAT('%', :kw, '%') OR
               s.address LIKE CONCAT('%', :kw, '%'))
            """,
            nativeQuery = true
    )
    Page<GoodsSearchRow> searchGoods(@Param("kw") String kw, Pageable pageable);
}