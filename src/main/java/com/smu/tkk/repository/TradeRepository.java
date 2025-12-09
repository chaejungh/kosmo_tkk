package com.smu.tkk.repository;

import com.smu.tkk.entity.TradePost;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

public interface TradeRepository extends JpaRepository<TradePost, Long> {

    Page<TradePost> findAllByOrderByLikeCountDesc(Pageable pageable);

    Page<TradePost> findAllByOrderByViewCountDesc(Pageable pageable);

    Page<TradePost> findAllByOrderByCreatedAtDesc(Pageable pageable);
}
