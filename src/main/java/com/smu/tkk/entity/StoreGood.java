package com.smu.tkk.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

import java.time.LocalDateTime;

@Getter
@Setter
@Entity
@Table(name = "store_goods") // ✅ DDL: store_goods
@ToString
public class StoreGood {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "goods_id", nullable = false)
    private Long id;

    // ✅ join 컬럼 값만 읽고 싶을 때 (편의용)
    @Column(name = "store_id", insertable = false, updatable = false)
    private Long storeId;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "store_id", nullable = false)
    @ToString.Exclude
    @JsonIgnore
    private Store store;

    @Column(name = "name", nullable = false, length = 150)
    private String name;

    @Column(name = "work_name", length = 100)
    private String workName;

    @Column(name = "character_name", length = 100)
    private String characterName;

    @Column(name = "category", length = 30)
    private String category;

    @Column(name = "price")
    private Integer price;      // ✅ DDL: INT

    @Column(name = "stock_qty")
    private Integer stockQty;   // ✅ DDL: INT

    @Column(name = "thumbnail_url", length = 511)
    private String thumbnailUrl;

    @CreationTimestamp
    @Column(name = "created_at", updatable = false)
    private LocalDateTime createdAt; // ✅ DDL: DATETIME

    @UpdateTimestamp
    @Column(name = "updated_at")
    private LocalDateTime updatedAt; // ✅ DDL: DATETIME DEFAULT NULL
}