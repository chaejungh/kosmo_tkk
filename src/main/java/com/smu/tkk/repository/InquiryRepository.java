package com.smu.tkk.repository;

import com.smu.tkk.entity.Inquiry;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface InquiryRepository extends JpaRepository<Inquiry,Integer> {
//    //3. 문의 내가 쓴글 조회
//    List<Inquiry> readById(Long memberId, Pageable pageable);
    List<Inquiry> findByMemberId(Long memberId, Pageable pageable);
}
