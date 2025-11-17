package com.tkk.goods.api;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.*;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriComponentsBuilder;

@RestController
@RequestMapping("/api")
public class NaverApiProxy {

    @Value("${naver.key-id}") private String keyId;     // 8ehod4l0bq
    @Value("${naver.key}")    private String keySecret; // 환경변수로 주입

    private final RestTemplate rest = new RestTemplate();

    /** 자동차 경로(Directions 5/15) : 경유지(waypoints) 지원 */
    // 예) /api/directions?start=127.105399,37.3595704&goal=126.97843,37.56668&option=traoptimal
    //    &waypoints=127.1,37.3|127.2,37.35   (최대 15개)
    @GetMapping("/directions")
    public ResponseEntity<String> directions(
            @RequestParam String start,
            @RequestParam String goal,
            @RequestParam(defaultValue = "traoptimal") String option,
            @RequestParam(required = false) String waypoints
    ) {
        UriComponentsBuilder ub = UriComponentsBuilder
                .fromHttpUrl("https://naveropenapi.apigw.ntruss.com/map-direction/v1/driving")
                .queryParam("start", start)
                .queryParam("goal", goal)
                .queryParam("option", option);
        if (waypoints != null && !waypoints.isBlank()) ub.queryParam("waypoints", waypoints);

        HttpHeaders h = new HttpHeaders();
        h.set("X-NCP-APIGW-API-KEY-ID", keyId);
        h.set("X-NCP-APIGW-API-KEY",    keySecret);

        ResponseEntity<String> resp = rest.exchange(ub.toUriString(), HttpMethod.GET, new HttpEntity<>(h), String.class);
        return ResponseEntity.status(resp.getStatusCode()).body(resp.getBody());
    }

    /** Static Map 프록시 (PNG 반환) */
    // 예) /api/staticmap?center=127.105399,37.3595704&level=15&w=800&h=500&markers=type:d|size:mid|pos:127.105399%2037.3595704
    @GetMapping("/staticmap")
    public ResponseEntity<byte[]> staticMap(@RequestParam MultiValueMap<String,String> params) {
        UriComponentsBuilder ub = UriComponentsBuilder
                .fromHttpUrl("https://naveropenapi.apigw.ntruss.com/map-static/v2/map");
        params.forEach((k, vList) -> vList.forEach(v -> ub.queryParam(k, v)));

        HttpHeaders h = new HttpHeaders();
        h.set("X-NCP-APIGW-API-KEY-ID", keyId);
        h.set("X-NCP-APIGW-API-KEY",    keySecret);

        ResponseEntity<byte[]> resp = rest.exchange(ub.toUriString(), HttpMethod.GET, new HttpEntity<>(h), byte[].class);

        HttpHeaders out = new HttpHeaders();
        out.setContentType(MediaType.IMAGE_PNG);
        return new ResponseEntity<>(resp.getBody(), out, resp.getStatusCode());
    }
}
