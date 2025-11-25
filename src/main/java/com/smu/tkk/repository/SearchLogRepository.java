package com.smu.tkk.repository;

import com.smu.tkk.entity.Member;
import com.smu.tkk.entity.SearchLog;
import com.smu.tkk.service.SearchLogService;
import org.springframework.data.domain.Limit;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.time.LocalDate;
import java.util.List;
import java.util.Map;
import java.util.Objects;

public interface SearchLogRepository extends JpaRepository<SearchLog,Integer> {
    //List<SearchLog> readTopByCreatedAtBefore(LocalDate createdAtBefore, Limit limit);
    @Query("""
        SELECT  COUNT(s.keyword) cnt,s.keyword keyword
            FROM SearchLog s
                WHERE TO_CHAR(s.createdAt,'YYYY-MM-DD')=:createdAt
                GROUP BY s.keyword 
                ORDER BY COUNT(s.keyword) DESC 
                        
           """)
    List<Map<String,Object>> readTopByCreatedAtBefore(String createdAt, Pageable pageable);

    List<SearchLog> findByMember_Id(Long MemberId, Pageable pageable);
    int deleteByMemberId(Long memberId);
    int deleteByMember(Member Member);
}
