package com.smu.tkk.controller;

import com.smu.tkk.dto.GoodsSearchRow;
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
     * ✅ 재고 통합 검색 API
     * 예) /goods/search?kw=진격&page=0&size=20
     */
    @GetMapping("/search")
    public Page<GoodsSearchRow> searchGoods(
            @RequestParam(required = false) String kw,
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "20") int size
    ) {
        return storeGoodRepository.searchGoods(kw, PageRequest.of(page, size));
    }
}