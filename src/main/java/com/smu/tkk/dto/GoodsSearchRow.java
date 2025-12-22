package com.smu.tkk.dto;

public interface GoodsSearchRow {
    Long getStoreId();
    String getStoreName();
    String getStoreAddress();

    Long getGoodsId();
    String getGoodsName();
    Long getPrice();
    Long getStockQty();
    String getThumbnailUrl();
}