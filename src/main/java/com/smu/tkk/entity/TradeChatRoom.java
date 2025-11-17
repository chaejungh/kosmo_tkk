package com.smu.tkk.entity;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;
import org.hibernate.annotations.ColumnDefault;

import java.time.LocalDate;
import java.util.LinkedHashSet;
import java.util.Set;

@Getter
@Setter
@Entity
@Table(name = "TRADE_CHAT_ROOM")
public class TradeChatRoom {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "ROOM_ID", nullable = false)
    private Long id;

    @Column(name = "TRADE_ID", nullable = false)
    private Long tradeId;

    @Column(name = "\"TYPE\"", length = 20)
    private String type;

    @Column(name = "MEMBER_ID", nullable = false)
    private Long memberId;

    @ColumnDefault("SYSDATE")
    @Column(name = "CREATED_AT")
    private LocalDate createdAt;

    @Column(name = "LAST_MESSAGE_AT")
    private LocalDate lastMessageAt;

    @OneToMany
    @JoinColumn
    private Set<TradeChatMessage> tradeChatMessages = new LinkedHashSet<>();

}