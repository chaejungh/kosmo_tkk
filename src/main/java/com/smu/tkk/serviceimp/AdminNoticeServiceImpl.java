package com.smu.tkk.serviceimp;
import com.smu.tkk.entity.ServiceNotice;
import com.smu.tkk.repository.ServiceNoticeRepository;
import com.smu.tkk.service.AdminNoticeService;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.*;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDate;

@Service
@RequiredArgsConstructor
@Transactional
public class AdminNoticeServiceImpl implements AdminNoticeService {

    private final ServiceNoticeRepository repository;

    @Override
    @Transactional(readOnly = true)
    public Page<ServiceNotice> getNoticePage(int page, int size, String keyword) {

        Pageable pageable = PageRequest.of(page, size, Sort.by(Sort.Direction.DESC, "id"));

        if (keyword != null && !keyword.trim().isEmpty()) {
            return repository.findByTitleContainingIgnoreCase(keyword, pageable);
        }

        return repository.findAll(pageable);
    }

    @Override
    @Transactional(readOnly = true)
    public ServiceNotice getNotice(Long id) {
        return repository.findById(id)
                .orElseThrow(() -> new IllegalArgumentException("공지사항을 찾을 수 없습니다. id=" + id));
    }

    @Override
    public ServiceNotice updateNotice(Long id,
                                      String title,
                                      String content,
                                      String noticeType,
                                      LocalDate startDate,
                                      LocalDate endDate) {

        ServiceNotice notice = getNotice(id);

        notice.setTitle(title);
        notice.setContent(content);
        notice.setNoticeType(noticeType);
        notice.setStartDate(startDate);
        notice.setEndDate(endDate);

        return repository.save(notice);
    }

    @Override
    public ServiceNotice createNotice(String title,
                                      String content,
                                      String noticeType,
                                      LocalDate startDate,
                                      LocalDate endDate) {

        ServiceNotice notice = new ServiceNotice();

        notice.setTitle(title);
        notice.setContent(content);
        notice.setNoticeType(noticeType);
        notice.setStartDate(startDate);
        notice.setEndDate(endDate);
        notice.setCreatedAt(LocalDate.now());

        return repository.save(notice);
    }

    @Override
    public void deleteNotice(Long id) {
        repository.deleteById(id);
    }
}