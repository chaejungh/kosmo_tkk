package com.smu.tkk.repository;

import com.smu.tkk.entity.StoreGood;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface StoreGoodRepository extends JpaRepository<StoreGood, Long> {

    // 매장 전체 굿즈 (작품/캐릭터 순으로 정렬)
    List<StoreGood> findByStoreIdOrderByWorkNameAscCharacterNameAsc(Long storeId);

    // 매장 내에서 작품명 / 캐릭터명 / 상품명 기준으로 검색
    @Query("select g from StoreGood g " +
            "where g.storeId = :storeId " +
            "and (" +
            "   lower(g.workName) like :keyword " +
            "   or lower(g.characterName) like :keyword " +
            "   or lower(g.name) like :keyword" +
            ") " +
            "order by g.workName asc, g.characterName asc")
    List<StoreGood> searchInStore(@Param("storeId") Long storeId,
                                  @Param("keyword") String keyword);

    // 혹시 기존 코드에서 쓰고 있을 수도 있으니, 원래 메서드도 남겨두자
    List<StoreGood> findByStoreId(long storeId);
}
