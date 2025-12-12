package com.smu.tkk.dto;

import jakarta.validation.constraints.Max;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotBlank;
import lombok.Data;

@Data
public class BoardWriteValid {
    @NotBlank
    private String title;
    @NotBlank
    private String content;
    @Min(1) @Max(3)
    private Long categoryId;
}
