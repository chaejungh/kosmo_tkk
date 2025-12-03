package com.smu.tkk.entity;

import jakarta.persistence.*;
import lombok.*;

import java.time.LocalDateTime;

@Entity
@Table(name = "ADMIN_USER")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class AdminUser {

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "admin_user_seq_gen")
    @SequenceGenerator(
            name = "admin_user_seq_gen",
            sequenceName = "ADMIN_USER_SEQ",
            allocationSize = 1
    )
    @Column(name = "ADMIN_ID")
    private Long adminId;

    @Column(name = "LOGIN_ID", nullable = false, unique = true, length = 50)
    private String loginId;

    @Column(name = "LOGIN_PW", nullable = false, length = 200)
    private String loginPw;

    @Column(name = "NAME", nullable = false, length = 50)
    private String name;

    @Column(name = "EMAIL", length = 100)
    private String email;

    @Column(name = "PHONE", length = 20)
    private String phone;

    // Y: 활성, N: 비활성
    @Column(name = "STATUS", nullable = false, length = 1)
    private String status;

    @Column(name = "LAST_LOGIN_AT")
    private LocalDateTime lastLoginAt;

    @Column(name = "CREATED_AT", nullable = false)
    private LocalDateTime createdAt;

    @Column(name = "UPDATED_AT")
    private LocalDateTime updatedAt;

    @PrePersist
    public void onCreate() {
        if (createdAt == null) {
            createdAt = LocalDateTime.now();
        }
        if (status == null) {
            status = "Y";
        }
    }

    @PreUpdate
    public void onUpdate() {
        updatedAt = LocalDateTime.now();
    }
}
