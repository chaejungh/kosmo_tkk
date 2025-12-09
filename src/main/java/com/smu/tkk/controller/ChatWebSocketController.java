package com.smu.tkk.controller;

import com.smu.tkk.config.NotificationPublisher;
import com.smu.tkk.dto.ChatMessage;
import com.smu.tkk.service.TradeChatService;
import lombok.RequiredArgsConstructor;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Controller;

@Controller
@RequiredArgsConstructor
public class ChatWebSocketController {

    private final TradeChatService chatService;
    private final SimpMessagingTemplate template;
    private final NotificationPublisher notificationPublisher;

    // 텍스트/이미지 공통 처리
    @MessageMapping("/chat.send")
    public void send(ChatMessage msg) {

        ChatMessage saved = chatService.saveWebSocketMessage(msg);

        /* SSE 토스트 알림 보내기 */
        // room 조회 → 상대방 ID 구하기
        Long roomId = saved.getRoomId();
        Long senderId = saved.getSenderId();

        var room = chatService.getRoom(roomId);

        Long receiverId = room.getBuyerId().equals(senderId)
                ? room.getSellerId()
                : room.getBuyerId();

        // 알림 발송
        notificationPublisher.send(receiverId, " 새로운 메시지가 도착했습니다! ");


        template.convertAndSend("/sub/chat.room." + saved.getRoomId(), saved);
    }

    // 읽음 이벤트
    @MessageMapping("/chat.read")
    public void read(ChatMessage msg) {

        chatService.markAsRead(msg.getRoomId(), msg.getSenderId());

        msg.setType("READ");
        template.convertAndSend("/sub/chat.room." + msg.getRoomId(), msg);
    }

    // 입력중 이벤트
    @MessageMapping("/chat.typing")
    public void typing(ChatMessage msg) {
        msg.setType("TYPING");
        template.convertAndSend("/sub/chat.room." + msg.getRoomId(), msg);
    }

    // 삭제 이벤트
    @MessageMapping("/chat.delete")
    public void delete(ChatMessage msg) {
        chatService.deleteMessage(msg.getMessageId(), msg.getSenderId());
        msg.setType("DELETE");
        template.convertAndSend("/sub/chat.room." + msg.getRoomId(), msg);
    }
}