package com.smu.tkk.serviceimp;

import com.smu.tkk.config.NotificationPublisher;
import com.smu.tkk.entity.Member;
import com.smu.tkk.entity.Notification;
import com.smu.tkk.entity.TradeChatRoom;
import com.smu.tkk.repository.NotificationRepository;
import com.smu.tkk.repository.TradeChatRoomRepository;
import com.smu.tkk.service.NotificationService;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.sql.SQLException;
import java.time.LocalDate;
import java.util.List;

    @Service
    @RequiredArgsConstructor
    @Transactional
    @Component
    public class NotificationServiceImp implements NotificationService {

        private final NotificationRepository notificationRepository;
        private final NotificationPublisher notificationPublisher;
        private final TradeChatRoomRepository roomRepository;

        /** -------------------------------------------------------
         *  1. 알림 등록
         * ------------------------------------------------------- */
        @Override
        public boolean registerOne(Member member) throws SQLException {

            if (member == null || member.getId() == null) {
                throw new IllegalArgumentException("잘못된 사용자 정보입니다.");
            }

            Notification noti = new Notification();
            noti.setMemberId(member.getId());
            noti.setReadYn("N");   // 기본값: 미읽음

            notificationRepository.save(noti);

            return true;
        }

        /** -------------------------------------------------------
         *  2. 알림 읽음 여부 변경
         * ------------------------------------------------------- */
        @Override
        public boolean modify(boolean read) {

            // DTO나 요청에서 memberId 받아올 구조가 정해지지 않아
            // 일단 read만 받고 전체 업데이트는 불가능 → 기존 레포지토리 형식 맞춰 작성

            throw new UnsupportedOperationException(
                    "modify(boolean) alone cannot work — memberId is required.\n" +
                            "서비스 시그니처를 modify(Long memberId, boolean read) 로 변경해야 합니다."
            );
        }

        /** -------------------------------------------------------
         *  2-1. (추천) memberId 포함한 알림 읽음 처리
         * ------------------------------------------------------- */
        @Transactional
        public boolean modifyRead(Long memberId, boolean read) {

            if (memberId == null) {
                throw new IllegalArgumentException("memberId is null");
            }

            String readYn = read ? "Y" : "N";

            int updated = notificationRepository.modifyRead(readYn, memberId);

            return updated > 0;
        }

        /** -------------------------------------------------------
         *  3. 알림 전체 조회
         * ------------------------------------------------------- */
        @Override
        public List<Notification> readAll() {
            return notificationRepository.findAll();
        }

        /** -------------------------------------------------------
         *  4. 미읽음 개수
         * ------------------------------------------------------- */
        @Override
        public Long unreadCount(Long memberId) throws SQLException {

            if (memberId == null) return 0L;

            List<Notification> unread =
                    notificationRepository.findByMemberIdAndReadYn(memberId, "N", Pageable.unpaged());

            return (long) unread.size();
        }

        /** -------------------------------------------------------
         *  5. 알림 전체 삭제
         * ------------------------------------------------------- */
        @Override
        @Transactional
        public boolean removeAll(Member member) throws SQLException {

            if (member == null || member.getId() == null) {
                throw new IllegalArgumentException("잘못된 사용자 정보입니다.");
            }

            /*List<Notification> list =
                    notificationRepository.findByMemberIdAndReadYn(member.getId(), "Y", Pageable.unpaged());*/

            /*notificationRepository.deleteAll(list);*/

            notificationRepository.deleteByMemberId(member.getId());

            return true;
        }

        @Override
        public Notification create(Long memberId, String notifType, String message, String linkType, Long linkTargetId) {
            Notification n = new Notification();
            n.setMemberId(memberId);
            n.setNotifType(notifType);
            n.setMessage(message);
            n.setLinkType(linkType);
            n.setReadYn("N");
            n.setCreatedAt(LocalDate.now());

            return notificationRepository.save(n);
        }

        @Override
        public boolean markRead(Long notificationId) {

            Notification noti = notificationRepository.findById(notificationId)
                    .orElseThrow(() -> new IllegalArgumentException("해당 알림이 존재하지 않습니다."));

            noti.setReadYn("Y");
            notificationRepository.save(noti);

            return false;
        }

        @Override
        public void sendChatNotification(Long roomId, Long senderId) {

            // 1) 채팅방 불러오기
            TradeChatRoom room = roomRepository.findDetailById(roomId);
            if (room == null) {
                throw new IllegalArgumentException("채팅방 없음: " + roomId);
            }

            // 2) 상대방 아이디 찾기
            Long buyerId = room.getMemberId();
            Long sellerId = room.getTrade().getSeller().getId();

            Long target = senderId.equals(buyerId) ? sellerId : buyerId;

            System.out.println("📌 알림 받을 대상 ID = " + target);

            // 3) 토스트 전송
            notificationPublisher.send(target, "새 채팅 메시지가 도착했습니다."
            );
        }
    }
