package com.smu.tkk.service;

import com.smu.tkk.entity.Member;
import com.smu.tkk.entity.Notification;

import java.sql.SQLException;
import java.util.List;
//알림
public interface NotificationService {
    // ===== 기존 =====

    // 1. 알림 등록 (레파지토리 완료)
    boolean registerOne(Member memberId) throws SQLException;

    // 2. 알림 읽음 행동여부
    boolean modify(boolean read);

    // 3. 알림 전체 조회 (레파지토리 완료)
    List<Notification> readAll();

    // 4. 어플 내 미읽음 개수 */ (레파지토리 완료)
    Long unreadCount(Long memberId) throws SQLException;

    // 5. 알림 전체 삭제 (레파지토리 완료)
    boolean removeAll(Member memberId) throws SQLException;
}
