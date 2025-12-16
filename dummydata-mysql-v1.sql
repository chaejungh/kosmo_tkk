

USE tkk;

-- 2-1. MEMBER (회원) - 10명
INSERT INTO member (
    member_id, login_id, login_pw, nickname, profile_image_url, intro,
    user_level, email, gender, nationality, verify_code, created_at, deleted_yn
) VALUES
      (1, 'kuku001', 'pw1234!', '더쿠1', NULL, '홍대 성지 순례 중인 굿즈러입니다.', 1,
       'kuku1@example.com', '여자', '내국인', NULL, NOW(), 'N'),
      (2, 'kuku002', 'pw1234!', '굿즈부자', NULL, '포카랑 피규어 모으는 중.', 1,
       'kuku2@example.com', '남자', '내국인', NULL, NOW(), 'N'),
      (3, 'kuku003', 'pw1234!', '코스플레이어', NULL, '코스프레 사진 자랑하러 왔어요.', 1,
       'kuku3@example.com', '여자', '외국인', NULL, NOW(), 'N'),
      (4, 'kuku004', 'pw1234!', '덕후곰', NULL, '굿즈 사느라 통장 텅장.', 1,
       'kuku4@example.com', '남자', '내국인', NULL, NOW(), 'N'),
      (5, 'kuku005', 'pw1234!', '피규어왕', NULL, '피규어만 100개 넘음.', 1,
       'kuku5@example.com', '남자', '내국인', NULL, NOW(), 'N'),
      (6, 'kuku006', 'pw1234!', '포카장인', NULL, '포카 정리만 하루종일.', 1,
       'kuku6@example.com', '여자', '내국인', NULL, NOW(), 'N'),
      (7, 'kuku007', 'pw1234!', '렌고쿠최애', NULL, '불꽃 기둥 사랑해.', 1,
       'kuku7@example.com', '여자', '내국인', NULL, NOW(), 'N'),
      (8, 'kuku008', 'pw1234!', '블루록빠', NULL, '축구 + 애니 = 완벽.', 1,
       'kuku8@example.com', '남자', '외국인', NULL, NOW(), 'N'),
      (9, 'kuku009', 'pw1234!', '굿즈정리러', NULL, '방 정리하다 굿즈 구경함.', 1,
       'kuku9@example.com', '여자', '내국인', NULL, NOW(), 'N'),
      (10,'kuku010', 'pw1234!', '뉴비덕후', NULL, '입덕한 지 한 달.', 1,
       'kuku10@example.com','남자','내국인', NULL, NOW(), 'N');

-- 2-2. MEMBER NOTIFICATION SETTING (회원 알림 설정)
INSERT INTO member_notification_setting (
    member_id, comment_yn, like_yn, trade_yn, event_yn, created_at
) VALUES
      (1, 'Y', 'Y', 'Y', 'Y', NOW()),
      (2, 'Y', 'Y', 'Y', 'N', NOW()),
      (3, 'Y', 'N', 'Y', 'Y', NOW()),
      (4, 'Y', 'Y', 'Y', 'Y', NOW()),
      (5, 'Y', 'Y', 'N', 'N', NOW()),
      (6, 'Y', 'Y', 'Y', 'Y', NOW()),
      (7, 'Y', 'N', 'N', 'Y', NOW()),
      (8, 'Y', 'Y', 'Y', 'Y', NOW()),
      (9, 'Y', 'Y', 'Y', 'Y', NOW()),
      (10,'Y','Y','Y','Y', NOW());

-- 2-3. STORE (굿즈 매장) - 10개
INSERT INTO store (
    store_id, name, one_line_desc, address, region_name,
    latitude, longitude, avg_rating, bookmark_count, phone, created_at, deleted_yn
) VALUES
      (1, '홍대 더쿠로드샵', '홍대 애니 굿즈 성지', '서울 마포구 홍대입구로 1', '홍대',
       37.55719200, 126.92387000, 4.8, 0, '02-111-1111', NOW(), 'N'),
      (2, '강남 피규어 타운', '피규어 전문 매장', '서울 강남구 테헤란로 100', '강남',
       37.49809500, 127.02761000, 4.6, 0, '02-222-2222', NOW(), 'N'),
      (3, '부산 애니 플래닛', '부산 애니 굿즈 총집합', '부산 해운대구 해운대로 50', '부산',
       35.16313400, 129.16360000, 4.7, 0, '051-333-3333', NOW(), 'N'),
      (4, '대구 피규어 팩토리', '한정 피규어 다수 보유', '대구 중구 동성로 20', '대구',
       35.86940000, 128.59450000, 4.5, 0, '053-444-4444', NOW(), 'N'),
      (5, '신촌 오타쿠 하우스', '포카/키링 천국', '서울 서대문구 신촌로 30', '신촌',
       37.55980000, 126.94260000, 4.3, 0, '02-555-5555', NOW(), 'N'),
      (6, '일산 애니 스퀘어', '일산 대표 애니 샵', '경기 고양시 일산동구 중앙로 1200', '일산',
       37.65840000, 126.83200000, 4.4, 0, '031-666-6666', NOW(), 'N'),
      (7, '수원 굿즈 스튜디오', '수원역 굿즈 모음', '경기 수원시 팔달구 매산로 10', '수원',
       37.26640000, 127.00000000, 4.2, 0, '031-777-7777', NOW(), 'N'),
      (8, '인천 포카마켓', '포카 전문 매장', '인천 남동구 예술로 100', '인천',
       37.45230000, 126.70190000, 4.1, 0, '032-888-8888', NOW(), 'N'),
      (9, '광주 덕질존', '광주 애니 굿즈 핫플', '광주 동구 충장로 50', '광주',
       35.14600000, 126.91990000, 4.3, 0, '062-999-9999', NOW(), 'N'),
      (10,'울산 피규어 라운지', '울산 애니 피규어샵', '울산 남구 삼산로 200', '울산',
       35.53840000, 129.31140000, 4.5, 0, '052-000-0000', NOW(), 'N');

-- 2-4. STORE_BOOKMARK (매장 북마크)
INSERT INTO store_bookmark (store_bookmark_id, member_id, store_id, created_at) VALUES
                                                                                    (1, 1, 1, NOW()),
                                                                                    (2, 1, 2, NOW()),
                                                                                    (3, 2, 1, NOW()),
                                                                                    (4, 3, 3, NOW()),
                                                                                    (5, 4, 4, NOW()),
                                                                                    (6, 5, 1, NOW()),
                                                                                    (7, 6, 5, NOW()),
                                                                                    (8, 7, 2, NOW()),
                                                                                    (9, 8, 6, NOW()),
                                                                                    (10,9, 1, NOW());

-- 2-5. STORE_GOODS (매장 굿즈) - 예시 10개
INSERT INTO store_goods (
    store_id, name, work_name, character_name, category,
    price, stock_qty, thumbnail_url, created_at
) VALUES
-- 1. 루피 BIG SOFVIMATES
( 1, 'BIG SOFVIMATES 루피 피규어', '원피스', '몽키 D. 루피', '피규어',
 28000, 8, 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/goods/%EC%9B%90%ED%94%BC%EC%8A%A4/%EC%9B%90%ED%94%BC%EC%8A%A4+BIG+SOFVIMATES+%ED%94%BC%EA%B7%9C%EC%96%B4+-+%EB%AA%BD%ED%82%A4+D.+%EB%A3%A8%ED%94%BC.png', NOW()),

-- 2. 쵸파 드럼왕국 Ver.
( 1, 'BIG SOFVIMATES 쵸파 드럼왕국 Ver.', '원피스', '토니토니 쵸파', '피규어',
 26000, 10, 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/goods/%EC%9B%90%ED%94%BC%EC%8A%A4/%EC%9B%90%ED%94%BC%EC%8A%A4+BIG+SOFVIMATES+%ED%94%BC%EA%B7%9C%EC%96%B4+-+%EC%B5%B8%ED%8C%8C+%EB%93%9C%EB%9F%BC+%EC%99%95%EA%B5%AD+Ver..png', NOW()),

-- 3. 트라팔가 로우 DXF
(1, 'DXF 그랜드라인 스페셜 트라팔가 로우', '원피스', '트라팔가 로우', '피규어',
 32000, 6, 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/goods/%EC%9B%90%ED%94%BC%EC%8A%A4/%EC%9B%90%ED%94%BC%EC%8A%A4+DXF+%EA%B7%B8%EB%9E%9C%EB%93%9C%EB%9D%BC%EC%9D%B8+%EC%8B%9C%EB%A6%AC%EC%A6%88+%EC%8A%A4%ED%8E%98%EC%85%9C+%ED%94%BC%EA%B7%9C%EC%96%B4+-+%ED%8A%B8%EB%9D%BC%ED%8C%94%EA%B0%80+%EB%A1%9C%EC%9A%B0.png', NOW()),

-- 4. 루피 GRANDISTA 스페셜
(1, 'GRANDISTA 루피 스페셜 에디션', '원피스', '몽키 D. 루피', '피규어',
 35000, 5, 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/goods/%EC%9B%90%ED%94%BC%EC%8A%A4/%EC%9B%90%ED%94%BC%EC%8A%A4+GRANDISTA+%EA%B7%B8%EB%9E%9C%EB%94%94%EC%8A%A4%ED%83%80+%ED%94%BC%EA%B7%9C%EC%96%B4+-+%EB%AA%BD%ED%82%A4+D.+%EB%A3%A8%ED%94%BC+%EC%8A%A4%ED%8E%98%EC%85%9C+%EC%97%90%EB%94%94%EC%85%98.png', NOW()),

-- 5. 샹크스 THEORAMA SOUL
(1, 'THEORAMA SOUL 샹크스', '원피스', '샹크스', '피규어',
 68000, 3, 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/goods/%EC%9B%90%ED%94%BC%EC%8A%A4/%EC%9B%90%ED%94%BC%EC%8A%A4+THEORAMA+SOUL+%ED%94%BC%EA%B7%9C%EC%96%B4+-+%EC%83%B9%ED%81%AC%EC%8A%A4.png', NOW()),

-- 6. 루피 VS 키자루 메가 WCF
(1, '메가 월드 콜렉터블 루피 VS 키자루', '원피스', '몽키 D. 루피', '피규어',
 55000, 4, 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/goods/%EC%9B%90%ED%94%BC%EC%8A%A4/%EC%9B%90%ED%94%BC%EC%8A%A4+%EB%A9%94%EA%B0%80+%EC%9B%94%EB%93%9C+%EC%BD%9C%EB%A0%89%ED%84%B0%EB%B8%94+%ED%94%BC%EA%B7%9C%EC%96%B4+-+%EB%AA%BD%ED%82%A4+D.+%EB%A3%A8%ED%94%BC+VS+%EB%B3%BC%EC%82%AC%EB%A6%AC%EB%85%B8++%ED%82%A4%EC%9E%90%EB%A3%A8.png', NOW()),

-- 7. 상디 POP KxMAXIMUM
(1, 'POP KxMAXIMUM 상디', '원피스', '상디', '포스터',
 198000, 2, 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/goods/%EC%9B%90%ED%94%BC%EC%8A%A4/%EC%9B%90%ED%94%BC%EC%8A%A4+%EB%A9%94%EA%B0%80%ED%95%98%EC%9A%B0%EC%8A%A4+PoP+Portrait.Of.Pirates+KxMAXIMUM+%ED%94%BC%EA%B7%9C%EC%96%B4+-+%EC%83%81%EB%94%94.jpg', NOW()),

-- 8. 흰 수염 POP NEO-MAXIMUM
(1, 'POP NEO-MAXIMUM 흰 수염', '원피스', '에드워드 뉴게이트', '포스터',
 298000, 1, 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/goods/%EC%9B%90%ED%94%BC%EC%8A%A4/%EC%9B%90%ED%94%BC%EC%8A%A4+%EB%A9%94%EA%B0%80%ED%95%98%EC%9A%B0%EC%8A%A4+POP+Portrait.Of.Pirates+NEO-MAXIMUM+%ED%94%BC%EA%B7%9C%EC%96%B4+-+%EC%97%90%EB%93%9C%EC%9B%8C%EB%93%9C+%EB%89%B4%EA%B2%8C%EC%9D%B4%ED%8A%B8++%ED%9D%B0+%EC%88%98%EC%97%BC.jpg', NOW()),

-- 9. 징베 POP WA-MAXIMUM
(1, 'POP WA-MAXIMUM 바다의 협객 징베', '원피스', '징베', '포스터',
 210000, 2, 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/goods/%EC%9B%90%ED%94%BC%EC%8A%A4/%ED%94%BC%EC%8A%A4+%EB%A9%94%EA%B0%80%ED%95%98%EC%9A%B0%EC%8A%A4+PoP+Portrait.Of.Pirates+WA-MAXIMUM+%ED%94%BC%EA%B7%9C%EC%96%B4+-+%EB%B0%94%EB%8B%A4%EC%9D%98+%ED%98%91%EA%B0%9D+%EC%A7%95%EB%B2%A0.jpg', NOW()),

-- 10. 루피 기어5 스타일 피규어
(1, '기어5 루피 스페셜 액션 피규어', '원피스', '몽키 D. 루피', '피규어',
 72000, 3, 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/goods/%EC%9B%90%ED%94%BC%EC%8A%A4/%EC%9B%90%ED%94%BC%EC%8A%A4+%EB%A9%94%EA%B0%80%ED%95%98%EC%9A%B0%EC%8A%A4+%EB%A3%A9%EC%97%85+%ED%94%BC%EA%B7%9C%EC%96%B4+-+%EB%AA%BD%ED%82%A4+D.+%EB%A3%A8%ED%94%BC+%EA%B8%B0%EC%96%B4+5.jpg', NOW()),

-- 11. 하이큐 Yummy 마스코트 A5 엽서 세트
(1, '하이큐 Yummy 마스코트 A5 엽서 세트', '하이큐', '히나타 쇼요', '엽서',
    12000, 15, 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/goods/%ED%95%98%EC%9D%B4%ED%81%90/%ED%95%98%EC%9D%B4%ED%81%90+Yummy+%EB%A7%88%EC%8A%A4%EC%BD%94%ED%8A%B8+%EC%8B%9C%EB%A6%AC%EC%A6%88+%EA%B3%B5%EC%8B%9D+A5+%EC%97%BD%EC%84%9C+%EC%84%B8%ED%8A%B8.png', NOW()),

-- 12. 보쿠토 코타로 푸리누이타치 미니 봉제인형
(1, '푸리누이타치 드림 미니 봉제인형', '하이큐', '보쿠토 코타로', '봉제인형',
    22000, 8, 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/goods/%ED%95%98%EC%9D%B4%ED%81%90/%ED%95%98%EC%9D%B4%ED%81%90+%EA%B5%BF%EC%A6%88+%EB%B0%98%EB%8B%A4%EC%9D%B4+%EB%82%A8%EC%BD%94+%EB%88%84%EC%9D%B4+%ED%91%B8%EB%A6%AC%EB%88%84%EC%9D%B4%ED%83%80%EC%B9%98+%EB%93%9C%EB%A6%BC+%EB%AF%B8%EB%8B%88+%EB%B4%89%EC%A0%9C%EC%9D%B8%ED%98%95+-+%EB%B3%B4%EC%BF%A0%ED%86%A0+%EC%BD%94%ED%83%80%EB%A1%9C.jpg', NOW()),

-- 13. 쿠로오 테츠로 Mocho 아크릴 스탠드
(1, 'Mocho 시리즈 아크릴 스탠드 3탄', '하이큐', '쿠로오 테츠로', '아크릴스탠드',
    18000, 10, 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/goods/%ED%95%98%EC%9D%B4%ED%81%90/%ED%95%98%EC%9D%B4%ED%81%90+%EA%B5%BF%EC%A6%88+%EC%8B%B1%ED%81%AC+%EC%9D%B4%EB%85%B8%EB%B2%A0%EC%9D%B4%EC%85%98+Mocho+%EC%8B%9C%EB%A6%AC%EC%A6%88+3%ED%83%84+%EC%95%84%ED%81%AC%EB%A6%B4+%EC%8A%A4%ED%83%A0%EB%93%9C+-+%EC%BF%A0%EB%A1%9C%EC%98%A4+%ED%85%8C%EC%B8%A0%EB%A1%9C.jpg', NOW()),

-- 14. 코모리 모토야 Mocho 아크릴 키체인
(1, 'Mocho 시리즈 아크릴 키체인 4탄', '하이큐', '코모리 모토야', '아크릴키링',
    9000, 20, 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/goods/%ED%95%98%EC%9D%B4%ED%81%90/%ED%95%98%EC%9D%B4%ED%81%90+%EA%B5%BF%EC%A6%88+%EC%8B%B1%ED%81%AC+%EC%9D%B4%EB%85%B8%EB%B2%A0%EC%9D%B4%EC%85%98+Mocho+%EC%8B%9C%EB%A6%AC%EC%A6%88+4%ED%83%84+%EC%95%84%ED%81%AC%EB%A6%B4+%ED%82%A4%EC%B2%B4%EC%9D%B8+-+%EC%BD%94%EB%AA%A8%EB%A6%AC+%EB%AA%A8%ED%86%A0%EC%95%BC.jpg', NOW()),

-- 15. 쿠로오 테츠로 치미케모 마스코트 봉제인형
(1, '치미케모 마스코트 봉제인형 JF2026', '하이큐', '쿠로오 테츠로', '봉제인형',
    32000, 5, 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/goods/%ED%95%98%EC%9D%B4%ED%81%90/%ED%95%98%EC%9D%B4%ED%81%90+%EA%B5%BF%EC%A6%88+%EC%97%94%EC%8A%A4%EC%B9%B4%EC%9D%B4+JF+2026+%EC%B4%88%ED%8A%B9%EB%8C%80+%EC%B9%98%EB%AF%B8%EC%BC%80%EB%AA%A8+%EB%A7%88%EC%8A%A4%EC%BD%94%ED%8A%B8+%EB%B4%89%EC%A0%9C%EC%9D%B8%ED%98%95++%EB%88%84%EC%9D%B4+-+%EC%BF%A0%EB%A1%9C%EC%98%A4+%ED%85%8C%EC%B8%A0%EB%A1%9C.png', NOW()),

-- 16. 히나타 쇼요 치미케모 마스코트 봉제인형
(1, '치미케모 마스코트 봉제인형 JF2026', '하이큐', '히나타 쇼요', '봉제인형',
    32000, 6, 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/goods/%ED%95%98%EC%9D%B4%ED%81%90/%ED%95%98%EC%9D%B4%ED%81%90+%EA%B5%BF%EC%A6%88+%EC%97%94%EC%8A%A4%EC%B9%B4%EC%9D%B4+JF+2026+%EC%B4%88%ED%8A%B9%EB%8C%80+%EC%B9%98%EB%AF%B8%EC%BC%80%EB%AA%A8+%EB%A7%88%EC%8A%A4%EC%BD%94%ED%8A%B8+%EB%B4%89%EC%A0%9C%EC%9D%B8%ED%98%95++%EB%88%84%EC%9D%B4+-+%ED%9E%88%EB%82%98%ED%83%80+%EC%87%BC%EC%9A%94.png', NOW()),

-- 17. 아카아시 케이지 점프 아크릴 기가 피규어 스탠드
(1, '점프 아크릴 기가 피규어 스탠드', '하이큐', '아카아시 케이지', '아크릴스탠드',
    29000, 7, 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/goods/%ED%95%98%EC%9D%B4%ED%81%90/%ED%95%98%EC%9D%B4%ED%81%90+%EA%B5%BF%EC%A6%88+%EC%A0%90%ED%94%84+%EC%95%84%ED%81%AC%EB%A6%B4+%EA%B8%B0%EA%B0%80+%ED%94%BC%EA%B7%9C%EC%96%B4+%EC%8A%A4%ED%83%A0%EB%93%9C+-+%EC%95%84%EC%B9%B4%EC%95%84%EC%8B%9C+%EC%BC%80%EC%9D%B4%EC%A7%80.png', NOW()),

-- 18. 코즈메 켄마 JF2026 아크릴 스탠드
(1, 'JF2026 아크릴 스탠드', '하이큐', '코즈메 켄마', '아크릴스탠드',
    25000, 6, 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/goods/%ED%95%98%EC%9D%B4%ED%81%90/%ED%95%98%EC%9D%B4%ED%81%90+%EA%B5%BF%EC%A6%88+%ED%83%80%EC%B9%B4%EB%9D%BC%ED%86%A0%EB%AF%B8+%EC%95%84%EC%B8%A0+JF+2026+%EC%95%84%ED%81%AC%EB%A6%B4+%EC%8A%A4%ED%83%A0%EB%93%9C+-+%EC%BD%94%EC%A6%88%EB%A9%94+%EC%BC%84%EB%A7%88.png', NOW()),

-- 19. 카게야마 토비오 룩업 피규어 유니폼 Ver.
(1, '룩업 피규어 유니폼 Ver.', '하이큐', '카게야마 토비오', '피규어',
    42000, 4, 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/goods/%ED%95%98%EC%9D%B4%ED%81%90/%ED%95%98%EC%9D%B4%ED%81%90+%EB%A9%94%EA%B0%80%ED%95%98%EC%9A%B0%EC%8A%A4+%EB%A3%A9%EC%97%85+%ED%94%BC%EA%B7%9C%EC%96%B4+-+%EC%B9%B4%EA%B2%8C%EC%95%BC%EB%A7%88+%ED%86%A0%EB%B9%84%EC%98%A4+%EC%9C%A0%EB%8B%88%ED%8F%BC+Ver..png', NOW()),

-- 20. 히나타 쇼요 룩업 피규어 유니폼 Ver.
(1, '룩업 피규어 유니폼 Ver.', '하이큐', '히나타 쇼요', '피규어',
    42000, 5, 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/goods/%ED%95%98%EC%9D%B4%ED%81%90/%ED%95%98%EC%9D%B4%ED%81%90+%EB%A9%94%EA%B0%80%ED%95%98%EC%9A%B0%EC%8A%A4+%EB%A3%A9%EC%97%85+%ED%94%BC%EA%B7%9C%EC%96%B4+-+%ED%9E%88%EB%82%98%ED%83%80+%EC%87%BC%EC%9A%94+%EC%9C%A0%EB%8B%88%ED%8F%BC+Ver..png', NOW()),

-- 21. 넨도로이드 카마도 네즈코
(1, '넨도로이드 1194 카마도 네즈코', '귀멸의 칼날', '카마도 네즈코', '피규어',
 62000, 5, 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/goods/%EA%B7%80%EC%B9%BC/%EA%B7%80%EB%A9%B8%EC%9D%98+%EC%B9%BC%EB%82%A0+%EA%B5%BF%EC%8A%A4%EB%A7%88%EC%9D%BC+%EC%BB%B4%ED%8D%BC%EB%8B%88+%EB%84%A8%EB%8F%84%EB%A1%9C%EC%9D%B4%EB%93%9C+1194+%ED%94%BC%EA%B7%9C%EC%96%B4+-+%EC%B9%B4%EB%A7%88%EB%8F%84+%EB%84%A4%EC%A6%88%EC%BD%94.png', NOW()),

-- 22. 넨도로이드 아가츠마 젠이츠
(1, '넨도로이드 1334 아가츠마 젠이츠', '귀멸의 칼날', '아가츠마 젠이츠', '피규어',
 62000, 4, 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/goods/%EA%B7%80%EC%B9%BC/%EA%B7%80%EB%A9%B8%EC%9D%98+%EC%B9%BC%EB%82%A0+%EA%B5%BF%EC%8A%A4%EB%A7%88%EC%9D%BC+%EC%BB%B4%ED%8D%BC%EB%8B%88+%EB%84%A8%EB%8F%84%EB%A1%9C%EC%9D%B4%EB%93%9C+1334+%ED%94%BC%EA%B7%9C%EC%96%B4+-+%EC%95%84%EA%B0%80%EC%B8%A0%EB%A7%88+%EC%A0%A0%EC%9D%B4%EC%B8%A0.png', NOW()),

-- 23. Fluffy Puffy 챠챠마루
(1, 'Fluffy Puffy 챠챠마루 피규어', '귀멸의 칼날', '챠챠마루', '피규어',
 28000, 9, 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/goods/%EA%B7%80%EC%B9%BC/%EA%B7%80%EB%A9%B8%EC%9D%98+%EC%B9%BC%EB%82%A0+%EA%B7%80%EC%B9%BC+Fluffy+Puffy+%ED%94%8C%EB%9F%AC%ED%94%BC+%ED%8D%BC%ED%94%BC+%ED%94%BC%EA%B7%9C%EC%96%B4+-+%EC%B1%A0%EC%B1%A0%EB%A7%88%EB%A3%A8.jpg', NOW()),

-- 24. PalVerse 피규어 1탄 랜덤
(1, 'PalVerse 피규어 1탄 랜덤', '귀멸의 칼날', '랜덤', '피규어',
 12000, 20, 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/goods/%EA%B7%80%EC%B9%BC/%EA%B7%80%EB%A9%B8%EC%9D%98+%EC%B9%BC%EB%82%A0+%EA%B7%80%EC%B9%BC+%EA%B5%BF%EC%A6%88+%EB%B6%80%EC%8B%9C%EB%A1%9C%EB%93%9C+%ED%81%AC%EB%A6%AC%EC%97%90%EC%9D%B4%ED%8B%B0%EB%B8%8C+PalVerse+%ED%94%BC%EA%B7%9C%EC%96%B4+1%ED%83%84+%EB%9E%9C%EB%8D%A4+%EB%8B%A8%ED%92%88.jpg', NOW()),

-- 25. 모치코로링 누이 봉제인형 7탄 랜덤
(1, '모치코로링 누이 봉제인형 7탄 랜덤', '귀멸의 칼날', '랜덤', '봉제인형',
 14000, 18, 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/goods/%EA%B7%80%EC%B9%BC/%EA%B7%80%EB%A9%B8%EC%9D%98+%EC%B9%BC%EB%82%A0+%EA%B7%80%EC%B9%BC+%EA%B5%BF%EC%A6%88+%EC%A4%91%EC%99%B8%EA%B4%91%EC%97%85+%EB%AC%B4%ED%95%9C%EC%84%B1%ED%8E%B8+%EC%A0%9C1%EC%9E%A5+%EB%AA%A8%EC%B9%98%EC%BD%94%EB%A1%9C%EB%A7%81+%EB%88%84%EC%9D%B4+%EB%B4%89%EC%A0%9C%EC%9D%B8%ED%98%95+7%ED%83%84+%EB%9E%9C%EB%8D%A4+%EB%8B%A8%ED%92%88jpg.jpg', NOW()),

-- 26. 피탄코 러버 스트랩 A 랜덤
(1, '피탄코 러버 스트랩 A 랜덤', '귀멸의 칼날', '랜덤', '러버스트랩',
 8000, 25, 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/goods/%EA%B7%80%EC%B9%BC/%EA%B7%80%EB%A9%B8%EC%9D%98+%EC%B9%BC%EB%82%A0+%EA%B7%80%EC%B9%BC+%EA%B5%BF%EC%A6%88+%EC%A4%91%EC%99%B8%EA%B4%91%EC%97%85+%EB%AC%B4%ED%95%9C%EC%84%B1%ED%8E%B8+%EC%A0%9C1%EC%9E%A5+%ED%94%BC%ED%83%84%EC%BD%94+%EB%9F%AC%EB%B2%84+%EC%8A%A4%ED%8A%B8%EB%9E%A9+A+%EB%9E%9C%EB%8D%A4+%EB%8B%A8%ED%92%88.jpg', NOW()),

-- 27. 룩업 피규어 아가츠마 젠이츠
(1, '룩업 피규어 아가츠마 젠이츠', '귀멸의 칼날', '아가츠마 젠이츠', '피규어',
 42000, 6, 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/goods/%EA%B7%80%EC%B9%BC/%EA%B7%80%EB%A9%B8%EC%9D%98+%EC%B9%BC%EB%82%A0+%EA%B7%80%EC%B9%BC+%EB%A9%94%EA%B0%80%ED%95%98%EC%9A%B0%EC%8A%A4+%EB%A3%A9%EC%97%85+%ED%94%BC%EA%B7%9C%EC%96%B4+-+%EC%95%84%EA%B0%80%EC%B8%A0%EB%A7%88+%EC%A0%A0%EC%9D%B4%EC%B8%A0.png', NOW()),

-- 28. 극장판 무한성편 키 비주얼 A3 포스터
(1, '극장판 무한성편 키 비주얼 A3 포스터', '귀멸의 칼날', '카마도 탄지로', '포스터',
 18000, 10, 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/goods/%EA%B7%80%EC%B9%BC/%EA%B7%80%EB%A9%B8%EC%9D%98+%EC%B9%BC%EB%82%A0+%EA%B7%B9%EC%9E%A5%ED%8C%90+%EB%AC%B4%ED%95%9C%EC%84%B1%ED%8E%B8+%EA%B7%80%EC%B9%BC+%EA%B5%BF%EC%A6%88+%ED%82%A4+%EB%B9%84%EC%A3%BC%EC%96%BC+%ED%8A%B9%EC%88%98+%EC%9D%B8%EC%87%84+A3+%ED%8F%AC%EC%8A%A4%ED%84%B0.png', NOW()),

-- 29. 룩업 피규어 도우마
(1, '룩업 피규어 도우마', '귀멸의 칼날', '도우마', '피규어',
 44000, 4, 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/goods/%EA%B7%80%EC%B9%BC/%EA%B7%80%EB%A9%B8%EC%9D%98+%EC%B9%BC%EB%82%A0+%EB%A9%94%EA%B0%80%ED%95%98%EC%9A%B0%EC%8A%A4+%EB%A3%A9%EC%97%85+%ED%94%BC%EA%B7%9C%EC%96%B4+-+%EB%8F%84%EC%9A%B0%EB%A7%88.png', NOW()),

-- 30. 룩업 피규어 코쵸우 시노부 스마일 Ver.
(1, '룩업 피규어 코쵸우 시노부 스마일 Ver.', '귀멸의 칼날', '코쵸우 시노부', '피규어',
 44000, 5, 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/goods/%EA%B7%80%EC%B9%BC/%EA%B7%80%EB%A9%B8%EC%9D%98+%EC%B9%BC%EB%82%A0+%EB%A9%94%EA%B0%80%ED%95%98%EC%9A%B0%EC%8A%A4+%EB%A3%A9%EC%97%85+%ED%94%BC%EA%B7%9C%EC%96%B4+-+%EC%BD%94%EC%B5%B8%EC%9A%B0+%EC%8B%9C%EB%85%B8%EB%B6%80+%EC%8A%A4%EB%A7%88%EC%9D%BC+Ver..png', NOW()),

-- 31. JF2026 아크릴 스탠드 쵸소우
(1, 'JF2026 아크릴 스탠드 쵸소우', '주술회전', '쵸소우', '아크릴스탠드',
 24000, 7, 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/goods/%EC%A3%BC%EC%88%A0%ED%9A%8C%EC%A0%84/%EC%88%A0%ED%9A%8C%EC%A0%84+%EA%B7%B9%EC%9E%A5%ED%8C%90+%EC%8B%9C%EB%B6%80%EC%95%BC%EC%82%AC%EB%B3%80X%EC%82%AC%EB%A9%B8%ED%9A%8C%EC%9C%A0+%EA%B5%BF%EC%A6%88+%EB%8F%84%ED%98%B8+JF+2026+%EC%95%84%ED%81%AC%EB%A6%B4+%EC%8A%A4%ED%83%A0%EB%93%9C+-+%EC%B5%B8%EC%86%8C%EC%9A%B0.png', NOW()),

-- 32. 푸리누이타치 드림 미니 봉제인형 옷코츠 유타
(1, '푸리누이타치 드림 미니 봉제인형', '주술회전', '옷코츠 유타', '봉제인형',
 22000, 8, 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/goods/%EC%A3%BC%EC%88%A0%ED%9A%8C%EC%A0%84/%EC%A3%BC%EC%88%A0%ED%9A%8C%EC%A0%84+%EA%B5%BF%EC%A6%88+%EB%B0%98%EB%8B%A4%EC%9D%B4+%EB%82%A8%EC%BD%94+%EB%88%84%EC%9D%B4+%ED%91%B8%EB%A6%AC%EB%88%84%EC%9D%B4%ED%83%80%EC%B9%98+%EB%93%9C%EB%A6%BC+%EB%AF%B8%EB%8B%88+%EB%B4%89%EC%A0%9C%EC%9D%B8%ED%98%95++%EB%88%84%EC%9D%B4+-+%EC%98%B7%EC%BD%94%EC%B8%A0+%EC%9C%A0%ED%83%80.jpg', NOW()),

-- 33. 푸리누이타치 드림 미니 봉제인형 이타도리 유지
(1, '푸리누이타치 드림 미니 봉제인형', '주술회전', '이타도리 유지', '봉제인형',
 22000, 9, 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/goods/%EC%A3%BC%EC%88%A0%ED%9A%8C%EC%A0%84/%EC%A3%BC%EC%88%A0%ED%9A%8C%EC%A0%84+%EA%B5%BF%EC%A6%88+%EB%B0%98%EB%8B%A4%EC%9D%B4+%EB%82%A8%EC%BD%94+%EB%88%84%EC%9D%B4+%ED%91%B8%EB%A6%AC%EB%88%84%EC%9D%B4%ED%83%80%EC%B9%98+%EB%93%9C%EB%A6%BC+%EB%AF%B8%EB%8B%88+%EB%B4%89%EC%A0%9C%EC%9D%B8%ED%98%95++%EB%88%84%EC%9D%B4+-+%EC%9D%B4%ED%83%80%EB%8F%84%EB%A6%AC+%EC%9C%A0%EC%A7%80++%EC%9D%B4%ED%83%80%EB%8F%84%EB%A6%AC+%EC%9C%A0%EC%9A%B0%EC%A7%80.jpg', NOW()),

-- 34. 트레이딩 글리터 캔 뱃지 할로윈 Ver. 랜덤
(1, '트레이딩 글리터 캔 뱃지 할로윈 Ver. 랜덤', '주술회전', '랜덤', '캔뱃지',
 7000, 30, 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/goods/%EC%A3%BC%EC%88%A0%ED%9A%8C%EC%A0%84/%EC%A3%BC%EC%88%A0%ED%9A%8C%EC%A0%84+%EA%B5%BF%EC%A6%88+%EC%A4%91%EC%99%B8%EA%B4%91%EC%97%85+%ED%8A%B8%EB%A0%88%EC%9D%B4%EB%94%A9+%EA%B8%80%EB%A6%AC%ED%84%B0+%EC%BA%94+%EB%B1%83%EC%A7%80+%ED%95%A0%EB%A1%9C%EC%9C%88+Ver.+%EB%9E%9C%EB%8D%A4+%EB%8B%A8%ED%92%88.jpg', NOW()),

-- 35. JF2026 아크릴 스탠드 옷코츠 유타
(1, 'JF2026 아크릴 스탠드 옷코츠 유타', '주술회전', '옷코츠 유타', '아크릴스탠드',
 24000, 6, 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/goods/%EC%A3%BC%EC%88%A0%ED%9A%8C%EC%A0%84/%EC%A3%BC%EC%88%A0%ED%9A%8C%EC%A0%84+%EA%B7%B9%EC%9E%A5%ED%8C%90+%EC%8B%9C%EB%B6%80%EC%95%BC%EC%82%AC%EB%B3%80X%EC%82%AC%EB%A9%B8%ED%9A%8C%EC%9C%A0+%EA%B5%BF%EC%A6%88+%EB%8F%84%ED%98%B8+JF+2026+%EC%95%84%ED%81%AC%EB%A6%B4+%EC%8A%A4%ED%83%A0%EB%93%9C+-+%EC%98%B7%EC%BD%94%EC%B8%A0+%EC%9C%A0%ED%83%80.png', NOW()),

-- 36. 후와푸치 데포르메 피규어 이타도리 유지
(1, '후와푸치 데포르메 피규어', '주술회전', '이타도리 유지', '피규어',
 36000, 5, 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/goods/%EC%A3%BC%EC%88%A0%ED%9A%8C%EC%A0%84/%EC%A3%BC%EC%88%A0%ED%9A%8C%EC%A0%84+%EA%B7%B9%EC%9E%A5%ED%8C%90+%EC%8B%9C%EB%B6%80%EC%95%BC%EC%82%AC%EB%B3%80X%EC%82%AC%EB%A9%B8%ED%9A%8C%EC%9C%A0+%EA%B5%BF%EC%A6%88+%EC%84%B8%EA%B0%80+%ED%8E%98%EC%9D%B4%EB%B8%8C+%ED%9B%84%EC%99%80%ED%91%B8%EC%B9%98+%EB%8D%B0%ED%8F%AC%EB%A5%B4%EB%A9%94+%ED%94%BC%EA%B7%9C%EC%96%B4+-+%EC%9D%B4%ED%83%80%EB%8F%84%EB%A6%AC+%EC%9C%A0%EC%A7%80++%EC%9D%B4%ED%83%80%EB%8F%84%EB%A6%AC+%EC%9C%A0%EC%9A%B0%EC%A7%80.jpg', NOW()),

-- 37. 룩업 피규어 이누마키 토게
(1, '룩업 피규어 이누마키 토게', '주술회전', '이누마키 토게', '피규어',
 42000, 4, 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/goods/%EC%A3%BC%EC%88%A0%ED%9A%8C%EC%A0%84/%EC%A3%BC%EC%88%A0%ED%9A%8C%EC%A0%84+%EA%B7%B9%EC%9E%A5%ED%8C%90+%EC%8B%9C%EB%B6%80%EC%95%BC%EC%82%AC%EB%B3%80X%EC%82%AC%EB%A9%B8%ED%9A%8C%EC%9C%A0+%EB%A9%94%EA%B0%80%ED%95%98%EC%9A%B0%EC%8A%A4+%EB%A3%A9%EC%97%85+%ED%94%BC%EA%B7%9C%EC%96%B4+-+%EC%9D%B4%EB%88%84%EB%A7%88%ED%82%A4+%ED%86%A0%EA%B2%8C.png', NOW()),

-- 38. 아쿠누이 봉제인형 후시구로 메구미
(1, '아쿠누이 봉제인형', '주술회전', '후시구로 메구미', '봉제인형',
 26000, 6, 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/goods/%EC%A3%BC%EC%88%A0%ED%9A%8C%EC%A0%84/%EC%A3%BC%EC%88%A0%ED%9A%8C%EC%A0%84+%EC%95%84%EC%BF%A0%EB%88%84%EC%9D%B4+%EB%B4%89%EC%A0%9C%EC%9D%B8%ED%98%95+-+%ED%9B%84%EC%8B%9C%EA%B5%AC%EB%A1%9C+%EB%A9%94%EA%B5%AC%EB%AF%B8.png', NOW()),

-- 39. 후와푸치 데포르메 피규어 게토 스구루
(1, '후와푸치 데포르메 피규어', '주술회전', '게토 스구루', '피규어',
 38000, 4, 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/goods/%EC%A3%BC%EC%88%A0%ED%9A%8C%EC%A0%84/%EC%A3%BC%EC%88%A0%ED%9A%8C%EC%A0%84+%ED%9A%8C%EC%98%A5+%EC%98%A5%EC%A0%88+%ED%9B%84%EC%99%80%ED%91%B8%EC%B9%98+%EB%8D%B0%ED%8F%AC%EB%A5%B4%EB%A9%94+%ED%94%BC%EA%B7%9C%EC%96%B4+-+%EA%B2%8C%ED%86%A0+%EC%8A%A4%EA%B5%AC%EB%A3%A8.png', NOW()),

-- 40. 후와푸치 데포르메 피규어 고죠 사토루
(1, '후와푸치 데포르메 피규어', '주술회전', '고죠 사토루', '피규어',
 38000, 5, 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/goods/%EC%A3%BC%EC%88%A0%ED%9A%8C%EC%A0%84/%EC%A3%BC%EC%88%A0%ED%9A%8C%EC%A0%84+%ED%9A%8C%EC%98%A5+%EC%98%A5%EC%A0%88+%ED%9B%84%EC%99%80%ED%91%B8%EC%B9%98+%EB%8D%B0%ED%8F%AC%EB%A5%B4%EB%A9%94+%ED%94%BC%EA%B7%9C%EC%96%B4+-+%EA%B3%A0%EC%A3%A0+%EC%82%AC%ED%86%A0%EB%A3%A8.png', NOW()),

-- 41. Crux 트래블 시리즈 미니 아크릴 스탠드 시도 류세이
(1, 'Crux 트래블 시리즈 미니 아크릴 스탠드', '블루 록', '시도 류세이', '아크릴스탠드',
 19000, 8, 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/goods/%EB%B8%94%EB%A3%A8%EB%A1%9D/%EB%B8%94%EB%A3%A8+%EB%A1%9D+%EA%B5%BF%EC%A6%88+Crux+%ED%8A%B8%EB%9E%98%EB%B8%94+%EC%8B%9C%EB%A6%AC%EC%A6%88+%EB%AF%B8%EB%8B%88+%EC%BA%90%EB%A6%AD%ED%84%B0+%EC%95%84%ED%81%AC%EB%A6%B4+%EC%8A%A4%ED%83%A0%EB%93%9C+-+%EC%8B%9C%EB%8F%84+%EB%A5%98%EC%84%B8%EC%9D%B4.jpg', NOW()),

-- 42. PalVerse Palé 피규어 나기 세이시로
(1, 'PalVerse Palé 피규어', '블루 록', '나기 세이시로', '피규어',
 32000, 6, 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/goods/%EB%B8%94%EB%A3%A8%EB%A1%9D/%EB%B8%94%EB%A3%A8+%EB%A1%9D+%EA%B5%BF%EC%A6%88+%EB%B6%80%EC%8B%9C%EB%A1%9C%EB%93%9C+PalVerse+Pal%C3%A9+%ED%94%BC%EA%B7%9C%EC%96%B4+-+%EB%82%98%EA%B8%B0+%EC%84%B8%EC%9D%B4%EC%8B%9C%EB%A1%9C.jpg', NOW()),

-- 43. 메가하우스 룩업 피규어 이사기 요이치
(1, '룩업 피규어 이사기 요이치', '블루 록', '이사기 요이치', '피규어',
 42000, 5, 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/goods/%EB%B8%94%EB%A3%A8%EB%A1%9D/%EB%B8%94%EB%A3%A8+%EB%A1%9D+%EB%A9%94%EA%B0%80%ED%95%98%EC%9A%B0%EC%8A%A4+%EB%A3%A9%EC%97%85+%ED%94%BC%EA%B7%9C%EC%96%B4+-+%EC%9D%B4%EC%82%AC%EA%B8%B0+%EC%9A%94%EC%9D%B4%EC%B9%98.png', NOW()),

-- 44. 반다이 공식 솜누이 나기 세이시로
(1, '반다이 공식 솜누이', '블루 록', '나기 세이시로', '봉제인형',
 26000, 7, 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/goods/%EB%B8%94%EB%A3%A8%EB%A1%9D/%EB%B8%94%EB%A3%A8+%EB%A1%9D+%EB%B0%98%EB%8B%A4%EC%9D%B4+%EA%B3%B5%EC%8B%9D+%EC%86%9C%EB%88%84%EC%9D%B4+-+%EB%82%98%EA%B8%B0+%EC%84%B8%EC%9D%B4%EC%8B%9C%EB%A1%9C.png', NOW()),

-- 45. 벨하우스 아크릴 미니 스탠드 백귀야행 Ver. 나기 세이시로
(1, '아크릴 미니 스탠드 백귀야행 Ver.', '블루 록', '나기 세이시로', '아크릴스탠드',
 17000, 9, 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/goods/%EB%B8%94%EB%A3%A8%EB%A1%9D/%EB%B8%94%EB%A3%A8+%EB%A1%9D+%EB%B2%A8%ED%95%98%EC%9A%B0%EC%8A%A4+%EC%95%84%ED%81%AC%EB%A6%B4+%EB%AF%B8%EB%8B%88+%EC%8A%A4%ED%83%A0%EB%93%9C+%EB%B0%B1%EA%B7%80%EC%95%BC%ED%96%89+Ver.+-+%EB%82%98%EA%B8%B0+%EC%84%B8%EC%9D%B4%EC%8B%9C%EB%A1%9C.png', NOW()),

-- 46. 블루 록 아크릴 스탠드 랜덤
(1, '아크릴 스탠드 랜덤 단품', '블루 록', '랜덤', '아크릴스탠드',
 12000, 20, 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/goods/%EB%B8%94%EB%A3%A8%EB%A1%9D/%EB%B8%94%EB%A3%A8+%EB%A1%9D+%EC%95%84%ED%81%AC%EB%A6%B4+%EC%8A%A4%ED%83%A0%EB%93%9C+%EB%9E%9C%EB%8D%A4+%EB%8B%A8%ED%92%88.png', NOW()),

-- 47. 하네스 Style 미니 아크릴 스탠드 나기 세이시로
(1, '하네스 Style 미니 아크릴 스탠드', '블루 록', '나기 세이시로', '아크릴스탠드',
 18000, 8, 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/goods/%EB%B8%94%EB%A3%A8%EB%A1%9D/%EB%B8%94%EB%A3%A8+%EB%A1%9D+%ED%8C%80+%EC%97%94%ED%84%B0%ED%85%8C%EC%9D%B8%EB%A8%BC%ED%8A%B8+%EB%AF%B8%EB%8B%88+%EC%95%84%ED%81%AC%EB%A6%B4+%EC%8A%A4%ED%83%A0%EB%93%9C+%ED%95%98%EB%84%A4%EC%8A%A4+Style+-+%EB%82%98%EA%B8%B0+%EC%84%B8%EC%9D%B4%EC%8B%9C%EB%A1%9C+.png', NOW()),

-- 48. 파샤코레 랜덤
(1, '파샤코레 랜덤 단품', '블루 록', '랜덤', '포토카드',
 6000, 30, 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/goods/%EB%B8%94%EB%A3%A8%EB%A1%9D/%EB%B8%94%EB%A3%A8+%EB%A1%9D+%ED%8C%8C%EC%83%A4%EC%BD%94%EB%A0%88+%EB%9E%9C%EB%8D%A4+%EB%8B%A8%ED%92%88.png', NOW()),

-- 49. 푸니토푸 봉제인형 3탄 바치라 메구루
(1, '푸니토푸 봉제인형 3탄', '블루 록', '바치라 메구루', '봉제인형',
 24000, 6, 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/goods/%EB%B8%94%EB%A3%A8%EB%A1%9D/%EB%B8%94%EB%A3%A8+%EB%A1%9D+%ED%91%B8%EB%8B%88%ED%86%A0%ED%91%B8+%EB%B4%89%EC%A0%9C%EC%9D%B8%ED%98%95+3%ED%83%84+-+%EB%B0%94%EC%B9%98%EB%9D%BC+%EB%A9%94%EA%B5%AC%EB%A3%A8.jpg', NOW()),

-- 50. 푸니토푸 봉제인형 3탄 치기리 효마
(1, '푸니토푸 봉제인형 3탄', '블루 록', '치기리 효마', '봉제인형',
 24000, 6, 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/goods/%EB%B8%94%EB%A3%A8%EB%A1%9D/%EB%B8%94%EB%A3%A8+%EB%A1%9D+%ED%91%B8%EB%8B%88%ED%86%A0%ED%91%B8+%EB%B4%89%EC%A0%9C%EC%9D%B8%ED%98%95+3%ED%83%84+-+%EC%B9%98%EA%B8%B0%EB%A6%AC+%ED%9A%A8%EB%A7%88.jpg', NOW());

-- 2-6. SEARCH_LOG (검색 로그)
INSERT INTO search_log (search_id, member_id, keyword, target_type, target_id, created_at) VALUES
                                                                                               (1, 1, '홍대 굿즈샵', 'STORE', 1, NOW()),
                                                                                               (2, 2, '피규어', 'GOODS', 3, NOW()),
                                                                                               (3, 3, '주술회전', NULL, NULL, NOW()),
                                                                                               (4, 4, '블루록 포카', 'GOODS', 1, NOW()),
                                                                                               (5, 5, '팝업스토어', NULL, NULL, NOW()),
                                                                                               (6, 6, '귀멸의 칼날 굿즈', 'STORE', 2, NOW()),
                                                                                               (7, 7, '체인소맨', NULL, NULL, NOW()),
                                                                                               (8, 8, '코스프레 소품', NULL, NULL, NOW()),
                                                                                               (9, 9, '서울 굿즈샵', 'STORE', 2, NOW()),
                                                                                               (10,10,'부산 애니샵', 'STORE', 3, NOW());

-- 2-7. RECOMMENDED_SEARCH (추천 검색어)
INSERT INTO recommended_search (rec_id, keyword, target_type, sort_order, active_yn) VALUES
                                                                                         (1, '홍대 팝업', 'STORE', 1, 'Y'),
                                                                                         (2, '강남 피규어', 'STORE', 2, 'Y'),
                                                                                         (3, '주술회전 굿즈', 'GOODS', 3, 'Y'),
                                                                                         (4, '블루록 포카', 'GOODS', 4, 'Y'),
                                                                                         (5, '귀멸의 칼날 피규어', 'GOODS', 5, 'Y'),
                                                                                         (6, '서울 굿즈 성지', 'STORE', 6, 'Y'),
                                                                                         (7, '코스프레 용품', 'STORE', 7, 'Y'),
                                                                                         (8, '랜덤박스', 'GOODS', 8, 'Y'),
                                                                                         (9, '애니션 팝업', 'STORE', 9, 'Y'),
                                                                                         (10,'덕질 여행', 'STORE', 10, 'Y');

-- 2-8. POPUP_STORE (팝업스토어) - 5개
INSERT INTO popup_store (
    popup_id, title, place_name, address, region_name,
    latitude, longitude, start_date, end_date,
    banner_image_url, description, created_at, deleted_yn
) VALUES
      (1, '주술회전 팝업스토어', '더쿠쿠 팝업존', '서울 마포구 어딘가 123', '홍대',
       37.55750000, 126.92400000, '2025-12-01', '2025-12-31',
       NULL, '주술회전 공식 팝업. 포카, 굿즈, 포토존 준비.', NOW(), 'N'),
      (2, '블루록 페스티벌', '블루록 존', '서울 강남구 어딘가 456', '강남',
       37.50000000, 127.03000000, '2025-11-15', '2025-12-15',
       NULL, '블루록 팬들을 위한 스페셜 팝업.', NOW(), 'N'),
      (3, '귀멸의 칼날 전시', '귀멸 갤러리', '부산 해운대구 어딘가 789', '부산',
       35.16000000, 129.16000000, '2025-10-01', '2025-12-31',
       NULL, '귀멸의 칼날 원화/굿즈 전시.', NOW(), 'N'),
      (4, '체인소맨 체험존', '체인소 존', '대구 어딘가 101', '대구',
       35.87000000, 128.59500000, '2025-09-01', '2025-12-30',
       NULL, '체인소맨 체험/포토존.', NOW(), 'N'),
      (5, '애니 종합 팝업', '애니월드', '서울 신촌 어딘가 202', '신촌',
       37.56000000, 126.94500000, '2025-11-20', '2026-01-05',
       NULL, '여러 작품 합동 팝업.', NOW(), 'N');

-- 2-9. POPUP_BOOKMARK (팝업 찜)
INSERT INTO popup_bookmark (popup_bookmark_id, member_id, popup_id, created_at) VALUES
                                                                                    (1, 1, 1, NOW()),
                                                                                    (2, 1, 2, NOW()),
                                                                                    (3, 2, 1, NOW()),
                                                                                    (4, 3, 3, NOW()),
                                                                                    (5, 4, 4, NOW()),
                                                                                    (6, 5, 1, NOW()),
                                                                                    (7, 6, 2, NOW()),
                                                                                    (8, 7, 5, NOW()),
                                                                                    (9, 8, 3, NOW()),
                                                                                    (10,9, 4, NOW());

-- 2-10. POPUP_GOODS
INSERT INTO popup_goods (
    popup_goods_id, popup_id, name, description, category, price, thumbnail_url
) VALUES
      (1, 1, '주술 포카 세트', '한정 포카 5장 세트', '포카', 15000, NULL),
      (2, 1, '고죠 굿즈 박스', '랜덤 굿즈 박스', '박스', 39000, NULL),
      (3, 2, '블루록 유니폼', '팀 블루록 공식 유니폼', '의류', 69000, NULL),
      (4, 2, '블루록 포카', '선수별 랜덤 포카', '포카', 12000, NULL),
      (5, 3, '귀멸 스페셜 포스터', 'A2 사이즈 포스터', '포스터', 18000, NULL);

-- 2-11. MAIN_BANNER
INSERT INTO main_banner (
    banner_id, title, image_url, link_type, link_target_id, link_url,
    start_date, end_date, sort_order, active_yn
) VALUES
      (1, '주술회전 팝업 오픈!', '/images/banner_jjk.png', 'POPUP', 1, NULL,
       '2025-11-30', '2025-12-31', 1, 'Y'),
      (2, '블루록 페스티벌', '/images/banner_bluelock.png', 'POPUP', 2, NULL,
       '2025-11-10', '2025-12-15', 2, 'Y'),
      (3, '귀멸 전시 안내', '/images/banner_kny.png', 'POPUP', 3, NULL,
       '2025-10-01', '2025-12-31', 3, 'Y');

-- 2-12. BOARD_CATEGORY
INSERT INTO board_category (category_id, code, name) VALUES
                                                         (1, 'MY_GOODS', '내새끼 자랑'),
                                                         (2, 'COSPLAY', '코스프레'),
                                                         (3, 'FREE', '자유게시판');

-- 2-13. BOARD_TAG
INSERT INTO board_tag (tag_id, tag_name) VALUES
                                             (1, '주술회전'),
                                             (2, '블루록'),
                                             (3, '귀멸의 칼날'),
                                             (4, '체인소맨'),
                                             (5, '원피스');

-- 2-14. BOARD_POST - 10개 정도
INSERT INTO board_post (
    post_id, category_id, member_id, title, content,
    thumbnail_url, view_count, like_count, comment_count,
    created_at, deleted_yn
) VALUES
      (1, 1, 1, '우리 집 최애 포카 자랑', '요이치 포카 모은 지 1년...', NULL,
       123, 10, 2, NOW(), 'N'),
      (2, 2, 3, '주술회전 고죠 코스 해봤어요', '처음 해본 코스프레!', NULL,
       230, 25, 5, NOW(), 'N'),
      (3, 3, 2, '굿즈 정리 어떻게 하세요?', '방이 점점 창고가 되어가요...', NULL,
       45, 3, 0, NOW(), 'N'),
      (4, 1, 4, '렌고쿠 선생님 피규어 도착!', '불꽃 기둥 영접 완료.', NULL,
       80, 8, 1, NOW(), 'N'),
      (5, 1, 5, '피규어 진열장 리뉴얼', '새로 진열해봤어요.', NULL,
       60, 5, 0, NOW(), 'N'),
      (6, 2, 6, '블루록 단체 코스 준비', '다음 행사에서 할 예정!', NULL,
       150, 12, 3, NOW(), 'N'),
      (7, 3, 7, '덕질하면서 돈 관리 어떻게 함?', '가계부 공유 좀...', NULL,
       70, 4, 2, NOW(), 'N'),
      (8, 3, 8, '입덕한 지 한 달 후기', '덕질 행복하다.', NULL,
       30, 2, 0, NOW(), 'N'),
      (9, 1, 9, '체인소맨 굿즈 도착샷', '퀄리티 미쳤음.', NULL,
       55, 6, 1, NOW(), 'N'),
      (10,2,10,'첫 코스프레 후기', '엄청 떨렸는데 재밌었어요.', NULL,
       90, 7, 2, NOW(), 'N');

-- 2-15. BOARD_POST_TAG
INSERT INTO board_post_tag (board_post_tag_id, post_id, tag_id) VALUES
                                                                    (1, 1, 2),
                                                                    (2, 2, 1),
                                                                    (3, 3, 3),
                                                                    (4, 4, 3),
                                                                    (5, 5, 3),
                                                                    (6, 6, 2),
                                                                    (7, 7, 1),
                                                                    (8, 8, 2),
                                                                    (9, 9, 4),
                                                                    (10,10,1);

-- 2-16. BOARD_POST_IMAGE
INSERT INTO board_post_image (image_id, post_id, image_url, sort_order) VALUES
                                                                            (1, 1, '/images/posts/post1_img1.png', 1),
                                                                            (2, 2, '/images/posts/post2_img1.png', 1),
                                                                            (3, 4, '/images/posts/post4_img1.png', 1);

-- 2-17. BOARD_COMMENT
INSERT INTO board_comment (
    comment_id, post_id, member_id, parent_comment_id, content,
    like_count, created_at, deleted_yn
) VALUES
      (1, 1, 2, NULL, '와 포카 진짜 예쁘다...', 2, NOW(), 'N'),
      (2, 1, 3, 1, '저도 블루록 포카 모으는 중이에요!', 1, NOW(), 'N'),
      (3, 2, 1, NULL, '코스 너무 잘 어울려요!', 3, NOW(), 'N'),
      (4, 4, 5, NULL, '렌고쿠 피규어 부럽다...', 1, NOW(), 'N');

-- 2-18. BOARD_LIKE
INSERT INTO board_like (board_like_id, member_id, post_id, created_at) VALUES
                                                                           (1, 1, 2, NOW()),
                                                                           (2, 2, 1, NOW()),
                                                                           (3, 3, 2, NOW()),
                                                                           (4, 4, 4, NOW()),
                                                                           (5, 5, 4, NOW());

-- 2-19. BOARD_BOOKMARK
INSERT INTO board_bookmark (board_bookmark_id, member_id, post_id, created_at) VALUES
                                                                                   (1, 1, 1, NOW()),
                                                                                   (2, 1, 2, NOW()),
                                                                                   (3, 2, 3, NOW()),
                                                                                   (4, 3, 4, NOW()),
                                                                                   (5, 4, 5, NOW());

-- 2-20. BOARD_REPORT
INSERT INTO board_report (
    report_id, post_id, comment_id, reporter_id, reason, status, created_at
) VALUES
    (1, 3, NULL, 1, '광고성 스팸 같아요.', 'WAIT', NOW());

-- 2-21. TRADE_POST (쿠쿠마켓 거래글) - 5개
INSERT INTO trade_post (
    trade_id, seller_id, title, content, goods_name, work_name,
    character_name, category, price, trade_type, trade_method,
    region, status, view_count, like_count, created_at, deleted_yn
) VALUES
      (1, 2, '주술회전 포카 세트 팝니다', '중복 포카 정리해요.', '주술회전 포카 세트',
       '주술회전', '고죠 사토루', '포카', 12000, 'SELL', 'DIRECT', '홍대', 'ON_SALE',
       50, 3, NOW(), 'N'),
      (2, 1, '블루록 포스터 교환 구해요', '포스터 교환만 합니다.', '블루록 포스터',
       '블루록', NULL, '포스터', NULL, 'EXCHANGE', 'DIRECT', '강남', 'ON_SALE',
       20, 1, NOW(), 'N'),
      (3, 3, '귀멸 피규어 구매 원해요', '렌고쿠 피규어 구해요.', '렌고쿠 피규어',
       '귀멸의 칼날', '렌고쿠 쿄쥬로', '피규어', 90000, 'BUY', 'DIRECT', '부산', 'ON_SALE',
       15, 0, NOW(), 'N'),
      (4, 4, '체인소맨 키링 팝니다', '중복 키링 처분합니다.', '체인소맨 키링',
       '체인소맨', NULL, '키링', 8000, 'SELL', 'DIRECT', '대구', 'ON_SALE',
       18, 2, NOW(), 'N'),
      (5, 5, '랜덤 박스 교환/판매', '랜덤 굿즈 박스입니다.', '애니 굿즈 랜덤박스',
       NULL, NULL, '박스', 20000, 'SELL', 'DIRECT', '신촌', 'ON_SALE',
       10, 1, NOW(), 'N');

-- 2-22. TRADE_POST_IMAGE
INSERT INTO trade_post_image (image_id, trade_id, image_url, sort_order) VALUES
                                                                             (1, 1, '/images/trade/trade1_img1.png', 1),
                                                                             (2, 2, '/images/trade/trade2_img1.png', 1),
                                                                             (3, 3, '/images/trade/trade3_img1.png', 1);

-- 2-23. TRADE_BOOKMARK
INSERT INTO trade_bookmark (trade_bookmark_id, member_id, trade_id, created_at) VALUES
                                                                                    (1, 1, 1, NOW()),
                                                                                    (2, 3, 1, NOW()),
                                                                                    (3, 4, 2, NOW());

-- 2-24. TRADE_CHAT_ROOM / TRADE_CHAT_MESSAGE
INSERT INTO trade_chat_room (
    room_id, trade_id, seller_id, buyer_id, created_at, buyer_left_yn, seller_left_yn
) VALUES
    (1, 1, 2, 1, NOW(), 'N', 'N');

INSERT INTO trade_chat_message (
    message_id, room_id, sender_id, message, created_at, read_yn
) VALUES
      (1, 1, 1, '안녕하세요, 거래 가능할까요?', NOW(), 'N'),
      (2, 1, 2, '네, 가능해요! 언제가 편하세요?', NOW(), 'N');

-- 2-25. FAQ_CATEGORY / FAQ
INSERT INTO faq_category (faq_category_id, name) VALUES
                                                     (1, '계정'),
                                                     (2, '거래'),
                                                     (3, '매장/팝업');

INSERT INTO faq (
    faq_id, faq_category_id, question, answer, sort_order
) VALUES
      (1, 1, '비밀번호를 잊어버렸어요.', '로그인 화면에서 비밀번호 찾기를 이용해 주세요.', 1),
      (2, 2, '사기 피해가 의심될 때 어떻게 하나요?', '거래 내역과 채팅 로그를 고객센터로 보내 주세요.', 1),
      (3, 3, '팝업스토어 정보는 어디서 확인하나요?', '홈 화면 하단의 팝업스토어 영역을 확인해 주세요.', 1);

-- 2-26. INQUIRY (1:1 문의)
INSERT INTO inquiry (
    inquiry_id, member_id, category, title, content,
    status, created_at
) VALUES
      (1, 1, '계정', '로그인이 안 돼요.', '비밀번호를 여러 번 틀렸는데 어떻게 해야 하나요?', 'WAIT', NOW()),
      (2, 2, '거래', '거래 취소 문의', '상대방이 연락이 안 와요.', 'WAIT', NOW());

-- 2-27. SERVICE_NOTICE (공지)
INSERT INTO service_notice (
    notice_id, title, content, notice_type, start_date, end_date, created_at
) VALUES
      (1, '더쿠쿠 오픈 안내', '애니 굿즈를 사랑하는 여러분을 위한 플랫폼, 더쿠쿠가 오픈했습니다.', 'NOTICE',
       '2025-11-01', NULL, NOW()),
      (2, '주술회전 팝업 연동 이벤트', '주술회전 팝업 방문 인증 시 포인트를 지급합니다.', 'EVENT',
       '2025-12-01', '2025-12-31', NOW());

-- 2-28. NOTIFICATION (알림)
INSERT INTO notification (
    notification_id, member_id, notif_type, message, link_type, link_target_id, read_yn, created_at
) VALUES
      (1, 1, 'COMMENT', '내 게시글에 새로운 댓글이 달렸어요.', 'POST', 1, 'N', NOW()),
      (2, 2, 'TRADE', '내 거래글에 채팅이 도착했어요.', 'TRADE', 1, 'N', NOW());

-- 2-29. ADMIN_USER / ADMIN_ROLE / ADMIN_USER_ROLE / ADMIN_LOG
INSERT INTO admin_user (
    admin_id, login_id, login_pw, name, email, phone, status, created_at
) VALUES
    (1, 'admin', 'admin1234!', '관리자', 'admin@thekuku.com', '010-0000-0000', 'Y', NOW());

INSERT INTO admin_role (
    role_id, role_code, role_name, description, created_at
) VALUES
      (1, 'SUPER_ADMIN', '슈퍼관리자', '전체 권한 보유', NOW()),
      (2, 'CONTENT_MANAGER', '콘텐츠 관리자', '게시글/팝업 관리', NOW());

INSERT INTO admin_user_role (admin_id, role_id, created_at) VALUES
    (1, 1, NOW());

INSERT INTO admin_log (
    log_id, admin_id, action_type, target_table, target_id, description, ip_address, created_at
) VALUES
    (1, 1, 'LOGIN', NULL, NULL, '관리자 로그인', '127.0.0.1', NOW());