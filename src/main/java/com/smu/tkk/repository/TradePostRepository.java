package com.smu.tkk.repository;

import com.smu.tkk.entity.TradePost;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

public interface TradePostRepository extends JpaRepository<TradePost,Long> {
    //거래 상태 변경
    @Modifying
    @Query(value = "update TradePost t set t.status=:status where t.id=:postId")
    int modify(String status,Long postId);

}
