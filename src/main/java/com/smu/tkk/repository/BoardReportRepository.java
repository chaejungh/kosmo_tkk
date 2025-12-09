package com.smu.tkk.repository;

import com.smu.tkk.entity.BoardReport;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

public interface BoardReportRepository extends JpaRepository<BoardReport, Long> {

    // 회원 탈퇴 시 신고 기록 정리용
    void deleteByReporterId(Long memberId);

    // 상태별 조회 (WAIT, DONE 등)
    Page<BoardReport> findByStatus(String status, Pageable pageable);
}
