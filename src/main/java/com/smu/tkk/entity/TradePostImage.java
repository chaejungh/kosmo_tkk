package com.smu.tkk.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.hibernate.annotations.ColumnDefault;
import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;

@Getter
@Setter
@Entity
@ToString
@Table(name = "TRADE_POST_IMAGE")
public class TradePostImage {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "IMAGE_ID", nullable = false)
    private Long id;

    @Column(name = "TRADE_ID", nullable = false)
    private Long tradeId;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @OnDelete(action = OnDeleteAction.RESTRICT)
    @JoinColumn(name = "TRADE_ID", insertable = false, updatable = false)
    @ToString.Exclude
    @JsonIgnore
    private TradePost trade;

    @Column(name = "IMAGE_URL", nullable = false)
    private String imageUrl;

    @ColumnDefault("1")
    @Column(name = "SORT_ORDER")
    private Long sortOrder;

}