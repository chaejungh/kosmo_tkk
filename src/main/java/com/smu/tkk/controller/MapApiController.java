package com.smu.tkk.controller;

import com.smu.tkk.dto.PlaceDto;
import com.smu.tkk.service.NaverLocalSearchService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequiredArgsConstructor
@RequestMapping("/api/map")
public class MapApiController {

    private final NaverLocalSearchService naverLocalSearchService;

    // 예: /api/map/places?query=홍대&limit=10
    @GetMapping("/places")
    public List<PlaceDto> searchPlaces(
            @RequestParam String query,
            @RequestParam(defaultValue = "5") int limit
    ) {
        return naverLocalSearchService.searchPlaces(query, limit);
    }
}
