package com.smu.tkk.controller;

import com.smu.tkk.entity.Store;
import com.smu.tkk.entity.StoreGood;
import com.smu.tkk.repository.StoreBookmarkRepository;
import com.smu.tkk.repository.StoreGoodRepository;
import com.smu.tkk.repository.StoreRepository;

import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.server.ResponseStatusException;

import java.lang.reflect.Method;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequiredArgsConstructor
public class StoreController {

    private final StoreRepository storeRepository;
    private final StoreGoodRepository storeGoodRepository;
    private final StoreBookmarkRepository storeBookmarkRepository;

    @GetMapping({
            "/store/{storeId}/detail",
            "/store/{storeId}/detail.do",
            "/goods/store/{storeId}",
            "/goods/store/{storeId}/detail",
            "/goods/store/{storeId}/detail.do"
    })
    public String storeDetail(@PathVariable("storeId") Long storeId,
                              @RequestParam(name = "keyword", required = false) String keyword,
                              @SessionAttribute(name = "memberId", required = false) Long memberId,
                              Model model) {

        /* =========================
           1) 매장 기본 정보
        ========================= */
        Store store = storeRepository.findById(storeId)
                .orElseThrow(() ->
                        new ResponseStatusException(
                                HttpStatus.NOT_FOUND,
                                "매장을 찾을 수 없습니다. id=" + storeId));

        Map<String, Object> view = new LinkedHashMap<>();
        view.put("id",        getString(store, storeId.toString(), "getStoreId", "getId"));
        view.put("name",      getString(store, "", "getStoreName", "getName"));
        view.put("brand",     getString(store, "", "getBrandName", "getBrand"));
        view.put("description", getString(store, "", "getDescription"));
        view.put("address",   getString(store, "", "getAddress"));
        view.put("tel",       getString(store, "", "getTel", "getPhone"));
        view.put("openTime",  getString(store, "", "getOpenTime", "getBusinessHours"));
        view.put("homepage",  getString(store, "", "getHomepage", "getHomePage", "getUrl"));
        view.put("latitude",  getString(store, "", "getLatitude", "getLat"));
        view.put("longitude", getString(store, "", "getLongitude", "getLng", "getLon"));
        view.put("imageUrl",  getString(store, "", "getImageUrl"));

        model.addAttribute("store", view);
        model.addAttribute("storeId", storeId);

        /* =========================
           2) 굿즈 재고
        ========================= */
        List<StoreGood> goodsList;
        if (keyword == null || keyword.isBlank()) {
            goodsList = storeGoodRepository
                    .findByStoreIdOrderByWorkNameAscCharacterNameAsc(storeId);
        } else {
            String value = "%" + keyword.trim().toLowerCase() + "%";
            goodsList = storeGoodRepository.searchInStore(storeId, value);
        }

        if (goodsList == null) {
            goodsList = List.of();
        }

        model.addAttribute("goodsList", goodsList);
        model.addAttribute("keyword", keyword);

        /* =========================
           3) ❤️ 찜 여부 (로그인 연동)
        ========================= */
        boolean liked = false;

        if (memberId != null) {
            liked = storeBookmarkRepository
                    .existsByMemberIdAndStoreId(memberId, storeId);
        }

        model.addAttribute("liked", liked);

        return "store/store_detail";
    }

    /* =========================
       getter 유틸
    ========================= */
    private String getString(Store store,
                             String defaultValue,
                             String... getterNames) {
        for (String g : getterNames) {
            try {
                Method m = store.getClass().getMethod(g);
                Object v = m.invoke(store);
                if (v != null) return v.toString();
            } catch (NoSuchMethodException e) {
                // getter 없음 → 무시
            } catch (Exception e) {
                // 기타 오류 → 무시
            }
        }
        return defaultValue;
    }
}