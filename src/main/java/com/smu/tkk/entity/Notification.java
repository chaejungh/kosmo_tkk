package com.smu.tkk.entity;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;
import org.hibernate.annotations.ColumnDefault;

import java.time.LocalDate;

@Getter
@Setter
@Entity
@Table(name = "NOTIFICATION")
public class Notification {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "NOTIFICATION_ID", nullable = false)
    private Long id;

    @Column(name = "MEMBER_ID", nullable = false)
    private Long memberId;

    @Column(name = "NOTIF_TYPE", length = 30)
    private String notifType;

    @Column(name = "MESSAGE", nullable = false)
    private String message;

    @Column(name = "LINK_TYPE", length = 20)
    private String linkType;

    @Column(name = "LINK_TARGET_ID")
    private Long linkTargetId;

    @ColumnDefault("'N'")
    @Column(name = "READ_YN")
    private Boolean readYn;

    @ColumnDefault("SYSDATE")
    @Column(name = "CREATED_AT")
    private LocalDate createdAt;

}