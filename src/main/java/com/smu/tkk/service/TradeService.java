package com.smu.tkk.service;

import com.smu.tkk.entity.TradePost;
import com.smu.tkk.entity.TradePostImage;

import java.util.List;

public interface TradeService {
    TradePost registerTradePost(TradePost tradePost); //거래글 작성
    TradePost modifyTradePost(TradePost tradePost); //거래글 수정
    TradePost removeTradePost(TradePost tradePost); //거래글 삭제
    TradePost readOneTradePost(TradePost tradePost); //거래글 상세 조회
    List<TradePost> readlist(TradePost tradePost); //거래글 목록 조회
    TradePostImage saveTradeimage(TradePostImage tradePostImage); //거래글 이미지 저장
    TradePost modifytradepost(TradePost tradePost); //거래 상태 변경
}
