package com.smu.tkk.config;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.mvc.method.annotation.SseEmitter;

import java.io.IOException;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

@Slf4j
@Component
public class NotificationPublisher {

    // 회원별 연결된 SSE emitter 저장소
    private static final Map<Long, SseEmitter> emitters = new ConcurrentHashMap<>();


    /** 회원별 emitter 등록 */
    public void addEmitter(Long memberId, SseEmitter emitter) {
        emitters.put(memberId, emitter);

        // 연결 종료/에러 시 emitter 제거
        emitter.onCompletion(() -> emitters.remove(memberId));
        emitter.onTimeout(() -> emitters.remove(memberId));
        emitter.onError(e -> emitters.remove(memberId));

        log.info("SSE 연결 생성됨: memberId={}", memberId);
    }


    /** 서버 → 특정 사용자에게 메시지 전송 */
    public void send(Long memberId, String message) {
        SseEmitter emitter = emitters.get(memberId);

        if (emitter != null) {
            try {
                emitter.send(SseEmitter.event().name("notification").data(message));
            } catch (IOException e) {
                emitters.remove(memberId);
                log.warn("SSE 전송 실패 → emitter 제거됨: memberId={}", memberId);
            }
        } else {
            log.info("알림을 보낼 SSE 연결이 없습니다. memberId={}", memberId);
        }
    }

    public void sendToMemberWithEvent(Long memberId, String message, String eventName) {
        SseEmitter emitter = emitters.get(memberId);
        if (emitter != null) {
            try {
                emitter.send(SseEmitter.event()
                        .name(eventName)
                        .data(message));
            } catch (Exception e) {
                emitters.remove(memberId);
            }
        }
    }

    /** 🔥 서버 → 전체 사용자에게 메시지 전송 */
    public void sendToAll(String message, String eventName) {
        for (Map.Entry<Long, SseEmitter> entry : emitters.entrySet()) {
            Long memberId = entry.getKey();
            SseEmitter emitter = entry.getValue();

            if (emitter != null) {
                try {
                    emitter.send(SseEmitter.event()
                            .name(eventName)
                            .data(message));
                } catch (Exception e) {
                    emitters.remove(memberId);
                    log.warn("전체 발송 실패 → emitter 제거됨: memberId={}", memberId);
                }
            }
        }
    }

}
