package com.smu.tkk.serviceimp;

import com.smu.tkk.entity.Inquiry;
import com.smu.tkk.repository.InquiryRepository;
import com.smu.tkk.service.AdminInquiryService;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDate;
import java.util.List;

@Service
@RequiredArgsConstructor
@Transactional(readOnly = true)
public class AdminInquiryServiceImp implements AdminInquiryService {

    private final InquiryRepository inquiryRepository;

    // Long -> Integer 변환 (Repository 가 Integer ID 를 쓰기 때문에)
    private Integer toIntegerId(Long id) {
        if (id == null) {
            throw new IllegalArgumentException("id 가 null 입니다.");
        }
        if (id > Integer.MAX_VALUE || id < Integer.MIN_VALUE) {
            throw new IllegalArgumentException("id 범위를 벗어납니다: " + id);
        }
        return id.intValue();
    }

    @Override
    public Page<Inquiry> getInquiryPage(int page, int size, String keyword) {

        // id 기준 내림차순 정렬
        Sort sort = Sort.by(Sort.Direction.DESC, "id");
        Pageable pageable = PageRequest.of(page, size, sort);

        // keyword 없으면 그냥 기존 findAll(pageable) 사용
        if (keyword == null || keyword.isBlank()) {
            return inquiryRepository.findAll(pageable);
        }

        // keyword 있을 때는 기존 Repository 전혀 안 건드리기 위해
        // findAll() 결과에서 메모리 필터링
        List<Inquiry> all = inquiryRepository.findAll(sort);

        String lowerKeyword = keyword.trim().toLowerCase();

        List<Inquiry> filtered = all.stream()
                .filter(inq -> {
                    String title = inq.getTitle() != null ? inq.getTitle().toLowerCase() : "";
                    String content = inq.getContent() != null ? inq.getContent().toLowerCase() : "";
                    return title.contains(lowerKeyword) || content.contains(lowerKeyword);
                })
                .toList();

        int start = (int) pageable.getOffset();
        int end = Math.min(start + pageable.getPageSize(), filtered.size());

        List<Inquiry> pageContent =
                (start > filtered.size()) ? List.of() : filtered.subList(start, end);

        return new PageImpl<>(pageContent, pageable, filtered.size());
    }

    @Override
    public Inquiry getInquiry(Long id) {
        Integer key = toIntegerId(id);  // 🔹 여기서 Long -> Integer
        return inquiryRepository.findById(key)
                .orElseThrow(() -> new IllegalArgumentException("존재하지 않는 문의입니다. id=" + id));
    }

    @Override
    @Transactional
    public Inquiry answerInquiry(Long id, String answerText) {

        Inquiry inquiry = getInquiry(id);  // 위에서 이미 변환해서 가져옴

        // Inquiry 엔티티에 실제 있는 필드 사용 (ANSWER_CONTENT / STATUS / ANSWERED_AT)
        inquiry.setAnswerContent(answerText);
        inquiry.setStatus("DONE");                 // WAIT -> DONE
        inquiry.setAnsweredAt(LocalDate.now());

        return inquiryRepository.save(inquiry);
    }

    @Override
    @Transactional
    public void deleteInquiry(Long id) {
        Integer key = toIntegerId(id);  // 🔹 여기서도 Long -> Integer
        inquiryRepository.deleteById(key);
    }
}
