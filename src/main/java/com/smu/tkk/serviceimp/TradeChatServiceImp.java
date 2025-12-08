package com.smu.tkk.serviceimp;

import com.smu.tkk.dto.ChatMessage;
import com.smu.tkk.dto.ChatRoomListDTO;
import com.smu.tkk.entity.TradeChatMessage;
import com.smu.tkk.entity.TradeChatRoom;
import com.smu.tkk.entity.TradePost;
import com.smu.tkk.repository.TradeChatMessageRepository;
import com.smu.tkk.repository.TradeChatRoomRepository;
import com.smu.tkk.repository.TradePostImageRepository;
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
import java.util.*;
import java.util.stream.Stream;

@Service
@RequiredArgsConstructor
@Transactional
public class TradeChatServiceImp implements TradeChatService {

    private final TradeChatRoomRepository roomRepo;
    private final TradeChatMessageRepository messageRepo;
    private final TradePostRepository postRepo;
    private final TradePostImageRepository postImageRepo;

    /* ============================================================
     * 1. 채팅방 생성 or 기존방 재사용
     * ============================================================ */
    @Override
    public TradeChatRoom register(Long tradeId, Long buyerId) {
        List<TradeChatRoom> rooms = roomRepo.findAll();
        for (TradeChatRoom room : rooms) {
            if (room.getTradeId().equals(tradeId)
                    && room.getBuyerId().equals(buyerId)) {
                return room;
            }
        }

        TradeChatRoom newRoom = new TradeChatRoom();
        Optional<TradePost> tradePost = postRepo.findById(tradeId);

        newRoom.setTradeId(tradeId);
        newRoom.setSellerId(tradePost.get().getSellerId());
        newRoom.setBuyerId(buyerId);
        //newRoom.setCreatedAt(LocalDateTime.now());
        //newRoom.setLastMessageAt(LocalDateTime.now());
        System.out.println(newRoom);
        return roomRepo.save(newRoom);
    }

    @Override
    public TradeChatRoom getOrCreateRoom(Long tradeId, Long buyerId) {
        return register(tradeId, buyerId);
    }

    /* ============================================================
     * 2. 기존 REST에서 사용하던 send (지금은 WS 위주)
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
        msg.setCreatedAt(LocalDateTime.now());
        msg.setReadYn("N");

        room.setLastMessageAt(LocalDateTime.now());
        roomRepo.save(room);

        return messageRepo.save(msg);
    }

    /* ============================================================
     * 3. 읽음 처리
     * ============================================================ */
    @Override
    @Transactional
    public boolean markAsRead(Long roomId, Long viewerId) {

        TradeChatRoom room = roomRepo.findById(roomId)
                .orElseThrow(() -> new IllegalArgumentException("채팅방 없음: " + roomId));

        Long opponentId = room.getBuyerId().equals(viewerId)
                ? room.getSellerId()
                : room.getBuyerId();

        int updated = messageRepo.modifyRead("Y", roomId, opponentId);
        return updated > 0;
    }

    /* ============================================================
     * 4. 내가 속한 채팅방 목록
     * ============================================================ */
    @Override
    public List<TradeChatRoom> myRooms(Long memberId) {

//        Pageable pageable = PageRequest.of(0, 100, Sort.by(Sort.Direction.DESC, "lastMessageAt"));

        List<TradeChatRoom> buyerRooms = roomRepo.findBySellerIdOrBuyerId(memberId);


        return buyerRooms;
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
     * 7. 이미지 전송 (REST)
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
        msg.setCreatedAt(LocalDateTime.now());
        msg.setReadYn("N");

        room.setLastMessageAt(LocalDateTime.now());
        roomRepo.save(room);

        return messageRepo.save(msg);
    }

    /* ============================================================
     * 8. WebSocket 텍스트 메시지 저장
     * ============================================================ */
    @Override
    public ChatMessage saveWebSocketMessage(ChatMessage dto) {

        TradeChatRoom room = roomRepo.findById(dto.getRoomId())
                .orElseThrow(() -> new IllegalArgumentException("채팅방 없음: " + dto.getRoomId()));

        LocalDateTime now = LocalDateTime.now();

        TradeChatMessage entity = new TradeChatMessage();
        entity.setRoom(room);
        entity.setRoomId(dto.getRoomId());
        entity.setSenderId(dto.getSenderId());
        entity.setMessage(dto.getMessage());
        entity.setReadYn("N");
        entity.setCreatedAt(now);

        room.setLastMessageAt(now);
        roomRepo.save(room);

        TradeChatMessage saved = messageRepo.save(entity);

        dto.setMessageId(saved.getId());
        dto.setCreatedAt(now.toString());
        dto.setRead(false);
        dto.setType(dto.getType() == null ? "TEXT" : dto.getType());

        return dto;
    }

    /* ============================================================
     * 9. WebSocket 이미지 저장
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
        msg.setCreatedAt(now);
        msg.setReadYn("N");

        messageRepo.save(msg);

        return "/upload/chat/" + fileName;
    }

    /* ============================================================
     * 10. 메시지 삭제(소프트 삭제)
     * ============================================================ */
    @Override
    public void deleteMessage(Long messageId, Long memberId) {
        TradeChatMessage msg = messageRepo.findById(messageId)
                .orElseThrow(() -> new IllegalArgumentException("메시지 없음: " + messageId));

        if (!msg.getSenderId().equals(memberId)) {
            throw new IllegalStateException("본인이 보낸 메시지만 삭제할 수 있습니다.");
        }

        msg.setMessage("(삭제된 메시지입니다)");
        msg.setReadYn("Y");
        messageRepo.save(msg);
    }

    /* ============================================================
     * 11. 채팅방 목록(썸네일/닉네임/최근메세지/시간/안읽음)
     * ============================================================ */
    @Override
    @Transactional(readOnly = true)
    public List<ChatRoomListDTO> getChatRoomList(Long memberId) {

        List<TradeChatRoom> rooms = myRooms(memberId);

        List<ChatRoomListDTO> result = new java.util.ArrayList<>();

        for (TradeChatRoom room : rooms) {

            ChatRoomListDTO dto = new ChatRoomListDTO();
            dto.setRoomId(room.getId());
            dto.setTradeId(room.getTradeId());

            // 🔹 거래글 썸네일 – 일단 null 로 두고, 나중에 TradePost 엔티티 보고 진짜 필드 연결
            String thumb = null;

            if (room.getTrade() != null) {
                // TODO: TradePost 엔티티에 썸네일(대표이미지) 필드가 뭐인지 확인해서
                // 예: thumb = room.getTrade().getImageUrl();
                //     thumb = room.getTrade().getMainImg();
                // 이런 식으로 한 줄만 채워 넣으면 됨.
                Long tradeId = room.getTradeId();
                thumb = String.valueOf(postImageRepo.findFirstByTradeIdOrderBySortOrderAscIdAsc(tradeId));
            }

            dto.setTradeThumb(thumb);

            Long opponentId;
            String opponentName;

            if (room.getBuyerId().equals(memberId)) {
                opponentId = room.getTrade().getSellerId();
                opponentName = room.getTrade().getSeller().getNickname();
            } else {
                opponentId = room.getBuyerId();
                opponentName = room.getBuyer() != null ? room.getBuyer().getNickname() : "알 수 없음";
            }

            dto.setOpponentId(opponentId);
            dto.setOpponentName(opponentName);

            TradeChatMessage lastMsg = messageRepo.findTopByRoomIdOrderByIdDesc(room.getId());
            if (lastMsg != null) {
                String msgText = lastMsg.getMessage();
                if (msgText != null && msgText.startsWith("[img]")) {
                    dto.setLastMessage("(사진을 보냈습니다)");
                } else {
                    dto.setLastMessage(msgText);
                }

                dto.setLastTime(lastMsg.getCreatedAt() != null
                        ? lastMsg.getCreatedAt().toString()
                        : "");
            } else {
                dto.setLastMessage("아직 대화가 없습니다.");
                dto.setLastTime("");
            }

            int unreadCount = 0;
            try {
                unreadCount = messageRepo.countUnread(room.getId(), memberId);
            } catch (Exception e) {
                e.printStackTrace();
            }

            dto.setUnreadCount(unreadCount);

            result.add(dto);
        }

        return result;
    }

    @Override
    @Transactional
    public void leaveRoom(Long roomId, Long memberId) {

        TradeChatRoom room = roomRepo.findById(roomId)
                .orElseThrow(() -> new IllegalArgumentException("채팅방 없음: " + roomId));

        Long buyerId  = room.getBuyerId();              // 구매자
        Long sellerId = room.getTrade().getSellerId();   // 판매자

        boolean isBuyer  = buyerId != null  && buyerId.equals(memberId);
        boolean isSeller = sellerId != null && sellerId.equals(memberId);

        if (!isBuyer && !isSeller) {
            throw new IllegalStateException("본인 채팅방만 나가기 가능합니다.");
        }

        // 🔹 내가 buyer라면 buyerLeftYn만 Y
        if (isBuyer) {
            room.setBuyerLeftYn("Y");
        }

        // 🔹 내가 seller라면 sellerLeftYn만 Y
        if (isSeller) {
            room.setSellerLeftYn("Y");
        }

        // (선택) 둘 다 나갔으면 방 자체를 delete
         if ("Y".equals(room.getBuyerLeftYn()) && "Y".equals(room.getSellerLeftYn())) {
             roomRepo.delete(room);
             return;
         }

        roomRepo.save(room);
    }

}