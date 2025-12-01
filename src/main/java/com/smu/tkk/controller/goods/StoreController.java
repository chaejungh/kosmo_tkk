package com.smu.tkk.controller.goods;

import com.smu.tkk.entity.Store;
import com.smu.tkk.repository.StoreRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.server.ResponseStatusException;

@Controller
@RequestMapping("/goods")
@RequiredArgsConstructor
public class StoreController {

    private final StoreRepository storeRepository;

    /**
     * 매장 상세페이지
     *  예) /goods/store/1  또는 /goods/store/1/detail.do
     */
    @GetMapping({"/store/{storeId}", "/store/{storeId}/detail.do"})
    public String storeDetail(@PathVariable Long storeId, Model model) {

        Store store = storeRepository.findById(storeId)
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "매장을 찾을 수 없습니다."));

        model.addAttribute("store", store);
        return "goods/store-detail";  // templates/goods/store-detail.html
    }
}
