package com.smu.tkk.controller;

import com.smu.tkk.entity.TradeChatRoom;
import com.smu.tkk.entity.TradePost;
import com.smu.tkk.entity.TradePostImage;
import com.smu.tkk.service.TradeChatService;
import com.smu.tkk.service.TradePostImageService;
import com.smu.tkk.service.TradeService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Optional;

@Controller
@RequiredArgsConstructor
@RequestMapping("/trade")
public class TradeChatController {

    private final TradeChatService chatService;
    private final TradeService tradeService;
    private final TradePostImageService tradePostImageService;

    /* ===============================================================
       1) 내 채팅방 목록
       ============================================================== */
    @GetMapping("/{memberId}/chat")
    public String myChatRooms(@PathVariable Long memberId, Model model) {

        model.addAttribute("memberId", memberId);
        model.addAttribute("rooms", chatService.myRooms(memberId));

        return "trade/chat/chat_list";
    }

    /* ⭐⭐ 자동 생성용 — POST /trade/{memberId}/chat/start/{tradeId} */
    @PostMapping("/{memberId}/chat/start/{tradeId}")
    public String startChat(
            @PathVariable Long memberId,
            @PathVariable Long tradeId
    ) {
        TradeChatRoom room = chatService.getOrCreateRoom(tradeId, memberId);
        return "redirect:/trade/" + memberId + "/chat/" + room.getId();
    }

    /* ===============================================================
       2) 채팅방 입장
       ============================================================== */
    @PostMapping("/{memberId}/chat/{roomId}")
    public String enterRoom(@PathVariable Long memberId,
                            @PathVariable Long roomId) {

        return "redirect:/trade/" + memberId + "/chat/" + roomId;
    }

    /* ===============================================================
       3) 채팅방 화면
       ============================================================== */
    @GetMapping("/{memberId}/chat/{roomId}")
    public String viewRoom(@PathVariable Long memberId,
                           @PathVariable Long roomId,
                           Model model) {

        TradeChatRoom room = chatService.getRoom(roomId);
        TradePost trade = room.getTrade();

        model.addAttribute("room", room);
        model.addAttribute("msgList", chatService.messages(roomId).getContent());
        model.addAttribute("currentMemberId", memberId);

        model.addAttribute("sellerName",
                trade.getSeller() != null ? trade.getSeller().getNickname() : "판매자");

        model.addAttribute("productTitle", trade.getTitle());
        model.addAttribute("productPriceText",
                trade.getPrice() == null ? "가격 미정" : String.format("%,d원", trade.getPrice()));

        Optional<TradePostImage> imgOpt = tradePostImageService.readOneImage(trade.getId());
        model.addAttribute("productThumbnailUrl",
                imgOpt.map(TradePostImage::getImageUrl).orElse("/images/dummy/noimg.png"));

        String status = trade.getStatus();
        String label = "판매중";
        String css = "";

        if ("RESERVED".equalsIgnoreCase(status)) { label = "예약중"; css = "reserved"; }
        else if ("SOLD".equalsIgnoreCase(status) || "SOLD_OUT".equalsIgnoreCase(status)) {
            label = "판매완료"; css = "sold";
        }

        model.addAttribute("productStatusLabel", label);
        model.addAttribute("productStatusClass", css);

        return "trade/chat/chat_room";
    }

    /* ===============================================================
       4) 메시지 전송
       ============================================================== */
    @PostMapping("/{memberId}/chat/{roomId}/send")
    public String sendMessage(@PathVariable Long memberId,
                              @PathVariable Long roomId,
                              @RequestParam String message) {

        chatService.send(roomId, memberId, message);
        return "redirect:/trade/" + memberId + "/chat/" + roomId;
    }

    /* ===============================================================
       5) 채팅방 삭제
       ============================================================== */
    @PostMapping("/{memberId}/chat/{roomId}/delete")
    public String deleteRoom(@PathVariable Long memberId,
                             @PathVariable Long roomId) {

        return "redirect:/trade/" + memberId + "/chat";
    }
}