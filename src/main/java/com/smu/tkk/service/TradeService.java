package com.smu.tkk.service;

import com.smu.tkk.dto.TradePostListDto;
import com.smu.tkk.entity.TradePost;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

public interface TradeService {

    /* ============================================================
       🔥 1) 거래글 등록 (글쓰기)
       ============================================================ */
    TradePost registerTradePost(TradePost tradePost);


    /* ============================================================
       🔥 2) 거래글 수정
       ============================================================ */
    TradePost modifyTradePost(TradePost tradePost);


    /* ============================================================
       🔥 3) 거래글 삭제
       ============================================================ */
    TradePost removeTradePost(TradePost tradePost);


    /* ============================================================
       🔥 4) 거래글 단건 조회 (TradePost 엔티티로 조회)
       ============================================================ */
    TradePost readOneTradePost(TradePost tradePost);


    /* ============================================================
       🔥 5) 거래글 ID로 단건 조회 (상세)
       ============================================================ */
    TradePost readOneTradePostById(Long tradeId);


    /* ============================================================
       🔥 6) 거래글 목록 조회 (엔티티)
       ============================================================ */
    Page<TradePost> readAll(Pageable pageable);


    /* ============================================================
       🔥 7) 거래글 목록 조회 (DTO 변환된 리스트)
       ============================================================ */
    Page<TradePostListDto> readAllListDto(Pageable pageable);


    /* ============================================================
       🔥 8) 거래 검색 (제목 + 내용 + 지역 + 굿즈명)
       ============================================================ */
    Page<TradePost> search(String keyword, Pageable pageable);


    /* ============================================================
       ⚠ 9) 상태만 수정하는 오래된 메서드 (이름 비추천)
       ============================================================ */
    TradePost modifyTradepost(TradePost tradePostId, TradePost tradePostStatus);

    void register(TradePost post);

    // 10. 멤버 별 거래글 조회
    Page<TradePost> readBySellerId(Long sellerId, Pageable pageable);


    /* ============================================================
       ⭐ 11) 이미지 포함 거래글 등록 (새로 추가)
       ============================================================ */
    void createPostWithImages(TradePost post, List<MultipartFile> images);

    TradePostListDto toListDTO(TradePost post);

    /* ============================================================
       ⭐ 12) 조회수 증가
       ============================================================ */
    void increaseViewCount(Long tradeId);

    // 13) 찜순
    Page<TradePostListDto> readAllOrderByLike(Pageable pageable);

    // 14) 조회순
    Page<TradePostListDto> readAllOrderByView(Pageable pageable);

    // 15) 최신순
    Page<TradePostListDto> readAllOrderByLatest(Pageable pageable);
}