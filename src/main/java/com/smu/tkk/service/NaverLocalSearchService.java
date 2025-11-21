// src/main/java/com/smu/tkk/service/NaverLocalSearchService.java
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
public class NaverLocalSearchService {

    @Value("${naver.search.client-id}")
    private String clientId;

    @Value("${naver.search.client-secret}")
    private String clientSecret;

    // 간단하게 new 로 사용해도 됨 (필요하면 @Bean 으로 분리 가능)
    private final RestTemplate restTemplate = new RestTemplate();

    public List<PlaceDto> searchPlaces(String query, int limit) {
        if (query == null || query.isBlank()) {
            return Collections.emptyList();
        }

        // "홍대" 처럼 지역만 들어와도 굿즈샵 중심으로 찾도록 자동 보정
        String realQuery = query.contains("굿즈")
                ? query
                : query + " 애니 굿즈샵";

        int display = Math.min(Math.max(limit, 1), 5); // 문서: 최대 5
        int start = 1;                                 // 문서: 최대 1

        URI uri = UriComponentsBuilder
                .fromUriString("https://openapi.naver.com")
                .path("/v1/search/local.json")
                .queryParam("query", realQuery)
                .queryParam("display", display)
                .queryParam("start", start)
                .queryParam("sort", "random") // random / comment 둘 중 하나
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
        double mapx = 0;
        double mapy = 0;
        try {
            if (item.getMapx() != null) {
                mapx = Double.parseDouble(item.getMapx());
            }
            if (item.getMapy() != null) {
                mapy = Double.parseDouble(item.getMapy());
            }
        } catch (NumberFormatException ignore) { }

        return PlaceDto.builder()
                .name(stripTags(item.getTitle()))
                .category(item.getCategory())
                .address(item.getAddress())
                .roadAddress(item.getRoadAddress())
                .tel(item.getTelephone())
                .mapx(mapx) // TM128 좌표 그대로 전달 (프론트에서 LatLng 로 변환)
                .mapy(mapy)
                .build();
    }

    private String stripTags(String html) {
        if (html == null) return null;
        return html.replaceAll("<.*?>", "");
    }
}
