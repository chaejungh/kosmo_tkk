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
@Table(name = "POPUP_BOOKMARK")
public class PopupBookmark {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "POPUP_BOOKMARK_ID", nullable = false)
    private Long id;

    @Column(name = "MEMBER_ID", nullable = false)
    private Long memberId;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @OnDelete(action = OnDeleteAction.CASCADE)
    @JoinColumn(name = "MEMBER_ID",insertable = false,updatable = false)
    @ToString.Exclude
    @JsonIgnore
    private Member member;

    @Column(name = "POPUP_ID", nullable = false)
    private Long popupId;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @OnDelete(action = OnDeleteAction.CASCADE)
    @JoinColumn(name = "POPUP_ID", insertable = false,updatable = false)
    @ToString.Exclude
    @JsonIgnore
    private PopupStore popup;

    @ColumnDefault("SYSDATE")
    @Column(name = "CREATED_AT")
    private LocalDate createdAt;

}