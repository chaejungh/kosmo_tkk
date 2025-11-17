package com.smu.tkk.entity;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;
import org.hibernate.annotations.ColumnDefault;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.LinkedHashSet;
import java.util.Set;

@Getter
@Setter
@Entity
@Table(name = "STORE")
public class Store {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "STORE_ID", nullable = false)
    private Long id;

    @Column(name = "NAME", nullable = false, length = 100)
    private String name;

    @Column(name = "ONE_LINE_DESC", length = 200)
    private String oneLineDesc;

    @Column(name = "ADDRESS")
    private String address;

    @Column(name = "REGION_NAME", length = 100)
    private String regionName;

    @Column(name = "LATITUDE", precision = 11, scale = 8)
    private BigDecimal latitude;

    @Column(name = "LONGITUDE", precision = 11, scale = 8)
    private BigDecimal longitude;

    @ColumnDefault("0")
    @Column(name = "AVG_RATING", precision = 3, scale = 2)
    private BigDecimal avgRating;

    @ColumnDefault("0")
    @Column(name = "BOOKMARK_COUNT")
    private Long bookmarkCount;

    @Column(name = "PHONE", length = 30)
    private String phone;

    @ColumnDefault("SYSDATE                       -- 등록일")
    @Column(name = "CREATED_AT")
    private LocalDate createdAt;

    @OneToMany
    @JoinColumn
    private Set<StoreBookmark> storeBookmarks = new LinkedHashSet<>();

    @OneToMany
    @JoinColumn
    private Set<StoreGood> storeGoods = new LinkedHashSet<>();

}