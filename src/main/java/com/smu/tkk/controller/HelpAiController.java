package com.smu.tkk.controller;

import com.smu.tkk.dto.AiInquiryRequest;
import com.smu.tkk.dto.AiInquiryResponse;
import com.smu.tkk.service.HelpAiService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequiredArgsConstructor
@RequestMapping("/api/help")
public class HelpAiController {

    private final HelpAiService helpAiService;

    @PostMapping("/ai")
    public ResponseEntity<AiInquiryResponse> ask(@RequestBody AiInquiryRequest request) {

        String question = request.getQuestion();
        String answer = helpAiService.ask(question);

        AiInquiryResponse resp = new AiInquiryResponse();
        resp.setAnswer(answer);

        return ResponseEntity.ok(resp);
    }
}
