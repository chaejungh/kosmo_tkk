package com.smu.tkk.serviceimp;

import com.smu.tkk.entity.PopupStore;
import com.smu.tkk.entity.Store;
import com.smu.tkk.entity.TradePost;
import com.smu.tkk.repository.PopupStoreRepository;
import com.smu.tkk.repository.StoreRepository;
import com.smu.tkk.repository.TradePostRepository;
import com.smu.tkk.service.AdminTradeStoreService;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@RequiredArgsConstructor
@Transactional
public class AdminTradeStoreServiceImp implements AdminTradeStoreService {

    private final TradePostRepository tradePostRepository;
    private final StoreRepository storeRepository;
    private final PopupStoreRepository popupStoreRepository;

    // ▽ 거래글 목록 (지금은 검색어 무시하고 전체 조회)
    @Override
    @Transactional(readOnly = true)
    public Page<TradePost> readTradePosts(Pageable pageable, String keyword) {
        return tradePostRepository.findAll(pageable);
    }

    @Override
    public void softDeleteTradePost(Long tradeId) {
        TradePost post = tradePostRepository.findById(tradeId)
                .orElseThrow(() -> new IllegalArgumentException("거래글이 존재하지 않습니다. id=" + tradeId));
        // 엔티티에 Boolean deletedYn 이 있다고 가정
        post.setDeletedYn(Boolean.TRUE);
    }

    @Override
    public void restoreTradePost(Long tradeId) {
        TradePost post = tradePostRepository.findById(tradeId)
                .orElseThrow(() -> new IllegalArgumentException("거래글이 존재하지 않습니다. id=" + tradeId));
        post.setDeletedYn(Boolean.FALSE);
    }

    // ▽ 매장 목록
    @Override
    @Transactional(readOnly = true)
    public Page<Store> readStores(Pageable pageable, String keyword) {
        return storeRepository.findAll(pageable);
    }

    // ▽ 매장 활성/비활성 (현재는 상태 필드가 없어서 “검증만 하는 NO-OP 메소드”로 둠)
    @Override
    public void changeStoreActive(Long storeId, boolean active) {
        storeRepository.findById(storeId)
                .orElseThrow(() -> new IllegalArgumentException("매장이 존재하지 않습니다. id=" + storeId));
        // TODO: Store 엔티티에 상태(예: activeYn, deletedYn 등) 필드가 생기면 여기서 값 변경
    }

    // ▽ 팝업 목록
    @Override
    @Transactional(readOnly = true)
    public Page<PopupStore> readPopupStores(Pageable pageable, String keyword) {
        return popupStoreRepository.findAll(pageable);
    }

    // ▽ 팝업 활성/비활성 (역시 NO-OP)
    @Override
    public void changePopupActive(Long popupId, boolean active) {
        popupStoreRepository.findById(popupId)
                .orElseThrow(() -> new IllegalArgumentException("팝업스토어가 존재하지 않습니다. id=" + popupId));
        // TODO: PopupStore 엔티티에 상태 필드가 생기면 여기서 값 변경
    }
}
