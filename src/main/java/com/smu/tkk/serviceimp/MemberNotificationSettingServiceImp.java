package com.smu.tkk.serviceimp;

import com.smu.tkk.entity.MemberNotificationSetting;
import com.smu.tkk.repository.MemberNotificationSettingRepository;
import com.smu.tkk.service.MemberNotificationSettingService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Optional;

@Service
@RequiredArgsConstructor
@Transactional
public class MemberNotificationSettingServiceImp implements MemberNotificationSettingService {

    private final MemberNotificationSettingRepository memberNotificationSettingRepository;

    @Override
    @Transactional(readOnly = true)
    public Optional<MemberNotificationSetting> get(Long memberId) {
        if (memberId == null) {
            return Optional.empty();
        }
        // Repository PK 타입이 Integer라서 변환
        return memberNotificationSettingRepository.findById(memberId.intValue());
    }

    @Override
    public MemberNotificationSetting upsert(Long memberId,
                                            String commentYn,
                                            String likeYn,
                                            String tradeYn,
                                            String eventYn) {

        MemberNotificationSetting setting = get(memberId)
                .orElseGet(() -> {
                    MemberNotificationSetting s = new MemberNotificationSetting();
                    // PK = memberId 전략이면 필요 시 열어 쓰기
                    // s.setId(memberId);
                    return s;
                });

        if (commentYn != null) {
            setting.setCommentYn(commentYn);
        }
        if (likeYn != null) {
            setting.setLikeYn(likeYn);
        }
        if (tradeYn != null) {
            setting.setTradeYn(tradeYn);
        }
        if (eventYn != null) {
            setting.setEventYn(eventYn);
        }

        return memberNotificationSettingRepository.save(setting);
    }
}
