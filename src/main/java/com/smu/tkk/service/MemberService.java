package com.smu.tkk.service;

import com.smu.tkk.dto.NaverProfileResponse;
import com.smu.tkk.entity.Member;
import com.smu.tkk.entity.MemberNotificationSetting;
import org.springframework.data.domain.Pageable;

import java.sql.SQLException;
import java.util.List;

public interface MemberService {

    // 1. 회원 가입
    boolean register(Member member) throws SQLException, IllegalArgumentException;

    // 2. 로그인
    Member login(String loginId, String loginPw) throws SQLException, IllegalArgumentException;

    // 3. 아이디 중복 확인
    boolean existsByLoginId(String loginId) throws SQLException;

    // 4. 닉네임 중복 확인
    boolean existsByNickname(String nickname) throws SQLException;

    // 5. 회원 정보 수정
    boolean modify(Member member) throws SQLException, IllegalArgumentException;

    // 6. 단일 회원 조회
    Member readOne(Long memberId) throws SQLException;

    // 7. 전체 회원 조회
    List<Member> readAll(Pageable pageable) throws SQLException;

    // 8. 회원 알림 설정 조회
    MemberNotificationSetting readNotificationSetting(Long memberId) throws SQLException;

    // 9. 회원 알림 설정 수정
    boolean updateNotificationSetting(MemberNotificationSetting setting)
            throws SQLException, IllegalArgumentException;

    // 10. Member 이미지 추가
    boolean addImage(Long memberId, Member profileImage)
            throws SQLException, IllegalArgumentException;

    // 11. Member 이미지 수정
    boolean modifyImage(Long memberId, Member profileImage)
            throws SQLException, IllegalArgumentException;

    // 12. 회원 삭제
    void deleteMember(Long memberId);

    // 13. ✅ 네이버 간편 로그인 (자동 회원가입 + 로그인)
    com.smu.tkk.entity.Member loginByNaver(NaverProfileResponse.NaverProfile profile)
            throws SQLException;

    // 12. 이메일 변경
    void updateEmail(Long memberId, String email) throws SQLException, IllegalArgumentException;

    Member readByNicknameAndEmail(String nickname, String email);

    Member readByLoginIdAndNicknameAndEmail(String loginId, String nickname, String email);

}