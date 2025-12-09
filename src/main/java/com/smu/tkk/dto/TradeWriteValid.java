package com.smu.tkk.dto;

import jakarta.validation.constraints.NotBlank;
import lombok.Data;

@Data
public class TradeWriteValid {
    @NotBlank
    private String title;
    private Long price;
    @NotBlank
    private String region;
    @NotBlank
    private String category;
    @NotBlank
    private String tradeMethod;
    @NotBlank(message = "내용은 꼭 입력해야합니다.")
    private String content;
    @NotBlank
    private String status;
}
