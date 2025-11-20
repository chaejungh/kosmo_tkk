package com.smu.tkk.service;

import com.smu.tkk.entity.ServiceNotice;
import org.springframework.data.domain.Pageable;

import java.util.List;
//공지
public interface NoticeService {
    // 1. 리스트 전체 조회
    List<ServiceNotice> readAll(Pageable pageable);
    
    // 2. 리스트 단일 조회
    ServiceNotice readById(Long noticeId);

}
