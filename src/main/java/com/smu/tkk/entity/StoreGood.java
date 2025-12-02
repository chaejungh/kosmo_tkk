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
@Table(name = "STORE_GOODS")
@ToString
public class StoreGood {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "GOODS_ID", nullable = false)
    private Long id;

    @Column(name = "STORE_ID", insertable = false, updatable = false)
    private Long storeId;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @OnDelete(action = OnDeleteAction.RESTRICT)
    @JoinColumn(name = "STORE_ID", nullable = false)
    @ToString.Exclude
    @JsonIgnore
    private Store store;

    @Column(name = "NAME", nullable = false, length = 150)
    private String name;

    @Column(name = "WORK_NAME", length = 100)
    private String workName;

    @Column(name = "CHARACTER_NAME", length = 100)
    private String characterName;

    @Column(name = "CATEGORY", length = 30)
    private String category;

    @Column(name = "PRICE")
    private Long price;

    @Column(name = "STOCK_QTY")
    private Long stockQty;

    @Column(name = "THUMBNAIL_URL")
    private String thumbnailUrl;

    @ColumnDefault("SYSDATE")
    @Column(name = "CREATED_AT")
    private LocalDate createdAt;

    @Column(name = "UPDATED_AT")
    private LocalDate updatedAt;
}
