package com.smu.tkk.service;

import com.smu.tkk.entity.ServiceNotice;
import org.springframework.data.domain.Page;
import java.time.LocalDate;

public interface AdminNoticeService {

    Page<ServiceNotice> getNoticePage(int page, int size, String keyword);

    ServiceNotice getNotice(Long id);

    ServiceNotice updateNotice(Long id,
                               String title,
                               String content,
                               String noticeType,
                               LocalDate startDate,
                               LocalDate endDate);

    ServiceNotice createNotice(String title,
                               String content,
                               String noticeType,
                               LocalDate startDate,
                               LocalDate endDate);

    void deleteNotice(Long id);
}
