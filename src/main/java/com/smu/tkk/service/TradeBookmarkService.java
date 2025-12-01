package com.smu.tkk.service;

import com.smu.tkk.entity.TradeBookmark;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

public interface TradeBookmarkService {

    void addBookmark(Long memberId, Long tradeId);

    void removeBookmark(Long memberId, Long tradeId);

    boolean isBookmarked(Long memberId, Long tradeId);

    Page<TradeBookmark> getBookmarks(Long memberId, Pageable pageable);

}