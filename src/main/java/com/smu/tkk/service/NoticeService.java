package com.smu.tkk.service;

import com.smu.tkk.entity.ServiceNotice;

import java.util.List;
//공지
public interface NoticeService {
    List<ServiceNotice> readAll();
    ServiceNotice readById(int noticeId);

}
