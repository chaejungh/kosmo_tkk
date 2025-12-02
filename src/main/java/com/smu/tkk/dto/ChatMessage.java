package com.smu.tkk.dto;

import lombok.Data;

@Data
public class ChatMessage {

    private Long roomId;      // 방 ID
    private Long senderId;    // 보낸 사람 ID

    // 새로 추가
    private Long messageId;   // DB에 저장된 메시지 PK
    private String createdAt; // "2025-12-02T01:40:12" 같은 문자열 (프론트용)
    private Boolean read;     // 읽음 여부 (상대 기준)

    private String message;   // 내용 (텍스트 or [img]경로)

    /**
     * TEXT   : 일반 텍스트
     * IMAGE  : 이미지 메시지
     * READ   : 읽음 처리 이벤트 (상대방이 읽음)
     * TYPING : 입력중 표시 이벤트
     * DELETE : 메시지 삭제 이벤트
     */
    private String type;
}