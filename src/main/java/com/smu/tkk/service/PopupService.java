package com.smu.tkk.service;

import com.smu.tkk.entity.PopupGood;
import com.smu.tkk.entity.PopupStore;

import java.sql.SQLException;
import java.util.List;

public interface PopupService {
    List<PopupStore> readAll() throws SQLException;
    PopupStore readOne(int popup_id) throws SQLException;
}
