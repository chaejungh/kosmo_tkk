package com.smu.tkk.service;

import com.smu.tkk.dto.PlaceDto;

import java.util.List;

public interface NaverLocalSearchService {

    /**
     * 네이버 지역 검색 API로 실제 매장 검색
     * @param query 키워드(예: "홍대", "홍대 피규어샵")
     * @param limit 최대 결과 개수(1~5)
     */
    List<PlaceDto> searchPlaces(String query, int limit);
}
