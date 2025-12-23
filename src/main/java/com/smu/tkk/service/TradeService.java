package com.smu.tkk.service;

import com.smu.tkk.dto.TradePostListDto;
import com.smu.tkk.entity.TradePost;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

public interface TradeService {

    // 목록 정렬
    Page<TradePostListDto> readAllOrderByLatest(Pageable pageable);
    Page<TradePostListDto> readAllOrderByLike(Pageable pageable);
    Page<TradePostListDto> readAllOrderByView(Pageable pageable);

    // 검색 / 판매자목록 (DTO로 바로)
    Page<TradePostListDto> searchDto(String keyword, Pageable pageable);
    Page<TradePostListDto> readBySellerIdDto(Long sellerId, Pageable pageable);

    Page<TradePost> readAll(Pageable pageable);

    // 기존 엔티티 조회(너 컨트롤러에서 이미 씀)
    Page<TradePost> readBySellerId(Long sellerId, Pageable pageable);

    TradePost readOneTradePost(TradePost tradePost);

    TradePost readOneTradePostById(Long tradeId);

    // 조회수 +1
    void increaseViewCount(Long tradeId);

    TradePost modifyTradepost(TradePost tradePostId, TradePost tradePostStatus);

    void register(TradePost post);

    /* ============================================================
           🔥 검색 기능 구현
           ============================================================ */
    Page<TradePost> search(String keyword, Pageable pageable);

    /* ============================================================
       🔥 리스트 DTO 변환
       ============================================================ */
    TradePostListDto toListDTO(TradePost post);

    /* ============================================================
           🔥 리스트 DTO 전체 변환
           ============================================================ */
    Page<TradePostListDto> readAllListDto(Pageable pageable);

    // 글+이미지 저장 (너희 기존 로직 유지)
    void createPostWithImages(TradePost post, List<MultipartFile> images);

    TradePost registerTradePost(TradePost tradePost);

    // 수정/삭제 (너희 기존 로직 유지)
    TradePost modifyTradePost(TradePost post) throws Exception;
    TradePost removeTradePost(TradePost post) throws Exception;

    /* ============================================================
   🔥 정렬 통합용 (추가)
   ============================================================ */
    Page<TradePostListDto> readAllSorted(String sort, Pageable pageable);

}