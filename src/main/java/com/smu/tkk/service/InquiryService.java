package com.smu.tkk.service;

import com.smu.tkk.entity.Inquiry;

import java.util.List;

public interface InquiryService {
    List<Inquiry> readById(int memberId);
    Inquiry readOne(int inquiryId);
    /// 관리자 답변 등록/수정
}
