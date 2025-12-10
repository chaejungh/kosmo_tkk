package com.smu.tkk.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.*;
import jakarta.validation.constraints.Size;
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

    /* ----------------------------- ⭐ 추가된 필드 ----------------------------- */

    @Column(name = "GENDER", nullable = false, length = 10)
    private String gender;     // 남자 / 여자

    @Column(name = "NATIONALITY", nullable = false, length = 10)
    private String nationality; // 내국인 / 외국인

    /* ------------------------------------------------------------------------- */

    @ColumnDefault("SYSDATE")
    @Column(name = "CREATED_AT")
    private LocalDate createdAt;

    @Column(name = "UPDATED_AT")
    private LocalDate updatedAt;

    @ColumnDefault("'N'")
    @Column(name = "DELETED_YN")
    private char deletedYn;

    /* ----------------------------- 연관관계 ----------------------------- */

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

//    @OneToMany(mappedBy = "member")
//    @ToString.Exclude
//    @JsonIgnore
//    private Set<TradeChatRoom> tradeChatRooms = new LinkedHashSet<>();
    @OneToMany(mappedBy = "seller")
    @ToString.Exclude
    @JsonIgnore
    private Set<TradeChatRoom> sellerTradeChatRooms = new LinkedHashSet<>();

    @OneToMany(mappedBy = "buyer")
    @ToString.Exclude
    @JsonIgnore
    private Set<TradeChatRoom> buyerTradeChatRooms = new LinkedHashSet<>();

    @OneToMany(mappedBy = "seller")
    @ToString.Exclude
    @JsonIgnore
    private Set<TradePost> tradePosts = new LinkedHashSet<>();

    @Size(max = 10)
    @Column(name = "VERIFY_CODE", length = 10)
    private String verifyCode;

    @PrePersist
    public void onCreate() {
        if (this.createdAt == null) {
            this.createdAt = LocalDate.now();
        }
    }
}
//public class Member {
//
//    @Id
//    @GeneratedValue(strategy = GenerationType.IDENTITY)
//    @Column(name = "MEMBER_ID", nullable = false)
//    private Long id;
//
//    @Column(name = "LOGIN_ID", nullable = false, length = 50)
//    private String loginId;
//
//    @Column(name = "LOGIN_PW", nullable = false)
//    private String loginPw;
//
//    @Column(name = "NICKNAME", nullable = false, length = 50)
//    private String nickname;
//
//    @Column(name = "PROFILE_IMAGE_URL")
//    private String profileImageUrl;
//
//    @Column(name = "INTRO")
//    private String intro;
//
//    @ColumnDefault("1")
//    @Column(name = "USER_LEVEL")
//    private Long userLevel;
//
//    @Column(name = "EMAIL", length = 100)
//    private String email;
//
//    /* ----------------------------- ⭐ 추가된 필드 ----------------------------- */
//
//    @Column(name = "GENDER", nullable = false, length = 10)
//    private String gender;     // 남자 / 여자
//
//    @Column(name = "NATIONALITY", nullable = false, length = 10)
//    private String nationality; // 내국인 / 외국인
//
//    /* ------------------------------------------------------------------------- */
//
//    @ColumnDefault("SYSDATE")
//    @Column(name = "CREATED_AT")
//    private LocalDate createdAt;
//
//    @Column(name = "UPDATED_AT")
//    private LocalDate updatedAt;
//
//    @ColumnDefault("'N'")
//    @Column(name = "DELETED_YN")
//    private Boolean deletedYn;
//
//    /* ----------------------------- 연관관계 ----------------------------- */
//
//    @OneToMany(mappedBy = "member")
//    @ToString.Exclude
//    @JsonIgnore
//    private Set<BoardBookmark> boardBookmarks = new LinkedHashSet<>();
//
//    @OneToMany(mappedBy = "member")
//    @ToString.Exclude
//    @JsonIgnore
//    private Set<BoardComment> boardComments = new LinkedHashSet<>();
//
//    @OneToMany(mappedBy = "member")
//    @ToString.Exclude
//    @JsonIgnore
//    private Set<BoardLike> boardLikes = new LinkedHashSet<>();
//
//    @OneToMany(mappedBy = "member")
//    @ToString.Exclude
//    @JsonIgnore
//    private Set<BoardPost> boardPosts = new LinkedHashSet<>();
//
//    @OneToMany(mappedBy = "reporter")
//    @ToString.Exclude
//    @JsonIgnore
//    private Set<BoardReport> boardReports = new LinkedHashSet<>();
//
//    @OneToMany(mappedBy = "member")
//    @ToString.Exclude
//    @JsonIgnore
//    private Set<Inquiry> inquiries = new LinkedHashSet<>();
//
//    @OneToOne(mappedBy = "member")
//    @ToString.Exclude
//    @JsonIgnore
//    private MemberNotificationSetting memberNotificationSetting;
//
//    @OneToMany(mappedBy = "member")
//    @ToString.Exclude
//    @JsonIgnore
//    private Set<Notification> notifications = new LinkedHashSet<>();
//
//    @OneToMany(mappedBy = "member")
//    @ToString.Exclude
//    @JsonIgnore
//    private Set<PopupBookmark> popupBookmarks = new LinkedHashSet<>();
//
//    @OneToMany(mappedBy = "member")
//    @ToString.Exclude
//    @JsonIgnore
//    private Set<SearchLog> searchLogs = new LinkedHashSet<>();
//
//    @OneToMany(mappedBy = "member")
//    @ToString.Exclude
//    @JsonIgnore
//    private Set<StoreBookmark> storeBookmarks = new LinkedHashSet<>();
//
//    @OneToMany(mappedBy = "member")
//    @ToString.Exclude
//    @JsonIgnore
//    private Set<TradeBookmark> tradeBookmarks = new LinkedHashSet<>();
//
//    @OneToMany(mappedBy = "sender")
//    @ToString.Exclude
//    @JsonIgnore
//    private Set<TradeChatMessage> tradeChatMessages = new LinkedHashSet<>();
//
/// /    @OneToMany(mappedBy = "member")
/// /    @ToString.Exclude
/// /    @JsonIgnore
/// /    private Set<TradeChatRoom> tradeChatRooms = new LinkedHashSet<>();
//    @OneToMany(mappedBy = "seller")
//    @ToString.Exclude
//    @JsonIgnore
//    private Set<TradeChatRoom> sellerTradeChatRooms = new LinkedHashSet<>();
//
//    @OneToMany(mappedBy = "buyer")
//    @ToString.Exclude
//    @JsonIgnore
//    private Set<TradeChatRoom> buyerTradeChatRooms = new LinkedHashSet<>();
//
//    @OneToMany(mappedBy = "seller")
//    @ToString.Exclude
//    @JsonIgnore
//    private Set<TradePost> tradePosts = new LinkedHashSet<>();
//
//    @Size(max = 10)
//    @Column(name = "VERIFY_CODE", length = 10)
//    private String verifyCode;
//
//    @PrePersist
//    public void onCreate() {
//        if (this.createdAt == null) {
//            this.createdAt = LocalDate.now();
//        }
//    }
//} ..verifyCode 인증코드 추가했어. 레디스 없이 회원가입하면 먼저 LEVEL 0 으로 등록하고 이메일 인증하면 level을 2로 변경할거야. 인증 서비스 다시 만들어줘