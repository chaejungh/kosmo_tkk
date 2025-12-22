package com.smu.tkk.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
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
    @OnDelete(action = OnDeleteAction.CASCADE)
    @JoinColumn(name = "MEMBER_ID", nullable = false)
    @ToString.Exclude
    @JsonIgnore
    private Member member;

    @Column(name = "COMMENT_YN", nullable = false, length = 1)
    private String commentYn;

    @Column(name = "LIKE_YN", nullable = false, length = 1)
    private String likeYn;

    @Column(name = "TRADE_YN", nullable = false, length = 1)
    private String tradeYn;

    @Column(name = "EVENT_YN", nullable = false, length = 1)
    private String eventYn;

    @Column(name = "CREATED_AT", updatable = false)
    private LocalDate createdAt;

    @Column(name = "UPDATED_AT")
    private LocalDate updatedAt;

    @PrePersist
    public void prePersist() {
        if (commentYn == null) commentYn = "Y";
        if (likeYn == null) likeYn = "Y";
        if (tradeYn == null) tradeYn = "Y";
        if (eventYn == null) eventYn = "Y";

        LocalDate now = LocalDate.now();
        if (createdAt == null) createdAt = now;
        if (updatedAt == null) updatedAt = now;
    }

    @PreUpdate
    public void preUpdate() {
        updatedAt = LocalDate.now();
    }
}
