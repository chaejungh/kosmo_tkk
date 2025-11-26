package com.smu.tkk.service;

import com.smu.tkk.dto.PlaceDto;

import java.util.List;

public interface NaverLocalSearchService {
    List<PlaceDto> searchPlaces(String query, int limit);
}
