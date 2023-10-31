package com.example.bumerang.handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.example.bumerang.web.dto.SessionUserDto;
import org.springframework.web.servlet.HandlerInterceptor;

public class LoginCheckIntercepter implements HandlerInterceptor {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
            throws Exception {
        System.out.println(request.getRequestURI());

        String uri = request.getRequestURI();

        HttpSession session = request.getSession();
        SessionUserDto principal = (SessionUserDto) session.getAttribute("principal");

        if (uri.contains("api")) {
            if (principal == null) {
                // 로그인 되지 않음
                System.out.println("비로그인 요청");

                //로그인으로 redirect
                response.sendRedirect("/user/loginForm");
                return false;
            }
        }

        if (uri.contains("auth")) {
            if (!principal.getUserRole().equals("관리자")) {
                System.out.println("권한없는 사용자 요청");

                //메인페이지로 redirect
                response.sendRedirect("/");
                return false;
            }
        }
        // 로그인 되어있을 때
        return true;
    }
}