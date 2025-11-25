package com.smu.tkk.repository;

import com.smu.tkk.entity.TradeChatMessage;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface TradeChatMessageRepository extends JpaRepository<TradeChatMessage,Integer> {
    List<TradeChatMessage> findByRoomId(Long RoomId ,Pageable pageable);

}
