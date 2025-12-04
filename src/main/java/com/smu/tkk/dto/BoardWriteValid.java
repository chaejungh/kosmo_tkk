package com.smu.tkk.dto;

import jakarta.validation.constraints.Max;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotBlank;
import lombok.Data;

@Data
public class BoardWriteValid {
    @NotBlank(message = "제목은 꼭 입력해야합니다.")
    private String title;
    @NotBlank(message = "내용은 꼭 입력해야합니다.")
    private String content;
    @Min(1) @Max(3)
    private Long categoryId;
}
