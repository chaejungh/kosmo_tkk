package com.smu.tkk.service;

import com.smu.tkk.entity.PopupStore;
import com.smu.tkk.entity.Store;
import com.smu.tkk.entity.TradePost;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

public interface AdminTradeStoreService {

    Page<TradePost> readTradePosts(Pageable pageable, String keyword);

    void softDeleteTradePost(Long tradeId);

    void restoreTradePost(Long tradeId);

    Page<Store> readStores(Pageable pageable, String keyword);

    void changeStoreActive(Long storeId, boolean active);

    Page<PopupStore> readPopupStores(Pageable pageable, String keyword);

    void changePopupActive(Long popupId, boolean active);
}
