package com.smu.tkk.serviceimp;

import com.smu.tkk.entity.Member;
import com.smu.tkk.repository.MemberRepository;
import com.smu.tkk.service.AdminMemberService;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@RequiredArgsConstructor
@Transactional(readOnly = true)
public class AdminMemberServiceImp implements AdminMemberService {

    private final MemberRepository memberRepository;

    /**
     * 회원 목록 조회 (검색어 optional)
     */
    @Override
    public Page<Member> readMembers(Pageable pageable, String keyword) {

        if (keyword == null || keyword.isBlank()) {
            return memberRepository.findAll(pageable);
        }

        return memberRepository
                .findByLoginIdContainingIgnoreCaseOrNicknameContainingIgnoreCase(
                        keyword, keyword, pageable
                );
    }

    /**
     * 단일 회원 조회
     */
    @Override
    public Member readMember(Long memberId) {
        return memberRepository.findById(memberId)
                .orElseThrow(() ->
                        new IllegalArgumentException("존재하지 않는 회원입니다. id=" + memberId));
    }

    /**
     * 회원 상태 변경 (정상 <-> 삭제)
     */
    @Override
    @Transactional
    public void changeMemberStatus(Long memberId, String deletedYn) {

        Member member = readMember(memberId);

        boolean deleted = false;
        if (deletedYn != null) {
            String v = deletedYn.trim().toUpperCase();
            deleted = "Y".equals(v)
                    || "TRUE".equals(v)
                    || "1".equals(v);
        }

        // Boolean -> 'Y' / 'N'
        member.setDeletedYn(deleted ? 'Y' : 'N');
    }

    /**
     * 회원 등급 변경
     */
    @Override
    @Transactional
    public void changeMemberLevel(Long memberId, Long userLevel) {

        Member member = readMember(memberId);

        if (userLevel == null) {
            throw new IllegalArgumentException("회원 등급 값이 없습니다.");
        }

        // 필요하면 허용 범위 체크
        // if (userLevel != 0L && userLevel != 1L && userLevel != 2L && userLevel != 9L) {
        //     throw new IllegalArgumentException("허용되지 않는 회원 등급입니다. value=" + userLevel);
        // }

        member.setUserLevel(userLevel);   // 🔥 여기서 Long 타입 그대로 전달
    }
}
