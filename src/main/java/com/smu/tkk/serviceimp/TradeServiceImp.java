package com.smu.tkk.serviceimp;

import com.smu.tkk.dto.TradePostListDto;
import com.smu.tkk.entity.TradePost;
import com.smu.tkk.entity.TradePostImage;
import com.smu.tkk.repository.TradePostImageRepository;
import com.smu.tkk.repository.TradePostRepository;
import com.smu.tkk.service.S3StorageService;
import com.smu.tkk.service.TradeService;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.time.LocalDateTime;
import java.time.temporal.ChronoUnit;
import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class TradeServiceImp implements TradeService {

    private final TradePostRepository tradePostRepository;
    private final TradePostImageRepository tradePostImageRepository;
    private final S3StorageService s3StorageService;

    @Override
    public TradePost registerTradePost(TradePost tradePost) {
        return tradePostRepository.save(tradePost);
    }

    @Override
    public TradePost modifyTradePost(TradePost tradePost) {
        return tradePostRepository.save(tradePost);
    }

    @Override
    public TradePost removeTradePost(TradePost tradePost) {
        tradePostRepository.delete(tradePost);
        return tradePost;
    }

    @Override
    public TradePost readOneTradePost(TradePost tradePost) {
        return tradePostRepository.findById(tradePost.getId()).orElse(null);
    }

    @Override
    public TradePost readOneTradePostById(Long tradeId) {
        return tradePostRepository.findById(tradeId).orElse(null);
    }

    @Override
    public Page<TradePost> readAll(Pageable pageable) {
        return tradePostRepository.findAll(pageable);
    }

    @Override
    public Page<TradePost> readBySellerId(Long sellerId, Pageable pageable) {
        return tradePostRepository.findBySellerId(sellerId, pageable);
    }

    @Override
    public TradePost modifyTradepost(TradePost tradePostId, TradePost tradePostStatus) {
        tradePostId.setStatus(tradePostStatus.getStatus());
        return tradePostRepository.save(tradePostId);
    }

    @Override
    public void register(TradePost post) { }

    /* ============================================================
       🔥 검색 기능 구현
       ============================================================ */
    @Override
    public Page<TradePost> search(String keyword, Pageable pageable) {
        return tradePostRepository.search(keyword, pageable);
    }

    /* ============================================================
       🔥 상대 시간 계산
       ============================================================ */
    private String calcTimeAgo(LocalDateTime createdAt) {

        if (createdAt == null) return "방금 전";

        LocalDateTime now = LocalDateTime.now();

        long minutes = ChronoUnit.MINUTES.between(createdAt, now);
        long hours = ChronoUnit.HOURS.between(createdAt, now);
        long days = ChronoUnit.DAYS.between(createdAt, now);

        if (minutes < 1) return "방금 전";
        if (minutes < 60) return minutes + "분 전";
        if (hours < 24) return hours + "시간 전";
        if (days == 1) return "어제";
        return days + "일 전";
    }

    /* ============================================================
       🔥 리스트 DTO 변환
       ============================================================ */
    @Override
    public TradePostListDto toListDTO(TradePost post) {

        TradePostListDto dto = new TradePostListDto();
        dto.setId(post.getId());
        dto.setTitle(post.getTitle());
        dto.setRegion(post.getRegion() != null ? post.getRegion() : "지역 미지정");

        if (post.getPrice() == null) dto.setPriceText("가격 미정");
        else dto.setPriceText(String.format("%,d원", post.getPrice()));

        dto.setTimeAgo(calcTimeAgo(post.getCreatedAt()));

        Optional<TradePostImage> imgOpt =
                tradePostImageRepository.findFirstByTradeIdOrderBySortOrderAscIdAsc(post.getId());

        String thumbnail = imgOpt.map(TradePostImage::getImageUrl)
                .orElse("/images/dummy/noimg.png");

        dto.setThumbnailUrl(thumbnail);

        return dto;
    }

    /* ============================================================
       🔥 리스트 DTO 전체 변환
       ============================================================ */
    @Override
    public Page<TradePostListDto> readAllListDto(Pageable pageable) {

        Page<TradePost> page = tradePostRepository.findAll(pageable);

        return page.map(this::toListDTO);
    }

    /* ============================================================
       🔥 이미지 저장 포함한 글 등록 (S3 적용)
       ============================================================ */
    @Override
    public void createPostWithImages(TradePost post, List<MultipartFile> images) {

        // 1) 글 먼저 저장
        TradePost savedPost = tradePostRepository.save(post);

        if (images == null || images.isEmpty()) {
            System.out.println("⚠ createPostWithImages: 전달된 이미지가 없습니다.");
            return;
        }

        System.out.println("✅ createPostWithImages: 이미지 개수 = " + images.size());

        int sortOrder = 1;

        for (MultipartFile file : images) {
            if (file.isEmpty()) {
                System.out.println("⚠ 비어있는 파일 하나 건너뜀");
                continue;
            }

            try {
                // 2) S3 업로드
                String imageUrl = s3StorageService.upload(file);

                // 3) DB에 이미지 정보 저장
                TradePostImage img = new TradePostImage();
                img.setTradeId(savedPost.getId());
                img.setImageUrl(imageUrl);
                img.setSortOrder((long) sortOrder++);

                tradePostImageRepository.save(img);
                System.out.println("✅ TradePostImage 저장 완료: " + imageUrl);

            } catch (Exception e) {
                System.out.println("❌ createPostWithImages 내부 에러: " + e.getMessage());
                e.printStackTrace();
            }
        }
    }
}