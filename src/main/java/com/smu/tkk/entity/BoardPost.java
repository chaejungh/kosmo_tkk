package com.smu.tkk.entity;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;
import org.hibernate.annotations.ColumnDefault;

import java.time.LocalDate;
import java.util.LinkedHashSet;
import java.util.Set;

@Getter
@Setter
@Entity
@Table(name = "BOARD_POST")
public class BoardPost {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "POST_ID", nullable = false)
    private Long id;

    @Column(name = "CATEGORY_ID", nullable = false)
    private Long categoryId;

    @Column(name = "MEMBER_ID", nullable = false)
    private Long memberId;

    @Column(name = "TITLE", nullable = false, length = 200)
    private String title;

    @Lob
    @Column(name = "CONTENT", nullable = false)
    private String content;

    @Column(name = "THUMBNAIL_URL")
    private String thumbnailUrl;

    @ColumnDefault("0")
    @Column(name = "VIEW_COUNT")
    private Long viewCount;

    @ColumnDefault("0")
    @Column(name = "LIKE_COUNT")
    private Long likeCount;

    @ColumnDefault("0")
    @Column(name = "COMMENT_COUNT")
    private Long commentCount;

    @ColumnDefault("SYSDATE")
    @Column(name = "CREATED_AT")
    private LocalDate createdAt;

    @Column(name = "UPDATED_AT")
    private LocalDate updatedAt;

    @ColumnDefault("'N'")
    @Column(name = "DELETED_YN")
    private Boolean deletedYn;

    @OneToMany
    @JoinColumn
    private Set<BoardBookmark> boardBookmarks = new LinkedHashSet<>();

    @OneToMany
    @JoinColumn
    private Set<BoardComment> boardComments = new LinkedHashSet<>();

    @OneToMany
    @JoinColumn
    private Set<BoardLike> boardLikes = new LinkedHashSet<>();

    @OneToMany
    @JoinColumn
    private Set<BoardPostImage> boardPostImages = new LinkedHashSet<>();

    @OneToMany
    @JoinColumn
    private Set<BoardPostTag> boardPostTags = new LinkedHashSet<>();

    @OneToMany
    @JoinColumn
    private Set<BoardReport> boardReports = new LinkedHashSet<>();

}