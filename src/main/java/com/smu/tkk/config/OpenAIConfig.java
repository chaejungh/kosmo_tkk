package com.smu.tkk.config;

import com.openai.client.OpenAIClient;
import com.openai.client.okhttp.OpenAIOkHttpClient;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class OpenAIConfig {

    // application.yaml -> openai.api-key 에서 가져옴
    @Value("${openai.api-key}")
    private String apiKey;

    @Bean
    public OpenAIClient openAIClient() {
        // API 키로 OpenAI 클라이언트 생성
        return OpenAIOkHttpClient.builder()
                .apiKey(apiKey)
                .build();
    }
}
