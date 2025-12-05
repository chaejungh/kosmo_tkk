package com.smu.tkk.service;

import com.smu.tkk.entity.Inquiry;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

public interface AdminCsService {

    // 문의 목록 / 상세 / 답변
    Page<Inquiry> readInquiries(Pageable pageable, String status);

    // Inquiry PK 타입이 Integer 라는 에러가 떠서 Integer 로 맞춤
    Inquiry readInquiry(Integer inquiryId);

    void answerInquiry(Integer inquiryId, String answerContent, String adminName);
}
