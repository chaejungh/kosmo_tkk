package com.smu.tkk.controller;

import com.smu.tkk.service.TradeBookmarkService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@Controller
@RequiredArgsConstructor
@RequestMapping("/trade")
public class TradeBookmarkController {

    private final TradeBookmarkService bookmarkService;

    /** ---------------------------------------------
     *  거래 북마크 추가
     *  URL : POST /trade/{memberId}/BookMark
     *  param : tradeId
     * --------------------------------------------- */
    @PostMapping("/{memberId}/BookMark")
    public String addBookmark(
                              @RequestParam Long tradeId,
                              @RequestHeader(value = "Referer", required = false) String referer,
                              @SessionAttribute(name = "memberId",required = false) Long memberId) {

        if (memberId==null){
            return "redirect:/auth/login";
        }
        bookmarkService.addBookmark(memberId, tradeId);

        // 원래 페이지로 돌려보내기 (없으면 리스트)
        if (referer != null && !referer.isBlank()) {
            return "redirect:" + referer;
        }
        return "redirect:/trade/list.do";
    }

    /** ---------------------------------------------
     *  거래 북마크 삭제
     *  URL : POST /trade/{memberId}/BookMarkDelete
     *  param : tradeId
     * --------------------------------------------- */
    @PostMapping("/{memberId}/BookMarkDelete")
    public String deleteBookmark(@PathVariable Long memberId,
                                 @RequestParam Long tradeId,
                                 @RequestHeader(value = "Referer", required = false) String referer) {

        bookmarkService.removeBookmark(memberId, tradeId);

        if (referer != null && !referer.isBlank()) {
            return "redirect:" + referer;
        }
        return "redirect:/trade/list.do";
    }
}