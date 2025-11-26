package com.smu.tkk.dto;

import lombok.*;

@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class PlaceDto {

    // 우리 DB 매장일 때만 채우는 값 (STORE_ID)
    private Long storeId;

    private String name;
    private String category;
    private String address;
    private String roadAddress;
    private String tel;

    // WGS84 위/경도 (우리 DB 매장은 여기 채움)
    private Double lat;
    private Double lng;

    // 네이버 지역검색에서 오는 TM128 좌표 (실제 매장용)
    private Double mapx;
    private Double mapy;

    // "DB" / "NAVER"
    private String source;
}
