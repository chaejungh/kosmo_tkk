package com.smu.tkk.controller;

import com.smu.tkk.dto.GoodsMapRow;
import com.smu.tkk.repository.StoreGoodRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.web.bind.annotation.*;

@RestController
@RequiredArgsConstructor
@RequestMapping("/goods")
public class GoodsApiController {

    private final StoreGoodRepository storeGoodRepository;

    /**
     * ✅ 지도용 재고 검색
     * /goods/search-map?kw=주술회전&page=0&size=30
     */
    @GetMapping("/search-map")
    public Page<GoodsMapRow> searchMap(
            @RequestParam(required = false) String kw,
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "30") int size
    ) {
        return storeGoodRepository.searchGoodsForMap(kw, PageRequest.of(page, size));
    }
}