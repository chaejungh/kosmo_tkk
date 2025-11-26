package com.smu.tkk.naver;

import lombok.Getter;
import lombok.Setter;

import java.util.List;

@Getter
@Setter
public class NaverLocalSearchResponse {
    private String lastBuildDate;
    private int total;
    private int start;
    private int display;
    private List<NaverLocalItem> items;
}
