package com.smu.tkk.controller;

import com.smu.tkk.dto.ChatMessage;
import com.smu.tkk.service.TradeChatService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

@RestController
@RequiredArgsConstructor
@RequestMapping("/chat-file")   // ⬅⬅⬅ 수정된 부분 (절대 /chat 쓰면 안됨!!)
public class TradeChatFileController {

    private final TradeChatService chatService;
    private final SimpMessagingTemplate template;

    /**
     * 채팅 이미지 업로드 API (WebSocket 연동)
     * 업로드 → DB 저장 → 모든 구독자에게 브로드캐스트
     */
    @PostMapping("/upload-image")
    public ResponseEntity<?> uploadImage(
            @RequestParam("roomId") Long roomId,
            @RequestParam("senderId") Long senderId,
            @RequestParam("image") MultipartFile file
    ) {
        try {

            // 1) 서버에 파일 저장 후 URL 반환
            String imagePath = chatService.saveWebSocketImage(roomId, senderId, file);

            // 2) WebSocket 메시지 생성
            ChatMessage msg = new ChatMessage();
            msg.setRoomId(roomId);
            msg.setSenderId(senderId);
            msg.setType("IMAGE");
            msg.setMessage(imagePath);   // ex) /upload/chat/uuid_image.png

            // 3) 해당 방 모든 사용자에게 실시간 전송
            template.convertAndSend("/sub/chat.room." + roomId, msg);

            return ResponseEntity.ok(msg);

        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.internalServerError().body("ERROR");
        }
    }
}