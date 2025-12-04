package com.smu.tkk.service;

import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.model.ObjectMetadata;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.InputStream;
import java.util.UUID;

@Service
@RequiredArgsConstructor
public class S3StorageService {

    private final AmazonS3 amazonS3;

    @Value("${cloud.aws.s3.bucket}")
    private String bucket;

    /**
     * 🔥 S3에 파일 업로드하고, 접근 가능한 URL을 리턴
     */
    public String upload(MultipartFile file) {

        try {
            if (file == null || file.isEmpty()) {
                throw new IllegalArgumentException("업로드할 파일이 없습니다.");
            }

            String originalName = file.getOriginalFilename();
            String ext = "";
            if (originalName != null && originalName.contains(".")) {
                ext = originalName.substring(originalName.lastIndexOf("."));
            }

            // trade/ 폴더 아래에 UUID_원본이름.ext 로 저장
            String key = "trade/" + UUID.randomUUID() + "_" +
                    (originalName != null ? originalName : "image") + ext;

            ObjectMetadata metadata = new ObjectMetadata();
            metadata.setContentLength(file.getSize());
            metadata.setContentType(file.getContentType());

            try (InputStream inputStream = file.getInputStream()) {
                System.out.println("📤 [S3 업로드 시작] bucket=" + bucket + ", key=" + key);
                amazonS3.putObject(bucket, key, inputStream, metadata);
            }

            String url = amazonS3.getUrl(bucket, key).toString();
            System.out.println("✅ [S3 업로드 성공] URL = " + url);

            return url;

        } catch (Exception e) {
            System.out.println("❌ [S3 업로드 실패] " + e.getClass().getSimpleName()
                    + " : " + e.getMessage());
            throw new RuntimeException("S3 파일 업로드 실패: " + e.getMessage(), e);
        }
    }
}