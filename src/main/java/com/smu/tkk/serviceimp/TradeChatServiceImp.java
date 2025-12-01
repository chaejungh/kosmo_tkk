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

import org.springframework.web.multipart.MultipartFile;   // ⭐ 추가
import java.io.File;                                // ⭐ 추가
import java.time.LocalDate;
import java.util.List;
import java.util.UUID;                               // ⭐ 추가
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

    /* ⭐⭐ 자동 생성 전용 메서드 — 기존 코드 재사용 */
    @Override
    public TradeChatRoom getOrCreateRoom(Long tradeId, Long buyerId) {
        return register(tradeId, buyerId);
    }

    /* ============================================
     * 2. 메시지 전송 (텍스트)
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
        msg.setCreatedAt(LocalDate.now());
        msg.setReadYn("N");

        // ★ 마지막 메시지 시각 업데이트 (정렬용)
        room.setLastMessageAt(LocalDate.now());
        roomRepo.save(room);

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

    /* ============================================
     * ⭐ 이미지 전송 기능 (추가)
     * ============================================ */
    @Override
    public TradeChatMessage sendImage(Long roomId, Long senderId, MultipartFile file) throws Exception {

        // 실제 저장 경로 (프로젝트 최상위/upload/chat/)
        String uploadDir = System.getProperty("user.dir") + "/upload/chat/";

        File dir = new File(uploadDir);
        if (!dir.exists()) dir.mkdirs();  // 폴더 없으면 자동 생성

        // 파일명 생성
        String fileName = UUID.randomUUID() + "_" + file.getOriginalFilename();
        File saveFile = new File(uploadDir + fileName);

        // 파일 저장
        file.transferTo(saveFile);

        // DB 저장
        TradeChatRoom room = roomRepo.findById(roomId)
                .orElseThrow(() -> new IllegalArgumentException("채팅방 없음"));

        TradeChatMessage msg = new TradeChatMessage();
        msg.setRoom(room);
        msg.setRoomId(roomId);
        msg.setSenderId(senderId);

        // ⭐ DB에는 이렇게 저장됨
        msg.setMessage("[img]/upload/chat/" + fileName);

        msg.setCreatedAt(LocalDate.now());
        msg.setReadYn("N");

        // 마지막 메시지 시간 업데이트
        room.setLastMessageAt(LocalDate.now());
        roomRepo.save(room);

        return messageRepo.save(msg);
    }
}