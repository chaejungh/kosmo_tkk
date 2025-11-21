package com.smu.tkk.service.impl;

import com.smu.tkk.dto.PlaceDto;
import com.smu.tkk.naver.NaverLocalItem;
import com.smu.tkk.naver.NaverLocalSearchResponse;
import com.smu.tkk.service.NaverLocalSearchService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.*;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriComponentsBuilder;

import java.net.URI;
import java.nio.charset.StandardCharsets;
import java.util.Collections;
import java.util.List;

@Service
@Slf4j
public class NaverLocalSearchServiceImpl implements NaverLocalSearchService {

    @Value("${naver.search.client-id}")
    private String clientId;

    @Value("${naver.search.client-secret}")
    private String clientSecret;

    private final RestTemplate restTemplate = new RestTemplate();

    /**
     * 1차 : 사용자가 입력한 검색어 그대로 호출
     * 2차 : 결과가 없고, 굿즈 관련 키워드가 없으면 "굿즈샵" 붙여서 한 번 더 호출
     */
    @Override
    public List<PlaceDto> searchPlaces(String query, int limit) {
        if (query == null || query.isBlank()) {
            return Collections.emptyList();
        }

        String q = query.trim();
        int display = Math.min(Math.max(limit, 1), 5); // 1~5

        // 1차 : 그대로
        List<PlaceDto> result = callLocalSearch(q, display);

        // 1차가 0개이고, 굿즈 관련 단어가 없으면 "굿즈샵" 붙여서 재검색
        if (result.isEmpty() && !containsGoodsKeyword(q)) {
            String q2 = q + " 굿즈샵";
            log.info("local search fallback: '{}' -> '{}'", q, q2);
            result = callLocalSearch(q2, display);
        }

        return result;
    }

    // "굿즈", "샵", goods, store 등 이미 들어있으면 굳이 굿즈샵 안 붙임
    private boolean containsGoodsKeyword(String q) {
        String lower = q.toLowerCase();
        return lower.contains("굿즈")
                || lower.contains("샵")
                || lower.contains("goods")
                || lower.contains("store")
                || lower.contains("shop");
    }

    // 실제 네이버 지역 검색 호출
    private List<PlaceDto> callLocalSearch(String realQuery, int display) {
        URI uri = UriComponentsBuilder
                .fromUriString("https://openapi.naver.com")
                .path("/v1/search/local.json")
                .queryParam("query", realQuery)
                .queryParam("display", display)
                .queryParam("start", 1)
                .queryParam("sort", "random") // random / comment
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

        log.info("local search '{}' -> total: {}", realQuery, body.getTotal());

        return body.getItems().stream()
                .map(this::toPlaceDto)
                .toList();
    }

    // NaverLocalItem -> PlaceDto 변환 (TM128 좌표 그대로)
    private PlaceDto toPlaceDto(NaverLocalItem item) {
        double x = 0;
        double y = 0;
        try {
            if (item.getMapx() != null) {
                x = Double.parseDouble(item.getMapx());
            }
            if (item.getMapy() != null) {
                y = Double.parseDouble(item.getMapy());
            }
        } catch (NumberFormatException ignore) { }

        return PlaceDto.builder()
                .name(stripTags(item.getTitle()))
                .category(item.getCategory())
                .address(item.getAddress())
                .roadAddress(item.getRoadAddress())
                .tel(item.getTelephone())
                .mapx(x)   // TM128 X
                .mapy(y)   // TM128 Y
                .build();
    }

    private String stripTags(String html) {
        if (html == null) return null;
        return html.replaceAll("<.*?>", "");
    }
}
