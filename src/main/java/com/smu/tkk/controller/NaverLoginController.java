package com.smu.tkk.controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.smu.tkk.dto.NaverProfileResponse;
import com.smu.tkk.dto.NaverTokenResponse;
import com.smu.tkk.entity.Member;
import com.smu.tkk.service.MemberService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.*;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;
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

    private static final String STATE_KEY = "NAVER_LOGIN_STATE";

    /** 네이버 로그인 시작 */
    @GetMapping("/oauth2/authorization/naver")
    public String redirectToNaver(HttpServletRequest request, HttpSession session) {

        String state = UUID.randomUUID().toString();
        session.setAttribute(STATE_KEY, state);

        // ✅ 현재 접속한 주소 기준으로 콜백 URL 자동 생성
        // - 로컬: http://localhost:8080/login/oauth2/naver
        // - 서버: https://13.125.180.4/login/oauth2/naver
        String redirectUri = ServletUriComponentsBuilder
                .fromRequest(request)
                .replacePath("/login/oauth2/naver")
                .replaceQuery(null)
                .build()
                .toUriString();

        String authorizeUrl = UriComponentsBuilder
                .fromHttpUrl("https://nid.naver.com/oauth2.0/authorize")
                .queryParam("response_type", "code")
                .queryParam("client_id", naverClientId)
                .queryParam("redirect_uri", redirectUri)
                .queryParam("state", state)
                .queryParam("auth_type", "reprompt")
                .build(true)
                .toUriString();

        return "redirect:" + authorizeUrl;
    }

    /** 네이버 로그인 콜백 */
    @GetMapping("/login/oauth2/naver")
    public String naverCallback(@RequestParam(required = false) String code,
                                @RequestParam(required = false) String state,
                                @RequestParam(required = false, name = "error") String error,
                                @RequestParam(required = false, name = "error_description") String errorDescription,
                                HttpServletRequest request,
                                HttpSession session,
                                Model model) {

        try {
            // 1) 네이버 쪽 에러
            if (error != null) {
                model.addAttribute("error",
                        "네이버 로그인 실패: " + error + " (" + errorDescription + ")");
                return "auth/login";
            }

            if (code == null || code.isBlank()) {
                model.addAttribute("error", "네이버 인증 코드가 없습니다.");
                return "auth/login";
            }

            // 2) state 검증
            String sessionState = (String) session.getAttribute(STATE_KEY);
            if (sessionState == null || !sessionState.equals(state)) {
                model.addAttribute("error", "잘못된 네이버 로그인 요청입니다.(state 불일치)");
                return "auth/login";
            }
            session.removeAttribute(STATE_KEY);

            // ✅ 콜백 URL도 요청 기준으로 동일하게 생성 (일관성)
            String redirectUri = ServletUriComponentsBuilder
                    .fromRequest(request)
                    .replaceQuery(null)
                    .build()
                    .toUriString();

            // 3) code 로 Access Token 발급
            String tokenUrl = UriComponentsBuilder
                    .fromHttpUrl("https://nid.naver.com/oauth2.0/token")
                    .queryParam("grant_type", "authorization_code")
                    .queryParam("client_id", naverClientId)
                    .queryParam("client_secret", naverClientSecret)
                    .queryParam("code", code)
                    .queryParam("state", state)
                    // 네이버는 보통 없어도 되지만, 환경 꼬임 방지용으로 같이 보냄
                    .queryParam("redirect_uri", redirectUri)
                    .build(true)
                    .toUriString();

            ResponseEntity<String> tokenRes = restTemplate.getForEntity(tokenUrl, String.class);

            if (!tokenRes.getStatusCode().is2xxSuccessful()) {
                model.addAttribute("error", "네이버 토큰 발급에 실패했습니다.");
                return "auth/login";
            }

            NaverTokenResponse token = objectMapper.readValue(tokenRes.getBody(), NaverTokenResponse.class);

            if (token.getAccessToken() == null || token.getAccessToken().isBlank()) {
                model.addAttribute("error", "네이버 토큰 응답이 올바르지 않습니다.");
                return "auth/login";
            }

            // 4) Access Token으로 프로필 조회
            HttpHeaders headers = new HttpHeaders();
            headers.add("Authorization", "Bearer " + token.getAccessToken());
            HttpEntity<Void> profileReq = new HttpEntity<>(headers);

            ResponseEntity<String> profileRes = restTemplate.exchange(
                    "https://openapi.naver.com/v1/nid/me",
                    HttpMethod.GET,
                    profileReq,
                    String.class
            );

            if (!profileRes.getStatusCode().is2xxSuccessful()) {
                model.addAttribute("error", "네이버 프로필 조회에 실패했습니다.");
                return "auth/login";
            }

            NaverProfileResponse profile = objectMapper.readValue(profileRes.getBody(), NaverProfileResponse.class);

            if (!"00".equals(profile.getResultcode())) {
                model.addAttribute("error", "네이버 프로필 응답 코드 오류: " + profile.getMessage());
                return "auth/login";
            }

            NaverProfileResponse.NaverProfile p = profile.getResponse();

            // 5) 우리 서비스 회원 로그인/가입 처리 (※ 여기서 DB 필요)
            Member member = memberService.loginByNaver(p);

            // 6) 세션 저장
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
