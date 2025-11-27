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

    // 우리 DB 매장용 (WGS84 위경도)
    private Double lat;
    private Double lng;

    // 네이버 지역검색에서 오는 TM128 좌표
    private Double mapx;
    private Double mapy;

    // "STORE" / "NAVER" 구분
    private String source;
}
