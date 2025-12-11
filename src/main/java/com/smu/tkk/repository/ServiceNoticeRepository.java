package com.smu.tkk.repository;

import com.smu.tkk.entity.ServiceNotice;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ServiceNoticeRepository extends JpaRepository<ServiceNotice,Long> {

    Page<ServiceNotice> findByTitleContainingIgnoreCase(String keyword, Pageable pageable);

}
