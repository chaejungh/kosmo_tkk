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
@Table(name = "BOARD_POST")
public class BoardPost {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "POST_ID", nullable = false)
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @OnDelete(action = OnDeleteAction.RESTRICT)
    @JoinColumn(name = "CATEGORY_ID", nullable = false)
    @ToString.Exclude
    @JsonIgnore
    private BoardCategory category;

    @Column(name = "MEMBER_ID", nullable = false)
    private Long memberId;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @OnDelete(action = OnDeleteAction.RESTRICT)
    @JoinColumn(name = "MEMBER_ID", insertable = false, updatable = false)
    @ToString.Exclude
    @JsonIgnore
    private Member member;

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
    private String deletedYn;


    @OneToMany(mappedBy = "post")
    @ToString.Exclude
    @JsonIgnore
    private Set<BoardBookmark> boardBookmarks = new LinkedHashSet<>();

    @OneToMany(mappedBy = "post")
    @ToString.Exclude
    @JsonIgnore
    private Set<BoardComment> boardComments = new LinkedHashSet<>();

    @OneToMany(mappedBy = "post")
    @ToString.Exclude
    @JsonIgnore
    private Set<BoardLike> boardLikes = new LinkedHashSet<>();

    @OneToMany(mappedBy = "post")
    @ToString.Exclude
    @JsonIgnore
    private Set<BoardPostImage> boardPostImages = new LinkedHashSet<>();

    @OneToMany(mappedBy = "post")
    @ToString.Exclude
    @JsonIgnore
    private Set<BoardPostTag> boardPostTags = new LinkedHashSet<>();

    @OneToMany(mappedBy = "post")
    @ToString.Exclude
    @JsonIgnore
    private Set<BoardReport> boardReports = new LinkedHashSet<>();

}