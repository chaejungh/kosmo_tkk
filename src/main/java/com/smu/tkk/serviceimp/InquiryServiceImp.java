package com.smu.tkk.serviceimp;

import com.smu.tkk.entity.Inquiry;
import com.smu.tkk.repository.InquiryRepository;
import com.smu.tkk.service.InquiryService;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.sql.SQLException;
import java.util.List;

    @Service
    @RequiredArgsConstructor
    @Transactional
    public class InquiryServiceImp implements InquiryService {

        private final InquiryRepository inquiryRepository;

        /** -------------------------------------------------------
         *  1. 문의 등록
         * ------------------------------------------------------- */
        @Override
        public boolean register(Inquiry inquiry) throws SQLException, IllegalArgumentException {

            if (inquiry == null) {
                throw new IllegalArgumentException("문의 정보가 없습니다.");
            }
            if (inquiry.getId() == null) {
                throw new IllegalArgumentException("memberId가 없습니다.");
            }

            inquiryRepository.save(inquiry);
            return true;
        }

        /** -------------------------------------------------------
         *  2. 문의 삭제
         * ------------------------------------------------------- */
        @Override
        public boolean remove(Long inquiryId) throws SQLException {

            if (!inquiryRepository.existsById(inquiryId.intValue())) {
                throw new IllegalArgumentException("존재하지 않는 문의입니다.");
            }

            inquiryRepository.deleteById(inquiryId.intValue());
            return true;
        }

        /** -------------------------------------------------------
         *  3. 내가 쓴 문의 목록 조회
         * ------------------------------------------------------- */
        @Override
        public Page<Inquiry> readById(Long memberId, Pageable pageable) {
            return inquiryRepository.findByMemberId(memberId, pageable);
        }

        /** -------------------------------------------------------
         *  4. 문의 단일 상세 조회
         * ------------------------------------------------------- */
        @Override
        public Inquiry readOne(Long inquiryId) {

            return inquiryRepository.findById(inquiryId.intValue())
                    .orElseThrow(() -> new IllegalArgumentException("문의 정보를 찾을 수 없습니다."));
        }
    }
