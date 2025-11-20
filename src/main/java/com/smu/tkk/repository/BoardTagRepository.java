package com.smu.tkk.repository;

import com.smu.tkk.entity.BoardPost;
import com.smu.tkk.entity.BoardTag;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface BoardTagRepository extends JpaRepository<BoardTag,Long> {

}
