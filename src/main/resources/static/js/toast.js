if (memberId) {
    const es = new EventSource(`/alarm/stream/${memberId}`);

    es.addEventListener("notification", (event) => {
        showToast(event.data);   // 드디어 토스트 뜸!
        console.log(event.data);
    });
}
