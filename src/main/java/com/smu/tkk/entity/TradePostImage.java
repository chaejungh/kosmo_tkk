package com.smu.tkk.entity;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;
import org.hibernate.annotations.ColumnDefault;

@Getter
@Setter
@Entity
@Table(name = "TRADE_POST_IMAGE")
public class TradePostImage {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "IMAGE_ID", nullable = false)
    private Long id;

    @Column(name = "TRADE_ID", nullable = false)
    private Long tradeId;

    @Column(name = "IMAGE_URL", nullable = false)
    private String imageUrl;

    @ColumnDefault("1")
    @Column(name = "SORT_ORDER")
    private Long sortOrder;

}