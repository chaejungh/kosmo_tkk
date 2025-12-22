package com.smu.tkk.dto;

import com.smu.tkk.entity.TradePost;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class TradePostListDto {

    private Long id;
    private Long sellerId;

    private String title;
    private String region;

    // 썸네일 / 시간 / 가격
    private String thumbnailUrl;
    private String timeAgo;
    private String priceText;

    // 채팅 수 / 찜 수 / 조회수
    private long chatCount;
    private long likeCount;
    private long viewCount;

    public TradePostListDto() {}

    // ✅ 리스트용 생성자 (서비스에서 thumb/timeAgo 넣어줌)
    public TradePostListDto(TradePost post, String thumbnailUrl, String timeAgo) {
        this.id = post.getId();
        this.title = post.getTitle();
        this.region = post.getRegion();

        this.thumbnailUrl = thumbnailUrl;
        this.timeAgo = timeAgo;

        // sellerId 안전하게 세팅
        this.sellerId = (post.getSeller() != null ? post.getSeller().getId() : post.getSellerId());

        if (post.getPrice() != null) this.priceText = String.format("%,d원", post.getPrice());
        else this.priceText = "가격문의";

        // 엔티티에 있으면 기본값 세팅(찜수는 아래에서 repository count로 덮어씀)
        try { this.viewCount = post.getViewCount(); } catch (Exception ignored) {}
        try { this.likeCount = post.getLikeCount(); } catch (Exception ignored) {}
    }
}