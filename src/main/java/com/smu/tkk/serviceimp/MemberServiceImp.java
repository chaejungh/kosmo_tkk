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

    /** ✅ MySQL/Oracle 상관없이: 알림설정 없으면 생성 */
    private void ensureDefaultNotificationSetting(Long memberId) {
        memberNotificationSettingRepository.findById(memberId).orElseGet(() -> {
            MemberNotificationSetting s = new MemberNotificationSetting();
            s.setMember(memberRepository.getReferenceById(memberId)); // @MapsId 필수
            return memberNotificationSettingRepository.save(s);
        });
    }

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

        member.setDeletedYn('N');

        if (member.getUserLevel() == null) {
            member.setUserLevel(1L);
        }

        Member savedMember = memberRepository.save(member);

        // ✅ (기존 MERGE 제거) 알림 기본값 보장
        ensureDefaultNotificationSetting(savedMember.getId());

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

        Member member = memberRepository.findByLoginIdAndLoginPw(loginId, loginPw);

        if (member == null) {
            return null;
        }

        char deletedYn = member.getDeletedYn();
        if (deletedYn == 'Y') {
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
        // ✅ (기존 intValue 제거)
        return memberNotificationSettingRepository.findById(memberId).orElse(null);
    }

    // 9. 회원 알림 설정 수정
    @Override
    public boolean updateNotificationSetting(MemberNotificationSetting setting)
            throws SQLException, IllegalArgumentException {

        if (setting == null || setting.getId() == null) {
            throw new IllegalArgumentException("설정 정보가 올바르지 않습니다.");
        }

        // ✅ (기존 native update 제거) 조회 후 수정 + save
        MemberNotificationSetting existing = memberNotificationSettingRepository.findById(setting.getId())
                .orElseThrow(() -> new IllegalArgumentException("설정 정보가 올바르지 않습니다."));

        existing.setCommentYn(setting.getCommentYn());
        existing.setLikeYn(setting.getLikeYn());
        existing.setTradeYn(setting.getTradeYn());
        existing.setEventYn(setting.getEventYn());

        memberNotificationSettingRepository.save(existing);
        return true;
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

        Optional<Member> existingOpt = memberRepository.findByLoginId(loginId);
        if (existingOpt.isPresent()) {
            return existingOpt.get();
        }

        Member member = new Member();
        member.setLoginId(loginId);
        member.setLoginPw("NAVER_" + UUID.randomUUID());

        String nickname = profile.getNickname();
        if (nickname == null || nickname.isBlank()) {
            nickname = "네이버사용자";
        }
        member.setNickname(nickname);

        member.setEmail(profile.getEmail());
        member.setProfileImageUrl(profile.getProfileImage());

        String g = profile.getGender();
        String dbGender;
        if ("M".equalsIgnoreCase(g) || "male".equalsIgnoreCase(g) || "남".equals(g)) {
            dbGender = "남자";
        } else if ("F".equalsIgnoreCase(g) || "female".equalsIgnoreCase(g) || "여".equals(g)) {
            dbGender = "여자";
        } else {
            dbGender = "남자";
        }
        member.setGender(dbGender);

        member.setNationality("내국인");

        member.setDeletedYn('N');
        if (member.getUserLevel() == null) {
            member.setUserLevel(1L);
        }

        Member saved = memberRepository.save(member);

        // ✅ (기존 MERGE 제거) 알림 기본값 보장
        ensureDefaultNotificationSetting(saved.getId());

        return saved;
    }

    // 14. 이메일 변경
    @Override
    public void updateEmail(Long memberId, String email) throws SQLException {
        Member member = memberRepository.findById(memberId)
                .orElseThrow(() -> new IllegalArgumentException("존재하지 않는 회원입니다."));

        member.setEmail(email);
        memberRepository.save(member);
    }

    // 15. 닉네임 + 이메일로 회원 조회
    @Override
    public Member readByNicknameAndEmail(String nickname, String email) {
        return memberRepository.findByNicknameAndEmail(nickname, email)
                .orElse(null);
    }

    // 16. 아이디 + 닉네임 + 이메일로 회원 조회
    @Override
    public Member readByLoginIdAndNicknameAndEmail(String loginId, String nickname, String email) {
        return memberRepository
                .findByLoginIdAndNicknameAndEmail(loginId, nickname, email)
                .orElse(null);
    }
}
