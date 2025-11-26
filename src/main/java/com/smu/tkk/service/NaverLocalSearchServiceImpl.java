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

    // 간단하게 new 로 사용 (필요하면 @Bean 으로 분리해도 됨)
    private final RestTemplate restTemplate = new RestTemplate();

    @Override
    public List<PlaceDto> searchPlaces(String query, int limit) {
        if (query == null || query.isBlank()) {
            return Collections.emptyList();
        }

        int display = Math.min(Math.max(limit, 1), 5); // 1~5

        URI uri = UriComponentsBuilder
                .fromUriString("https://openapi.naver.com")
                .path("/v1/search/local.json")
                .queryParam("query", query)       // "홍대", "홍대 피규어샵" 그대로 보냄
                .queryParam("display", display)   // 1~5
                .queryParam("start", 1)           // 문서상 start 최댓값 1
                .queryParam("sort", "random")     // random / comment
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
                .map(this::toPlaceDtoFromApi)
                .toList();
    }

    private PlaceDto toPlaceDtoFromApi(NaverLocalItem item) {
        Double mapx = null;
        Double mapy = null;
        try {
            if (item.getMapx() != null && !item.getMapx().isBlank()) {
                mapx = Double.parseDouble(item.getMapx());
            }
            if (item.getMapy() != null && !item.getMapy().isBlank()) {
                mapy = Double.parseDouble(item.getMapy());
            }
        } catch (NumberFormatException ignore) { }

        return PlaceDto.builder()
                .storeId(null) // 우리 DB가 아니니까 null
                .name(stripTags(item.getTitle()))
                .category(item.getCategory())
                .address(item.getAddress())
                .roadAddress(item.getRoadAddress())
                .tel(item.getTelephone())
                .lat(null) // TM128 -> LatLng 변환은 프론트에서
                .lng(null)
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
