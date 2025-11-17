package com.smu.tkk.entity;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;
import org.hibernate.annotations.ColumnDefault;

import java.time.LocalDate;

@Getter
@Setter
@Entity
@Table(name = "TRADE_CHAT_MESSAGE")
public class TradeChatMessage {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "MESSAGE_ID", nullable = false)
    private Long id;

    @Column(name = "ROOM_ID", nullable = false)
    private Long roomId;

    @Column(name = "SENDER_ID", nullable = false)
    private Long senderId;

    @Column(name = "MESSAGE", nullable = false, length = 1000)
    private String message;

    @ColumnDefault("SYSDATE")
    @Column(name = "CREATED_AT")
    private LocalDate createdAt;

    @ColumnDefault("'N'")
    @Column(name = "READ_YN")
    private Boolean readYn;

}