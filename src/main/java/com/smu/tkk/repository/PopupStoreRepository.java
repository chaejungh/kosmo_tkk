package com.smu.tkk.repository;

import com.smu.tkk.entity.PopupBookmark;
import com.smu.tkk.entity.PopupStore;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;
import com.smu.tkk.entity.PopupStore;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import java.time.LocalDate;
import java.util.List;
import java.math.BigDecimal;
import java.util.Optional;

public interface PopupStoreRepository extends JpaRepository<PopupStore,Long> {
    //List<PopupStore> active(LocalDate today) throws SQLException; 쿼리로 작성

        /** 진행 중인 팝업 */
        @Query("SELECT p FROM PopupStore p " +
                "WHERE p.startDate <= :today AND p.endDate >= :today")
        List<PopupStore> findActive(@Param("today") LocalDate today);

        /** 반경 km 이내 팝업 (Haversine) */
        @Query(value = """
    SELECT * FROM popup_store p
    WHERE (
        6371 * ACOS(
            COS( (:lat * (3.141592653589793 / 180)) ) *
            COS( p.latitude * (3.141592653589793 / 180) ) *
            COS( (p.longitude * (3.141592653589793 / 180)) - (:lng * (3.141592653589793 / 180)) ) +
            SIN( (:lat * (3.141592653589793 / 180)) ) *
            SIN( p.latitude * (3.141592653589793 / 180) )
        )
    ) < :km
    """, nativeQuery = true)
        List<PopupStore> findNear(
                 double lat,
                 double lng,
                 double km
        );

}
