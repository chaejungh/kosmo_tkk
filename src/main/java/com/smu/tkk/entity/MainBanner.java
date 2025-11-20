package com.smu.tkk.entity;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.hibernate.annotations.ColumnDefault;

import java.time.LocalDate;

@Getter
@Setter
@Entity
@ToString
@Table(name = "MAIN_BANNER")
public class MainBanner {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "BANNER_ID", nullable = false)
    private Long id;

    @Column(name = "TITLE", nullable = false, length = 150)
    private String title;

    @Column(name = "IMAGE_URL", nullable = false)
    private String imageUrl;

    @Column(name = "LINK_TYPE", length = 20)
    private String linkType;

    @Column(name = "LINK_TARGET_ID")
    private Long linkTargetId;

    @Column(name = "LINK_URL")
    private String linkUrl;

    @Column(name = "START_DATE")
    private LocalDate startDate;

    @Column(name = "END_DATE")
    private LocalDate endDate;

    @ColumnDefault("1")
    @Column(name = "SORT_ORDER")
    private Long sortOrder;

    @ColumnDefault("'Y'                             -- 사용 여부")
    @Column(name = "ACTIVE_YN")
    private Boolean activeYn;

}