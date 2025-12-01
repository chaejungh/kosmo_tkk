package com.smu.tkk.controller;

import com.smu.tkk.entity.Store;
import com.smu.tkk.repository.StoreRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.server.ResponseStatusException;

import java.lang.reflect.Method;
import java.util.LinkedHashMap;
import java.util.Map;

@Controller
@RequiredArgsConstructor
public class StoreController {

    private final StoreRepository storeRepository;

    // /goods/store/172  /store/172/detail.do 등 여러 패턴을 한 번에 처리
    @GetMapping({
            "/store/{storeId}/detail",
            "/store/{storeId}/detail.do",
            "/goods/store/{storeId}",
            "/goods/store/{storeId}/detail",
            "/goods/store/{storeId}/detail.do"
    })
    public String storeDetail(@PathVariable("storeId") Long storeId,
                              Model model) {

        Store store = storeRepository.findById(storeId)
                .orElseThrow(() ->
                        new ResponseStatusException(
                                HttpStatus.NOT_FOUND,
                                "매장을 찾을 수 없습니다. id=" + storeId));

        // ▽ 여기서부터는 리플렉션으로 안전하게 꺼내서 Map으로 넘김
        Map<String, Object> view = new LinkedHashMap<>();
        view.put("id",      getString(store, storeId.toString(), "getStoreId", "getId"));
        view.put("name",    getString(store, "", "getStoreName", "getName"));
        view.put("brand",   getString(store, "", "getBrandName", "getBrand"));
        view.put("address", getString(store, "", "getAddress"));
        view.put("tel",     getString(store, "", "getTel", "getPhone"));
        view.put("openTime",getString(store, "", "getOpenTime", "getBusinessHours"));
        view.put("homepage",getString(store, "", "getHomepage", "getHomePage", "getUrl"));
        view.put("latitude",getString(store, "", "getLatitude", "getLat"));
        view.put("longitude",getString(store, "", "getLongitude", "getLng", "getLon"));

        model.addAttribute("store", view);

        // templates/store/store_detail.html
        return "store/store_detail";
    }

    private String getString(Store store,
                             String defaultValue,
                             String... getterNames) {
        for (String g : getterNames) {
            try {
                Method m = store.getClass().getMethod(g);
                Object v = m.invoke(store);
                if (v != null) return v.toString();
            } catch (NoSuchMethodException e) {
                // 이 이름의 getter 가 없으면 패스
            } catch (Exception e) {
                // 다른 오류도 패스 (로그 남기고 싶으면 여기서 처리)
            }
        }
        return defaultValue;
    }
}
