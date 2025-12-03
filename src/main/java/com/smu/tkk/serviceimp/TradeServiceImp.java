package com.smu.tkk.serviceimp;

import com.smu.tkk.dto.TradePostListDto;
import com.smu.tkk.entity.TradePost;
import com.smu.tkk.entity.TradePostImage;
import com.smu.tkk.repository.TradePostImageRepository;
import com.smu.tkk.repository.TradePostRepository;
import com.smu.tkk.service.FileStorageService;
import com.smu.tkk.service.TradeService;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Value;
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
    private final FileStorageService fileStorageService;

    @Value("${file.upload-dir}")
    private String uploadPath;

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
       🔥 검색 기능 구현 (필수 수정)
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
       🔥 리스트 DTO 변환 (컨트롤러 중복 제거)
       ============================================================ */
    @Override
    public TradePostListDto toListDTO(TradePost post) {

        TradePostListDto dto = new TradePostListDto();
        dto.setId(post.getId());
        dto.setTitle(post.getTitle());
        dto.setRegion(post.getRegion() != null ? post.getRegion() : "지역 미지정");

        // 가격 표시
        if (post.getPrice() == null) dto.setPriceText("가격 미정");
        else dto.setPriceText(String.format("%,d원", post.getPrice()));

        // 상대 시간 표시
        dto.setTimeAgo(calcTimeAgo(post.getCreatedAt()));

        // 썸네일 지정
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
       🔥 이미지 저장 포함한 글 등록
       ============================================================ */
    @Override
    public void createPostWithImages(TradePost post, List<MultipartFile> images) {

        TradePost savedPost = tradePostRepository.save(post);

        if (images == null || images.isEmpty()) return;

        int sortOrder = 1;

        for (MultipartFile file : images) {
            if (file.isEmpty()) continue;

            try {
                String imageUrl = fileStorageService.saveFile(file);

                TradePostImage img = new TradePostImage();
                img.setTradeId(savedPost.getId());
                img.setImageUrl(imageUrl);
                img.setSortOrder((long) sortOrder++);

                tradePostImageRepository.save(img);

            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}