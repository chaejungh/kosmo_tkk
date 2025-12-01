package com.smu.tkk.controller;

import com.smu.tkk.entity.TradeChatRoom;
import com.smu.tkk.entity.TradePost;
import com.smu.tkk.entity.TradePostImage;
import com.smu.tkk.service.TradeChatService;
import com.smu.tkk.service.TradePostImageService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.Optional;

@Controller
@RequiredArgsConstructor
@RequestMapping("/trade")
public class TradeChatController {

    private final TradeChatService chatService;
    private final TradePostImageService tradePostImageService;

    /* ======================================================
       🔥 채팅 시작 기능 (채팅방 생성 or 기존방 재사용)
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

        // 읽음처리
        chatService.markAsRead(roomId, currentMemberId);

        model.addAttribute("memberId", memberId);
        model.addAttribute("room", room);
        // 초기 렌더링용 메시지 목록 (옵션 – 없애고 전부 웹소켓으로만 해도 됨)
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
       ❌ (폴링용 텍스트 전송/조회 API 제거됨)
       - sendMessage()
       - /api/{roomId}/chat/list
       - /api/{memberId}/chat/{roomId}/send
       ====================================================== */

    /* ======================================================
       ✅ 이미지 업로드 API (REST 유지)
       - 파일만 업로드하고, 실제 채팅 메시지는
         "[img]/upload/chat/파일명" 형태로 웹소켓으로 보내는 구조로 사용 가능
       ====================================================== */
    @ResponseBody
    @PostMapping("/api/{memberId}/chat/{roomId}/image")
    public ResponseEntity<?> uploadImage(
            @PathVariable Long memberId,
            @PathVariable Long roomId,
            @RequestParam("image") MultipartFile file
    ) {
        try {
            // 이미지 저장 + [img] 경로로 메시지 저장
            chatService.sendImage(roomId, memberId, file);
            return ResponseEntity.ok().build();
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.internalServerError().build();
        }
    }

    /* ======================================================
       채팅방 삭제 (지금은 단순 redirect만 – 기존 로직 유지)
       ====================================================== */
    @PostMapping("/{memberId}/chat/{roomId}/delete")
    public String deleteRoom(@PathVariable Long memberId,
                             @PathVariable Long roomId) {

        // TODO: 실제 삭제 로직이 필요하면 service 쪽에 메서드 추가
        return "redirect:/trade/" + memberId + "/chat";
    }
}