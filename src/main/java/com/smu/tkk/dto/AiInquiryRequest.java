package com.smu.tkk.dto;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class AiInquiryRequest {
    private String question;   // 프론트에서 오는 문의 내용
}
