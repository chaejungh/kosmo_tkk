package com.smu.tkk.service;

import com.smu.tkk.entity.TradeChatMessage;
import com.smu.tkk.entity.TradeChatRoom;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

/**
 * 거래 채팅 서비스 (엔터티 직접 사용)
 * - 참여자: 판매자 = TradePost.seller, 구매자 = TradeChatRoom.member
 * - 메시지 읽음: TradeChatMessage.readYn 사용(단순 불리언)
 */
public interface TradeChatService {

    // 1. 채팅방 생성(존재 시 재사용) — buyerId = room.member.id */
    TradeChatRoom register(Long tradeId, Long buyerId);

    // 2. 메시지 전송 */ insert
    TradeChatMessage send(Long roomId, Long senderId, String message);

    // 3. 읽음 처리(내가 아닌 상대가 보낸 메시지를 읽음으로) → 변경된 개수 반환 */ modify
    boolean markAsRead(Long roomId, Long viewerId);

    // 4. 내가 속한 채팅방 목록(구매자=room.member or 판매자=room.trade.seller) */
    Page<TradeChatRoom> myRooms(Long memberId);

    // 5. 채팅 메시지 리스트(오름차순 권장) */ (레파지토리 완료)
    Page<TradeChatMessage> messages(Long roomId);
}
