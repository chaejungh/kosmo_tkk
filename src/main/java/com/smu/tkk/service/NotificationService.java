package com.smu.tkk.service;

import com.smu.tkk.entity.Notification;

import java.sql.SQLException;
import java.util.List;

public interface NotificationService {
    // ===== 기존 =====
    boolean registerOne(Notification noId) throws SQLException;
    boolean modify(boolean read);
    List<Notification> readAll();

    // ===== 추가 =====

    /** 내 미읽음 개수 */
    long unreadCount(int memberId) throws SQLException;
}
