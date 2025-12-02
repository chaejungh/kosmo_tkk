package com.smu.tkk.serviceimp;

import com.openai.client.OpenAIClient;
import com.openai.models.ChatModel;
import com.openai.models.chat.completions.ChatCompletion;
import com.openai.models.chat.completions.ChatCompletionCreateParams;
import com.smu.tkk.service.HelpAiService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class HelpAiServiceImp implements HelpAiService {

    private final OpenAIClient openAIClient;

    @Override
    public String ask(String question) {
        if (question == null || question.trim().isEmpty()) {
            question = "문의 내용이 비어 있습니다. 사용자가 어떤 내용을 궁금해하는지 알 수 없습니다.";
        }

        // 역할 프롬프트(시스템/개발자 메시지 느낌)
        String systemPrompt = """
                너는 '더쿠쿠'라는 애니 굿즈 팝업스토어 길찾기 서비스의 고객센터 상담원이야.
                반드시 한국어로만 답변하고, 존댓말을 사용해.
                너무 장황하게 길게 쓰지 말고, 핵심 위주로 3~6문장 정도로 요약해서 안내해 줘.
                각 문장은 줄바꿈으로 적당히 나눠줘.
                """;

        try {
            ChatCompletionCreateParams params = ChatCompletionCreateParams.builder()
                    // 사용 모델 (빠르고 싼 미니 모델 추천)
                    .model(ChatModel.GPT_4O_MINI)
                    .addDeveloperMessage(systemPrompt)
                    .addUserMessage(question)
                    .maxCompletionTokens(400L)
                    .build();

            ChatCompletion completion = openAIClient
                    .chat()
                    .completions()
                    .create(params);

            // 여러 choice / 여러 content 파츠가 올 수 있으니 전부 이어서 하나의 문자열로 합침
            String answer = completion.choices().stream()
                    .flatMap(choice -> choice.message().content().stream())
                    .map(Object::toString)   // content 객체의 toString()이 텍스트를 포함
                    .collect(Collectors.joining("\n"));

            if (answer == null || answer.isBlank()) {
                return "AI 응답을 가져오지 못했습니다. 잠시 후 다시 시도해 주세요.";
            }

            return answer.trim();

        } catch (Exception e) {
            e.printStackTrace();
            return "AI 서버와 통신 중 오류가 발생했습니다. 잠시 후 다시 시도해 주세요.";
        }
    }
}
