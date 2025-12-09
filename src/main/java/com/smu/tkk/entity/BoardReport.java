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
@Table(name = "BOARD_REPORT")
public class BoardReport {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "REPORT_ID", nullable = false)
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY)
    @OnDelete(action = OnDeleteAction.CASCADE)
    @JoinColumn(name = "POST_ID")
    @ToString.Exclude
    @JsonIgnore
    private BoardPost post;

    @ManyToOne(fetch = FetchType.LAZY)
    @OnDelete(action = OnDeleteAction.CASCADE)
    @JoinColumn(name = "COMMENT_ID")
    @ToString.Exclude
    @JsonIgnore
    private BoardComment comment;

    @Column(name = "REPORTER_ID", nullable = false)
    private Long reporterId;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @OnDelete(action = OnDeleteAction.CASCADE)
    @JoinColumn(name = "REPORTER_ID", referencedColumnName = "MEMBER_ID", insertable = false, updatable = false)
    @ToString.Exclude
    @JsonIgnore
    private Member reporter;

    @Column(name = "REASON")
    private String reason;

    @ColumnDefault("'WAIT'")
    @Column(name = "STATUS", length = 20)
    private String status;

    @ColumnDefault("SYSDATE")
    @Column(name = "CREATED_AT")
    private LocalDate createdAt;

}