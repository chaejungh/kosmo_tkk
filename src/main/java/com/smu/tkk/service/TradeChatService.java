package com.smu.tkk.service;

import com.smu.tkk.dto.ChatMessage;
import com.smu.tkk.entity.TradeChatMessage;
import com.smu.tkk.entity.TradeChatRoom;
import org.springframework.data.domain.Page;
import org.springframework.web.multipart.MultipartFile;

public interface TradeChatService {

    TradeChatRoom register(Long tradeId, Long buyerId);

    TradeChatRoom getOrCreateRoom(Long tradeId, Long buyerId);

    TradeChatMessage send(Long roomId, Long senderId, String message);

    boolean markAsRead(Long roomId, Long viewerId);

    Page<TradeChatRoom> myRooms(Long memberId);

    Page<TradeChatMessage> messages(Long roomId);

    TradeChatRoom getRoom(Long roomId);

    TradeChatMessage sendImage(Long roomId, Long senderId, MultipartFile file) throws Exception;

    // 웹소켓 텍스트 메시지 저장
    ChatMessage saveWebSocketMessage(ChatMessage msg);

    // 이미지 업로드(WebSocket)
    String saveWebSocketImage(Long roomId, Long senderId, MultipartFile file) throws Exception;

    // 메시지 삭제
    void deleteMessage(Long messageId, Long memberId);
}