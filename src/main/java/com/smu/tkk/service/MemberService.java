package com.smu.tkk.service;

import com.smu.tkk.entity.Member;
import com.smu.tkk.entity.MemberNotificationSetting;

public interface MemberService {

    // 1. 회원가입
    Member register(Member member);

    // 2. 로그인
    Member login(String loginId, String loginPw);

    // 3. 아이디 중복확인
    boolean existsByLoginId(String loginId);

    // 4. 닉네임 중복확인
    boolean existsByNickname(String nickname);

    // 5. 회원정보 수정
    Member updateMember(Long memberId, Member updateData);

    // 6. 마이페이지(회원 정보) 조회
    Member getMemberInfo(Long memberId);

    // 7. 회원 알림 설정 조회
    MemberNotificationSetting getNotificationSetting(Long memberId);

    // 8. 회원 알림 설정 수정
    void updateNotificationSetting(Long memberId,
                                   Boolean commentYn,
                                   Boolean likeYn,
                                   Boolean tradeYn,
                                   Boolean eventYn);
}