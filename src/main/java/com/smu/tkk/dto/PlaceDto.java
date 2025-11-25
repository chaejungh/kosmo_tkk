// src/main/java/com/smu/tkk/dto/PlaceDto.java
package com.smu.tkk.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class PlaceDto {

    // 우리 DB 매장일 때만 들어가는 값 (nullable)
    private Long id;

    private String name;
    private String category;
    private String address;
    private String roadAddress;
    private String tel;

    // 우리 DB 더미데이터용 (위도/경도)
    private Double lat;
    private Double lng;

    // 네이버 지역검색용 (TM128 좌표)
    private Double mapx;
    private Double mapy;

    // "STORE" (우리 더쿠쿠 매장) / "NAVER" (네이버 실제 상점)
    private String source;
}
