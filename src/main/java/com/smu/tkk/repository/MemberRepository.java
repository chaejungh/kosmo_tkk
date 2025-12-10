package com.smu.tkk.repository;

import com.smu.tkk.entity.Member;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import java.util.Optional;

public interface MemberRepository extends JpaRepository<Member, Long> {

    @Modifying
    @Query(value = "DELETE FROM MEMBER WHERE MEMBER_ID = :memberId", nativeQuery = true)
    void deleteById(Long memberId);

    // 아이디 중복 확인
    boolean existsByLoginId(String loginId);

    // 닉네임 중복 확인
    boolean existsByNickname(String nickname);

    // 로그인 여부 확인(기존 코드 – 다른 곳에서 쓰고 있을 수 있어서 유지)
    boolean existsByLoginIdAndLoginPw(String loginId, String loginPw);

    // 아이디 + 비밀번호로 단건 조회(기존 코드)
    Member findByLoginIdAndLoginPw(String loginId, String loginPw);

    // 소셜 로그인용 – loginId만으로 조회
    Optional<Member> findByLoginId(String loginId);

    // ✅ 일반 로그인용 – 삭제되지 않은 회원만
    Optional<Member> findByLoginIdAndLoginPwAndDeletedYn(String loginId,
                                                         String loginPw,
                                                         Character deletedYn);

    // 회원정보 수정
    @Modifying
    @Query("UPDATE Member m " +
            "SET m.loginId = :loginId, " +
            "    m.loginPw = :loginPw, " +
            "    m.nickname = :nickname, " +
            "    m.profileImageUrl = :imgUrl, " +
            "    m.intro = :intro, " +
            "    m.email = :email " +
            "WHERE m.id = :id")
    int update(String loginId,
               String loginPw,
               String nickname,
               String imgUrl,
               String intro,
               String email,
               Long id);

    // 이미지 수정
    @Modifying
    @Query("UPDATE Member m SET m.profileImageUrl = :imgUrl WHERE m.id = :id")
    int updateImg(String imgUrl, Long id);

    // 관리자 검색용
    Page<Member> findByLoginIdContainingIgnoreCaseOrNicknameContainingIgnoreCase(
            String loginId, String nickname, Pageable pageable
    );
}
