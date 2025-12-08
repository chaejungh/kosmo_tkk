package com.smu.tkk.repository;

import com.smu.tkk.entity.MemberNotificationSetting;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

public interface MemberNotificationSettingRepository extends JpaRepository<MemberNotificationSetting,Integer> {
    void deleteByMemberId(Long memberId);
    @Modifying
    @Query(value = "update MemberNotificationSetting m SET m.commentYn=:commentYn,m.likeYn=:likeYn,m.tradeYn=:tradeYn,m.eventYn=:eventYn where m.id=:memberId")
    int update(Long memberId, String commentYn, String likeYn, String tradeYn, String eventYn);
}
