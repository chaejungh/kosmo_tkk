package com.smu.tkk.serviceimp;

import com.smu.tkk.service.HelpAiService;
import lombok.RequiredArgsConstructor;
import org.springframework.ai.ollama.OllamaChatModel;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class HelpAiServiceImp implements HelpAiService {

    // 🔹 티스토리 글처럼 OllamaChatModel 주입받기
    private final OllamaChatModel chatModel;

    @Override
    public String ask(String question) {
        if (question == null || question.isBlank()) {
            question = "문의 내용이 비어 있습니다.";
        }

        // 역할 프롬프트 + 유저 질문 한 번에 던지기
        String prompt = """
                너는 '더쿠쿠'라는 애니 굿즈 팝업스토어 길찾기 서비스의 고객센터 상담원이야.
                항상 한국어 존댓말로만 답변해 줘.
                답변은 너무 길지 않게 3~6문장 정도로 핵심만 정리해서 안내해 줘.

                [사용자 문의]
                %s
                """.formatted(question);

        try {
            // 티스토리 예제: return chatModel.call(question);
            return chatModel.call(prompt);
        } catch (Exception e) {
            e.printStackTrace();
            return "현재 AI 상담 기능에서 오류가 발생했습니다.\n" +
                    "잠시 후 다시 시도하시거나, 1:1 문의를 남겨 주세요.";
        }
    }
}
