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
import java.util.LinkedHashSet;
import java.util.Set;

@Getter
@Setter
@Entity
@ToString
@Table(name = "BOARD_COMMENT")
public class BoardComment {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "COMMENT_ID", nullable = false)
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @OnDelete(action = OnDeleteAction.RESTRICT)
    @JoinColumn(name = "POST_ID", nullable = false)
    @ToString.Exclude
    @JsonIgnore
    private BoardPost post;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @OnDelete(action = OnDeleteAction.RESTRICT)
    @JoinColumn(name = "MEMBER_ID", nullable = false)
    @ToString.Exclude
    @JsonIgnore
    private Member member;

    @ManyToOne(fetch = FetchType.LAZY)
    @OnDelete(action = OnDeleteAction.RESTRICT)
    @JoinColumn(name = "PARENT_COMMENT_ID")
    @ToString.Exclude
    @JsonIgnore
    private BoardComment parentComment;

    @Column(name = "CONTENT", nullable = false, length = 1000)
    private String content;

    @ColumnDefault("0")
    @Column(name = "LIKE_COUNT")
    private Long likeCount;

    @ColumnDefault("SYSDATE")
    @Column(name = "CREATED_AT")
    private LocalDate createdAt;

    @Column(name = "UPDATED_AT")
    private LocalDate updatedAt;

    @ColumnDefault("'N'")
    @Column(name = "DELETED_YN")
    private Boolean deletedYn;

    @OneToMany(mappedBy = "parentComment")
    @ToString.Exclude
    @JsonIgnore
    private Set<BoardComment> boardComments = new LinkedHashSet<>();

    @OneToMany(mappedBy = "comment")
    @ToString.Exclude
    @JsonIgnore
    private Set<BoardReport> boardReports = new LinkedHashSet<>();

}