package com.smu.tkk.service;

import lombok.RequiredArgsConstructor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import software.amazon.awssdk.auth.credentials.AwsBasicCredentials;
import software.amazon.awssdk.auth.credentials.StaticCredentialsProvider;
import software.amazon.awssdk.core.sync.RequestBody;
import software.amazon.awssdk.regions.Region;
import software.amazon.awssdk.services.s3.S3Client;
import software.amazon.awssdk.services.s3.S3ClientBuilder;
import software.amazon.awssdk.services.s3.S3Configuration;
import software.amazon.awssdk.services.s3.model.PutObjectRequest;
import software.amazon.awssdk.services.s3.model.GetObjectRequest;
import software.amazon.awssdk.services.s3.presigner.S3Presigner;
import software.amazon.awssdk.services.s3.presigner.model.GetObjectPresignRequest;
import software.amazon.awssdk.services.s3.presigner.model.PresignedGetObjectRequest;

import java.io.IOException;
import java.net.URI;
import java.time.Duration;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Random;

@Service
@RequiredArgsConstructor
public class S3StorageService {

    private static final Logger log = LoggerFactory.getLogger(S3StorageService.class);

    @Value("${cloud.aws.credentials.access-key}")
    private String accessKey;

    @Value("${cloud.aws.credentials.secret-key}")
    private String secretKey;

    @Value("${cloud.aws.region.static}")
    private String region;

    @Value("${cloud.aws.s3.bucket}")
    private String bucket;

    // 로컬스택 같은 거 쓸 때만 application.yml 에 넣고,
    // 실제 AWS S3만 쓰면 yaml에서 이 프로퍼티 빼도 되고, 기본값 "" 로 둠
    @Value("${cloud.aws.endpoint:}")
    private String endpoint;

    /**
     * 🔧 S3Client 생성 (선생님 코드 기반)
     */
    private S3Client createClient() {
        S3ClientBuilder builder = S3Client.builder()
                .region(Region.of(region))
                .credentialsProvider(
                        StaticCredentialsProvider.create(
                                AwsBasicCredentials.create(accessKey, secretKey)
                        )
                );

        // endpoint 설정한 경우 (LocalStack 등)
        if (endpoint != null && !endpoint.isBlank()) {
            builder = builder
                    .endpointOverride(URI.create(endpoint))
                    .serviceConfiguration(
                            S3Configuration.builder()
                                    .pathStyleAccessEnabled(true)
                                    .checksumValidationEnabled(false)
                                    .chunkedEncodingEnabled(false)
                                    .build()
                    );
        }

        return builder.build();
    }

    /**
     * 🔧 S3Presigner 생성 (프리사인드 URL용)
     */
    private S3Presigner createPresigner() {
        S3Presigner.Builder builder = S3Presigner.builder()
                .region(Region.of(region))
                .credentialsProvider(
                        StaticCredentialsProvider.create(
                                AwsBasicCredentials.create(accessKey, secretKey)
                        )
                );

        if (endpoint != null && !endpoint.isBlank()) {
            builder = builder.endpointOverride(URI.create(endpoint));
        }

        return builder.build();
    }

    /**
     * 🔥 S3에 파일 업로드하고, 접근 가능한 URL을 리턴
     */
    public String upload(MultipartFile file) {

        if (file == null || file.isEmpty()) {
            throw new IllegalArgumentException("업로드할 파일이 없습니다.");
        }

        try (S3Client s3 = createClient()) {

            // 파일 이름 만들기 (현재시간 + 랜덤 + 원본이름)
            String originalName = file.getOriginalFilename();
            String safeName = (originalName != null ? originalName : "image");

            String timestamp = LocalDateTime.now()
                    .format(DateTimeFormatter.ofPattern("yyyyMMdd_HHmmss"));
            int random = new Random().nextInt(9000) + 1000;

            // 네가 쓰던 폴더 구조 유지: trade/...
            String key = "trade/" + timestamp + "_" + random + "_" + safeName;

            PutObjectRequest putObjectRequest = PutObjectRequest.builder()
                    .bucket(bucket)
                    .key(key)
                    .contentType(file.getContentType())
                    .build();

            s3.putObject(
                    putObjectRequest,
                    RequestBody.fromInputStream(file.getInputStream(), file.getSize())
            );

            log.info("✅ [S3 업로드 성공] bucket={}, key={}", bucket, key);

            // 버킷을 퍼블릭으로 열었을 때 접근 가능한 URL
            String url = String.format(
                    "https://%s.s3.%s.amazonaws.com/%s",
                    bucket, region, key
            );

            return url;

        } catch (IOException e) {
            log.error("❌ [S3 업로드 실패] {}", e.getMessage(), e);
            throw new RuntimeException("S3 파일 업로드 실패: " + e.getMessage(), e);
        }
    }

    // ============================================================
    // 🔥 여기부터 프리사인드 URL 관련 기능
    // ============================================================

    /**
     * 전체 URL에서 S3 key 부분만 추출
     * 예) https://bucket.s3.region.amazonaws.com/trade/aaa.png
     *   -> trade/aaa.png
     */
    public String extractKeyFromUrl(String url) {
        try {
            URI uri = URI.create(url);
            String path = uri.getPath();   // "/trade/xxx..."
            return path.startsWith("/") ? path.substring(1) : path;
        } catch (Exception e) {
            // 혹시 파싱 실패하면 그냥 원래 값 반환
            return url;
        }
    }

    /**
     * S3 key 로부터 10분짜리 프리사인드 GET URL 생성
     */
    public String createPresignedGetUrl(String key) {
        S3Presigner presigner = createPresigner();
        try {
            GetObjectRequest getObjectRequest = GetObjectRequest.builder()
                    .bucket(bucket)
                    .key(key)
                    .build();

            GetObjectPresignRequest presignRequest = GetObjectPresignRequest.builder()
                    .signatureDuration(Duration.ofMinutes(10)) // 10분 유효
                    .getObjectRequest(getObjectRequest)
                    .build();

            PresignedGetObjectRequest presigned =
                    presigner.presignGetObject(presignRequest);

            return presigned.url().toString();
        } finally {
            presigner.close();
        }
    }

    /**
     * DB에 전체 URL이 들어있을 때,
     * 그걸 프리사인드 URL로 변환해 주는 helper
     */
    public String createPresignedFromFullUrl(String url) {
        String key = extractKeyFromUrl(url);
        return createPresignedGetUrl(key);
    }
}