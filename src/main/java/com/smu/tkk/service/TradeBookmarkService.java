package com.smu.tkk.service;

public interface TradeBookmarkService {

    void addBookmark(Long memberId, Long tradeId);

    void removeBookmark(Long memberId, Long tradeId);

    boolean isBookmarked(Long memberId, Long tradeId);

}