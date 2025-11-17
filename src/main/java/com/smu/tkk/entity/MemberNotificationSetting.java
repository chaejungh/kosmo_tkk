package com.smu.tkk.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Getter;
import lombok.Setter;
import org.hibernate.annotations.ColumnDefault;

import java.time.LocalDate;

@Getter
@Setter
@Entity
@Table(name = "MEMBER_NOTIFICATION_SETTING")
public class MemberNotificationSetting {
    @Id
    @Column(name = "MEMBER_ID", nullable = false)
    private Long id;

    @ColumnDefault("'Y'")
    @Column(name = "COMMENT_YN")
    private Boolean commentYn;

    @ColumnDefault("'Y'")
    @Column(name = "LIKE_YN")
    private Boolean likeYn;

    @ColumnDefault("'Y'")
    @Column(name = "TRADE_YN")
    private Boolean tradeYn;

    @ColumnDefault("'Y'")
    @Column(name = "EVENT_YN")
    private Boolean eventYn;

    @ColumnDefault("SYSDATE")
    @Column(name = "CREATED_AT")
    private LocalDate createdAt;

    @Column(name = "UPDATED_AT")
    private LocalDate updatedAt;

}