package com.smu.tkk.service;

import com.smu.tkk.entity.PopupStore;
import com.smu.tkk.entity.Store;
import com.smu.tkk.entity.TradePost;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

public interface AdminTradeStoreService {

    // 거래글 관리
    Page<TradePost> readTradePosts(Pageable pageable, String keyword);

    void softDeleteTradePost(Long tradeId);

    void restoreTradePost(Long tradeId);

    // 상설 매장 관리
    Page<Store> readStores(Pageable pageable, String keyword);

    void changeStoreActive(Long storeId, boolean active);

    // 팝업스토어 관리
    Page<PopupStore> readPopupStores(Pageable pageable, String keyword);

    void changePopupActive(Long popupId, boolean active);
}
