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
@ToString
@Table(name = "MEMBER_NOTIFICATION_SETTING")
public class MemberNotificationSetting {
    @Id
    @Column(name = "MEMBER_ID", nullable = false)
    private Long id;

    @MapsId
    @OneToOne(fetch = FetchType.LAZY, optional = false)
    @OnDelete(action = OnDeleteAction.RESTRICT)
    @JoinColumn(name = "MEMBER_ID", nullable = false)
    @ToString.Exclude
    @JsonIgnore
    private Member member;

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