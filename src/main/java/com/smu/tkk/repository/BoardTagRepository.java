package com.smu.tkk.repository;

import com.smu.tkk.entity.BoardPost;
import com.smu.tkk.entity.BoardTag;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface BoardTagRepository extends JpaRepository<BoardTag,Long> {

    //    // 태그 검색 (키워드 포함, 삭제되지 않은 것만, 최신순)
    List<BoardPost> findAllByTagIdContainingIgnoreCaseAndDeletedYn(Long tagId, String deleteYn, Pageable pageable);
}
