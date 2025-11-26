package com.smu.tkk.repository;

import com.smu.tkk.entity.Store;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface StoreRepository extends JpaRepository<Store, Long> {

    // 반경 km 이내의 스토어
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
    List<Store> findNear(double lat, double lng, double km);

    // 이름/주소에 키워드 포함된 매장 Top20
    List<Store> findTop20ByNameContainingIgnoreCaseOrAddressContainingIgnoreCase(
            String nameKeyword,
            String addressKeyword
    );
}
