package com.smu.tkk.entity;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;
import org.hibernate.annotations.ColumnDefault;

import java.time.LocalDate;

@Getter
@Setter
@Entity
@Table(name = "BOARD_REPORT")
public class BoardReport {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "REPORT_ID", nullable = false)
    private Long id;

    @Column(name = "POST_ID")
    private Long postId;

    @Column(name = "COMMENT_ID")
    private Long commentId;

    @Column(name = "REPORTER_ID", nullable = false)
    private Long reporterId;

    @Column(name = "REASON")
    private String reason;

    @ColumnDefault("'WAIT'")
    @Column(name = "STATUS", length = 20)
    private String status;

    @ColumnDefault("SYSDATE")
    @Column(name = "CREATED_AT")
    private LocalDate createdAt;

}