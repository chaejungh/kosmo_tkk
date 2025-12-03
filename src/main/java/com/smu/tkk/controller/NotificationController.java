package com.smu.tkk.controller;

import com.smu.tkk.config.NotificationPublisher;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.method.annotation.SseEmitter;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@RestController
@RequestMapping("/alarm")
@RequiredArgsConstructor(onConstructor = @__(@Autowired))
public class NotificationController {
    private final NotificationPublisher notificationPublisher;

    @GetMapping(value = "/stream/{memberId}", produces = "text/event-stream")
    public SseEmitter stream(@PathVariable Long memberId) throws IOException {
        SseEmitter emitter = new SseEmitter(Long.MAX_VALUE);
        notificationPublisher.addEmitter(memberId, emitter);
        return emitter;
    }

}
