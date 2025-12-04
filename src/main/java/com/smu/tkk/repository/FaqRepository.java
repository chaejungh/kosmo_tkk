package com.smu.tkk.repository;

import com.smu.tkk.entity.Faq;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

public interface FaqRepository extends JpaRepository<Faq,Long> {
    // 카테고리 기준 목록 조회 (필요 시)
    Page<Faq> findByFaqCategory_Id(Long categoryId, Pageable pageable);
}
