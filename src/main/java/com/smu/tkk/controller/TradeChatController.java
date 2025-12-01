package com.smu.tkk.controller;

import com.smu.tkk.entity.TradeChatMessage;
import com.smu.tkk.entity.TradeChatRoom;
import com.smu.tkk.entity.TradePostImage;
import com.smu.tkk.entity.TradePost;
import com.smu.tkk.service.TradeChatService;
import com.smu.tkk.service.TradePostImageService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import java.util.List;
import java.util.Optional;

@Controller
@RequiredArgsConstructor
@RequestMapping("/trade")
public class TradeChatController {

    private final TradeChatService chatService;
    private final TradePostImageService tradePostImageService;

    /* ======================================================
       🔥 채팅 시작 기능 (서비스 인터페이스에 맞게 수정 완료)
       ====================================================== */
    @PostMapping("/{tradeId}/chat/start/{memberId}")
    public String startChat(
            @PathVariable Long tradeId,
            @PathVariable Long memberId
    ) {
        // 1) 채팅방 생성 또는 기존방 재사용
        TradeChatRoom room = chatService.getOrCreateRoom(tradeId, memberId);

        // 2) 생성된 채팅방으로 이동
        return "redirect:/trade/" + memberId + "/chat/" + room.getId();
    }


    /* ======================================================
       채팅 목록
       ====================================================== */
    @GetMapping("/{memberId}/chat")
    public String myChatRooms(@PathVariable Long memberId, Model model) {

        model.addAttribute("memberId", memberId);
        model.addAttribute("rooms", chatService.myRooms(memberId).getContent());

        return "trade/chat/chat_list";
    }

    /* ======================================================
       채팅방 입장
       ====================================================== */
    @GetMapping("/{memberId}/chat/{roomId}")
    public String chatRoom(@PathVariable Long memberId,
                           @PathVariable Long roomId,
                           Model model) {

        Long currentMemberId = memberId;

        TradeChatRoom room = chatService.getRoom(roomId);
        TradePost trade = room.getTrade();

        String sellerName = trade.getSeller() != null
                ? trade.getSeller().getNickname()
                : "판매자";

        Optional<TradePostImage> coverOpt = tradePostImageService.readOneImage(trade.getId());
        String productThumb = coverOpt
                .map(TradePostImage::getImageUrl)
                .orElse("/images/dummy/noimg.png");

        String priceText = (trade.getPrice() == null)
                ? "가격 미정"
                : String.format("%,d원", trade.getPrice());

        String status = trade.getStatus();
        String statusLabel = "판매중";
        String statusClass = "badge-onsale";

        if ("RESERVED".equalsIgnoreCase(status)) {
            statusLabel = "예약중";
            statusClass = "badge-reserved";
        } else if ("SOLD".equalsIgnoreCase(status) || "SOLD_OUT".equalsIgnoreCase(status)) {
            statusLabel = "판매완료";
            statusClass = "badge-sold";
        }

        chatService.markAsRead(roomId, currentMemberId);

        model.addAttribute("memberId", memberId);
        model.addAttribute("room", room);
        model.addAttribute("msgList", chatService.messages(roomId).getContent());
        model.addAttribute("currentMemberId", currentMemberId);

        model.addAttribute("sellerName", sellerName);
        model.addAttribute("productTitle", trade.getTitle());
        model.addAttribute("productPriceText", priceText);
        model.addAttribute("productThumbnailUrl", productThumb);
        model.addAttribute("productStatusLabel", statusLabel);
        model.addAttribute("productStatusClass", statusClass);

        return "trade/chat/chat_room";
    }

    /* ======================================================
       메시지 전송
       ====================================================== */
    @PostMapping("/{memberId}/chat/{roomId}/send")
    public String sendMessage(@PathVariable Long memberId,
                              @PathVariable Long roomId,
                              @RequestParam String message) {

        Long currentMemberId = memberId;

        if (message != null && !message.isBlank()) {
            chatService.send(roomId, currentMemberId, message.trim());
        }

        return "redirect:/trade/" + memberId + "/chat/" + roomId;
    }

    /* ======================================================
       API - 메시지 목록
       ====================================================== */
    @GetMapping("/api/{roomId}/chat/list")
    public ResponseEntity<List<TradeChatMessage>> apiChatList(@PathVariable Long roomId) {

        return ResponseEntity.ok(chatService.messages(roomId).getContent());
    }

    /* ======================================================
       API - 메시지 전송
       ====================================================== */
    @ResponseBody
    @PostMapping("/api/{memberId}/chat/{roomId}/send")
    public ResponseEntity apiSendMessage(@PathVariable Long memberId,
                                         @PathVariable Long roomId,
                                         @RequestParam String message) {

        Long currentMemberId = memberId;

        if (message != null && !message.isBlank()) {
            try {
                chatService.send(roomId, currentMemberId, message.trim());
                return ResponseEntity.ok().build();
            } catch (Exception e) {
                e.printStackTrace();
                return ResponseEntity.internalServerError().build();
            }
        }

        return ResponseEntity.badRequest().build();
    }

    /* ======================================================
   API - 이미지 전송 (신규)
====================================================== */
    @ResponseBody
    @PostMapping("/api/{memberId}/chat/{roomId}/image")
    public ResponseEntity uploadImage(
            @PathVariable Long memberId,
            @PathVariable Long roomId,
            @RequestParam("image") MultipartFile file
    ) {
        try {
            chatService.sendImage(roomId, memberId, file);
            return ResponseEntity.ok().build();
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.internalServerError().build();
        }
    }

    /* ======================================================
       채팅방 삭제
       ====================================================== */
    @PostMapping("/{memberId}/chat/{roomId}/delete")
    public String deleteRoom(@PathVariable Long memberId,
                             @PathVariable Long roomId) {

        return "redirect:/trade/" + memberId + "/chat";
    }
}