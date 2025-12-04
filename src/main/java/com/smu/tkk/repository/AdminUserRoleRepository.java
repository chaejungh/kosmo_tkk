package com.smu.tkk.repository;

import com.smu.tkk.entity.AdminUserRole;
import com.smu.tkk.entity.AdminUserRoleId;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface AdminUserRoleRepository extends JpaRepository<AdminUserRole, AdminUserRoleId> {

    List<AdminUserRole> findByAdminUser_AdminId(Long adminId);
}
