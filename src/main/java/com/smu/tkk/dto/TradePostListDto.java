package com.smu.tkk.dto;

import com.smu.tkk.entity.TradePost;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class TradePostListDto {

    private Long id;
    private String title;
    private String region;

    // 썸네일 / 시간 / 가격
    private String thumbnailUrl;
    private String timeAgo;
    private String priceText;

    // 🔥 채팅 수 / 찜 수
    private long chatCount;
    private long likeCount;   // 북마크(하트) 개수

    // 🔥 새로 추가: 조회수
    private long viewCount;

    public TradePostListDto() {
    }

    // 예전에 쓰던 생성자 (혹시 다른 곳에서 쓰고 있으면 그대로 유지)
    public TradePostListDto(TradePost post, String thumbnailUrl, String timeAgo) {
        this.id = post.getId();
        this.title = post.getTitle();
        this.region = post.getRegion();
        this.thumbnailUrl = thumbnailUrl;
        this.timeAgo = timeAgo;

        if (post.getPrice() != null) {
            this.priceText = String.format("%,d원", post.getPrice());
        } else {
            this.priceText = "가격문의";
        }

        // 🔥 생성자에서도 조회수 세팅 (필요하면)
        // this.viewCount = post.getViewCount() != null ? post.getViewCount() : 0L;
    }
}