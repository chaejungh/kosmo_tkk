if (memberId) {

    const connectSSE = () => {
        const es = new EventSource(`/alarm/stream/${memberId}`);

        es.addEventListener("notification", (event) => {
            showToast(event.data);   //
            console.log(event.data);
        });
        es.onerror = () => {
            console.log("SSE 연결 끊김 → 재연결 중...");
            setTimeout(connectSSE, 3000);
        };
    };

    connectSSE();
}
// console.log(memberId)
if (memberId) {
    const connectSSE = () => {

        const es = new EventSource(`/alarm/stream/${memberId}`);
        console.log(es)

        es.addEventListener("notification", (event) => {
            const setting = localStorage.getItem("board_alert_on");
            if (setting === "N") return;
            showToast(event.data);
        });

        es.addEventListener("message-alert", (event) => {
            const setting = localStorage.getItem("message_alert_on");
            if (setting === "N") return;  // 메시지 알림 OFF면 막기
            showToast(event.data);
        });

        es.addEventListener("inquiry-alert", (event) => {
            const setting = localStorage.getItem("inquiry_alert_on");
            if (setting === "N") return;  // 문의 알림 OFF면 무시
            showToast(event.data);
        });

        // 거래 상태 변경 알림
        es.addEventListener("trade-alert", (event) => {
            const setting = localStorage.getItem("trade_alert_on");
            if (setting === "N") return;
            showToast(event.data);
        });

        es.onerror = () => {
            console.log("SSE 연결 끊김 → 재연결 중...");
            setTimeout(connectSSE, 3000);
        };
    };
    connectSSE();
}

function showToast(message) {
    const toastEl = document.getElementById('tkkToast');
    if (!toastEl) return;
    toastEl.querySelector(".toast-body").innerText = message;
    new bootstrap.Toast(toastEl).show();
}
