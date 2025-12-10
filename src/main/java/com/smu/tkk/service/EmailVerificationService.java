package com.smu.tkk.service;

import com.smu.tkk.entity.Member;
import com.smu.tkk.repository.MemberRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class EmailVerificationService {

    private final MemberRepository memberRepository;
    private final JavaMailSender mailSender;

    /** 1. 신규 회원가입 시 인증코드 생성 + 이메일 전송 */
    public Member registerNewMember(Member member) {

        // 1) LEVEL 0으로 저장
        member.setUserLevel(0L);

        // 2) 인증코드 생성
        String code = createVerifyCode();
        member.setVerifyCode(code);

        // 3) DB 저장
        Member saved = memberRepository.save(member);

        // 4) 이메일 발송
        sendVerifyEmail(saved.getEmail(), code);

        return saved;
    }

    /** LEVEL 0 → 2로 올리는 인증 로직 */
    public boolean verifyEmail(String email, String code) {

        return memberRepository.findByEmailAndVerifyCode(email, code)
                .map(member -> {

                    member.setUserLevel(2L);   // LEVEL 업
                    member.setVerifyCode(null); // 인증코드 삭제

                    memberRepository.save(member);
                    return true;
                }).orElse(false);
    }

    /** ⭐ 추가된 메서드: 이메일로 인증코드 재전송 */
    public void sendVerificationCode(String email) {

        Member member = memberRepository.findByEmail(email)
                .orElseThrow(() -> new IllegalArgumentException("등록된 이메일이 없습니다."));

        String code = createVerifyCode();
        member.setVerifyCode(code);
        memberRepository.save(member);

        sendVerifyEmail(email, code);
        System.out.println(email + " : 인증코드 재발송 완료");
    }


    /* 랜덤 6자리 인증코드 생성 */
    private String createVerifyCode() {
        int random = (int) (Math.random() * 900000) + 100000;
        return String.valueOf(random);
    }

    /* 이메일 전송 */
    private void sendVerifyEmail(String email, String code) {

        String subject = "더쿠쿠 이메일 인증코드 안내";
        String body = "안녕하세요.\n\n아래 인증코드를 입력하여 이메일 인증을 완료해주세요.\n\n" +
                "인증코드 : " + code + "\n\n감사합니다.";

        SimpleMailMessage message = new SimpleMailMessage();
        message.setTo(email);
        message.setSubject(subject);
        message.setText(body);
        mailSender.send(message);
        System.out.println(email+" : 이메일 보내기 선공");
    }

    public Member findByEmail(String email) {
        return memberRepository.findByEmail(email)
                .orElseThrow(() -> new IllegalArgumentException("존재하지 않는 이메일입니다."));
    }

}
