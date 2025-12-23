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
import java.net.URLDecoder;
import java.nio.charset.StandardCharsets;
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

    // ============================================================
    // 🔥 업로드
    // ============================================================

    /**
     * ✅ 기존 메서드 유지:
     * 기존에 trade/ 폴더로 업로드되던 동작 그대로 보장
     */
    public String upload(MultipartFile file) {
        return upload(file, "trade"); // ✅ 기존 동작 유지
    }

    /**
     * ✅ 추가: 폴더 지정 업로드
     * ex) upload(file, "profile") -> profile/xxx.jpg
     */
    public String upload(MultipartFile file, String dir) {

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

            // ✅ 폴더만 바뀜 (trade/..., profile/..., popup/..., etc/...)
            String folder = (dir == null || dir.isBlank()) ? "etc" : dir;
            String key = folder + "/" + timestamp + "_" + random + "_" + safeName;

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
            return String.format(
                    "https://%s.s3.%s.amazonaws.com/%s",
                    bucket, region, key
            );

        } catch (IOException e) {
            log.error("❌ [S3 업로드 실패] {}", e.getMessage(), e);
            throw new RuntimeException("S3 파일 업로드 실패: " + e.getMessage(), e);
        }
    }

    // ============================================================
    // 🔥 여기부터 프리사인드 URL 관련 기능
    // ============================================================


    public String extractKeyFromUrl(String url) {
        if (url == null || url.isBlank()) return null;

        // 이미 key만 들어오는 경우 (예: "trade/xxx.png")
        if (!url.startsWith("http://") && !url.startsWith("https://")) {
            String key = url.startsWith("/") ? url.substring(1) : url;
            return key;
        }

        URI uri = URI.create(url);

        // 예: "/trade/%5B%EA%B7%80%EB%A9%B8%5D...PNG"
        String rawPath = uri.getRawPath();
        if (rawPath == null) return null;

        // 앞 "/" 제거
        String path = rawPath.startsWith("/") ? rawPath.substring(1) : rawPath;

        // path-style URL 방어:
        // https://s3.ap-northeast-2.amazonaws.com/{bucket}/{key}
        // 이런 형태면 맨 앞 bucket을 제거해야 함
        if (path.startsWith(bucket + "/")) {
            path = path.substring((bucket + "/").length());
        }

        // URL 인코딩 해제 (%EA%B7... -> "귀멸" 등)
        String decoded = URLDecoder.decode(path, StandardCharsets.UTF_8);

        return decoded;
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