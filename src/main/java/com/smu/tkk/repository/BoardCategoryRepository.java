package com.smu.tkk.repository;

import com.smu.tkk.entity.BoardCategory;
import org.springframework.data.jpa.repository.JpaRepository;

import java.awt.print.Pageable;
import java.util.List;


public interface BoardCategoryRepository extends JpaRepository<BoardCategory, Long> {

}