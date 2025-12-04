package com.smu.tkk.service;

import com.smu.tkk.entity.Faq;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

    public interface FaqService {

        Page<Faq> readAll(Pageable pageable);

        Faq readById(Long id);

        Page<Faq> readByCategory(Long categoryId, Pageable pageable);
    }

