package com.smu.tkk.serviceimp;

import com.smu.tkk.entity.Inquiry;
import com.smu.tkk.repository.InquiryRepository;
import com.smu.tkk.service.AdminCsService;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@RequiredArgsConstructor
@Transactional
public class AdminCsServiceImp implements AdminCsService {

    private final InquiryRepository inquiryRepository;

    @Override
    @Transactional(readOnly = true)
    public Page<Inquiry> readInquiries(Pageable pageable, String status) {
        // InquiryRepository 에 findByStatus(...) 가 없어서
        // 일단은 status 무시하고 전체 조회만 사용
        return inquiryRepository.findAll(pageable);
    }

    @Override
    @Transactional(readOnly = true)
    public Inquiry readInquiry(Integer inquiryId) {
        return inquiryRepository.findById(inquiryId)
                .orElseThrow(() -> new IllegalArgumentException("문의가 존재하지 않습니다. id=" + inquiryId));
    }

    @Override
    public void answerInquiry(Integer inquiryId, String answerContent, String adminName) {
        Inquiry inquiry = readInquiry(inquiryId);

        // ⚠️ Inquiry 엔티티 필드명을 아직 몰라서 실제 저장 로직은 TODO 로 남겨둔다.
        // 예시 (엔티티에 이런 필드가 있을 때):
        //
        // import java.time.LocalDate;
        //
        // inquiry.setAnswerContent(answerContent);
        // inquiry.setAnsweredBy(adminName);
        // inquiry.setAnsweredAt(LocalDate.now());
        // inquiry.setStatus("ANSWERED");
    }
}
