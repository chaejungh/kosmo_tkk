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
import java.util.LinkedHashSet;
import java.util.Set;

@Getter
@Setter
@Entity
@ToString
@Table(name = "TRADE_CHAT_ROOM")
public class TradeChatRoom {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "ROOM_ID", nullable = false)
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @OnDelete(action = OnDeleteAction.RESTRICT)
    @JoinColumn(name = "TRADE_ID", nullable = false)
    @ToString.Exclude
    @JsonIgnore
    private TradePost trade;

    @Column(name = "\"TYPE\"", length = 20)
    private String type;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @OnDelete(action = OnDeleteAction.RESTRICT)
    @JoinColumn(name = "MEMBER_ID", nullable = false)
    @ToString.Exclude
    @JsonIgnore
    private Member member;

    @ColumnDefault("SYSDATE")
    @Column(name = "CREATED_AT")
    private LocalDate createdAt;

    @Column(name = "LAST_MESSAGE_AT")
    private LocalDate lastMessageAt;

    @OneToMany(mappedBy = "room")
    @ToString.Exclude
    @JsonIgnore
    private Set<TradeChatMessage> tradeChatMessages = new LinkedHashSet<>();

}