package com.smu.tkk.service;

import com.smu.tkk.entity.Member;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

public interface AdminMemberService {

    Page<Member> readAll(Pageable pageable, String keyword);

    Member readOne(Long memberId);

    void changeDeletedYn(Long memberId, String deletedYn);

    void changeUserLevel(Long memberId, Integer userLevel);
}
