package com.smu.tkk.serviceimp;

import com.smu.tkk.entity.Faq;
import com.smu.tkk.repository.FaqRepository;
import com.smu.tkk.service.FaqService;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@RequiredArgsConstructor
@Transactional(readOnly = true)
public class FaqServiceImp implements FaqService {

    private final FaqRepository faqRepository;

    @Override
    public Page<Faq> readAll(Pageable pageable) {
        return faqRepository.findAll(pageable);
    }

    @Override
    public Faq readById(Long id) {
        return faqRepository.findById(id)
                .orElseThrow(() -> new IllegalArgumentException("FAQ가 존재하지 않습니다. id=" + id));
    }

    @Override
    public Page<Faq> readByCategory(Long categoryId, Pageable pageable) {
        return faqRepository.findByFaqCategory_Id(categoryId, pageable);
    }
}
