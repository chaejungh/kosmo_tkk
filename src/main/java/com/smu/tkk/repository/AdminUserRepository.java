package com.smu.tkk.repository;

import com.smu.tkk.entity.AdminUser;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface AdminUserRepository extends JpaRepository<AdminUser, Long> {

    // 기존: Optional<AdminUser> findByLoginIdAndStatus(String loginId, String status);

    // 🔥 로그인 아이디로만 먼저 조회
    Optional<AdminUser> findByLoginId(String loginId);
}
