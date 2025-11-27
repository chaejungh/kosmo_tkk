package com.smu.tkk.serviceimp;

import com.smu.tkk.entity.ServiceNotice;
import com.smu.tkk.repository.ServiceNoticeRepository;
import com.smu.tkk.service.NoticeService;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

    @Service
    @RequiredArgsConstructor
    @Transactional(readOnly = true)
    public class NoticeServiceImp implements NoticeService {

        private final ServiceNoticeRepository ServiceNoticeRepository;

        /**
         * 1. 공지사항 리스트 조회 (페이징)
         */
        @Override
        public Page<ServiceNotice> readAll(Pageable pageable) {
            return ServiceNoticeRepository.findAll(pageable);
        }
        /**
         * 2. 공지사항 단일 조회
         */
        @Override
        public ServiceNotice readById(Long noticeId) {
            return ServiceNoticeRepository.findById(noticeId)
                    .orElseThrow(() -> new IllegalArgumentException("해당 공지가 존재하지 않습니다. noticeId=" + noticeId));
        }
    }
