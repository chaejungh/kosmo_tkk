package com.smu.tkk.repository;

import com.smu.tkk.entity.MemberNotificationSetting;
import org.springframework.data.jpa.repository.JpaRepository;

public interface MemberNotificationSettingRepository extends JpaRepository<MemberNotificationSetting, Long> {
}
