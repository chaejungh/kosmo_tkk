package com.smu.tkk.dto;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@JsonIgnoreProperties(ignoreUnknown = true)   // ✅ 혹시 모를 상위 필드 대비
public class NaverProfileResponse {

    private String resultcode;
    private String message;

    private NaverProfile response;

    @Getter
    @Setter
    @JsonIgnoreProperties(ignoreUnknown = true)   // ✅ 여기가 핵심
    public static class NaverProfile {
        private String id;
        private String nickname;
        private String name;
        private String email;
        private String gender;
        private String age;
        private String birthday;

        @JsonProperty("profile_image")
        private String profileImage;

        private String birthyear;

        // 모바일 번호 (기존에 쓰던 필드)
        private String mobile;

        // 굳이 안 써도 됨. 필요하면 이렇게 추가도 가능
        // @JsonProperty("mobile_e164")
        // private String mobileE164;
    }
}
