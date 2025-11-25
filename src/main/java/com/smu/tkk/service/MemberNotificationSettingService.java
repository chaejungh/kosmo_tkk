package com.smu.tkk.service;

import com.smu.tkk.entity.MemberNotificationSetting;

import java.util.Optional;

/**
 * 회원 알림 설정 서비스
 * - PK = member_id (@MapsId)
 */
public interface MemberNotificationSettingService {

    /** 조회 (없으면 empty) (레파지토리 완료)*/
    Optional<MemberNotificationSetting> get(Long memberId);

    /** 저장/수정(설정 요소별 부분 업데이트 허용) */
    MemberNotificationSetting upsert(Long memberId,
                                     String commentYn,
                                     String likeYn,
                                     String tradeYn,
                                     String eventYn);
}
