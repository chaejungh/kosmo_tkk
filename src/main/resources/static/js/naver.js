// static/js/naver.js

window.addEventListener('DOMContentLoaded', function () {
    // index.html 안의 <div id="map">을 찾아서 지도 표시
    var mapDiv = document.getElementById('map');
    if (!mapDiv) return;   // 다른 페이지에서 에러 안 나게

    var map = new naver.maps.Map('map', {
        center: new naver.maps.LatLng(37.5665, 126.9780), // 초기 위치(서울 시청 근처)
        zoom: 12
    });

    // 테스트용 마커 하나 찍기
    new naver.maps.Marker({
        position: new naver.maps.LatLng(37.5665, 126.9780),
        map: map,
        title: '테스트 마커'
    });
});