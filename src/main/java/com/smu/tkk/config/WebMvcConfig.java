package com.smu.tkk.config;

import lombok.RequiredArgsConstructor;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

/**
 * 웹 MVC 설정:
 *  - /upload/** → 로컬 디렉터리 매핑
 *  - /admin/** → AdminLoginInterceptor 로 로그인 체크
 */
@Configuration
@RequiredArgsConstructor
public class WebMvcConfig implements WebMvcConfigurer {

    // 🔥 아까 만든 인터셉터 주입 (@Component 붙어 있어야 함)
    private final AdminLoginInterceptor adminLoginInterceptor;

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(adminLoginInterceptor)
                .addPathPatterns("/admin/**")         // /admin 아래 전부 검사
                .excludePathPatterns(
                        "/admin/login",
                        "/admin/logout",
                        "/css/**",
                        "/js/**",
                        "/images/**",
                        "/static/**",
                        "/bootstrap-5.3.8-dist/**"
                );
    }

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/upload/**")
                .addResourceLocations("file:" + System.getProperty("user.dir") + "/upload/");
    }
}
