package com.smu.tkk.service;

import com.smu.tkk.entity.BoardReport;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

public interface AdminReportService {

    /** 신고 목록 조회 (status = ALL 이면 전체) */
    Page<BoardReport> readReports(Pageable pageable, String status);

    /** 신고만 처리 완료로 변경 */
    void markResolved(Long reportId);

    /** 신고 대상(게시글/댓글) 숨기고, 신고도 처리 완료로 변경 */
    void hideContentAndResolve(Long reportId);

    /** 신고 레코드 자체 삭제 */
    void deleteReport(Long reportId);
}
