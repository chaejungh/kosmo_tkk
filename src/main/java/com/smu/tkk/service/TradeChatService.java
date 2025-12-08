package com.smu.tkk.service;

import com.smu.tkk.dto.ChatMessage;
import com.smu.tkk.dto.ChatRoomListDTO;
import com.smu.tkk.entity.TradeChatMessage;
import com.smu.tkk.entity.TradeChatRoom;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

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

    // ✅ 채팅방 목록 화면용 DTO 리스트
    // 당근 채팅 탭처럼 보여줄 데이터 한 방에 모아서 내려줌
    java.util.List<ChatRoomListDTO> getChatRoomList(Long memberId);
}