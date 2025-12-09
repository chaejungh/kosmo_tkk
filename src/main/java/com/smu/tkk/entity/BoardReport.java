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

    // 신고 대상 게시글
    @ManyToOne(fetch = FetchType.LAZY)
    @OnDelete(action = OnDeleteAction.CASCADE)
    @JoinColumn(name = "POST_ID")
    @ToString.Exclude
    @JsonIgnore
    private BoardPost post;

    // 신고 대상 댓글 (있으면 댓글 신고, 없으면 게시글 신고로 봄)
    @ManyToOne(fetch = FetchType.LAZY)
    @OnDelete(action = OnDeleteAction.CASCADE)
    @JoinColumn(name = "COMMENT_ID")
    @ToString.Exclude
    @JsonIgnore
    private BoardComment comment;

    // 신고자 ID (FK 값)
    @Column(name = "REPORTER_ID", nullable = false)
    private Long reporterId;

    // 신고자 엔티티
    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @OnDelete(action = OnDeleteAction.CASCADE)
    @JoinColumn(
            name = "REPORTER_ID",
            referencedColumnName = "MEMBER_ID",
            insertable = false,
            updatable = false
    )
    @ToString.Exclude
    @JsonIgnore
    private Member reporter;

    // 신고 사유
    @Column(name = "REASON")
    private String reason;

    // WAIT / DONE / BLOCK 등
    @ColumnDefault("'WAIT'")
    @Column(name = "STATUS", length = 20)
    private String status;

    // 신고 일시
    @ColumnDefault("SYSDATE")
    @Column(name = "CREATED_AT")
    private LocalDate createdAt;

    /* ===== 편의용 필드/메서드 ===== */

    /** 댓글 신고인지 게시글 신고인지 표시용 (템플릿에서 사용) */
    @Transient
    public String getTargetType() {
        return (comment != null) ? "댓글" : "게시글";
    }

    /** 신고 대상 ID (댓글이면 comment.id, 아니면 post.id) */
    @Transient
    public Long getTargetId() {
        if (comment != null) {
            return comment.getId();
        }
        if (post != null) {
            return post.getId();
        }
        return null;
    }
}
