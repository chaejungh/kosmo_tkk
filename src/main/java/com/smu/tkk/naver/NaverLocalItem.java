// src/main/java/com/smu/tkk/naver/NaverLocalItem.java
package com.smu.tkk.naver;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Data;

@Data
public class NaverLocalItem {
    private String title;
    private String link;
    private String category;
    private String description;
    private String telephone;
    private String address;

    @JsonProperty("roadAddress")
    private String roadAddress;

    private String mapx; // TM128 X
    private String mapy; // TM128 Y
}
