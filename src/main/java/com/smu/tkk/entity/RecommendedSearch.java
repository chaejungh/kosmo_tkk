package com.smu.tkk.entity;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;
import org.hibernate.annotations.ColumnDefault;

@Getter
@Setter
@Entity
@Table(name = "RECOMMENDED_SEARCH")
public class RecommendedSearch {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "REC_ID", nullable = false)
    private Long id;

    @Column(name = "KEYWORD", nullable = false, length = 100)
    private String keyword;

    @Column(name = "TARGET_TYPE", length = 20)
    private String targetType;

    @ColumnDefault("1")
    @Column(name = "SORT_ORDER")
    private Long sortOrder;

    @ColumnDefault("'Y'                                  -- 사용 여부")
    @Column(name = "ACTIVE_YN")
    private Boolean activeYn;

}