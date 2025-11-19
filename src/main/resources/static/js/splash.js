// /static/js/splash.js
window.addEventListener("load", () => {
    const splash = document.getElementById("splash");
    const app = document.getElementById("app");

    // 전체 연출 시간 (캐릭터 + 지도 떨어지는 거) 맞춰서 2.5 ~ 3초 정도
    const TOTAL_DURATION = 2600;

    // 처음엔 app 숨겨둠
    app.classList.remove("hidden");
    app.style.opacity = 0;

    setTimeout(() => {
        // 스플래시 사라지는 애니메이션
        splash.classList.add("fade-out");
        app.classList.add("show");

        // 애니 끝난 뒤 완전히 제거
        setTimeout(() => {
            splash.style.display = "none";
        }, 700);
    }, TOTAL_DURATION);
});