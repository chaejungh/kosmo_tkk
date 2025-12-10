package com.smu.tkk.controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.smu.tkk.dto.NaverProfileResponse;
import com.smu.tkk.dto.NaverTokenResponse;
import com.smu.tkk.entity.Member;
import com.smu.tkk.service.MemberService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.*;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriComponentsBuilder;

import java.sql.SQLException;
import java.util.UUID;

@Controller
@RequiredArgsConstructor
public class NaverLoginController {

    private final MemberService memberService;

    private final RestTemplate restTemplate = new RestTemplate();
    private final ObjectMapper objectMapper = new ObjectMapper();

    @Value("${naver.login.client-id}")
    private String naverClientId;

    @Value("${naver.login.client-secret}")
    private String naverClientSecret;

    @Value("${naver.login.redirect-uri}")
    private String naverRedirectUri;

    /**
     * 네이버 로그인 시작
     *  - /oauth2/authorization/naver
     *  - 로그인 페이지에서 네이버 버튼이 이 URL을 호출
     */
    @GetMapping("/oauth2/authorization/naver")
    public String redirectToNaver(HttpSession session) {

        String state = UUID.randomUUID().toString();
        session.setAttribute("NAVER_LOGIN_STATE", state);

        String authorizeUrl = UriComponentsBuilder
                .fromHttpUrl("https://nid.naver.com/oauth2.0/authorize")
                .queryParam("response_type", "code")
                .queryParam("client_id", naverClientId)
                .queryParam("redirect_uri", naverRedirectUri)
                .queryParam("state", state)
                .build(true)
                .toUriString();

        return "redirect:" + authorizeUrl;
    }

    /**
     * 네이버 로그인 콜백
     *  - 네이버 개발자센터 Callback URL:
     *      http://localhost:8080/login/oauth2/naver
     */
    @GetMapping("/login/oauth2/naver")
    public String naverCallback(@RequestParam(required = false) String code,
                                @RequestParam(required = false) String state,
                                @RequestParam(required = false, name = "error") String error,
                                @RequestParam(required = false, name = "error_description") String errorDescription,
                                HttpSession session,
                                Model model) {

        try {
            // 1) 네이버 쪽 에러
            if (error != null) {
                model.addAttribute("error",
                        "네이버 로그인 실패: " + error + " (" + errorDescription + ")");
                return "auth/login";
            }

            // 2) state 검증
            String sessionState = (String) session.getAttribute("NAVER_LOGIN_STATE");
            if (sessionState == null || !sessionState.equals(state)) {
                model.addAttribute("error", "잘못된 네이버 로그인 요청입니다.(state 불일치)");
                return "auth/login";
            }

            // 3) code 로 Access Token 발급
            String tokenUrl = UriComponentsBuilder
                    .fromHttpUrl("https://nid.naver.com/oauth2.0/token")
                    .queryParam("grant_type", "authorization_code")
                    .queryParam("client_id", naverClientId)
                    .queryParam("client_secret", naverClientSecret)
                    .queryParam("code", code)
                    .queryParam("state", state)
                    .build(true)
                    .toUriString();

            ResponseEntity<String> tokenResponseEntity =
                    restTemplate.getForEntity(tokenUrl, String.class);

            if (!tokenResponseEntity.getStatusCode().is2xxSuccessful()) {
                model.addAttribute("error", "네이버 토큰 발급에 실패했습니다.");
                return "auth/login";
            }

            NaverTokenResponse tokenResponse = objectMapper.readValue(
                    tokenResponseEntity.getBody(), NaverTokenResponse.class);

            if (tokenResponse.getAccessToken() == null) {
                model.addAttribute("error", "네이버 토큰 응답이 올바르지 않습니다.");
                return "auth/login";
            }

            // 4) Access Token으로 프로필 조회
            HttpHeaders headers = new HttpHeaders();
            headers.add("Authorization", "Bearer " + tokenResponse.getAccessToken());

            HttpEntity<Void> profileRequest = new HttpEntity<>(headers);

            ResponseEntity<String> profileResponseEntity = restTemplate.exchange(
                    "https://openapi.naver.com/v1/nid/me",
                    HttpMethod.GET,
                    profileRequest,
                    String.class
            );

            if (!profileResponseEntity.getStatusCode().is2xxSuccessful()) {
                model.addAttribute("error", "네이버 프로필 조회에 실패했습니다.");
                return "auth/login";
            }

            NaverProfileResponse profileResponse = objectMapper.readValue(
                    profileResponseEntity.getBody(), NaverProfileResponse.class);

            if (!"00".equals(profileResponse.getResultcode())) {
                model.addAttribute("error",
                        "네이버 프로필 응답 코드 오류: " + profileResponse.getMessage());
                return "auth/login";
            }

            NaverProfileResponse.NaverProfile p = profileResponse.getResponse();

// 5) 우리 서비스 회원 로그인/가입 처리
            Member member = memberService.loginByNaver(p);


            // 6) 세션 저장 (기존 로그인과 동일)
            session.setAttribute("loginMember", member);
            session.setAttribute("memberId", member.getId());

            return "redirect:/";

        } catch (SQLException e) {
            e.printStackTrace();
            model.addAttribute("error", "네이버 로그인 처리 중 DB 오류가 발생했습니다.");
            return "auth/login";
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("error", "네이버 로그인 처리 중 오류가 발생했습니다.");
            return "auth/login";
        }
    }
}
