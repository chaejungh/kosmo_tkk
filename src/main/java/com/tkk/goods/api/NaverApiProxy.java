package com.tkk.goods.api;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.*;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriComponentsBuilder;

@RestController
@RequestMapping("/api")
public class NaverApiProxy {

    @Value("${naver.key-id}") private String keyId;     // 예: 8ehod4l0bq
    @Value("${naver.key}")    private String keySecret;
    @Value("${naver.search.client-id}")    private String searchClientId;
    @Value("${naver.search.client-secret}")    private String clientSecret;

    private final RestTemplate rest = new RestTemplate();

    private HttpHeaders ncpHeaders() {
        HttpHeaders h = new HttpHeaders();
        h.set("X-NCP-APIGW-API-KEY-ID", keyId);
        h.set("X-NCP-APIGW-API-KEY",    keySecret);
        return h;
    }

    /** 자동차 경로(Directions 5 기본). ver=15 주면 Directions 15 사용 */
    // 예) /api/directions?start=127.105399,37.3595704&goal=126.97843,37.56668&option=traoptimal
    //    &waypoints=127.1,37.3|127.2,37.35&ver=15
    @GetMapping("/directions")
    public ResponseEntity<String> directions(
            @RequestParam String start,
            @RequestParam String goal,
            @RequestParam(defaultValue = "traoptimal") String option,
            @RequestParam(required = false) String waypoints,
            @RequestParam(name = "ver", defaultValue = "5") String version
    ) {
        String base = "https://naveropenapi.apigw.ntruss.com/" +
                ("15".equals(version) ? "map-direction-15" : "map-direction") + "/v1/driving";

        UriComponentsBuilder ub = UriComponentsBuilder
                .fromHttpUrl(base)
                .queryParam("start", start)
                .queryParam("goal", goal)
                .queryParam("option", option);
        if (waypoints != null && !waypoints.isBlank()) ub.queryParam("waypoints", waypoints);

        ResponseEntity<String> resp = rest.exchange(
                ub.toUriString(), HttpMethod.GET, new HttpEntity<>(ncpHeaders()), String.class);
        return ResponseEntity.status(resp.getStatusCode()).body(resp.getBody());
    }

    /** Directions 15 전용 alias (편의상) */
    @GetMapping("/directions15")
    public ResponseEntity<String> directions15(
            @RequestParam String start,
            @RequestParam String goal,
            @RequestParam(defaultValue = "traoptimal") String option,
            @RequestParam(required = false) String waypoints
    ) {
        return directions(start, goal, option, waypoints, "15");
    }

    /** Static Map 프록시 (PNG 반환) */
    // 예) /api/staticmap?center=127.105399,37.3595704&level=15&w=800&h=500
    @GetMapping("/staticmap")
    public ResponseEntity<byte[]> staticMap(@RequestParam MultiValueMap<String,String> params) {
        UriComponentsBuilder ub = UriComponentsBuilder
                .fromHttpUrl("https://naveropenapi.apigw.ntruss.com/map-static/v2/map");
        params.forEach((k, vList) -> vList.forEach(v -> ub.queryParam(k, v)));

        ResponseEntity<byte[]> resp = rest.exchange(
                ub.toUriString(), HttpMethod.GET, new HttpEntity<>(ncpHeaders()), byte[].class);

        HttpHeaders out = new HttpHeaders();
        out.setContentType(MediaType.IMAGE_PNG);
        return new ResponseEntity<>(resp.getBody(), out, resp.getStatusCode());
    }

    /** 도보 경로: 추후 OSRM/Valhalla 등 연결 예정(현재 501) */
    @GetMapping(value="/walk", produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<String> walk(@RequestParam String start, @RequestParam String goal) {
        String body = "{\"message\":\"WALK routing not implemented. Wire up OSRM/Valhalla and return {coordinates:[[lng,lat],...],distance:0,duration:0}.\"}";
        return ResponseEntity.status(HttpStatus.NOT_IMPLEMENTED).body(body);
    }

    /** 대중교통 경로: 추후 ODsay/OTP 등 연결 예정(현재 501) */
    @GetMapping(value="/transit", produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<String> transit(@RequestParam String start, @RequestParam String goal) {
        String body = "{\"message\":\"TRANSIT routing not implemented. Connect a transit engine (ODsay/OTP) and return {polyline:[[lng,lat],...],time:0,transfers:0}.\"}";
        return ResponseEntity.status(HttpStatus.NOT_IMPLEMENTED).body(body);
    }

    /** 헬스 체크 */
    @GetMapping("/health")
    public ResponseEntity<String> health() {
        return ResponseEntity.ok("ok");
    }
}
