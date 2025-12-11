package com.smu.tkk.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;

@Configuration
public class MailConfig {

    /**
     * 아주 기본적인 JavaMailSender 빈.
     * host, port 같은 건 아직 설정 안 했고,
     * 나중에 실제 메일 보낼 때만 제대로 SMTP 설정해주면 됨.
     */
    @Bean
    public JavaMailSender javaMailSender() {
        return new JavaMailSenderImpl();
    }
}
