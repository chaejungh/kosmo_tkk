package com.smu.tkk.dto;

import lombok.Data;

/**
 * 채팅방 목록 화면(당근 채팅 탭 느낌)에서 사용할 DTO
 */
@Data
public class ChatRoomListDTO {

    private Long roomId;        // 채팅방 PK
    private Long tradeId;       // 거래글 PK

    // 썸네일 (거래글 대표 이미지)
    private String tradeThumb;

    // 상대방 정보
    private Long opponentId;
    private String opponentName;

    // 마지막 메시지 내용 + 시간
    private String lastMessage;
    private String lastTime;    // "2025-12-02" 같은 문자열

    // 읽지 않은 메시지 개수
    private int unreadCount;
}