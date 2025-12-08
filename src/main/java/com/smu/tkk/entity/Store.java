package com.smu.tkk.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.hibernate.annotations.ColumnDefault;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.LinkedHashSet;
import java.util.Set;

@Getter
@Setter
@Entity
@ToString
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

    @ColumnDefault("SYSDATE -- 등록일")
    @Column(name = "CREATED_AT")
    private LocalDate createdAt;

    // ================== 여기만 새로 추가 ==================
    @ColumnDefault("'N'")
    @Column(name = "DELETED_YN", length = 1, nullable = false)
    private String deletedYn = "N";   // N = 노출, Y = 숨김
    // =====================================================

    @OneToMany(mappedBy = "store")
    @ToString.Exclude
    @JsonIgnore
    private Set<StoreBookmark> storeBookmarks = new LinkedHashSet<>();

    @OneToMany(mappedBy = "store")
    @ToString.Exclude
    @JsonIgnore
    private Set<StoreGood> storeGoods = new LinkedHashSet<>();

}
