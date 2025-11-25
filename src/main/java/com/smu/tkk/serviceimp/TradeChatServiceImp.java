package com.smu.tkk.serviceimp;


import com.smu.tkk.entity.TradeChatMessage;
import com.smu.tkk.entity.TradeChatRoom;
import com.smu.tkk.entity.TradePost;
import com.smu.tkk.repository.TradeChatMessageRepository;
import com.smu.tkk.repository.TradeChatRoomRepository;
import com.smu.tkk.repository.TradePostRepository;
import com.smu.tkk.service.TradeChatService;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

    @Service
    @RequiredArgsConstructor
    @Transactional
public class TradeChatServiceImp implements TradeChatService {

        private final TradeChatRoomRepository tradeChatRoomRepository;
        private final TradeChatMessageRepository tradeChatMessageRepository;
        private final TradePostRepository tradePostRepository;

        /** -------------------------------------------------------
         *  1. 채팅방 생성 (존재 시 재사용)
         * ------------------------------------------------------- */
        @Override
        public TradeChatRoom register(Long tradeId, Long buyerId) {

            // 기존 채팅방 확인
            return tradeChatRoomRepository.findAll(PageRequest.of(0, 1000)).stream() // 전체 조회 후 필터
                    .filter(room -> room.getTrade().getId().equals(tradeId)
                            && room.getMemberId().equals(buyerId))
                    .findFirst()
                    .orElseGet(() -> {
                        TradeChatRoom room = new TradeChatRoom();
                        room.setTrade(tradePostRepository.findById(tradeId)
                                .orElseThrow(() -> new IllegalArgumentException("거래글이 존재하지 않습니다. id=" + tradeId)));
                        room.setMemberId(buyerId);
                        return tradeChatRoomRepository.save(room);
                    });
        }

        /** -------------------------------------------------------
         *  2. 메시지 전송
         * ------------------------------------------------------- */
        @Override
        public TradeChatMessage send(Long roomId, Long senderId, String message) {

            TradeChatRoom room = tradeChatRoomRepository.findById(roomId)
                    .orElseThrow(() -> new IllegalArgumentException("채팅방이 존재하지 않습니다. roomId=" + roomId));

            TradeChatMessage chatMessage = new TradeChatMessage();
            chatMessage.setRoom(room);
            chatMessage.setSenderId(senderId);
            chatMessage.setMessage(message);
            chatMessage.setReadYn("N");

            return tradeChatMessageRepository.save(chatMessage);
        }

        /** -------------------------------------------------------
         *  3. 읽음 처리 (내가 아닌 상대가 보낸 메시지)
         * ------------------------------------------------------- */
        @Override
        public boolean markAsRead(Long roomId, Long viewerId) {

            TradeChatRoom room = tradeChatRoomRepository.findById(roomId)
                    .orElseThrow(() -> new IllegalArgumentException("채팅방이 존재하지 않습니다. roomId=" + roomId));

            Long senderId = room.getMemberId().equals(viewerId)
                    ? room.getTrade().getSeller().getId()
                    : room.getMemberId();

            int updated = tradeChatMessageRepository.modifyRead("Y", roomId, senderId);
            return updated > 0;
        }

        /** -------------------------------------------------------
         *  4. 내가 속한 채팅방 목록
         * ------------------------------------------------------- */
        @Override
        public Page<TradeChatRoom> myRooms(Long memberId) {

            Page<TradeChatRoom> buyerRooms = tradeChatRoomRepository.findByMemberId(memberId, PageRequest.of(0, 50));

            // 판매자로 속한 채팅방도 포함하려면 추가 조회
            Page<TradeChatRoom> sellerRooms = (Page<TradeChatRoom>) tradeChatRoomRepository.findAll(PageRequest.of(0, 50))
                    .map(room -> room.getTrade().getSeller().getId().equals(memberId) ? room : null)
                    .filter(room -> room != null);

            // buyerRooms + sellerRooms 합쳐서 반환 (간단하게 1페이지 합치기)
            // 필요하면 Pageable 커스텀 합병
            return buyerRooms; // 간단 구현, 필요시 합병
        }

        /** -------------------------------------------------------
         *  5. 채팅 메시지 리스트 (오름차순)
         * ------------------------------------------------------- */
        @Override
        public Page<TradeChatMessage> messages(Long roomId) {
            Pageable pageable = PageRequest.of(0, 100, Sort.by(Sort.Order.asc("id")));
            return tradeChatMessageRepository.findByRoomId(roomId, pageable);
        }

    }
