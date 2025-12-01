package com.smu.tkk.serviceimp;

import com.smu.tkk.dto.ChatMessage;
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
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;
import java.util.UUID;
import java.util.stream.Stream;

@Service
@RequiredArgsConstructor
@Transactional
public class TradeChatServiceImp implements TradeChatService {

    private final TradeChatRoomRepository roomRepo;
    private final TradeChatMessageRepository messageRepo;
    private final TradePostRepository postRepo;

    /* ============================================================
     * 1. 채팅방 생성 or 기존방 재사용
     * ============================================================ */
    @Override
    public TradeChatRoom register(Long tradeId, Long buyerId) {
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

    @Override
    public TradeChatRoom getOrCreateRoom(Long tradeId, Long buyerId) {
        return register(tradeId, buyerId);
    }

    /* ============================================================
     * 2. 기존 폴링/REST에서 쓰던 send (지금은 거의 WebSocket 위주)
     * ============================================================ */
    @Override
    public TradeChatMessage send(Long roomId, Long senderId, String message) {

        TradeChatRoom room = roomRepo.findById(roomId)
                .orElseThrow(() -> new IllegalArgumentException("채팅방 없음: " + roomId));

        TradeChatMessage msg = new TradeChatMessage();
        msg.setRoom(room);
        msg.setRoomId(roomId);
        msg.setSenderId(senderId);
        msg.setMessage(message);
        msg.setCreatedAt(LocalDate.now());   // 🔹 엔티티는 LocalDate
        msg.setReadYn("N");

        room.setLastMessageAt(LocalDate.now()); // 🔹 채팅방도 LocalDate
        roomRepo.save(room);

        return messageRepo.save(msg);
    }

    /* ============================================================
     * 3. 읽음 처리
     * ============================================================ */
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

    /* ============================================================
     * 4. 내가 속한 채팅방 목록
     * ============================================================ */
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

    /* ============================================================
     * 5. 메시지 목록 조회
     * ============================================================ */
    @Override
    public Page<TradeChatMessage> messages(Long roomId) {
        Pageable pageable = PageRequest.of(0, 200, Sort.by(Sort.Direction.ASC, "id"));
        return messageRepo.findByRoomId(roomId, pageable);
    }

    /* ============================================================
     * 6. 채팅방 단건 조회
     * ============================================================ */
    @Override
    public TradeChatRoom getRoom(Long roomId) {
        return roomRepo.findById(roomId)
                .orElseThrow(() -> new IllegalArgumentException("채팅방 없음: " + roomId));
    }

    /* ============================================================
     * 7. 이미지 전송 (REST에서 사용)
     * ============================================================ */
    @Override
    public TradeChatMessage sendImage(Long roomId, Long senderId, MultipartFile file) throws Exception {

        String uploadDir = System.getProperty("user.dir") + "/upload/chat/";
        File dir = new File(uploadDir);
        if (!dir.exists()) dir.mkdirs();

        String fileName = UUID.randomUUID() + "_" + file.getOriginalFilename();
        File saveFile = new File(uploadDir + fileName);
        file.transferTo(saveFile);

        TradeChatRoom room = roomRepo.findById(roomId)
                .orElseThrow(() -> new IllegalArgumentException("채팅방 없음"));

        TradeChatMessage msg = new TradeChatMessage();
        msg.setRoom(room);
        msg.setRoomId(roomId);
        msg.setSenderId(senderId);
        msg.setMessage("[img]/upload/chat/" + fileName);
        msg.setCreatedAt(LocalDate.now());   // 🔹 엔티티는 LocalDate
        msg.setReadYn("N");

        room.setLastMessageAt(LocalDate.now());
        roomRepo.save(room);

        return messageRepo.save(msg);
    }

    /* ============================================================
     * 8. WebSocket 텍스트 메시지 저장
     *    - DB에는 LocalDate만 저장
     *    - 프론트에는 LocalDateTime 문자열로 내려줌
     * ============================================================ */
    @Override
    public ChatMessage saveWebSocketMessage(ChatMessage dto) {

        TradeChatRoom room = roomRepo.findById(dto.getRoomId())
                .orElseThrow(() -> new IllegalArgumentException("채팅방 없음: " + dto.getRoomId()));

        LocalDateTime now = LocalDateTime.now(); // 🔹 실제 시간(날짜+시간)

        TradeChatMessage entity = new TradeChatMessage();
        entity.setRoom(room);
        entity.setRoomId(dto.getRoomId());
        entity.setSenderId(dto.getSenderId());
        entity.setMessage(dto.getMessage());
        entity.setReadYn("N");
        entity.setCreatedAt(now.toLocalDate());  // 🔹 엔티티에는 날짜만

        room.setLastMessageAt(now.toLocalDate());
        roomRepo.save(room);

        TradeChatMessage saved = messageRepo.save(entity);

        // 프론트에서 시간까지 보이게 하고 싶어서 now 기준으로 내려줌
        dto.setMessageId(saved.getId());
        dto.setCreatedAt(now.toString());  // 예: 2025-12-02T01:40:12.345
        dto.setRead(false);
        dto.setType(dto.getType() == null ? "TEXT" : dto.getType());

        return dto;
    }

    /* ============================================================
     * 9. WebSocket + 이미지 업로드에서 사용할 저장 로직
     * ============================================================ */
    @Override
    public String saveWebSocketImage(Long roomId, Long senderId, MultipartFile file) throws Exception {

        String uploadDir = System.getProperty("user.dir") + "/upload/chat/";
        File dir = new File(uploadDir);
        if (!dir.exists()) dir.mkdirs();

        String fileName = UUID.randomUUID() + "_" + file.getOriginalFilename();
        File saveFile = new File(uploadDir + fileName);
        file.transferTo(saveFile);

        TradeChatRoom room = roomRepo.findById(roomId)
                .orElseThrow(() -> new IllegalArgumentException("채팅방 없음"));

        LocalDateTime now = LocalDateTime.now();

        TradeChatMessage msg = new TradeChatMessage();
        msg.setRoom(room);
        msg.setRoomId(roomId);
        msg.setSenderId(senderId);
        msg.setMessage("[img]/upload/chat/" + fileName);
        msg.setCreatedAt(now.toLocalDate());  // 🔹 엔티티는 LocalDate
        msg.setReadYn("N");

        messageRepo.save(msg);

        // 프론트에서는 이 경로로 <img src="..."> 사용
        return "/upload/chat/" + fileName;
    }

    /* ============================================================
     * 10. 메시지 삭제 (소프트 삭제)
     * ============================================================ */
    @Override
    public void deleteMessage(Long messageId, Long memberId) {
        TradeChatMessage msg = messageRepo.findById(messageId)
                .orElseThrow(() -> new IllegalArgumentException("메시지 없음: " + messageId));

        // 보낸 사람만 삭제 가능
        if (!msg.getSenderId().equals(memberId)) {
            throw new IllegalStateException("본인이 보낸 메시지만 삭제할 수 있습니다.");
        }

        // 실제 삭제 대신 "삭제된 메시지입니다" 표시
        msg.setMessage("(삭제된 메시지입니다)");
        msg.setReadYn("Y");
        messageRepo.save(msg);
    }
}