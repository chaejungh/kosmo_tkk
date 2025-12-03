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
        String answer = helpAiService.ask(request.getQuestion());
        return ResponseEntity.ok(new AiInquiryResponse(answer));
    }
}
