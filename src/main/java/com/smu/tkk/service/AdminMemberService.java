package com.smu.tkk.service;

import com.smu.tkk.entity.Member;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

public interface AdminMemberService {

    Page<Member> readMembers(Pageable pageable, String keyword);

    Member readMember(Long memberId);

    void changeMemberStatus(Long memberId, String deletedYn);

    // 🔥 여기 Long 으로!
    void changeMemberLevel(Long memberId, Long userLevel);
}
