package com.smu.tkk.service;

import com.smu.tkk.entity.Member;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

public interface AdminMemberService {

    // 회원 목록 (검색 포함)
    Page<Member> readMembers(Pageable pageable, String keyword);

    // 회원 한 명 조회
    Member readMember(Long memberId);

    // 회원 상태 변경 (활성/비활성 토글)
    void changeMemberStatus(Long memberId, String deletedYn);

    // 회원 등급 변경
    void changeMemberLevel(Long memberId, Integer userLevel);
}
