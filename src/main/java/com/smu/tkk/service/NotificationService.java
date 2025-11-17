package com.smu.tkk.service;

import com.smu.tkk.entity.Notification;

import java.sql.SQLException;
import java.util.List;

public interface NotificationService {
    boolean registerOne(Notification noId) throws SQLException;
    boolean modify(boolean read);
    List<Notification> readAll();
}
