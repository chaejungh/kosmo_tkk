package com.smu.tkk.repository;

import com.smu.tkk.entity.Member;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import java.util.Optional;

public interface MemberRepository extends JpaRepository<Member, Long> {
    //아이디 중복 확인
    boolean existsByLoginId(String loginId);
    //닉네임중복확인
    boolean existsByNickname(String nickname);

    //로그인
    boolean existsByLoginIdAndLoginPw(String loginId, String loginPw);

    //회원정보수정
    @Modifying
    @Query(value = "UPDATE Member m SET m.loginId=:loginId,m.loginPw=:loginPw,m.nickname=:nickname,m.profileImageUrl=:imgUrl,m.intro=:intro,m.email=:email where m.id=:id")
    int update(String loginId, String loginPw,String nickname, String imgUrl, String intro, String email,Long id);

    //이미지 수정(기존 이미지를 부여한다는가정하에 추가도 가능)
    @Modifying
    @Query(value = "update Member m set m.profileImageUrl=:imgUrl where m.id=:id")
    int updateImg(String imgUrl,Long id);
}