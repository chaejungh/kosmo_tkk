package com.smu.tkk.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.*;
import jakarta.persistence.Table;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.hibernate.annotations.*;

import java.time.LocalDate;
import java.time.LocalDateTime;
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

    @Column(name = "TRADE_ID", nullable = false)
    private Long tradeId;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @OnDelete(action = OnDeleteAction.CASCADE)
    @JoinColumn(name = "TRADE_ID", insertable = false, updatable = false)
    @ToString.Exclude
    @JsonIgnore
    private TradePost trade;

//    @Column(name = "TYPE", length = 20)
//    private String type;
//
//    @Column(name = "MEMBER_ID", nullable = false)
//    private Long memberId;
//
//    @ManyToOne(fetch = FetchType.LAZY, optional = false)
//    @OnDelete(action = OnDeleteAction.CASCADE)
//    @JoinColumn(name = "MEMBER_ID",insertable = false,updatable = false)
//    @ToString.Exclude
//    @JsonIgnore
//    private Member member;

    @Column(name = "SELLER_ID", nullable = false)
    private Long sellerId;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @OnDelete(action = OnDeleteAction.CASCADE)
    @JoinColumn(name = "SELLER_ID",insertable = false,updatable = false)
    @ToString.Exclude
    @JsonIgnore
    private Member seller;

    @Column(name = "BUYER_ID", nullable = false)
    private Long buyerId;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @OnDelete(action = OnDeleteAction.CASCADE)
    @JoinColumn(name = "BUYER_ID",insertable = false,updatable = false)
    @ToString.Exclude
    @JsonIgnore
    private Member buyer;


    @CreationTimestamp
    @Column(name = "CREATED_AT",nullable = true)
    private LocalDateTime createdAt;

    @CreationTimestamp
    @Column(name = "LAST_MESSAGE_AT",nullable = true)
    private LocalDateTime lastMessageAt;

    @OneToMany(mappedBy = "room")
    @ToString.Exclude
    @JsonIgnore
    private Set<TradeChatMessage> tradeChatMessages = new LinkedHashSet<>();
}