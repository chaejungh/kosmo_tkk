package com.smu.tkk.controller;

import com.smu.tkk.service.TradeChatService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
@RequiredArgsConstructor
public class ChatListController {

    private final TradeChatService chatService;

    // ⭐ 이미 /chat 으로 잘 되어 있음
    @GetMapping("/chat/list")
    public String chatListPage(HttpSession session, Model model) {

        Long memberId = (Long) session.getAttribute("memberId");

        // ⭐ 여기만 수정! (절대 다른 부분 변형 x)
        if (memberId == null) {
            return "redirect:/auth/login";   // ← 고친 부분
        }

        // 채팅방 리스트 가져오기
        model.addAttribute("rooms", chatService.getChatRoomList(memberId));

        // templates/chat/chat_list.html 렌더링
        return "trade/chat/chat_list";
    }
}