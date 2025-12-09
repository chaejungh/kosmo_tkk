package com.smu.tkk.serviceimp;

import com.smu.tkk.dto.TradePostListDto;
import com.smu.tkk.entity.TradePost;
import com.smu.tkk.entity.TradePostImage;
import com.smu.tkk.repository.*;
import com.smu.tkk.service.S3StorageService;
import com.smu.tkk.service.TradeService;
import jakarta.transaction.Transactional;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.time.LocalDateTime;
import java.time.temporal.ChronoUnit;
import java.util.List;
import java.util.Optional;

@Slf4j
@Service
@RequiredArgsConstructor
public class TradeServiceImp implements TradeService {
    private final TradeRepository tradeRepository;
    private final TradePostRepository tradePostRepository;
    private final TradePostImageRepository tradePostImageRepository;
    private final S3StorageService s3StorageService;

    // 🔥 새로 주입: 채팅방 / 북마크 레포지토리
    private final TradeChatRoomRepository tradeChatRoomRepository;
    private final TradeBookmarkRepository tradeBookmarkRepository;

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

        if (createdAt == null) return "등록 시간 없음";

        LocalDateTime now = LocalDateTime.now();
        log.info(now.toString(), createdAt.toString());

        if (createdAt.isAfter(now)) {
            return "방금 전";
        }

        long minutes = ChronoUnit.MINUTES.between(createdAt, now);
        if (minutes < 1) return "방금 전";
        if (minutes < 60) return minutes + "분 전";

        long hours = ChronoUnit.HOURS.between(createdAt, now);
        if (hours < 24) return hours + "시간 전";

        long days = ChronoUnit.DAYS.between(createdAt, now);
        if (days == 1) return "어제";
        if (days < 7) return days + "일 전";

        if (days < 30) {
            long weeks = days / 7;
            if (weeks < 1) weeks = 1;
            return weeks + "주 전";
        }

        if (days < 365) {
            long months = days / 30;
            if (months < 1) months = 1;
            return months + "개월 전";
        }

        long years = days / 365;
        if (years < 1) years = 1;
        return years + "년 전";
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

        // ⏰ 상대 시간 표시
        dto.setTimeAgo(calcTimeAgo(post.getCreatedAt()));

        // 🖼 썸네일 이미지
        Optional<TradePostImage> imgOpt =
                tradePostImageRepository.findFirstByTradeIdOrderBySortOrderAscIdAsc(post.getId());

        String thumbnail = imgOpt
                .map(TradePostImage::getImageUrl)
                .map(s3StorageService::createPresignedFromFullUrl)
                .orElse("/images/dummy/noimg.png");

        dto.setThumbnailUrl(thumbnail);

        // 👀 조회수
        dto.setViewCount(
                post.getViewCount() != null
                        ? post.getViewCount()
                        : 0L
        );

        // 👥 채팅 건 사람 수 (채팅방 개수)
        long chatCount = tradeChatRoomRepository.countByTradeId(post.getId());
        dto.setChatCount(chatCount);

        // ♥ 찜(북마크) 개수
        long likeCount = tradeBookmarkRepository.countByTradeId(post.getId());
        dto.setLikeCount(likeCount);

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
                String imageUrl = s3StorageService.upload(file);

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

    /* ============================================================
       🔥 조회수 증가
       ============================================================ */
    @Transactional
    @Override
    public void increaseViewCount(Long tradeId) {
        tradePostRepository.findById(tradeId).ifPresent(post -> {
            long current = (post.getViewCount() == null ? 0 : post.getViewCount());
            post.setViewCount(current + 1);
        });
    }
    @Override
    public Page<TradePostListDto> readAllOrderByLike(Pageable pageable) {
        Page<TradePost> posts = tradeRepository.findAllByOrderByLikeCountDesc(pageable);
        return posts.map(this::toListDTO);
    }

    @Override
    public Page<TradePostListDto> readAllOrderByView(Pageable pageable) {
        Page<TradePost> posts = tradeRepository.findAllByOrderByViewCountDesc(pageable);
        return posts.map(this::toListDTO);
    }

    @Override
    public Page<TradePostListDto> readAllOrderByLatest(Pageable pageable) {
        Page<TradePost> posts = tradeRepository.findAllByOrderByCreatedAtDesc(pageable);
        return posts.map(this::toListDTO);
    }

}