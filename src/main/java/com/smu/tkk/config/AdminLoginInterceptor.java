package com.smu.tkk.config;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

@Component
public class AdminLoginInterceptor implements HandlerInterceptor {

    @Override
    public boolean preHandle(HttpServletRequest request,
                             HttpServletResponse response,
                             Object handler) throws Exception {

        HttpSession session = request.getSession(false);
        Long adminId = (session != null) ? (Long) session.getAttribute("adminId") : null;

        if (adminId == null) {
            // 로그인 안 된 상태 -> 로그인 페이지로
            response.sendRedirect(request.getContextPath() + "/admin/login");
            return false;
        }

        // 로그인 된 상태 -> 계속 진행
        return true;
    }
}
