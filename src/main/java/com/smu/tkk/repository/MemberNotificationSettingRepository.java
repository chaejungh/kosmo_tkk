package com.smu.tkk.repository;

import com.smu.tkk.entity.MemberNotificationSetting;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface MemberNotificationSettingRepository extends JpaRepository<MemberNotificationSetting, Integer> {

    // 엔티티에 memberId 필드가 있다고 가정 (기존 코드 유지)
    void deleteByMemberId(Long memberId);

    // 🔧 알림 설정 값 업데이트 (MEMBER_ID 기준) - native SQL
    @Modifying
    @Query(
            value = "UPDATE MEMBER_NOTIFICATION_SETTING " +
                    "   SET COMMENT_YN = :commentYn, " +
                    "       LIKE_YN    = :likeYn, " +
                    "       TRADE_YN   = :tradeYn, " +
                    "       EVENT_YN   = :eventYn " +
                    " WHERE MEMBER_ID  = :memberId",
            nativeQuery = true
    )
    int update(@Param("memberId") Long memberId,
               @Param("commentYn") String commentYn,
               @Param("likeYn") String likeYn,
               @Param("tradeYn") String tradeYn,
               @Param("eventYn") String eventYn);

    // 🔧 기본 알림 설정: 없으면 한 번만 INSERT (MERGE 사용)
    @Modifying
    @Query(
            value = """
            MERGE INTO MEMBER_NOTIFICATION_SETTING m
            USING (SELECT :memberId AS MEMBER_ID FROM dual) s
            ON (m.MEMBER_ID = s.MEMBER_ID)
            WHEN NOT MATCHED THEN
              INSERT (MEMBER_ID, COMMENT_YN, LIKE_YN, TRADE_YN, EVENT_YN)
              VALUES (:memberId, 'Y', 'Y', 'Y', 'Y')
            """,
            nativeQuery = true
    )
    void insertDefaultIfNotExists(@Param("memberId") Long memberId);
}
