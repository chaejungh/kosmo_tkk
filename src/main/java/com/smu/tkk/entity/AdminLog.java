package com.smu.tkk.entity;

import jakarta.persistence.*;
import lombok.*;

import java.time.LocalDateTime;

@Entity
@Table(name = "ADMIN_LOG")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class AdminLog {

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "admin_log_seq_gen")
    @SequenceGenerator(
            name = "admin_log_seq_gen",
            sequenceName = "ADMIN_LOG_SEQ",
            allocationSize = 1
    )
    @Column(name = "LOG_ID")
    private Long logId;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "ADMIN_ID", nullable = false)
    private AdminUser adminUser;

    @Column(name = "ACTION_TYPE", nullable = false, length = 50)
    private String actionType;    // LOGIN, DELETE_POST, BAN_MEMBER ...

    @Column(name = "TARGET_TABLE", length = 50)
    private String targetTable;   // MEMBER, BOARD_POST ...

    @Column(name = "TARGET_ID")
    private Long targetId;        // 대상 PK

    @Column(name = "DESCRIPTION", length = 400)
    private String description;   // 상세 설명

    @Column(name = "IP_ADDRESS", length = 45)
    private String ipAddress;

    @Column(name = "CREATED_AT", nullable = false)
    private LocalDateTime createdAt;

    @PrePersist
    public void onCreate() {
        if (createdAt == null) {
            createdAt = LocalDateTime.now();
        }
    }
}
