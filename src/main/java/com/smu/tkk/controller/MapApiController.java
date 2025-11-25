package com.smu.tkk.controller;

import com.smu.tkk.dto.PlaceDto;
import com.smu.tkk.entity.Store;
import com.smu.tkk.repository.StoreRepository;
import com.smu.tkk.service.NaverLocalSearchService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.List;

@RestController
@RequiredArgsConstructor
@RequestMapping("/api/map")
public class MapApiController {

    private final NaverLocalSearchService naverLocalSearchService;
    private final StoreRepository storeRepository;

    // /api/map/places?query=홍대&limit=5
    @GetMapping("/places")
    public List<PlaceDto> searchPlaces(
            @RequestParam("query") String query,
            @RequestParam(value = "limit", defaultValue = "5") int limit
    ) {

        // 1) 우리 DB 매장 검색 (이름/지역/주소에서 부분 일치)
        List<PlaceDto> dbPlaces = storeRepository
                .findTop20ByNameContainingIgnoreCaseOrRegionNameContainingIgnoreCaseOrAddressContainingIgnoreCase(
                        query, query, query
                )
                .stream()
                .map(this::toStorePlaceDto)
                .toList();

        // 2) 네이버 지역 검색
        List<PlaceDto> naverPlaces = naverLocalSearchService.searchPlaces(query, limit);

        // 3) 합쳐서 반환 (먼저 우리 DB, 그 다음 네이버)
        List<PlaceDto> result = new ArrayList<>();
        result.addAll(dbPlaces);
        result.addAll(naverPlaces);
        return result;
    }

    // Store 엔티티 -> PlaceDto 로 변환
    private PlaceDto toStorePlaceDto(Store s) {
        Double lat = null;
        Double lng = null;

        // BigDecimal -> Double 로 변환 (PlaceDto 가 Double lat/lng 를 받으니까)
        if (s.getLatitude() != null) {
            lat = s.getLatitude().doubleValue();
        }
        if (s.getLongitude() != null) {
            lng = s.getLongitude().doubleValue();
        }

        return PlaceDto.builder()
                .id(s.getId())
                .name(s.getName())
                .category("더쿠쿠 매장")              // 필요하면 다른 값으로 바꿔도 됨
                .address(s.getAddress())
                .roadAddress(s.getAddress())
                .tel(s.getPhone())                  // ★ getPhone() 으로 수정
                .lat(lat)                           // ★ Double 타입
                .lng(lng)
                .source("STORE_DB")                 // 프론트에서 출처 구분용으로 사용
                .build();
    }
}
