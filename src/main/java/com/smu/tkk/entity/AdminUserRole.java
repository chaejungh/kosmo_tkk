package com.smu.tkk.entity;

import jakarta.persistence.*;
import lombok.*;

import java.time.LocalDateTime;

@Entity
@Table(name = "ADMIN_USER_ROLE")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class AdminUserRole {

    @EmbeddedId
    private AdminUserRoleId id;

    @ManyToOne(fetch = FetchType.LAZY)
    @MapsId("adminId")   // 복합키의 adminId와 매핑
    @JoinColumn(name = "ADMIN_ID")
    private AdminUser adminUser;

    @ManyToOne(fetch = FetchType.LAZY)
    @MapsId("roleId")    // 복합키의 roleId와 매핑
    @JoinColumn(name = "ROLE_ID")
    private AdminRole role;

    @Column(name = "CREATED_AT", nullable = false)
    private LocalDateTime createdAt;

    @PrePersist
    public void onCreate() {
        if (createdAt == null) {
            createdAt = LocalDateTime.now();
        }
    }
}
