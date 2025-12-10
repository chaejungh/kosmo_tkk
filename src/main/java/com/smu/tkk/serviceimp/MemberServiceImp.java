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
    public boolean register(Member member) throws SQLException {
        if (member == null) {
            throw new IllegalArgumentException("회원 정보가 없습니다.");
        }

        if (existsByLoginId(member.getLoginId())) {
            throw new IllegalArgumentException("이미 존재하는 아이디입니다.");
        }

        if (existsByNickname(member.getNickname())) {
            throw new IllegalArgumentException("이미 존재하는 닉네임입니다.");
        }

        // 기본값 강제 세팅
        member.setDeletedYn('N');      // 탈퇴 여부 기본값
        if (member.getUserLevel() == null) {
            member.setUserLevel(1L);   // 일반 회원
        }

        Member savedMember = memberRepository.save(member);

        // 기본 알림 설정 생성 (일반 회원 가입시에만)
        MemberNotificationSetting setting = new MemberNotificationSetting();
        setting.setId(savedMember.getId());
        setting.setCommentYn("Y");
        setting.setLikeYn("Y");
        setting.setTradeYn("Y");
        setting.setEventYn("Y");
        memberNotificationSettingRepository.save(setting);

        return true;
    }

    // 2. 로그인 (탈퇴하지 않은 회원만)
    @Override
    @Transactional(readOnly = true)
    public Member login(String loginId, String loginPw) throws SQLException {
        if (loginId == null || loginPw == null) {
            throw new IllegalArgumentException("아이디와 비밀번호를 입력해주세요.");
        }

        // 로그인 아이디 + 비밀번호 + deleted_yn = 'N' 인 회원만 조회
        Optional<Member> memberOpt =
                memberRepository.findByLoginIdAndLoginPwAndDeletedYn(loginId, loginPw, 'N');

        return memberOpt.orElse(null);
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
    public boolean modify(Member member) throws SQLException {
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
        // 기존 코드 그대로 유지 (ID 타입이 Long/Integer 상관없이 돌아가는 형태라서)
        return memberNotificationSettingRepository.findById(memberId.intValue()).orElse(null);
    }

    // 9. 회원 알림 설정 수정
    @Override
    public boolean updateNotificationSetting(MemberNotificationSetting setting)
            throws SQLException {

        if (setting == null || setting.getId() == null) {
            throw new IllegalArgumentException("설정 정보가 올바르지 않습니다.");
        }

        int updateCount = memberNotificationSettingRepository.update(
                setting.getId(),
                setting.getCommentYn(),
                setting.getLikeYn(),
                setting.getTradeYn(),
                setting.getEventYn()
        );

        return updateCount > 0;
    }

    // 10. Member 이미지 추가
    @Override
    public boolean addImage(Long memberId, Member profileImage) throws SQLException {
        if (memberId == null || profileImage == null) {
            throw new IllegalArgumentException("입력값이 올바르지 않습니다.");
        }

        int result = memberRepository.updateImg(profileImage.getProfileImageUrl(), memberId);
        return result > 0;
    }

    // 11. Member 이미지 수정
    @Override
    public boolean modifyImage(Long memberId, Member profileImage) throws SQLException {
        if (memberId == null || profileImage == null) {
            throw new IllegalArgumentException("입력값이 올바르지 않습니다.");
        }

        int result = memberRepository.updateImg(profileImage.getProfileImageUrl(), memberId);
        return result > 0;
    }

    // 12. 회원 삭제 (하드 삭제)
    @Override
    @Transactional
    public void deleteMember(Long memberId) {
        memberRepository.deleteById(memberId);
    }

    // 13. 네이버 간편 로그인 (자동 회원가입 + 로그인)
    @Override
    @Transactional
    public Member loginByNaver(NaverProfileResponse.NaverProfile profile) throws SQLException {

        if (profile == null || profile.getId() == null) {
            throw new IllegalArgumentException("네이버 프로필 정보가 올바르지 않습니다.");
        }

        String naverId = profile.getId();
        String loginId = "NAVER_" + naverId;

        // 이미 네이버로 가입한 회원이면 그대로 리턴
        Optional<Member> existingOpt = memberRepository.findByLoginId(loginId);
        if (existingOpt.isPresent()) {
            return existingOpt.get();
        }

        // 신규 회원 생성
        Member member = new Member();
        member.setLoginId(loginId);
        member.setLoginPw("NAVER_" + UUID.randomUUID());

        if (profile.getNickname() != null && !profile.getNickname().isBlank()) {
            member.setNickname(profile.getNickname());
        } else {
            member.setNickname("네이버사용자");
        }

        member.setEmail(profile.getEmail());
        member.setProfileImageUrl(profile.getProfileImage());

        // gender 제약: '남자', '여자' 만 허용
        String g = profile.getGender();
        if ("M".equalsIgnoreCase(g)) {
            member.setGender("남자");
        } else if ("F".equalsIgnoreCase(g)) {
            member.setGender("여자");
        } else {
            member.setGender(null);     // 다른 값은 저장 안 함(체크 제약 피하기)
        }

        // nationality 제약: nationality IN ('내국인','외국인')
        member.setNationality("내국인");

        member.setDeletedYn('N');
        member.setUserLevel(1L);

        // 네이버 로그인에서 알림 설정은 따로 생성하지 않음 (더미/기존 데이터 사용)
        return memberRepository.save(member);
    }
}
