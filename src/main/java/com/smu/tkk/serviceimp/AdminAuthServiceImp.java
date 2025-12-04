package com.smu.tkk.serviceimp;

import com.smu.tkk.entity.AdminUser;
import com.smu.tkk.repository.AdminUserRepository;
import com.smu.tkk.service.AdminAuthService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Objects;

@Service
@RequiredArgsConstructor
@Transactional(readOnly = true)
public class AdminAuthServiceImp implements AdminAuthService {

    private final AdminUserRepository adminUserRepository;

    @Override
    public AdminUser login(String loginId, String loginPw) {

        // 🔍 1) 로그인 아이디로 관리자 찾기
        AdminUser user = adminUserRepository
                .findByLoginId(loginId.trim())
                .orElse(null);

        if (user == null) {
            System.out.println("[ADMIN LOGIN] not found loginId = " + loginId);
            return null;
        }

        // 🔍 2) 상태값 확인 (Y 인지)
        String status = user.getStatus();
        if (status == null || !"Y".equalsIgnoreCase(status.trim())) {
            System.out.println("[ADMIN LOGIN] status not Y, status = " + status);
            return null;
        }

        // 🔍 3) 비밀번호 확인 (지금은 평문 비교)
        if (!Objects.equals(user.getLoginPw(), loginPw)) {
            System.out.println("[ADMIN LOGIN] password mismatch. input=" + loginPw
                    + ", stored=" + user.getLoginPw());
            return null;
        }

        System.out.println("[ADMIN LOGIN] success. adminId=" + user.getAdminId());
        return user;
    }
}
