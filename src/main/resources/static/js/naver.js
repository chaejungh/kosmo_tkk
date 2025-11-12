// 네이버맵 임시 어댑터 (실제 API 붙이기 전)
window.NaverMapAdapter = class {
    constructor(el) {
        this.el = el;
        if (!el) return;
        this.el.style.display = "flex";
        this.el.style.alignItems = "center";
        this.el.style.justifyContent = "center";
        this.el.innerText = "지도 준비 중";
    }
    centerOnMyLocation() {
        alert("내 위치 기능은 지도 SDK 연결 후 동작합니다.");
    }
    toggleList() {
        alert("목록 패널은 지도 SDK 연결 후 표시됩니다.");
    }
};
