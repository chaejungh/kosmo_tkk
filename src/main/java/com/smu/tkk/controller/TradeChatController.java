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

    /** -------------------------------------------------------
     *  1. 내가 참여한 중고거래 채팅방 목록
     *  URL: GET /trade/{memberId}/chat
     * ------------------------------------------------------- */
    @GetMapping("/{memberId}/chat")
    public String myChatRooms(
            @PathVariable Long memberId,
            Model model
    ) {
        model.addAttribute("memberId", memberId);
        model.addAttribute("rooms", chatService.myRooms(memberId));
        return "trade/chat/chat_list";   // ★ 수정됨
    }

    /** -------------------------------------------------------
     *  2. 특정 중고거래 채팅방 입장 (POST)
     * ------------------------------------------------------- */
    @PostMapping("/{memberId}/chat/{roomId}")
    public String enterRoom(
            @PathVariable Long memberId,
            @PathVariable Long roomId
    ) {
        return "redirect:/trade/" + memberId + "/chat/" + roomId;
    }

    /** -------------------------------------------------------
     *  3. 채팅방 화면
     *  URL: GET /trade/{memberId}/chat/{roomId}
     * ------------------------------------------------------- */
    @GetMapping("/{memberId}/chat/{roomId}")
    public String viewRoom(
            @PathVariable Long memberId,
            @PathVariable Long roomId,
            Model model
    ) {

        TradeChatRoom room = chatService.getRoom(roomId);
        TradePost trade = room.getTrade();

        model.addAttribute("room", room);
        model.addAttribute("msgList", chatService.messages(roomId).getContent());
        model.addAttribute("currentMemberId", memberId);

        // 판매자 닉네임
        model.addAttribute("sellerName",
                trade.getSeller() != null ? trade.getSeller().getNickname() : "판매자");

        // 상품 제목 / 가격
        model.addAttribute("productTitle", trade.getTitle());
        model.addAttribute("productPriceText",
                trade.getPrice() == null ? "가격 미정" : String.format("%,d원", trade.getPrice()));

        // 상품 대표 이미지
        Optional<TradePostImage> imgOpt = tradePostImageService.readOneImage(trade.getId());
        model.addAttribute("productThumbnailUrl",
                imgOpt.map(TradePostImage::getImageUrl).orElse("/images/dummy/noimg.png"));

        // 상태값
        String status = trade.getStatus();
        String statusLabel = "판매중";
        String statusClass = "";

        if ("RESERVED".equalsIgnoreCase(status)) {
            statusLabel = "예약중";
            statusClass = "reserved";
        } else if ("SOLD".equalsIgnoreCase(status) || "SOLD_OUT".equalsIgnoreCase(status)) {
            statusLabel = "판매완료";
            statusClass = "sold";
        }

        model.addAttribute("productStatusLabel", statusLabel);
        model.addAttribute("productStatusClass", statusClass);

        return "trade/chat/chat_room";   // ★ 수정됨
    }

    /** -------------------------------------------------------
     *  4. 채팅 메시지 전송
     * ------------------------------------------------------- */
    @PostMapping("/{memberId}/chat/{roomId}/send")
    public String sendMessage(
            @PathVariable Long memberId,
            @PathVariable Long roomId,
            @RequestParam String message
    ) {
        chatService.send(roomId, memberId, message);
        return "redirect:/trade/" + memberId + "/chat/" + roomId;
    }

    /** -------------------------------------------------------
     *  5. 채팅방 삭제
     * ------------------------------------------------------- */
    @PostMapping("/{memberId}/chat/{roomId}/delete")
    public String deleteRoom(
            @PathVariable Long memberId,
            @PathVariable Long roomId
    ) {
        return "redirect:/trade/" + memberId + "/chat";
    }
}