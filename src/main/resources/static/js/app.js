document.addEventListener("DOMContentLoaded", () => {
    // 검색
    document.getElementById("btnSearch")?.addEventListener("click", () => {
        const q = document.getElementById("q").value.trim();
        if (!q) return alert("검색어를 입력해주세요.");
        alert(`검색 요청: ${q}`);
    });

    // 지도 연결
    const mapEl = document.getElementById("map");
    let map = null;
    try {
        if (window.NaverMapAdapter) {
            map = new window.NaverMapAdapter(mapEl);
        }
    } catch (e) {
        console.error("지도 초기화 실패:", e);
    }

    document.getElementById("btnMyLoc")?.addEventListener("click", () => map?.centerOnMyLocation?.());
    document.getElementById("btnList")?.addEventListener("click", () => map?.toggleList?.());
    document.getElementById("btnContact")?.addEventListener("click", (e) => {
        e.preventDefault();
        alert("문의 페이지는 준비 중입니다 :)");
    });

    // 랭킹 데이터
    const storeRank = ["애니굿즈 강남역점", "오타베이스 홍대", "굿즈코엑스"];
    const productRank = ["주술회전 아크릴스탠드", "귀멸의 칼날 키링", "에반게리온 뱃지"];

    renderRank("store-rank", storeRank);
    renderRank("product-rank", productRank);
});

function renderRank(elId, items) {
    const el = document.getElementById(elId);
    if (!el) return;
    el.innerHTML = "";
    items.forEach((name) => {
        const li = document.createElement("li");
        li.textContent = name; // <ol>이 번호 자동 생성
        el.appendChild(li);
    });
}
