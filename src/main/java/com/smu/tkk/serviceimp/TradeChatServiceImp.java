package com.smu.tkk.serviceimp;

import com.smu.tkk.entity.TradeChatMessage;
import com.smu.tkk.entity.TradeChatRoom;
import com.smu.tkk.repository.TradeChatMessageRepository;
import com.smu.tkk.repository.TradeChatRoomRepository;
import com.smu.tkk.repository.TradePostRepository;
import com.smu.tkk.service.TradeChatService;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.*;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.stream.Stream;

@Service
@RequiredArgsConstructor
@Transactional
public class TradeChatServiceImp implements TradeChatService {

    private final TradeChatRoomRepository roomRepo;
    private final TradeChatMessageRepository messageRepo;
    private final TradePostRepository postRepo;

    /* ============================================
     * 1. 채팅방 생성 or 기존방 재사용
     * ============================================ */
    @Override
    public TradeChatRoom register(Long tradeId, Long buyerId) {

        // 기존 방 조회
        List<TradeChatRoom> rooms = roomRepo.findAll();

        for (TradeChatRoom room : rooms) {
            if (room.getTrade().getId().equals(tradeId)
                    && room.getMemberId().equals(buyerId)) {
                return room;
            }
        }

        TradeChatRoom newRoom = new TradeChatRoom();
        newRoom.setTrade(postRepo.findById(tradeId)
                .orElseThrow(() -> new IllegalArgumentException("거래글 없음: " + tradeId)));
        newRoom.setTradeId(tradeId);
        newRoom.setMemberId(buyerId);

        return roomRepo.save(newRoom);
    }

    /* ============================================
     * 2. 텍스트 메시지 전송
     * ============================================ */
    @Override
    public TradeChatMessage send(Long roomId, Long senderId, String message) {

        TradeChatRoom room = roomRepo.findById(roomId)
                .orElseThrow(() -> new IllegalArgumentException("채팅방 없음: " + roomId));

        TradeChatMessage msg = new TradeChatMessage();
        msg.setRoom(room);
        msg.setRoomId(roomId);
        msg.setSenderId(senderId);
        msg.setMessage(message);
        msg.setReadYn("N");

        return messageRepo.save(msg);
    }

    /* ============================================
     * 3. 읽음 처리
     * ============================================ */
    @Override
    public boolean markAsRead(Long roomId, Long viewerId) {

        TradeChatRoom room = roomRepo.findById(roomId)
                .orElseThrow(() -> new IllegalArgumentException("채팅방 없음: " + roomId));

        Long opponentId = room.getMemberId().equals(viewerId)
                ? room.getTrade().getSeller().getId()
                : room.getMemberId();

        int updated = messageRepo.modifyRead("Y", roomId, opponentId);
        return updated > 0;
    }

    /* ============================================
     * 4. 내가 속한 채팅방 목록
     * ============================================ */
    @Override
    public Page<TradeChatRoom> myRooms(Long memberId) {

        Pageable pageable = PageRequest.of(0, 100, Sort.by(Sort.Direction.DESC, "lastMessageAt"));

        Page<TradeChatRoom> buyerRooms = roomRepo.findByMemberId(memberId, pageable);

        List<TradeChatRoom> sellerRooms =
                roomRepo.findAll().stream()
                        .filter(r -> r.getTrade().getSeller().getId().equals(memberId))
                        .toList();

        List<TradeChatRoom> merged =
                Stream.concat(buyerRooms.getContent().stream(), sellerRooms.stream())
                        .sorted((a, b) -> {
                            if (a.getLastMessageAt() == null) return 1;
                            if (b.getLastMessageAt() == null) return -1;
                            return b.getLastMessageAt().compareTo(a.getLastMessageAt());
                        })
                        .toList();

        return new PageImpl<>(merged, pageable, merged.size());
    }

    /* ============================================
     * 5. 메시지 목록 조회
     * ============================================ */
    @Override
    public Page<TradeChatMessage> messages(Long roomId) {
        Pageable pageable = PageRequest.of(0, 200, Sort.by(Sort.Direction.ASC, "id"));
        return messageRepo.findByRoomId(roomId, pageable);
    }

    /* ============================================
     * 6. 채팅방 단건 조회
     * ============================================ */
    @Override
    public TradeChatRoom getRoom(Long roomId) {
        return roomRepo.findById(roomId)
                .orElseThrow(() -> new IllegalArgumentException("채팅방 없음: " + roomId));
    }
}