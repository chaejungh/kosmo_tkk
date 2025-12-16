package com.smu.tkk.repository;

import com.smu.tkk.entity.Member;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import java.util.Optional;

public interface MemberRepository extends JpaRepository<Member, Long> {

    // 하드 삭제 (기존에 쓰던 거 그대로 유지)
    @Modifying
    @Query(value = "DELETE FROM MEMBER WHERE MEMBER_ID = :memberId", nativeQuery = true)
    void deleteById(Long memberId);

    // 아이디 중복 확인
    boolean existsByLoginId(String loginId);

    // 닉네임 중복 확인
    boolean existsByNickname(String nickname);

    // 로그인 존재 여부 (필요하면 계속 사용)
    boolean existsByLoginIdAndLoginPw(String loginId, String loginPw);

    // ✅ 실제 로그인용: 삭제 여부까지 함께 체크
    Optional<Member> findByLoginIdAndLoginPwAndDeletedYn(String loginId,
                                                         String loginPw,
                                                         Character deletedYn);

    // 다른 곳에서 쓸 수도 있는 기본 로그인 조회
    Member findByLoginIdAndLoginPw(String loginId, String loginPw);

    // ✅ 소셜 로그인용 (네이버)
    Optional<Member> findByLoginId(String loginId);

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

    //이미지 수정(기존 이미지를 부여한다는가정하에 추가도 가능)
    @Modifying
    @Query("UPDATE Member m SET m.profileImageUrl = :imgUrl WHERE m.id = :id")
    int updateImg(String imgUrl, Long id);

    // 🔥 관리자 회원 검색용 (아이디 or 닉네임 LIKE 검색)
    Page<Member> findByLoginIdContainingIgnoreCaseOrNicknameContainingIgnoreCase(
            String loginId, String nickname, Pageable pageable
    );

    Optional<Member> findByEmail(String email);
    Optional<Member> findByEmailAndVerifyCode(String email, String verifyCode);

    Optional<Member> findByNicknameAndEmail(String nickname, String email);

    Optional<Member> findByLoginIdAndNicknameAndEmail(
            String loginId,
            String nickname,
            String email
    );
}