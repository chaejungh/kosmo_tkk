package com.smu.tkk.entity;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;
import org.hibernate.annotations.ColumnDefault;

import java.time.LocalDate;

@Getter
@Setter
@Entity
@Table(name = "SERVICE_NOTICE")
public class ServiceNotice {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "NOTICE_ID", nullable = false)
    private Long id;

    @Column(name = "TITLE", nullable = false, length = 200)
    private String title;

    @Lob
    @Column(name = "CONTENT", nullable = false)
    private String content;

    @ColumnDefault("'NOTICE'")
    @Column(name = "NOTICE_TYPE", length = 20)
    private String noticeType;

    @Column(name = "START_DATE")
    private LocalDate startDate;

    @Column(name = "END_DATE")
    private LocalDate endDate;

    @ColumnDefault("SYSDATE                                 -- 등록일")
    @Column(name = "CREATED_AT")
    private LocalDate createdAt;

}