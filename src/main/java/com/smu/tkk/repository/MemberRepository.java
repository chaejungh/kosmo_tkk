package com.smu.tkk.repository;

import com.smu.tkk.entity.Member;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import java.util.Optional;

public interface MemberRepository extends JpaRepository<Member, Long> {

    boolean existsByLoginId(String loginId);

    boolean existsByNickname(String nickname);

    //로그인
    boolean existsByLoginIdAndLoginPw(String loginId, String loginPw);

    //회원정보수정
    @Modifying
    @Query(value = "UPDATE Member m SET m.loginId=:loginId,m.loginPw=:loginPw,m.nickname=:nickname,m.profileImageUrl=:imgUrl,m.intro=:intro,m.email=:email where m.id=:id")
    int update(String loginId, String loginPw,String nickname, String imgUrl, String intro, String email,Long id);
}