package com.smu.tkk.service;

import com.smu.tkk.entity.TradePost;
import com.smu.tkk.entity.TradePostImage;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;

public interface TradeService {
    TradePost registerTradePost(TradePost tradePost); //거래글 작성(레파지토리 완료)
    TradePost modifyTradePost(TradePost tradePost); //거래글 수정(레파지토리 완료)
    TradePost removeTradePost(TradePost tradePostId); //거래글 삭제(레파지토리 완료)
    TradePost readOneTradePost(TradePost tradePost); //거래글 상세 조회(레파지토리 완료)
    Page<TradePost> readAll(Pageable pageable); //거래글 목록 조회(레파지토리 완료)
    TradePost modifyTradepost(TradePost tradePostId, TradePost tradePostStatus); //거래 상태 변경(레파지토리 완료)

    // 4. 이미지 추가 */(레파지토리 완료)
    TradePostImage register(Long tradeId, String imageUrl);
    /// Long sortOrder 기능 필요하면 추가

    // 5. 이미지 삭제 */(레파지토리 완료)
    boolean remove(Long imageId);
}
