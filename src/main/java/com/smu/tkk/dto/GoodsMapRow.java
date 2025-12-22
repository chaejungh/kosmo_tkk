package com.smu.tkk.dto;

public interface GoodsMapRow {
    Long getStoreId();
    String getStoreName();
    String getStoreAddress();
    Double getLatitude();
    Double getLongitude();

    Long getGoodsId();
    String getGoodsName();
    Integer getStockQty();
    Integer getPrice();
    String getThumbnailUrl();
}