package com.smu.tkk.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Embeddable;
import lombok.*;

import java.io.Serializable;

@Embeddable
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class AdminUserRoleId implements Serializable {

    @Column(name = "ADMIN_ID")
    private Long adminId;

    @Column(name = "ROLE_ID")
    private Long roleId;
}
