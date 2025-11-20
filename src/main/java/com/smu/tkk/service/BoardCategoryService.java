package com.smu.tkk.service;

import com.smu.tkk.entity.BoardCategory;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public interface BoardCategoryService {
    List<BoardCategory> readAll(Pageable pageable);
}
