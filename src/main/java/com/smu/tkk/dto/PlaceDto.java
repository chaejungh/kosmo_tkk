// src/main/java/com/smu/tkk/dto/PlaceDto.java
package com.smu.tkk.dto;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class PlaceDto {
    private String name;        // 업체명
    private String category;    // 카테고리
    private String address;     // 지번 주소
    private String roadAddress; // 도로명 주소
    private String tel;         // 전화번호
    private double mapx;        // TM128 X
    private double mapy;        // TM128 Y
}
