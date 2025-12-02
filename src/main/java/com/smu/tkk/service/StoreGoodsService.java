package com.smu.tkk.service;

import com.smu.tkk.entity.StoreGood;

import java.util.List;

public interface StoreGoodsService {

    // keyword가 null/빈문자면 전체, 아니면 검색
    List<StoreGood> getGoodsList(Long storeId, String keyword);
}
