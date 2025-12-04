package com.smu.tkk.service;

import com.smu.tkk.entity.AdminUser;

public interface AdminAuthService {

    /**
     * 로그인 ID, PW 로 관리자 인증
     * 성공하면 AdminUser 리턴, 실패하면 null 리턴
     */
    AdminUser login(String loginId, String loginPw);
}
