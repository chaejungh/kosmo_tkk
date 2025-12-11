package com.smu.tkk.serviceimp;

import com.smu.tkk.dto.NaverProfileResponse;
import com.smu.tkk.entity.Member;
import com.smu.tkk.entity.MemberNotificationSetting;
import com.smu.tkk.repository.*;
import com.smu.tkk.service.MemberService;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.sql.SQLException;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

@Service
@RequiredArgsConstructor
@Transactional
public class MemberServiceImp implements MemberService {

    private final MemberRepository memberRepository;
    private final MemberNotificationSettingRepository memberNotificationSettingRepository;
    private final BoardPostRepository boardPostRepository;
    private final BoardCommentRepository boardCommentRepository;
    private final BoardLikeRepository boardLikeRepository;
    private final BoardPostTagRepository boardPostTagRepository;
    private final BoardReportRepository boardReportRepository;
    private final InquiryRepository inquiryRepository;
    private final NotificationRepository notificationRepository;
    private final PopupStoreRepository popupStoreRepository;
    private final StoreBookmarkRepository storeBookmarkRepository;
    private final TradeBookmarkRepository tradeBookmarkRepository;
    private final TradeChatMessageRepository tradeChatMessageRepository;
    private final BoardBookmarkRepository boardBookmarkRepository;
    private final PopupBookmarkRepository popupBookmarkRepository;

    // 1. 회원 가입
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

        // ⚠ deletedYn 이 primitive char 라고 보고, 그냥 기본값 강제 세팅
        member.setDeletedYn('N');

        // userLevel 은 Long(래퍼)일 확률이 높으니 null 체크만
        if (member.getUserLevel() == null) {
            member.setUserLevel(1L);
        }

        Member savedMember = memberRepository.save(member);

        // ✅ 알림 설정: 없으면 한 번만 INSERT (native MERGE)
        memberNotificationSettingRepository.insertDefaultIfNotExists(savedMember.getId());

        return true;
    }

    // 2. 로그인 (일반 로그인 / 더미데이터)
    @Override
    @Transactional(readOnly = true)
    public Member login(String loginId, String loginPw) throws SQLException, IllegalArgumentException {
        if (loginId == null || loginPw == null ||
                loginId.isBlank() || loginPw.isBlank()) {
            throw new IllegalArgumentException("아이디와 비밀번호를 입력해주세요.");
        }

        // 단순 조회 (기존 더미데이터 방식 유지)
        Member member = memberRepository.findByLoginIdAndLoginPw(loginId, loginPw);

        if (member == null) {
            // 아이디 또는 비밀번호 불일치
            return null;
        }

        // deletedYn 이 primitive char 라고 가정
        char deletedYn = member.getDeletedYn();
        if (deletedYn == 'Y') {
            // 탈퇴 회원이면 로그인 막기
            return null;
        }

        return member;
    }

    // 3. 아이디 중복 확인
    @Override
    @Transactional(readOnly = true)
    public boolean existsByLoginId(String loginId) throws SQLException {
        return memberRepository.existsByLoginId(loginId);
    }

    // 4. 닉네임 중복 확인
    @Override
    @Transactional(readOnly = true)
    public boolean existsByNickname(String nickname) throws SQLException {
        return memberRepository.existsByNickname(nickname);
    }

    // 5. 회원 정보 수정
    @Override
    public boolean modify(Member member) throws SQLException, IllegalArgumentException {
        if (member == null || member.getId() == null) {
            throw new IllegalArgumentException("회원 정보가 올바르지 않습니다.");
        }

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

    // 6. 단일 회원 조회
    @Override
    @Transactional(readOnly = true)
    public Member readOne(Long memberId) throws SQLException {
        return memberRepository.findById(memberId).orElse(null);
    }

    // 7. 전체 회원 조회
    @Override
    @Transactional(readOnly = true)
    public List<Member> readAll(Pageable pageable) throws SQLException {
        Page<Member> memberPage = memberRepository.findAll(pageable);
        return memberPage.getContent();
    }

    // 8. 회원 알림 설정 조회
    @Override
    @Transactional(readOnly = true)
    public MemberNotificationSetting readNotificationSetting(Long memberId) throws SQLException {
        if (memberId == null) {
            return null;
        }
        // ✅ Repository PK 타입이 Integer 라서 intValue() 사용
        return memberNotificationSettingRepository.findById(memberId.intValue())
                .orElse(null);
    }

    // 9. 회원 알림 설정 수정
    @Override
    public boolean updateNotificationSetting(MemberNotificationSetting setting)
            throws SQLException, IllegalArgumentException {

        // ⚠ 엔티티에 memberId 필드 없고, PK = id(Integer) 라고 가정
        if (setting == null || setting.getId() == null) {
            throw new IllegalArgumentException("설정 정보가 올바르지 않습니다.");
        }

        int updateCount = memberNotificationSettingRepository.update(
                setting.getId().longValue(),          // MEMBER_ID = PK
                setting.getCommentYn(),
                setting.getLikeYn(),
                setting.getTradeYn(),
                setting.getEventYn()
        );

        return updateCount > 0;
    }

    // 10. Member 이미지 추가
    @Override
    public boolean addImage(Long memberId, Member profileImage)
            throws SQLException, IllegalArgumentException {

        if (memberId == null || profileImage == null) {
            throw new IllegalArgumentException("입력값이 올바르지 않습니다.");
        }

        int result = memberRepository.updateImg(profileImage.getProfileImageUrl(), memberId);
        return result > 0;
    }

    // 11. Member 이미지 수정
    @Override
    public boolean modifyImage(Long memberId, Member profileImage)
            throws SQLException, IllegalArgumentException {

        if (memberId == null || profileImage == null) {
            throw new IllegalArgumentException("입력값이 올바르지 않습니다.");
        }

        int result = memberRepository.updateImg(profileImage.getProfileImageUrl(), memberId);
        return result > 0;
    }

    // 12. 회원 삭제
    @Override
    @Transactional
    public void deleteMember(Long memberId) {
        memberRepository.deleteById(memberId);
    }

    // 13. ✅ 네이버 간편 로그인 (자동 회원가입 + 로그인)
    @Override
    @Transactional
    public Member loginByNaver(NaverProfileResponse.NaverProfile profile) throws SQLException {

        if (profile == null || profile.getId() == null) {
            throw new IllegalArgumentException("네이버 프로필 정보가 올바르지 않습니다.");
        }

        String naverId = profile.getId();
        String loginId = "NAVER_" + naverId;

        // 1) 이미 네이버 계정으로 가입된 회원이면 그 회원 그대로 사용
        Optional<Member> existingOpt = memberRepository.findByLoginId(loginId);
        if (existingOpt.isPresent()) {
            return existingOpt.get();
        }

        // 2) 신규 회원 생성
        Member member = new Member();
        member.setLoginId(loginId);
        member.setLoginPw("NAVER_" + UUID.randomUUID());   // 랜덤 패스워드

        member.setNickname(
                profile.getNickname() != null && !profile.getNickname().isBlank()
                        ? profile.getNickname()
                        : "네이버사용자"
        );
        member.setEmail(profile.getEmail());
        member.setProfileImageUrl(profile.getProfileImage());

        // gender 체크 (M/F/N)
        String g = profile.getGender();
        if ("M".equalsIgnoreCase(g)) {
            member.setGender("M");
        } else if ("F".equalsIgnoreCase(g)) {
            member.setGender("F");
        } else {
            member.setGender("N");
        }

        // nationality 체크 제약: ('내국인','외국인')
        member.setNationality("내국인");

        // ⚠ 여기서도 그냥 기본값 강제
        member.setDeletedYn('N');
        member.setUserLevel(1L);

        // 3) 저장
        Member saved = memberRepository.save(member);

        // 4) 기본 알림 설정 (없으면 한 번만 생성)
        memberNotificationSettingRepository.insertDefaultIfNotExists(saved.getId());

        return saved;
    }
}
