package com.smu.tkk.service;

import com.smu.tkk.entity.Inquiry;
import org.springframework.data.domain.Page;

public interface AdminInquiryService {

    // 관리자 문의 목록 (페이징 + 검색)
    Page<Inquiry> getInquiryPage(int page, int size, String keyword);

    // 단건 조회
    Inquiry getInquiry(Long id);

    // 관리자 답변 작성/수정
    Inquiry answerInquiry(Long id, String answerText);

    // 문의 삭제
    void deleteInquiry(Long id);
}
