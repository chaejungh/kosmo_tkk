package com.smu.tkk.service;

import com.smu.tkk.entity.BoardComment;
import com.smu.tkk.entity.Inquiry;
import org.springframework.data.domain.Pageable;

import java.sql.SQLException;
import java.util.List;

public interface InquiryService {
    //1. 문의 등록
    boolean register(Inquiry inquiry) throws SQLException, IllegalArgumentException;

    //2. 문의 삭제
    boolean remove(Long inquiryId) throws SQLException;

    //3. 문의 내가 쓴글 조회
    List<Inquiry> readById(Long memberId, Pageable pageable);

    //4. 문의 단일 상세 조회
    Inquiry readOne(Long inquiryId);

}
    /// 관리자 답변 등록/수정 , AI
