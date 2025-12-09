package com.smu.tkk.serviceimp;

import com.smu.tkk.entity.Member;
import com.smu.tkk.repository.MemberRepository;
import com.smu.tkk.service.AdminMemberService;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

@Service
@RequiredArgsConstructor
@Transactional(readOnly = true)
public class AdminMemberServiceImp implements AdminMemberService {

    private final MemberRepository memberRepository;

    /**
     * 관리자용 회원 목록 조회
     *  - keyword 없으면 전체
     *  - keyword 있으면 loginId OR nickname LIKE 검색
     */
    @Override
    public Page<Member> readMembers(Pageable pageable, String keyword) {
        if (StringUtils.hasText(keyword)) {
            return memberRepository
                    .findByLoginIdContainingIgnoreCaseOrNicknameContainingIgnoreCase(
                            keyword, keyword, pageable
                    );
        }
        return memberRepository.findAll(pageable);
    }

    @Override
    public Member readMember(Long memberId) {
        return memberRepository.findById(memberId)
                .orElseThrow(() ->
                        new IllegalArgumentException("회원이 존재하지 않습니다. id=" + memberId));
    }

    /**
     * 회원 상태 변경
     *  - deletedYn = "Y" / "N" / "true" / "false" / "1" / "0" 등 들어와도 처리
     *  - 엔티티 필드는 Boolean 이라고 가정
     */
    @Override
    @Transactional
    public void changeMemberStatus(Long memberId, String deletedYn) {
        Member member = readMember(memberId);

        boolean deleted = false;
        if (deletedYn != null) {
            String v = deletedYn.trim().toUpperCase();
            deleted = "Y".equals(v) || "TRUE".equals(v) || "1".equals(v);
        }

        member.setDeletedYn(deleted); // Boolean 필드
        // JPA 더티 체킹으로 UPDATE 반영
    }

    /**
     * 회원 등급 변경
     *  - userLevel(예: 1,2,9 등)을 Long으로 변환해서 저장
     */
    @Override
    @Transactional
    public void changeMemberLevel(Long memberId, Integer userLevel) {
        Member member = readMember(memberId);
        if (userLevel != null) {
            member.setUserLevel(userLevel.longValue());
        } else {
            member.setUserLevel(null);
        }
    }
}
