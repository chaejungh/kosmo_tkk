package com.smu.tkk.controller;

import com.smu.tkk.service.S3StorageService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.Map;

@RestController
@RequiredArgsConstructor
@RequestMapping("/api/upload")
public class ProfileUploadController {

    private final S3StorageService s3StorageService;

    @PostMapping("/profile")
    public Map<String, String> uploadProfile(@RequestParam("file") MultipartFile file) {
        // ✅ profile 폴더에 저장되게(아래 2번에서 오버로드 추가)
        String url = s3StorageService.upload(file, "profile");
        return Map.of("url", url);
    }
}