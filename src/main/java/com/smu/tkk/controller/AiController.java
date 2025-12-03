package com.smu.tkk.controller;

import com.smu.tkk.service.HelpAiService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/ai")
@RequiredArgsConstructor
public class AiController {

    private final HelpAiService helpAiService;   // 🔹 서비스만 주입

    @GetMapping("/chat")
    public String chat(@RequestParam String question) {
        return helpAiService.ask(question);      // 🔹 서비스에서 Ollama 호출
    }
}
