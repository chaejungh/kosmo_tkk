package com.smu.tkk.repository;

import com.smu.tkk.entity.Member;
import com.smu.tkk.entity.Notification;
import com.smu.tkk.service.NotificationService;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface NotificationRepository extends JpaRepository<Notification,Integer> {
    //Long countUnreadMessages(Long memberId); //앱 안에서 나에게 온 채팅의 읽지 않은 채팅의 개수
    List<Notification> findByMemberIdAndReadYn(Long memberId,String readYn , Pageable pageable);

    // 2. 알림 읽음 행동여부
    @Modifying
    @Query(value = "UPDATE Notification n set n.readYn=:readYn where n.memberId=:memberId")
    int modifyRead(String readYn, Long memberId);

}
