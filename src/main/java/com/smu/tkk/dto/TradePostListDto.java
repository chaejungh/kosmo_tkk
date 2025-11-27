package com.smu.tkk.dto;

import com.smu.tkk.entity.TradePost;
import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class TradePostListDto {

    private Long id;
    private String title;
    private String region;

    public TradePostListDto() {
    }

    private String thumbnailUrl;
    private String timeAgo;
    private String priceText;

    public TradePostListDto(TradePost post, String thumbnailUrl, String timeAgo) {
        this.id = post.getId();
        this.title = post.getTitle();
        this.region = post.getRegion();
        this.thumbnailUrl = thumbnailUrl;
        this.timeAgo = timeAgo;

        // 가격 포맷 → 10,000원 형식
        if (post.getPrice() != null) {
            this.priceText = String.format("%,d원", post.getPrice());
        } else {
            this.priceText = "가격문의";
        }
    }
}