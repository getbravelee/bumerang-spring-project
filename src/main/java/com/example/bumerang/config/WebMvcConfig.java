package com.example.bumerang.config;

import com.example.bumerang.handler.LoginCheckIntercepter;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;


@Configuration
public class WebMvcConfig implements WebMvcConfigurer {

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(new LoginCheckIntercepter())
                .addPathPatterns("/s/**"); // 주소에 s 있으면 인터셉터 발동

    }
}

