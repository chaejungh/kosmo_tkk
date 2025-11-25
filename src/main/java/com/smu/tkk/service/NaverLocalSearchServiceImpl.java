package com.smu.tkk.service;

import com.smu.tkk.dto.PlaceDto;
import com.smu.tkk.entity.Store;
import com.smu.tkk.naver.NaverLocalItem;
import com.smu.tkk.naver.NaverLocalSearchResponse;
import com.smu.tkk.repository.StoreRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.*;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriComponentsBuilder;
import java.net.URI;
import java.nio.charset.StandardCharsets;
import java.util.*;

@Service
@RequiredArgsConstructor
@Slf4j
public class NaverLocalSearchServiceImpl implements NaverLocalSearchService {

    @Value("${naver.search.client-id}")
    private String clientId;

    @Value("${naver.search.client-secret}")
    private String clientSecret;

    private final StoreRepository storeRepository;

    // 간단히 new 로 사용
    private final RestTemplate restTemplate = new RestTemplate();

    @Override
    public List<PlaceDto> searchPlaces(String query, int limit) {
        if (query == null || query.isBlank()) {
            return Collections.emptyList();
        }

        String keyword = query.trim();
        int size = Math.max(1, Math.min(limit, 5));  // 네이버 지역검색 최대 5

        // 1) 우리 DB 검색
        List<PlaceDto> dbPlaces = searchFromDb(keyword);

        // 2) 네이버 지역검색 API
        List<PlaceDto> apiPlaces = searchFromNaver(keyword, size);

        // 3) 이름+주소 기준으로 중복 제거하면서 합치기
        Map<String, PlaceDto> merged = new LinkedHashMap<>();

        for (PlaceDto p : dbPlaces) {
            merged.put(keyOf(p), p);
        }
        for (PlaceDto p : apiPlaces) {
            merged.putIfAbsent(keyOf(p), p);
        }

        return new ArrayList<>(merged.values());
    }

    private String keyOf(PlaceDto p) {
        String n = p.getName() == null ? "" : p.getName();
        String addr = p.getRoadAddress() != null ? p.getRoadAddress()
                : (p.getAddress() != null ? p.getAddress() : "");
        return n + "|" + addr;
    }

    private List<PlaceDto> searchFromDb(String keyword) {
        List<Store> stores = storeRepository
                .findTop20ByNameContainingIgnoreCaseOrRegionNameContainingIgnoreCase(keyword, keyword);

        return stores.stream()
                .map(this::toDtoFromStore)
                .toList();
    }

    private List<PlaceDto> searchFromNaver(String keyword, int limit) {
        // "홍대" -> "홍대 애니 굿즈샵" 같은 식으로 자동 보정
        String realQuery = keyword.contains("굿즈")
                ? keyword
                : keyword + " 애니 굿즈샵";

        URI uri = UriComponentsBuilder
                .fromUriString("https://openapi.naver.com")
                .path("/v1/search/local.json")
                .queryParam("query", realQuery)
                .queryParam("display", limit)
                .queryParam("start", 1)
                .queryParam("sort", "random")        // random / comment
                .encode(StandardCharsets.UTF_8)
                .build()
                .toUri();

        HttpHeaders headers = new HttpHeaders();
        headers.set("X-Naver-Client-Id", clientId);
        headers.set("X-Naver-Client-Secret", clientSecret);

        HttpEntity<Void> request = new HttpEntity<>(headers);

        ResponseEntity<NaverLocalSearchResponse> response =
                restTemplate.exchange(uri, HttpMethod.GET, request, NaverLocalSearchResponse.class);

        NaverLocalSearchResponse body = response.getBody();
        if (body == null || body.getItems() == null) {
            return Collections.emptyList();
        }

        return body.getItems().stream()
                .map(this::toDtoFromNaver)
                .toList();
    }

    // --- 매핑 도우미 ---

    private PlaceDto toDtoFromStore(Store s) {
        Double lat = null;
        Double lng = null;

        if (s.getLatitude() != null) {
            lat = s.getLatitude().doubleValue();      // ★ BigDecimal → Double
        }
        if (s.getLongitude() != null) {
            lng = s.getLongitude().doubleValue();     // ★ BigDecimal → Double
        }

        return PlaceDto.builder()
                .name(s.getName())
                .category("더쿠쿠 매장")
                .address(s.getAddress())
                .roadAddress(s.getAddress())
                .tel(s.getPhone())
                .lat(lat)
                .lng(lng)
                .source("DB")
                .build();
    }

    private PlaceDto toDtoFromNaver(NaverLocalItem item) {
        Double mapx = null;
        Double mapy = null;
        try {
            if (item.getMapx() != null) mapx = Double.valueOf(item.getMapx());
            if (item.getMapy() != null) mapy = Double.valueOf(item.getMapy());
        } catch (NumberFormatException ignore) { }

        return PlaceDto.builder()
                .name(stripTags(item.getTitle()))
                .category(item.getCategory())
                .address(item.getAddress())
                .roadAddress(item.getRoadAddress())
                .tel(item.getTelephone())
                .mapx(mapx)
                .mapy(mapy)
                .source("NAVER")
                .build();
    }

    private String stripTags(String html) {
        if (html == null) return null;
        return html.replaceAll("<.*?>", "");
    }
}
