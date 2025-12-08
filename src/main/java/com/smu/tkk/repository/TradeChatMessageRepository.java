package com.smu.tkk.repository;

import com.smu.tkk.entity.TradeChatMessage;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface TradeChatMessageRepository extends JpaRepository<TradeChatMessage, Long> {

    // 1. 특정 채팅방의 메시지 목록 (페이징)
    Page<TradeChatMessage> findByRoomId(Long roomId, Pageable pageable);

    // 2. 읽음 처리(내가 아닌 상대가 보낸 메시지를 읽음으로 변경)
    @Modifying
    @Query("UPDATE TradeChatMessage t SET t.readYn = :readYn " +
            "WHERE t.roomId = :roomId AND t.senderId = :sender")
    int modifyRead(@Param("readYn") String readYn,
                   @Param("roomId") Long roomId,
                   @Param("sender") Long sender);

    // ================== 🔽 여기서부터 새로 추가한 메서드들 🔽 ==================

    /**
     * 채팅방별 마지막(가장 최근) 메시지 1건
     * - 채팅방 리스트에서 "마지막 메시지 내용" 보여줄 때 사용
     */
    TradeChatMessage findTopByRoomIdOrderByIdDesc(Long roomId);

    /**
     * 안 읽은(unread) 메시지 개수
     * - viewerId 기준으로, 상대가 보냈고 아직 readYn = 'N' 인 것들만 카운트
     */
    @Query("""
SELECT COUNT(m) 
            FROM TradeChatMessage m 
            WHERE m.roomId = :roomId 
            AND m.senderId != :viewerId 
    AND m.readYn = 'N'
            """)
    int countUnread(Long roomId, Long viewerId);
}