package com.smu.tkk.naver;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class NaverLocalItem {
    private String title;
    private String link;
    private String category;
    private String description;
    private String telephone;
    private String address;
    private String roadAddress;
    private String mapx;   // 문자열로 옴
    private String mapy;
}
