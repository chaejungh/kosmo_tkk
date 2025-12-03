package com.smu.tkk.service;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.util.UUID;

@Service
public class FileStorageService {

    // ⭐ 절대경로로 고정 — Tomcat 임시폴더 문제 해결
    private final String uploadDir = System.getProperty("user.dir")
            + "/src/main/resources/static/uploads/trade";

    public FileStorageService() {
        File dir = new File(uploadDir);
        if (!dir.exists()) {
            dir.mkdirs();  // 폴더 자동 생성
        }
    }

    public String saveFile(MultipartFile file) {
        try {
            String fileName = UUID.randomUUID() + "_" + file.getOriginalFilename();
            File dest = new File(uploadDir, fileName);

            file.transferTo(dest);  // 절대 경로 저장

            return "/uploads/trade/" + fileName;  // 웹에서 접근할 URL
        } catch (Exception e) {
            throw new RuntimeException("파일 저장 실패: " + e.getMessage());
        }
    }
}