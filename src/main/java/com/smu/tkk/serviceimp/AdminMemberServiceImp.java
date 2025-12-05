package com.smu.tkk.serviceimp;

import com.smu.tkk.entity.Member;
import com.smu.tkk.repository.MemberRepository;
import com.smu.tkk.service.AdminMemberService;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import java.util.List;
import java.util.Locale;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
@Transactional
public class AdminMemberServiceImp implements AdminMemberService {

    private final MemberRepository memberRepository;

    /**
     * 관리자 – 회원 목록 조회
     * - keyword 없으면: 그냥 페이징 findAll
     * - keyword 있으면: 로그인ID 또는 닉네임에 keyword 포함되는 회원만 필터링
     *   (레포지토리 커스텀 메서드 안 쓰고, 서비스에서 필터링)
     */
    @Override
    @Transactional(readOnly = true)
    public Page<Member> readAll(Pageable pageable, String keyword) {

        // 검색어가 없으면 원래대로 레포지토리 페이징 사용
        if (!StringUtils.hasText(keyword)) {
            return memberRepository.findAll(pageable);
        }

        String lower = keyword.toLowerCase(Locale.ROOT);

        // 1) 전체 회원 리스트(삭제 여부 상관없이) 한 번 가져오고
        List<Member> allMembers = memberRepository.findAll();

        // 2) 로그인ID / 닉네임 기준으로 필터링
        List<Member> filtered = allMembers.stream()
                .filter(m -> {
                    String loginId = m.getLoginId();
                    String nickname = m.getNickname();

                    boolean matchId = loginId != null &&
                            loginId.toLowerCase(Locale.ROOT).contains(lower);
                    boolean matchNick = nickname != null &&
                            nickname.toLowerCase(Locale.ROOT).contains(lower);

                    return matchId || matchNick;
                })
                .collect(Collectors.toList());

        // 3) 필터링된 결과에 대해 수동 페이징
        int start = (int) pageable.getOffset();
        int end = Math.min(start + pageable.getPageSize(), filtered.size());

        List<Member> pageContent =
                (start >= filtered.size()) ? List.of() : filtered.subList(start, end);

        return new PageImpl<>(pageContent, pageable, filtered.size());
    }

    /**
     * 관리자 – 단일 회원 조회
     */
    @Override
    @Transactional(readOnly = true)
    public Member readOne(Long memberId) {
        return memberRepository.findById(memberId)
                .orElseThrow(() ->
                        new IllegalArgumentException("회원이 존재하지 않습니다. id=" + memberId));
    }

    /**
     * 관리자 – 회원 탈퇴/복구 플래그 변경
     * deletedYn 파라미터는 "Y" / "N" 이라고 가정하고,
     * 엔티티의 deletedYn 이 Boolean 이라서 true/false 로 변환해 줌.
     */
    @Override
    public void changeDeletedYn(Long memberId, String deletedYn) {
        Member member = readOne(memberId);

        // "Y" 이면 true, 그 외는 false 로 처리
        boolean flag = "Y".equalsIgnoreCase(deletedYn);

        member.setDeletedYn(flag);
    }

    /**
     * 관리자 – 회원 등급 변경
     * userLevel 이 null 이 아니라고 가정.
     * 엔티티가 int / Integer 어느 쪽이어도 int로 넣으면 둘 다 호환됨.
     */
    @Override
    public void changeUserLevel(Long memberId, Integer userLevel) {
        Member member = readOne(memberId);

        if (userLevel != null) {
            // Member 엔티티가 Long 타입이라서 Long으로 변환해서 넣어줌
            member.setUserLevel(userLevel.longValue());
        }
    }
}
