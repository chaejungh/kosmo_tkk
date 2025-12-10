package com.smu.tkk.dto;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class NaverTokenResponse {

    @JsonProperty("access_token")
    private String accessToken;

    @JsonProperty("refresh_token")
    private String refreshToken;

    @JsonProperty("token_type")
    private String tokenType;

    @JsonProperty("expires_in")
    private int expiresIn;

    private String error;

    @JsonProperty("error_description")
    private String errorDescription;

    // OIDC 쓸 때 내려오는 값 (안 쓰면 없어도 상관 없음)
    @JsonProperty("id_token")
    private String idToken;
}
