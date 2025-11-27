package com.smu.tkk.service;

import com.smu.tkk.entity.TradeChatMessage;
import com.smu.tkk.entity.TradeChatRoom;
import org.springframework.data.domain.Page;

public interface TradeChatService {

    // 채팅방 생성 (없으면 생성, 있으면 재사용)
    TradeChatRoom register(Long tradeId, Long buyerId);

    // 메시지 전송 (텍스트만)
    TradeChatMessage send(Long roomId, Long senderId, String message);

    // 읽음 처리
    boolean markAsRead(Long roomId, Long viewerId);

    // 내가 속한 채팅방 목록
    Page<TradeChatRoom> myRooms(Long memberId);

    // 메시지 목록 조회
    Page<TradeChatMessage> messages(Long roomId);

    // 채팅방 단건 조회
    TradeChatRoom getRoom(Long roomId);

    // ⭐ 자동 생성용 메서드 (추가)
    TradeChatRoom getOrCreateRoom(Long tradeId, Long buyerId);
}