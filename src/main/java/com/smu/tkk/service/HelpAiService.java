package com.smu.tkk.service;

public interface HelpAiService {

    /**
     * 사용자의 질문을 받아서 OpenAI에 물어보고,
     * AI의 답변 텍스트만 리턴하는 메서드
     */
    String ask(String question);
}
