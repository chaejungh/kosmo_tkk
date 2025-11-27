package com.smu.tkk.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.hibernate.annotations.ColumnDefault;
import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;

import java.time.LocalDate;

@Getter
@Setter
@Entity
@ToString
@Table(name = "TRADE_CHAT_MESSAGE")
public class TradeChatMessage {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "MESSAGE_ID", nullable = false)
    private Long id;

    @Column(name = "ROOM_ID", nullable = false)
    private Long roomId;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @OnDelete(action = OnDeleteAction.RESTRICT)
    @JoinColumn(name = "ROOM_ID", insertable = false, updatable = false)
    @ToString.Exclude
    @JsonIgnore
    private TradeChatRoom room;

    @Column(name = "SENDER_ID", nullable = false)
    private Long senderId;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @OnDelete(action = OnDeleteAction.RESTRICT)
    @JoinColumn(name = "SENDER_ID", insertable = false, updatable = false)
    @ToString.Exclude
    @JsonIgnore
    private Member sender;

    @Column(name = "MESSAGE", nullable = false, length = 1000)
    private String message;

    @ColumnDefault("SYSDATE")
    @Column(name = "CREATED_AT")
    private LocalDate createdAt;

    @ColumnDefault("'N'")
    @Column(name = "READ_YN")
    private String readYn;

    /* ==========================================================
       🔥 나중에 이미지/멀티미디어 기능 넣을 때 다시 사용할 필드
       🔥 지금은 주석 처리 (DB에 없기 때문에 오류남!)
       ========================================================== */

    // @Column(name = "MESSAGE_TYPE", length = 20)
    // private String messageType;   // ex) "TEXT", "IMAGE"

    // @Column(name = "IMAGE_URL")
    // private String imageUrl;
}