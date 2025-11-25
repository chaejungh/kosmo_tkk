package com.smu.tkk.serviceimp;

import com.smu.tkk.entity.BoardCategory;
import com.smu.tkk.repository.BoardCategoryRepository;
import com.smu.tkk.service.BoardCategoryService;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@RequiredArgsConstructor
@Transactional(readOnly = true)
public class BoardCategoryServiceImp implements BoardCategoryService {

    private final BoardCategoryRepository boardCategoryRepository;

    @Override
    public List<BoardCategory> readAll(Pageable pageable) {
        return boardCategoryRepository.findAll(pageable).getContent();
    }
}
