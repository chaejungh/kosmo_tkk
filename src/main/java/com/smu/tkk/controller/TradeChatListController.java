package com.smu.tkk.controller;

import com.smu.tkk.dto.ChatRoomListDTO;
import com.smu.tkk.service.TradeChatService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.SessionAttribute;

import java.util.List;

@Controller
@RequiredArgsConstructor
public class TradeChatListController {

    private final TradeChatService chatService;

    // ⭐ 이미 /chat 으로 잘 되어 있음
    @GetMapping("/chat/list")
    public String chatListPage(
            HttpSession session,
            Model model,
            @SessionAttribute(name = "memberId",required = false) Long memberId
    ) {
        if (memberId == null) {
            return "redirect:/auth/login";   // ← 고친 부분
        }

        int unreadCount=0;
        List<ChatRoomListDTO> rooms = chatService.getChatRoomList(memberId);
        for (ChatRoomListDTO room : rooms){
            unreadCount = room.getUnreadCount();
        }



        // 채팅방 리스트 가져오기
        model.addAttribute("rooms", chatService.getChatRoomList(memberId));
        model.addAttribute("unreadCount",unreadCount);
        // templates/chat/chat_list.html 렌더링
        return "trade/chat/chat_list";
    }
}