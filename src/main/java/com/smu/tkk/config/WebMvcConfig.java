package com.smu.tkk.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebMvcConfig implements WebMvcConfigurer {

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {

        String chatPath = System.getProperty("user.dir") + "/upload/chat/";

        registry.addResourceHandler("/upload/chat/**")
                .addResourceLocations("file:" + chatPath);
    }
}