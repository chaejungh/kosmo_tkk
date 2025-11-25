package com.smu.tkk.repository;

import com.smu.tkk.entity.TradeChatMessage;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface TradeChatMessageRepository extends JpaRepository<TradeChatMessage,Long> {
    Page<TradeChatMessage> findByRoomId(Long RoomId , Pageable pageable);

    // 3. 읽음 처리(내가 아닌 상대가 보낸 메시지를 읽음으로) → 변경된 개수 반환 */ modify
    //boolean markAsRead(Long roomId, Long viewerId);
    @Modifying
    @Query(value = "UPDATE TradeChatMessage t set t.readYn=:readYn where t.roomId=:roomId and t.senderId=:sender")
    int modifyRead(String readYn,Long roomId,Long sender);
}
