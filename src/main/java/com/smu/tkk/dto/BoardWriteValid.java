package com.smu.tkk.dto;

import jakarta.validation.constraints.NotBlank;
import lombok.Data;

@Data
public class BoardWriteValid {
    @NotBlank(message = "제목은 꼭 입력해야합니다.")
    private String title;
    @NotBlank(message = "내용은 꼭 입력해야합니다.")
    private String content;
}
