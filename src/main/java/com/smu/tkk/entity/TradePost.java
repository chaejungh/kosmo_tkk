package com.smu.tkk.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.hibernate.annotations.ColumnDefault;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;
import org.hibernate.annotations.UpdateTimestamp;

import java.time.LocalDateTime;
import java.util.LinkedHashSet;
import java.util.Set;

@Getter
@Setter
@Entity
@ToString
@Table(name = "TRADE_POST")
public class TradePost {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "TRADE_ID", nullable = false)
    private Long id;

    @Column(name = "SELLER_ID", nullable = false)
    private Long sellerId;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @OnDelete(action = OnDeleteAction.CASCADE)
    @JoinColumn(name = "SELLER_ID", insertable = false, updatable = false)
    @ToString.Exclude
    @JsonIgnore
    private Member seller;

    @Column(name = "TITLE", nullable = false, length = 200)
    private String title;

    @Column(name = "CONTENT", nullable = false)
    private String content;

    @Column(name = "GOODS_NAME", nullable = false, length = 150)
    private String goodsName;

    @Column(name = "WORK_NAME", length = 100)
    private String workName;

    @Column(name = "CHARACTER_NAME", length = 100)
    private String characterName;

    @Column(name = "CATEGORY", length = 30)
    private String category;

    @Column(name = "PRICE")
    private Long price;

    @Column(name = "TRADE_TYPE", nullable = false, length = 20)
    private String tradeType;

    @Column(name = "TRADE_METHOD", nullable = false, length = 20)
    private String tradeMethod;

    @Column(name = "REGION", length = 100)
    private String region;

    @ColumnDefault("'ON_SALE'")
    @Column(name = "STATUS", length = 20)
    private String status;

    @ColumnDefault("0")
    @Column(name = "VIEW_COUNT")
    private Long viewCount;

    @ColumnDefault("0")
    @Column(name = "LIKE_COUNT")
    private Long likeCount;

    @CreationTimestamp
    @ColumnDefault("SYSDATE")
    @Column(name = "CREATED_AT", updatable = false)
    private LocalDateTime createdAt;

    @UpdateTimestamp
    @Column(name = "UPDATED_AT")
    private LocalDateTime updatedAt;

    /** 🔥 소프트 삭제 플래그 : 'Y' / 'N' 문자열 */
    @ColumnDefault("'N'")
    @Column(name = "DELETED_YN", length = 1)
    private String deletedYn;

    @OneToMany(mappedBy = "trade")
    @ToString.Exclude
    @JsonIgnore
    private Set<TradeBookmark> tradeBookmarks = new LinkedHashSet<>();

    @OneToMany(mappedBy = "trade")
    @ToString.Exclude
    @JsonIgnore
    private Set<TradeChatRoom> tradeChatRooms = new LinkedHashSet<>();

    @OneToMany(mappedBy = "trade")
    @ToString.Exclude
    @JsonIgnore
    @OrderBy("sortOrder ASC")//12-17 수정
    private Set<TradePostImage> tradePostImages = new LinkedHashSet<>();


    @Transient
    public String getThumbnailUrl() {//12-17 수정
        if (tradePostImages == null || tradePostImages.isEmpty()) return null;
        // @OrderBy 덕분에 iterator().next()가 대표이미지(가장 앞) 역할
        return tradePostImages.iterator().next().getImageUrl();
    }
}
