package com.smu.tkk.service;

import com.smu.tkk.dto.PlaceDto;
import com.smu.tkk.naver.NaverLocalItem;
import com.smu.tkk.naver.NaverLocalSearchResponse;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.*;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import java.net.URI;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.List;

@Slf4j
@Service
public class NaverLocalSearchServiceImpl implements NaverLocalSearchService {

    // 🔥 에러 났던 부분: 이 키 이름이 application.properties 에 꼭 있어야 함
    @Value("${naver.api.client-id}")
    private String clientId;

    @Value("${naver.api.client-secret}")
    private String clientSecret;

    // 따로 Bean 안 만들어도 되게 그냥 new 로 사용
    private final RestTemplate restTemplate = new RestTemplate();

    @Override
    public List<PlaceDto> searchPlaces(String query, int limit) {
        List<PlaceDto> result = new ArrayList<>();
        if (query == null || query.isBlank()) {
            return result;
        }

        try {
            String encoded = URLEncoder.encode(query, StandardCharsets.UTF_8);
            String url = "https://openapi.naver.com/v1/search/local.json?query=" + encoded + "&display=" + limit;

            HttpHeaders headers = new HttpHeaders();
            headers.set("X-Naver-Client-Id", clientId);
            headers.set("X-Naver-Client-Secret", clientSecret);
            headers.setAccept(List.of(MediaType.APPLICATION_JSON));

            HttpEntity<Void> entity = new HttpEntity<>(headers);

            ResponseEntity<NaverLocalSearchResponse> resp =
                    restTemplate.exchange(new URI(url), HttpMethod.GET, entity, NaverLocalSearchResponse.class);

            NaverLocalSearchResponse body = resp.getBody();
            if (body == null || body.getItems() == null) {
                return result;
            }

            for (NaverLocalItem item : body.getItems()) {
                result.add(toPlaceDto(item));
            }
        } catch (Exception e) {
            log.warn("Naver local search 실패 query={}", query, e);
        }

        return result;
    }

    private PlaceDto toPlaceDto(NaverLocalItem item) {
        String title = item.getTitle();
        if (title != null) {
            // 네이버가 주는 <b>태그 같은 거 제거
            title = title.replaceAll("<.*?>", "");
        }

        Double mapx = null;
        Double mapy = null;
        try {
            if (item.getMapx() != null && !item.getMapx().isBlank()) {
                mapx = Double.valueOf(item.getMapx());
            }
            if (item.getMapy() != null && !item.getMapy().isBlank()) {
                mapy = Double.valueOf(item.getMapy());
            }
        } catch (NumberFormatException e) {
            log.debug("좌표 파싱 실패 item={}", item, e);
        }

        return PlaceDto.builder()
                .name(title)
                .category(item.getCategory())
                .address(item.getAddress())
                .roadAddress(item.getRoadAddress())
                .tel(item.getTelephone())
                .mapx(mapx)   // TM128 좌표 (x)
                .mapy(mapy)   // TM128 좌표 (y)
                .source("NAVER")
                .build();
    }
}
