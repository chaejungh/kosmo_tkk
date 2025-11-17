package com.smu.tkk.repository;

import com.smu.tkk.entity.TradeChatMessage;
import org.springframework.data.jpa.repository.JpaRepository;

public interface TradeChatMessageRepository extends JpaRepository<TradeChatMessage,Integer> {
}
