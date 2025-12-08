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
@Transactional(readOnly = true)
public class AdminTradeStoreServiceImp implements AdminTradeStoreService {

    private final TradePostRepository tradePostRepository;
    private final StoreRepository storeRepository;
    private final PopupStoreRepository popupStoreRepository;

    // ===================== 거래글 =====================

    @Override
    public Page<TradePost> readTradePosts(Pageable pageable, String keyword) {
        if (keyword != null && !keyword.isBlank()) {
            // 검색 시 삭제된 글은 제외
            return tradePostRepository.search(keyword, pageable);
        }
        // 삭제 안 된 글만 (DELETED_YN IS NULL OR 'N')
        return tradePostRepository.findByDeletedYnIsNullOrDeletedYn("N", pageable);
    }

    @Override
    @Transactional
    public void softDeleteTradePost(Long tradeId) {
        TradePost post = tradePostRepository.findById(tradeId)
                .orElseThrow(() -> new IllegalArgumentException("거래글이 존재하지 않습니다. id=" + tradeId));

        // 🔥 여기서는 문자열 "Y"/"N" 으로 관리 (엔티티도 String 이어야 함)
        post.setDeletedYn("Y");
        tradePostRepository.save(post);
    }

    @Override
    @Transactional
    public void restoreTradePost(Long tradeId) {
        TradePost post = tradePostRepository.findById(tradeId)
                .orElseThrow(() -> new IllegalArgumentException("거래글이 존재하지 않습니다. id=" + tradeId));

        post.setDeletedYn("N");
        tradePostRepository.save(post);
    }

    // ===================== 상설 매장 =====================

    @Override
    public Page<Store> readStores(Pageable pageable, String keyword) {
        // 지금은 키워드 무시하고 전체 조회 (필요하면 검색용 Repository 메서드 추가)
        return storeRepository.findAll(pageable);
    }

    @Override
    @Transactional
    public void changeStoreActive(Long storeId, boolean active) {
        Store store = storeRepository.findById(storeId)
                .orElseThrow(() -> new IllegalArgumentException("매장을 찾을 수 없습니다. id=" + storeId));

        // 예: deletedYn 으로 숨김 처리하고 있다면 이렇게
        store.setDeletedYn(active ? "N" : "Y");
        storeRepository.save(store);
    }

    // ===================== 팝업스토어 =====================

    @Override
    public Page<PopupStore> readPopupStores(Pageable pageable, String keyword) {
        // 마찬가지로 일단 전체 조회
        return popupStoreRepository.findAll(pageable);
    }

    @Override
    @Transactional
    public void changePopupActive(Long popupId, boolean active) {
        PopupStore popup = popupStoreRepository.findById(popupId)
                .orElseThrow(() -> new IllegalArgumentException("팝업스토어를 찾을 수 없습니다. id=" + popupId));

        popup.setDeletedYn(active ? "N" : "Y");
        popupStoreRepository.save(popup);
    }
}
