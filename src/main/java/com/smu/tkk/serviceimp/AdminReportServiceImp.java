package com.smu.tkk.serviceimp;

import com.smu.tkk.entity.BoardReport;
import com.smu.tkk.repository.BoardReportRepository;
import com.smu.tkk.service.AdminReportService;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@RequiredArgsConstructor
@Transactional(readOnly = true)
public class AdminReportServiceImp implements AdminReportService {

    private final BoardReportRepository boardReportRepository;

    @Override
    public Page<BoardReport> readReports(Pageable pageable, String status) {
        if (status == null || status.isBlank() || "ALL".equalsIgnoreCase(status)) {
            return boardReportRepository.findAll(pageable);
        }
        return boardReportRepository.findByStatus(status, pageable);
    }

    @Override
    @Transactional
    public void markResolved(Long reportId) {
        BoardReport report = boardReportRepository.findById(reportId)
                .orElseThrow(() -> new IllegalArgumentException("신고 내역이 존재하지 않습니다. id=" + reportId));

        report.setStatus("DONE"); // dirty checking 으로 UPDATE
    }

    @Override
    @Transactional
    public void hideContentAndResolve(Long reportId) {
        BoardReport report = boardReportRepository.findById(reportId)
                .orElseThrow(() -> new IllegalArgumentException("신고 내역이 존재하지 않습니다. id=" + reportId));

        // 댓글 신고면 댓글 삭제, 아니면 게시글 삭제
        if (report.getComment() != null) {
            report.getComment().setDeletedYn("Y");
        } else if (report.getPost() != null) {
            report.getPost().setDeletedYn("Y");
        }

        report.setStatus("DONE");
    }

    @Override
    @Transactional
    public void deleteReport(Long reportId) {
        boardReportRepository.deleteById(reportId);
    }
}
