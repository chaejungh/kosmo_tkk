package com.smu.tkk.repository;

import com.smu.tkk.entity.TradeChatRoom;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

public interface TradeChatRoomRepository extends JpaRepository<TradeChatRoom,Integer> {
    // 내가 속한 채팅방 목록
    Page<TradeChatRoom> findByMemberId(Long memberId, Pageable pageable);

}
