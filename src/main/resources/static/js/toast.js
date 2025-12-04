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
