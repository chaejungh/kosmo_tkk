package com.smu.tkk.serviceimp;

import com.smu.tkk.dto.TradePostListDto;
import com.smu.tkk.entity.TradePost;
import com.smu.tkk.entity.TradePostImage;
import com.smu.tkk.repository.TradePostImageRepository;
import com.smu.tkk.repository.TradePostRepository;
import com.smu.tkk.service.TradeService;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

@Service
@RequiredArgsConstructor
public class TradeServiceImp implements TradeService {

    private final TradePostRepository tradePostRepository;
    private final TradePostImageRepository tradePostImageRepository;

    /* 📌 이미지 저장 경로 (application.yaml에 설정됨) */
    @Value("${file.upload-dir}")
    private String uploadPath;

    /* =========================================================
       🔵 기존 기능 (절대 삭제 X)
       ========================================================= */
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
    public Page<TradePost> readAll(Pageable pageable) {
        return tradePostRepository.findAll(pageable);
    }

    @Override
    public TradePost modifyTradepost(TradePost tradePostId, TradePost tradePostStatus) {
        tradePostId.setStatus(tradePostStatus.getStatus());
        return tradePostRepository.save(tradePostId);
    }

    @Override
    public void register(TradePost post) { }

    @Override
    public Page<TradePost> readBySellerId(Long sellerId, Pageable pageable) {
        return tradePostRepository.findBySellerId(sellerId, pageable);
    }

    @Override
    public TradePost readOneTradePostById(Long tradeId) {
        return tradePostRepository.findById(tradeId).orElse(null);
    }

    /* =========================================================
       🔵 DTO 변환 목록
       ========================================================= */
    @Override
    public Page<TradePostListDto> readAllListDto(Pageable pageable) {

        Page<TradePost> page = tradePostRepository.findAll(pageable);

        return page.map(post -> {
            Optional<TradePostImage> imgOpt =
                    tradePostImageRepository.findFirstByTradeIdOrderBySortOrderAscIdAsc(post.getId());

            String thumbnail = imgOpt
                    .map(TradePostImage::getImageUrl)
                    .orElse("/images/dummy/noimg.png");

            String timeAgo = calcTimeAgo(post.getCreatedAt());

            return new TradePostListDto(post, thumbnail, timeAgo);
        });
    }

    /* =========================================================
       🔥 검색 기능
       ========================================================= */
    @Override
    public Page<TradePost> search(String keyword, Pageable pageable) {
        return tradePostRepository.search(keyword, pageable);
    }

    /* =========================================================
       🔧 시간 계산
       ========================================================= */
    private String calcTimeAgo(LocalDate createdAt) {
        if (createdAt == null) return "방금 전";

        long days = ChronoUnit.DAYS.between(createdAt, LocalDate.now());

        if (days < 1) return "오늘";
        if (days == 1) return "1일 전";
        return days + "일 전";
    }

    /* =========================================================
       ⭐⭐ 수정 완료: 이미지 서버 + DB 저장 ⭐⭐
       ========================================================= */
    @Override
    public void createPostWithImages(TradePost post, List<MultipartFile> images) {

        // 1) 글 먼저 저장
        TradePost savedPost = tradePostRepository.save(post);

        // 이미지 없으면 종료
        if (images == null || images.isEmpty()) return;

        int sortOrder = 1;

        for (MultipartFile file : images) {
            if (file.isEmpty()) continue;

            try {
                // 파일명 생성
                String uuid = UUID.randomUUID().toString();
                String original = file.getOriginalFilename();
                String ext = original != null && original.contains(".")
                        ? original.substring(original.lastIndexOf("."))
                        : "";

                String storedName = uuid + ext;

                // 저장할 폴더
                File dir = new File(uploadPath + "/trade/");
                if (!dir.exists()) dir.mkdirs();

                // 실제 저장
                File destination = new File(dir, storedName);
                file.transferTo(destination);

                // DB 저장
                TradePostImage img = new TradePostImage();
                img.setTradeId(savedPost.getId());
                img.setImageUrl("/uploads/trade/" + storedName); // ⭐ HTML에서 사용
                img.setSortOrder((long) sortOrder++);

                tradePostImageRepository.save(img);

            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    @Override
    public TradePostListDto toListDTO(TradePost post) {
        return null;
    }
}