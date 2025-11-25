// src/main/java/com/smu/tkk/service/NaverLocalSearchServiceImpl.java
package com.smu.tkk.service;

import com.smu.tkk.dto.PlaceDto;
import com.smu.tkk.naver.NaverLocalItem;
import com.smu.tkk.naver.NaverLocalSearchResponse;
import lombok.RequiredArgsConstructor;
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
@RequiredArgsConstructor
public class NaverLocalSearchServiceImpl implements NaverLocalSearchService {

    @Value("${naver.search.client-id}")
    private String clientId;

    @Value("${naver.search.client-secret}")
    private String clientSecret;

    private final RestTemplate restTemplate = new RestTemplate();

    @Override
    public List<PlaceDto> searchPlaces(String query, int limit) {
        if (query == null || query.isBlank()) {
            return Collections.emptyList();
        }

        // ✅ 이제 검색어 그대로 쓴다 (네이버 지도 동작과 동일)
        // "홍대" -> "홍대"
        // "홍대 굿즈샵" -> "홍대 굿즈샵"
        // "홍대 피규어샵" -> "홍대 피규어샵"
        String realQuery = query.trim();

        int display = Math.min(Math.max(limit, 1), 5); // 최대 5
        int start   = 1;                               // 1~100

        URI uri = UriComponentsBuilder
                .fromUriString("https://openapi.naver.com")
                .path("/v1/search/local.json")
                .queryParam("query", realQuery)
                .queryParam("display", display)
                .queryParam("start", start)
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

        return body.getItems().stream()
                .map(this::toPlaceDto)
                .toList();
    }

    private PlaceDto toPlaceDto(NaverLocalItem item) {
        Double mapx = null;
        Double mapy = null;

        try {
            if (item.getMapx() != null) {
                mapx = Double.valueOf(item.getMapx());
            }
            if (item.getMapy() != null) {
                mapy = Double.valueOf(item.getMapy());
            }
        } catch (NumberFormatException ignore) {}

        return PlaceDto.builder()
                .name(stripTags(item.getTitle()))
                .category(item.getCategory())
                .address(item.getAddress())
                .roadAddress(item.getRoadAddress())
                .tel(item.getTelephone())
                .mapx(mapx)   // TM128 X
                .mapy(mapy)   // TM128 Y
                .source("NAVER")
                .build();
    }

    private String stripTags(String html) {
        if (html == null) return null;
        return html.replaceAll("<.*?>", "");
    }
}
