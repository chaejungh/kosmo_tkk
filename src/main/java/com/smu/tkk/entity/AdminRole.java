package com.smu.tkk.entity;

import jakarta.persistence.*;
import lombok.*;

import java.time.LocalDateTime;

@Entity
@Table(name = "ADMIN_ROLE")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class AdminRole {

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "admin_role_seq_gen")
    @SequenceGenerator(
            name = "admin_role_seq_gen",
            sequenceName = "ADMIN_ROLE_SEQ",
            allocationSize = 1
    )
    @Column(name = "ROLE_ID")
    private Long roleId;

    @Column(name = "ROLE_CODE", nullable = false, unique = true, length = 30)
    private String roleCode;   // SUPER, MANAGER, CS, CONTENT ...

    @Column(name = "ROLE_NAME", nullable = false, length = 50)
    private String roleName;   // 한글명

    @Column(name = "DESCRIPTION", length = 200)
    private String description;

    @Column(name = "CREATED_AT", nullable = false)
    private LocalDateTime createdAt;

    @PrePersist
    public void onCreate() {
        if (createdAt == null) {
            createdAt = LocalDateTime.now();
        }
    }
}
