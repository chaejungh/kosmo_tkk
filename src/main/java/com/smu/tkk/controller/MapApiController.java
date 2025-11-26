package com.smu.tkk.controller;

import com.smu.tkk.dto.PlaceDto;
import com.smu.tkk.entity.Store;
import com.smu.tkk.repository.StoreRepository;
import com.smu.tkk.service.NaverLocalSearchService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

@RestController
@RequiredArgsConstructor
@RequestMapping("/api/map")   // 프론트에서 /api/map/places 로 호출
public class MapApiController {

    private final NaverLocalSearchService naverLocalSearchService; // 인터페이스 주입
    private final StoreRepository storeRepository;

    /**
     * 통합 검색
     *  - 1) 우리 DB 매장 (STORE)
     *  - 2) 네이버 지역검색 (NAVER)
     */
    @GetMapping("/places")
    public List<PlaceDto> searchPlaces(@RequestParam("query") String query,
                                       @RequestParam(value = "limit", defaultValue = "5") int limit) {

        // 1) 네이버 지역 검색
        List<PlaceDto> naverPlaces = naverLocalSearchService.searchPlaces(query, limit);

        // 2) 우리 DB 매장 검색 (이름 / 주소에 query 포함)
        List<Store> dbStores = storeRepository
                .findTop20ByNameContainingIgnoreCaseOrAddressContainingIgnoreCase(query, query);

        List<PlaceDto> result = new ArrayList<>();

        // DB 결과 먼저
        for (Store s : dbStores) {
            result.add(toStorePlaceDto(s));
        }

        // 네이버 결과 뒤에 붙이기
        result.addAll(naverPlaces);

        return result;
    }

    /**
     * Store 엔티티 -> PlaceDto 변환
     *  - latitude / longitude (BigDecimal) -> Double 로 변환
     *  - source = "STORE"
     */
    private PlaceDto toStorePlaceDto(Store s) {
        Double lat = null;
        Double lng = null;

        if (s.getLatitude() != null) {
            lat = s.getLatitude().doubleValue();
        }
        if (s.getLongitude() != null) {
            lng = s.getLongitude().doubleValue();
        }

        return PlaceDto.builder()
                .storeId(s.getId())
                .name(s.getName())
                .category("STORE")
                .address(s.getAddress())
                .roadAddress(s.getAddress())
                .tel(s.getPhone())
                .lat(lat)       // 우리 DB 매장 좌표 (위도/경도)
                .lng(lng)
                .source("STORE")
                .build();
    }
}
