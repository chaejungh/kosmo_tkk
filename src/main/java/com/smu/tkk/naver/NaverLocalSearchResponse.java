// src/main/java/com/smu/tkk/naver/NaverLocalSearchResponse.java
package com.smu.tkk.naver;

import lombok.Data;

import java.util.List;

@Data
public class NaverLocalSearchResponse {
    private String lastBuildDate;
    private int total;
    private int start;
    private int display;
    private List<NaverLocalItem> items;
}
