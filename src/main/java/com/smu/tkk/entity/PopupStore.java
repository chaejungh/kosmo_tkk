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
@Table(name = "POPUP_STORE")
public class PopupStore {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "POPUP_ID", nullable = false)
    private Long id;

    @Column(name = "TITLE", nullable = false, length = 150)
    private String title;

    @Column(name = "PLACE_NAME", length = 150)
    private String placeName;

    @Column(name = "ADDRESS")
    private String address;

    @Column(name = "REGION_NAME", length = 100)
    private String regionName;

    @Column(name = "LATITUDE", precision = 11, scale = 8)
    private BigDecimal latitude;

    @Column(name = "LONGITUDE", precision = 11, scale = 8)
    private BigDecimal longitude;

    @Column(name = "START_DATE", nullable = false)
    private LocalDate startDate;

    @Column(name = "END_DATE", nullable = false)
    private LocalDate endDate;

    @Column(name = "BANNER_IMAGE_URL")
    private String bannerImageUrl;

    @Lob
    @Column(name = "DESCRIPTION")
    private String description;

    @ColumnDefault("SYSDATE                          -- 등록일")
    @Column(name = "CREATED_AT")
    private LocalDate createdAt;

    @OneToMany(mappedBy = "popup")
    @ToString.Exclude
    @JsonIgnore
    private Set<PopupBookmark> popupBookmarks = new LinkedHashSet<>();

    @OneToMany(mappedBy = "popup")
    @ToString.Exclude
    @JsonIgnore
    private Set<PopupGood> popupGoods = new LinkedHashSet<>();

    // 🔥 소프트 삭제용 플래그 (Store / TradePost와 동일하게 사용)
    @ColumnDefault("'N'")
    @Column(name = "DELETED_YN", length = 1, nullable = false)
    private String deletedYn = "N";   // N = 노출, Y = 숨김/삭제
}
