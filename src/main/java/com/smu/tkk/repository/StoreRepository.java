package com.smu.tkk.repository;

import com.smu.tkk.entity.PopupStore;
import com.smu.tkk.entity.Store;
import com.smu.tkk.entity.StoreBookmark;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface StoreRepository extends JpaRepository<Store, Long> {

    // 이름 또는 지역명에 키워드가 포함된 매장 20개까지
    List<Store> findTop20ByNameContainingIgnoreCaseOrRegionNameContainingIgnoreCase(
            String nameKeyword,
            String regionKeyword
    );

    // 반경 km 이내의 스토어 //
    @Query(value = """
    SELECT * FROM store s
    WHERE (
        6371 * ACOS(
            COS( (:lat * (3.141592653589793 / 180)) ) *
            COS( s.latitude * (3.141592653589793 / 180) ) *
            COS( (s.longitude * (3.141592653589793 / 180)) - (:lng * (3.141592653589793 / 180)) ) +
            SIN( (:lat * (3.141592653589793 / 180)) ) *
            SIN( s.latitude * (3.141592653589793 / 180) )
        )
    ) < :km
    """, nativeQuery = true)
    List<Store> findNear(
            double lat,
            double lng,
            double km
    );
    //@Query()
    // 내 매장 북마크 목록 */
    //Page<StoreBookmark> myBookmarks(Long memberId, Pageable pageable);
}