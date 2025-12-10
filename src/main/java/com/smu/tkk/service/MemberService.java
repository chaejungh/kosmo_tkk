package com.smu.tkk.service;

import com.smu.tkk.entity.Member;
import com.smu.tkk.entity.MemberNotificationSetting;
import org.springframework.data.domain.Pageable;

import java.sql.SQLException;
import java.util.List;

/**
 * 회원 관련 서비스
 *
 * - 회원가입 register
 * - 로그인 login
 * - 아이디 / 닉네임 중복확인
 * - 회원정보 수정
 * - 마이페이지 정보 조회
 * - 알림 설정 조회 / 수정
 *
 * ※ 구현부에서는 IllegalArgumentException 으로 유효성 검사 처리
 */
public interface MemberService {

    // 1. 회원 가입(레파지토리 완료)
    //    - 필수값 누락, 형식 오류 등은 IllegalArgumentException
    boolean register(Member member) throws SQLException, IllegalArgumentException;

    // 2. 로그인(레파지토리 완료)
    //    - 아이디/비밀번호 틀리면 null 리턴 or IllegalArgumentException 중 택1 (구현 때 팀이 정하기)
    Member login(String loginId, String loginPw) throws SQLException, IllegalArgumentException;

    // 3. 아이디 중복 확인(레파지토리 완료)
    boolean existsByLoginId(String loginId) throws SQLException;

    // 4. 닉네임 중복 확인(레파지토리 완료)
    boolean existsByNickname(String nickname) throws SQLException;

    // 5. 회원 정보 수정 (이름, 닉네임, 이메일 등)(레파지토리 완료)
    boolean modify(Member member) throws SQLException, IllegalArgumentException;

    // 6. 단일 회원 조회 (마이페이지용)(레파지토리 완료)
    Member readOne(Long memberId) throws SQLException;

    // 7. 전체 회원 조회 (관리자/테스트용, 필요 없으면 나중에 삭제)(레파지토리 완료)
    List<Member> readAll(Pageable pageable) throws SQLException;

    // 8. 회원 알림 설정 조회(레파지토리 완료)
    MemberNotificationSetting readNotificationSetting(Long memberId) throws SQLException;

    // 9. 회원 알림 설정 수정(레파지토리 완료)
    boolean updateNotificationSetting(MemberNotificationSetting setting) throws SQLException, IllegalArgumentException;
    
    // 10. Member 이미지 추가(레파지토리 완료)
    boolean addImage(Long memberId, Member profileImage) throws SQLException, IllegalArgumentException;
    
    // 11. member 이미지 수정(레파지토리 완료)
    boolean modifyImage(Long memberId,Member profileImage) throws SQLException, IllegalArgumentException;

    void deleteMember(Long memberId);

    // 12. 이메일 변경
    void updateEmail(Long memberId, String email) throws SQLException, IllegalArgumentException;

}