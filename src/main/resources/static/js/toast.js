

///session 멤버아이디로 변경 ///
    const memberId=1;
    const es = new EventSource(`/alarm/stream/${memberId}`);
    console.log(es);
    es.onmessage = (event) => {
    // showToast(event.data); // 서버에서 보낸 메시지를 토스트로 띄움
    console.log(event.data)

};

    es.addEventListener("notification", (event) => {
    // showToast(event.data);
    console.log(event.data)

});


