package com.smu.tkk.controller;

import com.smu.tkk.entity.TradeChatRoom;
import com.smu.tkk.entity.TradePost;
import com.smu.tkk.entity.TradePostImage;
import com.smu.tkk.service.TradeChatService;
import com.smu.tkk.service.TradePostImageService;
import com.smu.tkk.repository.TradeChatRoomRepository;   // 🔥 추가
import com.smu.tkk.service.TradeService;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Pageable;
import org.springframework.http.ResponseEntity;
import org.springframework.messaging.simp.SimpMessagingTemplate;   // 🔥 추가
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
    private final TradeService tradeService;
    // 🔥 실시간 채팅 수 전송용
    private final SimpMessagingTemplate messagingTemplate;
    private final TradeChatRoomRepository tradeChatRoomRepository;

    /* ======================================================
       🔥 채팅 시작 기능 (채팅방 생성 or 기존방 재사용)
       ====================================================== */
    @PostMapping("/{tradeId}/chat/start")
    public String startChat(
            @PathVariable Long tradeId,
            @SessionAttribute(name = "memberId",required = false) Long memberId
    ) {

        if (memberId==null){
            return "redirect:/auth/login";
        }
        // 1) 채팅방 생성 또는 기존방 재사용
        TradeChatRoom room = chatService.getOrCreateRoom(tradeId, memberId);

        // 2) 해당 거래글의 채팅방 개수 세고 → 웹소켓으로 브로드캐스트
        long chatCount = tradeChatRoomRepository.countByTradeId(tradeId);
        // 구독 주소: /sub/trade.stats.{tradeId}
        messagingTemplate.convertAndSend("/sub/trade.stats." + tradeId, chatCount);

        // 3) 생성된 채팅방으로 이동
        return "redirect:/trade/" + tradeId + "/chat/" + room.getId();
    }

    /* ======================================================
       채팅 목록
       ====================================================== */
    @GetMapping("/chat")
    public String myChatRooms(@SessionAttribute(name = "memberId",required = false) Long memberId, Model model, Pageable pageable) {

        model.addAttribute("memberId", memberId);
        model.addAttribute("rooms", chatService.getChatRoomList(memberId));

        return "trade/chat/chat_list";
    }

    /* ======================================================
       채팅방 입장
       ====================================================== */
    @GetMapping("/{tradeId}/chat/{roomId}")
    public String chatRoom(
            @SessionAttribute(name = "memberId") Long loginUserId,
            @PathVariable Long tradeId,
                           @PathVariable Long roomId,
                           Model model) {

        Long currentMemberId = loginUserId;

        TradeChatRoom room = chatService.getRoom(roomId);
        TradePost trade = tradeService.readOneTradePostById(tradeId);

        String sellerName = room.getSellerId().equals(loginUserId)  //상대방 이름 표시 용
                ? room.getBuyer().getNickname()
                : room.getSeller().getNickname();


        Optional<TradePostImage> coverOpt = tradePostImageService.readOneImage(tradeId);
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

        model.addAttribute("room", room);
        model.addAttribute("msgList", chatService.messages(roomId).getContent());
        model.addAttribute("currentMemberId", currentMemberId);

        model.addAttribute("sellerName", sellerName);
        model.addAttribute("productTitle", trade.getTitle());
        model.addAttribute("productPriceText", priceText);
        model.addAttribute("productThumbnailUrl", productThumb);
        model.addAttribute("productStatusLabel", statusLabel);
        model.addAttribute("productStatusClass", statusClass);
        model.addAttribute("tradeId", tradeId);
        return "trade/chat/chat_room";
    }

    /* ======================================================
       ✅ 이미지 업로드 API (REST 유지)
       ====================================================== */
    @ResponseBody
    @PostMapping("/api/{memberId}/chat/{roomId}/image")
    public ResponseEntity<?> uploadImage(
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
       채팅방 삭제 (지금은 단순 redirect만 – 기존 로직 유지)
       ====================================================== */
    @PostMapping("/{memberId}/chat/{roomId}/delete")
    public String deleteRoom(@PathVariable Long memberId,
                             @PathVariable Long roomId) {

        // TODO: 실제 삭제 로직이 필요하면 service 쪽에 메서드 추가
        return "redirect:/trade/" + memberId + "/chat";
    }

    @PostMapping("/chat/{roomId}/leave")
    @ResponseBody
    public ResponseEntity<Void> leaveRoom(@PathVariable Long roomId,
                                          @SessionAttribute Long memberId) {


        chatService.leaveRoom(roomId, memberId);
        return ResponseEntity.ok().build();
    }
}