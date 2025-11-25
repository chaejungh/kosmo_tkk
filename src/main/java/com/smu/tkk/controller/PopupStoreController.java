package com.smu.tkk.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

/**
 * 팝업스토어 전체 기능 컨트롤러
 * - 팝업 리스트
 * - 팝업 상세
 * - 팝업 북마크 등록/삭제
 * - 팝업 굿즈 리스트 / 검색
 */
@Controller
@RequestMapping("/popupstore")   // 모든 URL 앞에 /popupstore 자동 추가
public class PopupStoreController {

    /**
     * ================================
     *  1. 팝업스토어 리스트
     *  ================================
     * URL: /popupstore/list.do?page=1&pageLimit=20&sort=createAt
     */
    @GetMapping("/list.do")
    public String popupStoreList(@RequestParam(defaultValue = "1") int page,
                                 @RequestParam(defaultValue = "20") int pageLimit,
                                 @RequestParam(defaultValue = "createAt") String sort,
                                 Model model) {

        // TODO: 나중에 서비스에서 팝업 리스트를 불러와서 model에 담기
        // model.addAttribute("popupList", popupStores);

        model.addAttribute("page", page);

        return "popupstore/popup_list";  // templates/popupstore/popup_list.html
    }

    /**
     * ================================
     *  2. 팝업스토어 상세
     *  ================================
     * URL: /popupstore/{popupStoreId}/detail.do
     */
    @GetMapping("/{popupStoreId}/detail.do")
    public String popupStoreDetail(@PathVariable("popupStoreId") Long popupStoreId,
                                   Model model) {

        // TODO: popupStoreId로 상세 내용 조회, model에 넣기
        model.addAttribute("popupStoreId", popupStoreId);

        return "popupstore/popup_detail";  // 상세 화면
    }


    /**
     * ================================
     *  3. 팝업 북마크 등록
     *  ================================
     * URL: /popupstore/{memberId}/bookmark
     * METHOD: POST
     */
    @PostMapping("/{memberId}/bookmark")
    @ResponseBody
    public String addBookmark(@PathVariable("memberId") Long memberId,
                              @RequestParam("popupStoreId") Long popupStoreId) {

        // TODO: 북마크 저장 로직
        return "OK"; // 나중엔 JSON으로 변경
    }

    /**
     * ================================
     *  4. 팝업 북마크 삭제
     *  ================================
     * URL: /popupstore/{bookmarkId}/bookmarkDelete
     * METHOD: POST
     */
    @PostMapping("/{bookmarkId}/bookmarkDelete")
    @ResponseBody
    public String removeBookmark(@PathVariable("bookmarkId") Long bookmarkId) {

        // TODO: 북마크 삭제 로직
        return "OK"; // 나중엔 JSON으로 변경
    }


    /**
     * ================================
     *  5. 팝업 굿즈 리스트 조회
     *  ================================
     * URL: /popupstore/goods/list.do?page=1&pageLimit=20&sort=createAt
     */
    @GetMapping("/goods/list.do")
    public String popupGoodsList(@RequestParam(defaultValue = "1") int page,
                                 @RequestParam(defaultValue = "20") int pageLimit,
                                 @RequestParam(defaultValue = "createAt") String sort,
                                 Model model) {

        // TODO: pop-up 굿즈 리스트 조회 모델 추가
        return "popupstore/popup_goods_list"; // 나중에 만들 화면
    }


    /**
     * ================================
     *  6. 팝업 굿즈 상세 조회
     *  ================================
     * URL: /popupstore/goods/{goodsId}/detail.do
     */
    @GetMapping("/goods/{goodsId}/detail.do")
    public String popupGoodsDetail(@PathVariable("goodsId") Long goodsId,
                                   Model model) {

        // TODO: 굿즈 상세 조회
        model.addAttribute("goodsId", goodsId);

        return "popupstore/popup_goods_detail";  // 나중에 만들 화면
    }


    /**
     * ================================
     *  7. 팝업 굿즈 검색 리스트
     *  ================================
     * URL 예시:
     * /p/search/검색어/popupstore/{popupStoreId}?c=좌표=/search/검색어/popupstoregoods/list.do
     */
    @GetMapping("/goods/search")
    public String searchPopupGoods(@RequestParam("keyword") String keyword,
                                   @RequestParam(required = false) String c,
                                   Model model) {

        // TODO: 검색 기능
        model.addAttribute("keyword", keyword);
        return "popupstore/popup_goods_search"; // 나중에 만들 화면
    }

}