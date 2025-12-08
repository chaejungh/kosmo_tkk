
package com.smu.tkk.serviceimp;

import com.smu.tkk.entity.Member;
import com.smu.tkk.entity.MemberNotificationSetting;
import com.smu.tkk.repository.MemberNotificationSettingRepository;
import com.smu.tkk.repository.MemberRepository;
import com.smu.tkk.service.MemberService;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Example;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.sql.SQLException;
import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
@Transactional
public class MemberServiceImp implements MemberService {

    private final MemberRepository memberRepository;
    private final MemberNotificationSettingRepository memberNotificationSettingRepository;

    /**
     * 1. 회원 가입
     */
    @Override
    public boolean register(Member member) throws SQLException, IllegalArgumentException {
        if (member == null) {
            throw new IllegalArgumentException("회원 정보가 없습니다.");
        }
        if (existsByLoginId(member.getLoginId())) {
            throw new IllegalArgumentException("이미 존재하는 아이디입니다.");
        }
        if (existsByNickname(member.getNickname())) {
            throw new IllegalArgumentException("이미 존재하는 닉네임입니다.");
        }

        // 회원 저장
        Member savedMember = memberRepository.save(member);

        // 회원가입 시 기본 알림 설정 생성 (선택 사항이지만 비즈니스 로직상 필요할 수 있음)
        // 엔티티 생성자나 빌더 패턴에 따라 달라질 수 있으나, 기본 객체 생성 후 저장 로직 예시
        MemberNotificationSetting defaultSetting = new MemberNotificationSetting();
        defaultSetting.setId(savedMember.getId()); // ID 매핑 가정
        defaultSetting.setCommentYn("Y");
        defaultSetting.setLikeYn("Y");
        defaultSetting.setTradeYn("Y");
        defaultSetting.setEventYn("Y");
        memberNotificationSettingRepository.save(defaultSetting);

        return true;
    }

    /**
     * 2. 로그인
     */
    @Override
    @Transactional(readOnly = true)
    public Member login(String loginId, String loginPw) throws SQLException, IllegalArgumentException {
        if (loginId == null || loginPw == null) {
            throw new IllegalArgumentException("아이디와 비밀번호를 입력해주세요.");
        }

        // 1차 검증: Repository의 exists 메서드 활용
        boolean exists = memberRepository.existsByLoginIdAndLoginPw(loginId, loginPw);
        if (!exists) {
            return null; // 또는 throw new IllegalArgumentException("아이디 또는 비밀번호가 일치하지 않습니다.");
        }

        // Member 객체 반환을 위해 조회 (Repository에 findByLoginId가 없으므로 Example 활용)
        Member probe = new Member();
        probe.setLoginId(loginId);

        // 비밀번호까지 일치하는지 확인된 상태이므로 ID로 조회
        Optional<Member> memberOptional = memberRepository.findOne(Example.of(probe));

        return memberOptional.orElse(null);
    }

    /**
     * 3. 아이디 중복 확인
     */
    @Override
    @Transactional(readOnly = true)
    public boolean existsByLoginId(String loginId) throws SQLException {
        return memberRepository.existsByLoginId(loginId);
    }

    /**
     * 4. 닉네임 중복 확인
     */
    @Override
    @Transactional(readOnly = true)
    public boolean existsByNickname(String nickname) throws SQLException {
        return memberRepository.existsByNickname(nickname);
    }

    /**
     * 5. 회원 정보 수정
     */
    @Override
    public boolean modify(Member member) throws SQLException, IllegalArgumentException {
        if (member == null || member.getId() == null) {
            throw new IllegalArgumentException("회원 정보가 올바르지 않습니다.");
        }

        // Repository의 JPQL update 메서드 호출
        // 순서: loginId, loginPw, nickname, imgUrl, intro, email, id
        int updateCount = memberRepository.update(
                member.getLoginId(),
                member.getLoginPw(),
                member.getNickname(),
                member.getProfileImageUrl(),
                member.getIntro(),
                member.getEmail(),
                member.getId()
        );

        return updateCount > 0;
    }

    /**
     * 6. 단일 회원 조회
     */
    @Override
    @Transactional(readOnly = true)
    public Member readOne(Long memberId) throws SQLException {
        return memberRepository.findById(memberId).orElse(null);
    }

    /**
     * 7. 전체 회원 조회
     */
    @Override
    @Transactional(readOnly = true)
    public List<Member> readAll(Pageable pageable) throws SQLException {
        Page<Member> memberPage = memberRepository.findAll(pageable);
        return memberPage.getContent();
    }

    /**
     * 8. 회원 알림 설정 조회
     */
    @Override
    @Transactional(readOnly = true)
    public MemberNotificationSetting readNotificationSetting(Long memberId) throws SQLException {
        // ID 타입 불일치(Long vs Integer) 주의: Repository 정의에 맞춰 형변환
        return memberNotificationSettingRepository.findById(memberId.intValue()).orElse(null);
    }

    /**
     * 9. 회원 알림 설정 수정
     */
    @Override
    public boolean updateNotificationSetting(MemberNotificationSetting setting) throws SQLException, IllegalArgumentException {
        if (setting == null || setting.getId() == null) {
            throw new IllegalArgumentException("설정 정보가 올바르지 않습니다.");
        }

        // Repository의 JPQL update 메서드 호출
        // 순서: memberId, commentYn, likeYn, tradeYn, eventYn
        int updateCount = memberNotificationSettingRepository.update(
                setting.getId(), // ID 타입 매칭
                setting.getCommentYn(),
                setting.getLikeYn(),
                setting.getTradeYn(),
                setting.getEventYn()
        );

        return updateCount > 0;
    }

    /**
     * 10. Member 이미지 추가
     * (기존 updateImg 활용)
     */
    @Override
    public boolean addImage(Long memberId, Member profileImage) throws SQLException, IllegalArgumentException {
        if (memberId == null || profileImage == null) {
            throw new IllegalArgumentException("입력값이 올바르지 않습니다.");
        }

        // updateImg 쿼리 호출
        int result = memberRepository.updateImg(profileImage.getProfileImageUrl(), memberId);
        return result > 0;
    }

    /**
     * 11. Member 이미지 수정
     */
    @Override
    public boolean modifyImage(Long memberId, Member profileImage) throws SQLException, IllegalArgumentException {
        if (memberId == null || profileImage == null) {
            throw new IllegalArgumentException("입력값이 올바르지 않습니다.");
        }

        // updateImg 쿼리 호출
        int result = memberRepository.updateImg(profileImage.getProfileImageUrl(), memberId);
        return result > 0;
    }
    @Override
    @Transactional
    public void deleteMember(Long memberId) {
        memberRepository.deleteById(memberId);  // ⭐ Hard Delete 실행
    }
}

