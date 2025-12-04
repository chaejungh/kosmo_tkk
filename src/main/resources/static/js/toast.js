if (memberId) {
    const es = new EventSource(`/alarm/stream/${memberId}`);

    es.addEventListener("notification", (event) => {
        showToast(event.data);   //
        console.log(event.data);
    });
}
