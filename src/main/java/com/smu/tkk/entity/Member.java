package com.smu.tkk.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.hibernate.annotations.ColumnDefault;

import java.time.LocalDate;
import java.util.LinkedHashSet;
import java.util.Set;

@Getter
@Setter
@Entity
@ToString
@Table(name = "MEMBER")
public class Member {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "MEMBER_ID", nullable = false)
    private Long id;

    @Column(name = "LOGIN_ID", nullable = false, length = 50)
    private String loginId;

    @Column(name = "LOGIN_PW", nullable = false)
    private String loginPw;

    @Column(name = "NICKNAME", nullable = false, length = 50)
    private String nickname;

    @Column(name = "PROFILE_IMAGE_URL")
    private String profileImageUrl;

    @Column(name = "INTRO")
    private String intro;

    @ColumnDefault("1")
    @Column(name = "USER_LEVEL")
    private Long userLevel;

    @Column(name = "EMAIL", length = 100)
    private String email;

    @ColumnDefault("SYSDATE")
    @Column(name = "CREATED_AT")
    private LocalDate createdAt;

    @Column(name = "UPDATED_AT")
    private LocalDate updatedAt;

    @ColumnDefault("'N'                          -- 탈퇴 여부 (Y/N)")
    @Column(name = "DELETED_YN")
    private Boolean deletedYn;

    @OneToMany(mappedBy = "member")
    @ToString.Exclude
    @JsonIgnore
    private Set<BoardBookmark> boardBookmarks = new LinkedHashSet<>();

    @OneToMany(mappedBy = "member")
    @ToString.Exclude
    @JsonIgnore
    private Set<BoardComment> boardComments = new LinkedHashSet<>();

    @OneToMany(mappedBy = "member")
    @ToString.Exclude
    @JsonIgnore
    private Set<BoardLike> boardLikes = new LinkedHashSet<>();

    @OneToMany(mappedBy = "member")
    @ToString.Exclude
    @JsonIgnore
    private Set<BoardPost> boardPosts = new LinkedHashSet<>();

    @OneToMany(mappedBy = "reporter")
    @ToString.Exclude
    @JsonIgnore
    private Set<BoardReport> boardReports = new LinkedHashSet<>();

    @OneToMany(mappedBy = "member")
    @ToString.Exclude
    @JsonIgnore
    private Set<Inquiry> inquiries = new LinkedHashSet<>();

    @OneToOne(mappedBy = "member")
    @ToString.Exclude
    @JsonIgnore
    private MemberNotificationSetting memberNotificationSetting;

    @OneToMany(mappedBy = "member")
    @ToString.Exclude
    @JsonIgnore
    private Set<Notification> notifications = new LinkedHashSet<>();

    @OneToMany(mappedBy = "member")
    @ToString.Exclude
    @JsonIgnore
    private Set<PopupBookmark> popupBookmarks = new LinkedHashSet<>();

    @OneToMany(mappedBy = "member")
    @ToString.Exclude
    @JsonIgnore
    private Set<SearchLog> searchLogs = new LinkedHashSet<>();

    @OneToMany(mappedBy = "member")
    @ToString.Exclude
    @JsonIgnore
    private Set<StoreBookmark> storeBookmarks = new LinkedHashSet<>();

    @OneToMany(mappedBy = "member")
    @ToString.Exclude
    @JsonIgnore
    private Set<TradeBookmark> tradeBookmarks = new LinkedHashSet<>();

    @OneToMany(mappedBy = "sender")
    @ToString.Exclude
    @JsonIgnore
    private Set<TradeChatMessage> tradeChatMessages = new LinkedHashSet<>();

    @OneToMany(mappedBy = "member")
    @ToString.Exclude
    @JsonIgnore
    private Set<TradeChatRoom> tradeChatRooms = new LinkedHashSet<>();

    @OneToMany(mappedBy = "seller")
    @ToString.Exclude
    @JsonIgnore
    private Set<TradePost> tradePosts = new LinkedHashSet<>();

}