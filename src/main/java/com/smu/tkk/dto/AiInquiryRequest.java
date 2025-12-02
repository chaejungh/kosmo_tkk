package com.smu.tkk.dto;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class AiInquiryRequest {
    // JS에서 { question: "..." } 로 보내는 값
    private String question;
}
