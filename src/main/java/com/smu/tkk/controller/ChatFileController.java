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
@RequestMapping("/chat")
public class ChatFileController {

    private final TradeChatService chatService;
    private final SimpMessagingTemplate template;

    @PostMapping("/upload-image")
    public ResponseEntity<?> uploadImage(
            @RequestParam("roomId") Long roomId,
            @RequestParam("senderId") Long senderId,
            @RequestParam("image") MultipartFile file
    ) {
        try {
            // 1) 서버에 이미지 저장 + DB 저장
            String imagePath = chatService.saveWebSocketImage(roomId, senderId, file);

            // 2) 같은 방 모든 유저에 실시간 전송
            ChatMessage msg = new ChatMessage();
            msg.setRoomId(roomId);
            msg.setSenderId(senderId);
            msg.setType("IMAGE");
            msg.setMessage(imagePath);

            template.convertAndSend("/sub/chat.room." + roomId, msg);

            return ResponseEntity.ok(msg);

        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.internalServerError().body("ERROR");
        }
    }
}