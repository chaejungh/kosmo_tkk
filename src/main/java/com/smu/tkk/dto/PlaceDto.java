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

    private String name;
    private String category;
    private String address;
    private String roadAddress;
    private String tel;

    // 우리 DB(STORE)에 저장된 위도/경도 (WGS84)
    private Double lat;
    private Double lng;

    // 네이버 지역검색에서 오는 TM128 좌표
    private Double mapx;
    private Double mapy;

    // 어디서 온 데이터인지 (DB / NAVER)
    private String source;   // "DB" 또는 "NAVER"
}
