package com.smu.tkk.dto;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class AiInquiryResponse {
    // 백엔드에서 AI 답변을 담아서 돌려줌
    private String answer;
}
