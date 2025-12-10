package com.smu.tkk.serviceimp;

import com.smu.tkk.entity.TradeBookmark;
import com.smu.tkk.repository.TradeBookmarkRepository;
import com.smu.tkk.service.TradeBookmarkService;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@RequiredArgsConstructor
@Transactional
public class TradeBookmarkServiceImp implements TradeBookmarkService {

    private final TradeBookmarkRepository tradeBookmarkRepository;

    @Override
    public void addBookmark(Long memberId, Long tradeId) {
        if (tradeBookmarkRepository.existsByMemberIdAndTradeId(memberId, tradeId)) {
            return;
        }
        TradeBookmark bookmark = new TradeBookmark();
        bookmark.setMemberId(memberId);
        bookmark.setTradeId(tradeId);
        tradeBookmarkRepository.save(bookmark);
    }

    @Override
    public void removeBookmark(Long memberId, Long tradeId) {
        tradeBookmarkRepository.findByMemberIdAndTradeId(memberId, tradeId)
                .ifPresent(tradeBookmarkRepository::delete);
    }

    @Override
    @Transactional(readOnly = true)
    public boolean isBookmarked(Long memberId, Long tradeId) {
        return tradeBookmarkRepository.existsByMemberIdAndTradeId(memberId, tradeId);
    }

    @Override
    public Page<TradeBookmark> getBookmarks(Long memberId, Pageable pageable) {
        return tradeBookmarkRepository.findByMemberId(memberId, pageable);
    }

    @Override
    public List<TradeBookmark> getBookmarksByTradId(Long tradeId) {
        return tradeBookmarkRepository.findByTradeId(tradeId);
    }
}