package com.smu.tkk.repository;

import com.smu.tkk.entity.Member;
import com.smu.tkk.entity.SearchLog;
import com.smu.tkk.service.SearchLogService;
import org.springframework.data.domain.Limit;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import java.time.LocalDate;
import java.util.List;

public interface SearchLogRepository extends JpaRepository<SearchLog,Integer> {
    List<SearchLog> readTopByCreatedAtBefore(LocalDate createdAtBefore, Limit limit);
    List<SearchLog> findAllByremoveMemberId(String MemberId, Pageable pageable);
}
