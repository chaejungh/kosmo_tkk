

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
    goods_id, store_id, name, work_name, character_name, category,
    price, stock_qty, thumbnail_url, created_at
) VALUES
      (1, 1, '블루록 포카 세트', '블루록', '이사기 요이치', '포카', 8000, 12, NULL, NOW()),
      (2, 1, '주술회전 아크릴 키링', '주술회전', '고죠 사토루', '키링', 12000, 5, NULL, NOW()),
      (3, 2, '귀멸의 칼날 1/7 피규어', '귀멸의 칼날', '렌고쿠 쿄쥬로', '피규어', 98000, 2, NULL, NOW()),
      (4, 2, '체인소맨 포스터', '체인소맨', '덴지', '포스터', 5000, 20, NULL, NOW()),
      (5, 3, '주술회전 클리어 파일', '주술회전', '이타도리', '잡화', 3000, 30, NULL, NOW()),
      (6, 4, '블루록 머플러', '블루록', NULL, '의류', 22000, 7, NULL, NOW()),
      (7, 5, '귀멸 포카 랜덤팩', '귀멸의 칼날', NULL, '포카', 6000, 15, NULL, NOW()),
      (8, 6, '체인소맨 키링 세트', '체인소맨', NULL, '키링', 15000, 8, NULL, NOW()),
      (9, 7, '원피스 피규어 세트', '원피스', '루피', '피규어', 150000, 1, NULL, NOW()),
      (10,8, '마호소녀 포카', '마호소녀', NULL, '포카', 7000, 10, NULL, NOW());

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
    category_id, member_id, title, content,
    thumbnail_url, view_count, like_count, comment_count,
    created_at, updated_at, deleted_yn
) VALUES
        (1, 1,
        '유리장 한 칸 액션 전시 완성',
        '와이어랑 스탠드 각도 맞추느라 2시간 날렸는데… 완성하고 불 켜니까 진짜 “장면”이 됨. 먼지 때문에 유리장 정리하고 LED도 추가함. 사진은 폰 기본 카메라로 찍었는데 생각보다 잘 나왔다.',
        'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/board/%EB%82%B4%EC%83%88%EB%81%BC%EC%9E%90%EB%9E%91/%EB%82%B4%EC%83%88%EC%9E%90-15.jpg', 312, 29, 7,
        NOW() - INTERVAL 18 DAY, NULL, 'N'),

        (1, 2,
        '이 칸은 해적 라인업으로 꽉 채웠다',
        '이펙트 파츠가 화려해서 앞쪽엔 액션 포즈, 뒤쪽은 키 큰 애들로 세워서 깊이감 살림. 박스는 원래 치울까 했는데 배경으로 써보니까 분위기 좋아서 일부만 남김.',
        'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/board/%EB%82%B4%EC%83%88%EB%81%BC%EC%9E%90%EB%9E%91/%EB%82%B4%EC%83%88%EC%9E%90-16.jpg', 541, 46, 12,
        NOW() - INTERVAL 12 DAY, NULL, 'N'),

        (1, 3,
        '책장 속 “숨은 최애” 전시',
        '책 사이에 슬쩍 세워두면 튀지 않으면서도 존재감이 있음. 원판 받침이라 안정감도 좋고, 책 정리할 때마다 먼지 털어주는 게 루틴이 됨.',
        'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/board/%EB%82%B4%EC%83%88%EB%81%BC%EC%9E%90%EB%9E%91/%EB%82%B4%EC%83%88%EC%9E%90-17.webp', 188, 21, 3,
        NOW() - INTERVAL 9 DAY, NULL, 'N'),

        (1, 4,
        '책상 위 미니 피규어… 표정이 너무 귀엽다',
        '앉아있는 포즈라 데스크에 두기 딱 좋음. 집중 안 될 때 한 번 보면 마음이 좀 진정됨ㅋㅋ 헤드폰 디테일이 특히 귀엽고 크기도 부담 없음.',
        'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/board/%EB%82%B4%EC%83%88%EB%81%BC%EC%9E%90%EB%9E%91/%EB%82%B4%EC%83%88%EC%9E%90-18.jfif', 97, 14, 2,
        NOW() - INTERVAL 5 DAY, NULL, 'N'),

        (1, 5,
        '농구 디오라마 세팅 완료(각도값 미쳤음)',
        '코트 질감이랑 골대 디테일이 생각보다 좋아서 감탄. 투명 스탠드 파츠가 많아서 각도 잡는 데 오래 걸렸는데, 한 번 잡아두니까 진짜 “명장면 캡처” 느낌 제대로남.',
        'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/board/%EB%82%B4%EC%83%88%EB%81%BC%EC%9E%90%EB%9E%91/%EB%82%B4%EC%83%88%EC%9E%90-19.jpg', 623, 52, 15,
        NOW() - INTERVAL 22 DAY, NULL, 'N'),

        (1, 6,
        '피규어는 박스아트까지 같이 전시해야 진짜다',
        '박스가 너무 예뻐서 버릴 수가 없었음… 그래서 아예 박스까지 전시 컨셉으로 바꿈. 소품 구성도 알차고 옆면 아트가 배경 역할까지 해줘서 만족.',
        'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/board/%EB%82%B4%EC%83%88%EB%81%BC%EC%9E%90%EB%9E%91/%EB%82%B4%EC%83%88%EC%9E%90-20.webp', 274, 33, 6,
        NOW() - INTERVAL 16 DAY, NULL, 'N'),

        (1, 7,
        '가동피규어는 포즈 바꾸는 재미가 진짜 큼',
        '옷이 실제 천 재질이라 분위기 확 살음. 포즈 세팅 전에 관절 체크 한 번씩 해줘야 오래감. 여분 유니폼 구성품까지 있어서 촬영할 때 조합 바꾸기 좋다.',
        'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/board/%EB%82%B4%EC%83%88%EB%81%BC%EC%9E%90%EB%9E%91/%EB%82%B4%EC%83%88%EC%9E%90-22.jpg', 356, 40, 9,
        NOW() - INTERVAL 7 DAY, NULL, 'N'),

        (1, 8,
        '교복 피규어는 기본템… 라인 예쁘게 뽑혔다',
        '앉은 포즈라 공간 덜 차지해서 전시하기 편함. 다리/치마 주름 표현 깔끔하고, 패키지 아트도 예뻐서 같이 두니까 인테리어 느낌 남.',
        'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/board/%EB%82%B4%EC%83%88%EB%81%BC%EC%9E%90%EB%9E%91/%EB%82%B4%EC%83%88%EC%9E%90-23.jpg', 141, 18, 4,
        NOW() - INTERVAL 3 DAY, NULL, 'N'),

        (1, 9,
        '청록 트윈테일 + 판다 소품 조합은 반칙',
        '색감이 너무 예뻐서 계속 보게 됨. 리본/소매 디테일도 좋고 판다 소품이 포인트 확실함. 같은 톤 피규어랑 같이 두면 전시가 훨씬 깔끔해짐.',
        'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/board/%EB%82%B4%EC%83%88%EB%81%BC%EC%9E%90%EB%9E%91/%EB%82%B4%EC%83%88%EC%9E%90-24.jpg', 487, 55, 11,
        NOW() - INTERVAL 11 DAY, NULL, 'N'),
        (1, 10,
        'SHF 개봉… 파츠가 이렇게 많은 건 반칙이지',
        '오늘 도착해서 바로 개봉. 기본 바디도 좋고 얼굴/손 파츠가 다양해서 포징 바꾸는 맛이 있음. 이펙트 파츠(별 모양)까지 들어있어서 전시할 때 화면이 확 살아남. 다만 파츠가 많아서 잃어버리기 쉬우니 트레이 그대로 보관 추천.',
        'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/board/%EB%82%B4%EC%83%88%EB%81%BC%EC%9E%90%EB%9E%91/%EB%82%B4%EC%83%88%EC%9E%90-25.webp', 268, 24, 5,
        NOW() - INTERVAL 6 DAY, NULL, 'N'),

        (1, 11,
        '블루아카 피그마 자전거 DX… 박스부터 설렌다',
        '박스 아트 미쳤고 구성도 빵빵함. 자전거 포함이라 공간 차지하긴 하는데, 포즈 잡아두면 진짜 “한 장면”이 됨. 조립 난이도는 중간 정도? 설명서 보면서 하면 충분히 가능. 주말에 제대로 세팅해서 사진 더 찍어볼 예정.',
        'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/board/%EB%82%B4%EC%83%88%EB%81%BC%EC%9E%90%EB%9E%91/%EB%82%B4%EC%83%88%EC%9E%90-26.jpg', 403, 37, 8,
        NOW() - INTERVAL 10 DAY, NULL, 'N'),

        (1, 13,
        '거실 소파 위 단체샷… 수집의 끝은 결국 전시다',
        '정리하다가 한 번에 꺼내서 단체샷 찍어봄. 장르 섞여도 포즈/높이만 잘 맞추면 생각보다 예쁘게 나옴. 큰 피규어는 뒤로, 작은 애들은 앞에 두니까 꽉 차는 느낌이 좋다. (먼지 닦는 건… 다음 주의 나에게 맡김)',
        'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/board/%EB%82%B4%EC%83%88%EB%81%BC%EC%9E%90%EB%9E%91/%EB%82%B4%EC%83%88%EC%9E%90-27.jfif', 512, 41, 11,
        NOW() - INTERVAL 15 DAY, NULL, 'N'),

        (1, 14,
        '유리장 한 칸이 아니라 한 “세계관”이 되어버림',
        '처음엔 테마 맞춰서 넣으려 했는데 점점 자리 싸움 나서 그냥 취향대로 배치함ㅋㅋ 메카/미소녀/작은 피규어까지 섞였는데 오히려 풍성해서 보는 재미가 있음. 조명 켜면 반사 때문에 사진 찍기 어렵긴 한데 실물은 만족도 높음.',
        'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/board/%EB%82%B4%EC%83%88%EB%81%BC%EC%9E%90%EB%9E%91/%EB%82%B4%EC%83%88%EC%9E%90-28.jfif', 634, 49, 14,
        NOW() - INTERVAL 21 DAY, NULL, 'N'),

        (1, 12,
        '원피스 라인업 책상 전시… 포즈 맛이 확실함',
        '책상 위에 쭉 세워두니까 지나갈 때마다 눈이 행복함. 이펙트 파츠 있는 애들은 앞쪽에 두고, 큰 애들은 뒤쪽으로 배치해서 깊이감 살림. 받침 원판이 좀 커서 자리 많이 먹긴 하는데, 완성도 때문에 납득됨.',
        'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/board/%EB%82%B4%EC%83%88%EB%81%BC%EC%9E%90%EB%9E%91/%EB%82%B4%EC%83%88%EC%9E%90-29.jfif', 289, 28, 6,
        NOW() - INTERVAL 8 DAY, NULL, 'N'),

        (1, 16,
        '에이스 박스 3종 모아두니 뿌듯함이 3배',
        '같은 캐릭터라도 버전별로 박스 톤이 달라서 모아두면 컬렉션 느낌 확 남. 개봉은 하나만 하고 나머지는 박스 보관 중… (언젠가 전부 꺼내겠지) 바닥에 줄 세워두기만 해도 전시가 되는 게 박스 피규어의 매력인 듯.',
        'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/board/%EB%82%B4%EC%83%88%EB%81%BC%EC%9E%90%EB%9E%91/%EB%82%B4%EC%83%88%EC%9E%90-30.jfif', 176, 19, 3,
        NOW() - INTERVAL 4 DAY, NULL, 'N'),
        (2, 1,
        '보라 마녀 컨셉 첫 촬영… 모자 각도 잡는 게 제일 어려웠다',
        '드디어 보라색 마녀 컨셉 코스 완성! 모자 고정이랑 망토 라인 잡는 게 생각보다 빡셌는데 결과물이 예쁘게 나와서 만족. 메이크업은 눈매 강조 + 글리터로 포인트 줬고, 별 모양 악세는 따로 제작해서 달아봤어.',
        'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/board/%EC%BD%94%EC%8A%A4%ED%94%84%EB%A0%88/%EC%BD%94%EC%8A%A4%ED%94%84%EB%A0%88-4.jfif', 462, 58, 14,
        NOW() - INTERVAL 20 DAY, NULL, 'N'),

        (2, 2,
        '야외 행사에서 고양이 컨셉 코스! (리본/소매 디테일 자랑)',
        '행사장에서 찍은 사진들 중 제일 마음에 드는 컷. 귀는 클립형이라 오래 착용하면 조금 아픈데… 사진 찍을 때는 확실히 포인트가 됨. 소매 리본은 풀릴까 봐 안쪽에 실로 한 번 더 고정했어.',
        'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/board/%EC%BD%94%EC%8A%A4%ED%94%84%EB%A0%88/%EC%BD%94%EC%8A%A4%ED%94%84%EB%A0%88-5.jfif', 517, 66, 18,
        NOW() - INTERVAL 14 DAY, NULL, 'N'),

        (2, 3,
        '실내 촬영: 청백 톤 의상은 조명빨 진짜 잘 받는다',
        '청색/백색 계열 의상이라 조명만 잘 맞추면 피부톤도 깨끗하게 나오더라. 가슴 장식이랑 브로치 디테일이 은근 무게감 있어서 촬영 전엔 테이프로 한 번 고정해줌. 렌즈는 자연스럽게 파란 계열로 맞췄어.',
        'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/board/%EC%BD%94%EC%8A%A4%ED%94%84%EB%A0%88/%EC%BD%94%EC%8A%A4%ED%94%84%EB%A0%88-6.jfif', 689, 81, 22,
        NOW() - INTERVAL 11 DAY, NULL, 'N'),

        (2, 4,
        '여우귀 검객 컨셉… 소품 칼 들고 찍으니 분위기 확 산다',
        '다리 장비/허리 벨트가 많아서 착용 순서가 제일 중요했음. 소품 칼은 가볍게 들 수 있게 제작된 걸로 준비했고, 포즈는 손목 각도 조금만 바꿔도 느낌 달라져서 여러 컷 찍어봄!',
        'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/board/%EC%BD%94%EC%8A%A4%ED%94%84%EB%A0%88/%EC%BD%94%EC%8A%A4%ED%94%84%EB%A0%88-7.jfif', 401, 47, 9,
        NOW() - INTERVAL 9 DAY, NULL, 'N'),

        (2, 5,
        '햇살 좋은 날 야외 코스 촬영! 파란 제복은 진리다',
        '날씨가 좋아서 야외 촬영 갔는데 색감이 너무 잘 나와서 행복…! 모자 장식이랑 단추가 반사되면서 포인트가 살아남. 장갑/리본은 바람 불면 흐트러져서 중간중간 정리하면서 촬영했어.',
        'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/board/%EC%BD%94%EC%8A%A4%ED%94%84%EB%A0%88/%EC%BD%94%EC%8A%A4%ED%94%84%EB%A0%88-8.jfif', 732, 93, 25,
        NOW() - INTERVAL 6 DAY, NULL, 'N'),

        (2, 6,
        '전시장 포토존에서 “악마/집사” 느낌 컨셉샷 찍어봄',
        '현장 조명이 강해서 피부 표현이 잘 나오더라. 헤어는 흰색 단발이라 뒷머리 뜨는 거 잡는 데 스프레이 많이 씀. 악세는 금속 느낌이라 사진에 더 살아서 만족!',
        'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/board/%EC%BD%94%EC%8A%A4%ED%94%84%EB%A0%88/%EC%BD%94%EC%8A%A4%ED%94%84%EB%A0%88-9.jfif', 358, 44, 7,
        NOW() - INTERVAL 17 DAY, NULL, 'N'),

        (2, 7,
        '블루 계열 남캐 코스 도전! 소품이 많아도 재밌다',
        '이번엔 남캐 느낌으로 스타일링 바꿔봤어. 의상에 끈/장식이 많아서 촬영 전에 꼼꼼히 정리 필수. 소품 무기는 야외에서 들고 촬영하면 진짜 분위기 살아남… 다음엔 연기 포즈 더 연구해볼게.',
        'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/board/%EC%BD%94%EC%8A%A4%ED%94%84%EB%A0%88/%EC%BD%94%EC%8A%A4%ED%94%84%EB%A0%88-10.jfif', 283, 32, 6,
        NOW() - INTERVAL 13 DAY, NULL, 'N'),

        (2, 8,
        '바디페인팅 코스 첫 도전… 준비/세팅이 가장 힘들었다',
        '처음이라 걱정했는데 결과적으로 너무 재밌었음. 페인팅은 번짐 방지 세팅이 핵심이고, 렌즈/귀/가발까지 맞추니까 캐릭터 느낌이 확 살아나더라. (세팅 시간이 길어서 다음엔 더 간단한 버전도 해보고 싶음)',
        'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/board/%EC%BD%94%EC%8A%A4%ED%94%84%EB%A0%88/%EC%BD%94%EC%8A%A4%ED%94%84%EB%A0%88-11.jfif', 621, 77, 19,
        NOW() - INTERVAL 23 DAY, NULL, 'N'),

        (2, 1,
        '하오리 스타일 코스 셀카! 햇빛 아래서 색감 최고',
        '날이 좋아서 그냥 가볍게 산책 겸 촬영. 망토(하오리) 라인이 펄럭이는 느낌이 좋아서 걷는 컷도 찍어봤어. 칼 손잡이 장식은 포인트라서 최대한 화면에 들어오게 잡았음.',
        'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/board/%EC%BD%94%EC%8A%A4%ED%94%84%EB%A0%88/%EC%BD%94%EC%8A%A4%ED%94%84%EB%A0%88-12.jfif', 245, 29, 4,
        NOW() - INTERVAL 4 DAY, NULL, 'N'),

        (2, 11,
        '정원 느낌 장소에서 촬영한 기모노 코스… 분위기 미쳤다',
        '배경이 너무 예뻐서 코스가 더 살아난 날! 옷 패턴이 강해서 포즈는 최대한 깔끔하게 잡고, 헤어는 앞머리 라인만 정리해줬어. 다음엔 같은 장소에서 다른 컨셉도 찍어보고 싶다.',
        'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/board/%EC%BD%94%EC%8A%A4%ED%94%84%EB%A0%88/%EC%BD%94%EC%8A%A4%ED%94%84%EB%A0%88-13.jfif', 493, 61, 12,
        NOW() - INTERVAL 2 DAY, NULL, 'N'),
        (2, 3,
         '닌자 컨셉 액션샷! 각도 잡느라 무릎 갈렸다…',
         '야외에서 낮광 받을 때가 제일 예쁘길래 바로 포즈컷 찍었어. 머리띠 위치랑 표정이 조금만 틀어져도 느낌이 달라져서 같은 포즈로 여러 장 찍고 베스트만 골랐음. 다음엔 연기(연막) 소품도 들고 가볼까 고민 중.',
         'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/board/%EC%BD%94%EC%8A%A4%ED%94%84%EB%A0%88/%EC%BD%94%EC%8A%A4%ED%94%84%EB%A0%88-14.jfif', 544, 63, 16,
         NOW() - INTERVAL 19 DAY, NULL, 'N'),

        (2, 5,
         '나비 하오리 + 소품검으로 한 컷… 분위기 너무 좋다',
         '저녁 노을빛에서 찍었더니 색감이 미쳤음. 하오리 패턴이 강해서 포즈는 최대한 깔끔하게 잡았고, 소품은 손목 각도만 바꿔도 느낌이 달라서 여러 컷 시도했어. 머리장식은 고정이 약해서 핀+테이프로 보강함.',
         'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/board/%EC%BD%94%EC%8A%A4%ED%94%84%EB%A0%88/%EC%BD%94%EC%8A%A4%ED%94%84%EB%A0%88-15.jfif', 487, 58, 12,
         NOW() - INTERVAL 13 DAY, NULL, 'N'),

        (2, 2,
         '레드&블랙 악역 컨셉… 부채 소품이 한 방에 살려줌',
         '컨셉은 “강한 눈빛 + 강한 색감”. 조명이 붉게 들어와서 더 잘 맞았고, 부채 소품이 있어서 손이 어색하지 않게 포즈 잡기 좋았어. 립/아이메이크업은 진하게, 대신 피부 표현은 최대한 깔끔하게 갔음.',
         'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/board/%EC%BD%94%EC%8A%A4%ED%94%84%EB%A0%88/%EC%BD%94%EC%8A%A4%ED%94%84%EB%A0%88-16.jfif', 701, 84, 23,
         NOW() - INTERVAL 22 DAY, NULL, 'N'),

        (2, 7,
         '눈 오는 날 촬영한 하얀/보라 톤 코스… 겨울감성 제대로',
         '진짜 추웠는데 결과물이 다 했다…🤣 눈 배경 덕분에 의상 색이 더 깨끗하게 떠서 만족. 망토 라인 잡으려고 팔 포즈를 크게 가져갔고, 나비 포인트는 얼굴 옆에 오게 맞춰서 캐릭터 느낌 살렸어.',
         'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/board/%EC%BD%94%EC%8A%A4%ED%94%84%EB%A0%88/%EC%BD%94%EC%8A%A4%ED%94%84%EB%A0%88-18.jfif', 612, 77, 19,
         NOW() - INTERVAL 8 DAY, NULL, 'N'),

        (2, 4,
         '단체샷은 역시 재미가 다르다(컨셉 통일 최고)',
         '셋이서 컨셉 맞춰서 앉는 포즈로 찍었는데, 분위기가 확 살아남. 의상 톤이랑 코트(망토) 실루엣이 통일돼서 사진이 더 깔끔하게 나왔어. 단체는 시선 처리/손 위치 맞추는 게 은근 어렵더라.',
         'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/board/%EC%BD%94%EC%8A%A4%ED%94%84%EB%A0%88/%EC%BD%94%EC%8A%A4%ED%94%84%EB%A0%88-19.jfif', 839, 102, 31,
         NOW() - INTERVAL 25 DAY, NULL, 'N'),

        (2, 6,
         '밀짚모자 선장 컨셉! 포즈 하나로 캐릭터 느낌 확 남',
         '이 의상은 포즈가 반 이상이라고 생각함ㅋㅋ 모자 각도랑 손 위치만 잡아도 바로 “그 느낌” 나와서 재밌었어. 상의는 핏이 중요해서 안쪽에 테이핑으로 라인 정리하고 촬영했음.',
         'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/board/%EC%BD%94%EC%8A%A4%ED%94%84%EB%A0%88/%EC%BD%94%EC%8A%A4%ED%94%84%EB%A0%88-20.jfif', 523, 60, 14,
         NOW() - INTERVAL 16 DAY, NULL, 'N'),

        (2, 1,
         '해변 촬영 도전! 바다 배경 + 색감 조합 너무 예쁘다',
         '햇빛 강한 시간대에 찍었더니 피부톤/의상색이 깔끔하게 나옴. 바람 때문에 가발 정리가 제일 힘들었는데, 촬영 전후로 빗+스프레이로 계속 잡아줬어. 다음엔 소품을 더 준비해서 컨셉을 확실히 잡아볼 예정.',
         'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/board/%EC%BD%94%EC%8A%A4%ED%94%84%EB%A0%88/%EC%BD%94%EC%8A%A4%ED%94%84%EB%A0%88-21.jfif', 910, 120, 28,
         NOW() - INTERVAL 11 DAY, NULL, 'N'),

        (2, 8,
         '블랙 교복 컨셉… 선글라스 소품 하나로 분위기 끝',
         '올블랙은 조명/배경에 따라 느낌이 크게 바뀌어서 장소 고르는 게 중요하더라. 선글라스는 “들추는 순간” 타이밍으로 잡아서 역동감 살렸고, 표정은 최대한 여유 있는 느낌으로 갔어.',
         'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/board/%EC%BD%94%EC%8A%A4%ED%94%84%EB%A0%88/%EC%BD%94%EC%8A%A4%ED%94%84%EB%A0%88-22.jfif', 465, 49, 10,
         NOW() - INTERVAL 6 DAY, NULL, 'N'),

        (2, 2,
         '오렌지 단발 + 페이스 포인트 메이크업… 컨셉샷 성공',
         '이번엔 메이크업을 강하게 잡아서 얼굴 중심으로 사진이 잘 나오게 구성했어. 소품 망치는 손 위치가 계속 어색해서 여러 번 찍고 제일 자연스러운 컷으로 선택. 다음엔 동일 컨셉으로 야외에서도 찍어보고 싶다.',
         'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/board/%EC%BD%94%EC%8A%A4%ED%94%84%EB%A0%88/%EC%BD%94%EC%8A%A4%ED%94%84%EB%A0%88-23.jfif', 578, 71, 17,
         NOW() - INTERVAL 9 DAY, NULL, 'N'),

        (2, 5,
         '블루 롱헤어 + 정장 컨셉… 깔끔하게 “캐릭터감” 살리기',
         '정장 계열은 라인 정리가 생명이라 옷 주름/카라 라인 계속 체크하면서 촬영했어. 렌즈는 너무 튀지 않게 맞췄고, 소품 검은 사진에 안 잡히면 밋밋해서 최대한 프레임 안에 들어오게 구도 잡았음.',
         'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/board/%EC%BD%94%EC%8A%A4%ED%94%84%EB%A0%88/%EC%BD%94%EC%8A%A4%ED%94%84%EB%A0%88-24.jfif', 392, 43, 8,
         NOW() - INTERVAL 3 DAY, NULL, 'N'),
        (2, 12,
         '단체 망토 코스 완성… 이 각도는 진짜 “그 장면”이다',
         '망토 디테일이랑 헤어 세팅이 핵심이라 촬영 전에 옷 라인/카라 각도부터 잡았어. 야외에서 찍으니까 색 대비가 확 살아나서 만족. 손 포즈는 여러 번 연습했는데, 카메라 앞에 서면 은근 어색해서 결국 제일 자연스러운 컷으로 선택!',
         'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/board/%EC%BD%94%EC%8A%A4%ED%94%84%EB%A0%88/%EC%BD%94%EC%8A%A4%ED%94%84%EB%A0%88-25.jfif', 681, 79, 18,
         NOW() - INTERVAL 12 DAY, NULL, 'N'),

        (2, 16,
         '단체샷 찍었는데 컨셉이 너무 과몰입이라 웃김ㅋㅋ',
         '여러 명이 같이 찍으니까 각자 포즈/표정 맞추는 게 제일 어려웠음. 그래도 망토 통일감 덕분에 사진이 꽉 차 보이고, 한 컷으로 “집단” 느낌 확 살아나서 만족! 촬영 끝나고 망토 정리만 한참 했다는 건 비밀…',
         'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/board/%EC%BD%94%EC%8A%A4%ED%94%84%EB%A0%88/%EC%BD%94%EC%8A%A4%ED%94%84%EB%A0%88-26.jfif', 942, 121, 33,
         NOW() - INTERVAL 20 DAY, NULL, 'N'),

        (2, 17,
         '금발 망토 코스 도전! 손 포즈 + 표정이 전부였다',
         '이 캐릭터는 표정이 반이라서 눈썹/아이라인에 힘 줬고, 렌즈도 톤 맞춰서 끼웠어. 손바닥 문양은 촬영 전에 빠르게 보정해서 선명하게 나오게 했고, 배경을 어둡게 잡으니까 의상이 더 튀어나와서 결과물 마음에 듦.',
         'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/board/%EC%BD%94%EC%8A%A4%ED%94%84%EB%A0%88/%EC%BD%94%EC%8A%A4%ED%94%84%EB%A0%88-27.jfif', 534, 65, 11,
         NOW() - INTERVAL 7 DAY, NULL, 'N'),
        (3, 10,
         '오늘 야식 치킨… 소스 조합 미쳤다',
         '바삭한 치킨에 양념/치즈 소스 찍어먹고, 치킨무까지 같이 먹으니까 끝… 한 입 먹고 “아 오늘은 성공이다” 소리 나옴. 다음엔 맥주까지 세트로 가야겠다.',
         'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/board/%EC%9E%90%EC%9C%A0/%EC%9E%90%EC%9C%A0-1.jpg', 388, 27, 6,
         NOW() - INTERVAL 1 DAY, NULL, 'N'),

        (3, 11,
         '이 짤 볼 때마다 대사 타이밍이 너무 웃김ㅋㅋ',
         '“큰일 났어”로 시작해서 점점 상황이 이상해지는 흐름이 진짜 레전드… 마지막 한 줄이 화룡점정임. 단톡방에 던지면 반응 보장.',
         'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/board/%EC%9E%90%EC%9C%A0/%EC%9E%90%EC%9C%A0-2.png', 742, 61, 15,
         NOW() - INTERVAL 3 DAY, NULL, 'N'),

        (3, 12,
         '질문 하나로 멘탈 부서지는 순간',
         '짧은 글인데 묘하게 파괴력 있음… “그렇게 보이는 이유”가 더 궁금해지는 글이라 댓글창 들어가게 됨. 이런 건 볼 때마다 웃프다.',
         'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/board/%EC%9E%90%EC%9C%A0/%EC%9E%90%EC%9C%A0-3.jpg', 529, 44, 9,
         NOW() - INTERVAL 8 DAY, NULL, 'N'),

        (3, 13,
         '서울 살면 말투가 이렇게 변하나 봄',
         '처음엔 “난 절대 안 바뀜”이라고 생각했는데 어느 순간 튀어나오는 말투가 있음ㅋㅋ 지역별로 말투 변화 체감되는 포인트가 재밌다. 다들 이런 경험 있어?',
         'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/board/%EC%9E%90%EC%9C%A0/%EC%9E%90%EC%9C%A0-4.jfif', 311, 22, 5,
         NOW() - INTERVAL 15 DAY, NULL, 'N'),

        (3, 14,
         '대화가 너무 깔끔하게 끝나서 웃음 터짐',
         '상대가 진지하게 고민 말하는데 갑자기 한 단어로 정리되는 그 느낌…ㅋㅋ 이런 템포는 진짜 센스다. “굿” 한 방이면 종결.',
         'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/board/%EC%9E%90%EC%9C%A0/%EC%9E%90%EC%9C%A0-5.jpeg', 615, 49, 11,
         NOW() - INTERVAL 6 DAY, NULL, 'N'),

        (3, 15,
         '이런 전/후 비교는 진짜 반칙 아니냐',
         '한 장으로 “변신”이 설명되는 케이스… 포인트는 헤어/눈썹/피부톤인 듯. 셀프 관리의 중요성을 다시 느낀다.',
         'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/board/%EC%9E%90%EC%9C%A0/%EC%9E%90%EC%9C%A0-6.jfif', 804, 73, 18,
         NOW() - INTERVAL 11 DAY, NULL, 'N'),

        (3, 16,
         '원피스 신권 표지 떴길래 저장함',
         '표지만 봐도 “이번 권은 사건 크다” 느낌이 확 남. 표지 구성 꽉 차 있는 거 너무 좋다… 읽을 시간만 생기면 바로 달릴 예정.',
         'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/board/%EC%9E%90%EC%9C%A0/%EC%9E%90%EC%9C%A0-7.jpg', 457, 38, 7,
         NOW() - INTERVAL 2 DAY, NULL, 'N'),

        (3, 17,
         '이 장면 캡처… 표정이 너무 강렬해서 저장',
         '그냥 “미친 텐션” 그 자체라서 짤로 저장해둠ㅋㅋ 이런 장면은 설명 필요 없이 짤 하나로 끝나는 느낌.',
         'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/board/%EC%9E%90%EC%9C%A0/%EC%9E%90%EC%9C%A0-8.jfif', 690, 55, 12,
         NOW() - INTERVAL 9 DAY, NULL, 'N'),

        (3, 18,
         '거인 나오는 그 작품은 역시 스케일이 다르다',
         '압도감 장난 아니고, 한 컷만 봐도 긴장감이 느껴짐. 이런 장면 나오면 다음 화까지 기다리는 게 고역…',
         'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/board/%EC%9E%90%EC%9C%A0/%EC%9E%90%EC%9C%A0-9.jfif', 733, 62, 14,
         NOW() - INTERVAL 4 DAY, NULL, 'N'),

        (3, 19,
         '중2 감성 대사인데 왠지 또 멋있음',
         '과하게 멋부린 대사일수록 웃기면서도 은근 뽕 차는 거 알지…? 이런 짤은 저장해뒀다가 친구한테 던지면 꿀잼.',
         'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/board/%EC%9E%90%EC%9C%A0/%EC%9E%90%EC%9C%A0-6.jpeg', 402, 30, 6,
         NOW() - INTERVAL 13 DAY, NULL, 'N'),
        (3, 10,
         '이 장면은 볼 때마다 소름… 스케일이 미쳤다',
         '한 컷만 봐도 압도감 장난 아님. 배경/연출이 너무 커서 그냥 “와…” 소리 나오는 장면. 이런 거 나오면 다음 화까지 기다리는 게 제일 힘듦.',
         'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/board/%EC%9E%90%EC%9C%A0/%EC%9E%90%EC%9C%A0-8.jfif', 821, 69, 14,
         NOW() - INTERVAL 12 DAY, NULL, 'N'),


        (3, 12,
         '이런 잔잔한 컷이 더 오래 기억남',
         '화려한 전투도 좋지만, 가끔은 이런 조용한 장면이 더 마음에 남더라. 분위기랑 표정이 너무 좋음. 그냥 저장각.',
         'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/board/%EC%9E%90%EC%9C%A0/%EC%9E%90%EC%9C%A0-10.jfif', 402, 33, 6,
         NOW() - INTERVAL 9 DAY, NULL, 'N'),

        (3, 13,
         '요즘 게임/애니 연출… 이펙트 맛이 미쳤다',
         '푸른 오라 이펙트 들어가면 무조건 간지… 화면이 꽉 차는 느낌이라 보는 맛이 있음. 이런 컨셉은 진짜 카메라 워크가 다 하더라.',
         'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/board/%EC%9E%90%EC%9C%A0/%EC%9E%90%EC%9C%A0-11.jfif', 511, 41, 8,
         NOW() - INTERVAL 15 DAY, NULL, 'N'),

        (3, 14,
         '이 표정은 진짜… 감정선 폭발 컷',
         '상처/피로감까지 다 담긴 표정이라 한 번 보면 안 잊힘. 이런 컷은 대사 없어도 분위기만으로 설명되는 느낌.',
         'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/board/%EC%9E%90%EC%9C%A0/%EC%9E%90%EC%9C%A0-12.jfif', 748, 64, 13,
         NOW() - INTERVAL 4 DAY, NULL, 'N'),

        (3, 15,
         '오늘의 야식 인증… 양념이 반칙이다',
         '겉바속촉에 양념 촉촉하게 배어있어서 그냥 순삭. “한 조각만” 했다가 결국 다 먹음… 다음엔 콜라/맥주까지 세트로 가야겠다.',
         'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/board/%EC%9E%90%EC%9C%A0/%EC%9E%90%EC%9C%A0-13.jpg', 368, 29, 7,
         NOW() - INTERVAL 2 DAY, NULL, 'N'),

        (3, 16,
         '길거리 음식은 현장감이 다 한다',
         '막 구워지는 소리 + 냄새 상상만 해도 배고픔. 이런 건 뜨거울 때 바로 먹어야 제맛인데… 사진 보니까 또 먹고 싶다.',
         'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/board/%EC%9E%90%EC%9C%A0/%EC%9E%90%EC%9C%A0-14.jfif', 295, 21, 5,
         NOW() - INTERVAL 7 DAY, NULL, 'N'),

        (3, 17,
         'AI가 이렇게 생각하는 느낌일 때 있음ㅋㅋ',
         '머리는 돌고 있는데 결론이 안 나는 그 순간… “정리 좀 해줘” 하고 싶어짐. 오늘 내 상태가 딱 이 짤 같았다.',
         'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/board/%EC%9E%90%EC%9C%A0/%EC%9E%90%EC%9C%A0-15.jfif', 579, 47, 11,
         NOW() - INTERVAL 1 DAY, NULL, 'N');

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

-- 2-16. BOARD_POST_IMAGE 아래 쿼리 한 방으로, board_post_image에 없는 글만 골라서 넣어줌(중복 방지):
INSERT INTO board_post_image (post_id, image_url, sort_order)
SELECT bp.post_id, bp.thumbnail_url, 1
FROM board_post bp
WHERE bp.thumbnail_url IS NOT NULL
  AND bp.thumbnail_url <> ''
  AND bp.thumbnail_url LIKE 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/board/%'
  AND NOT EXISTS (
    SELECT 1
    FROM board_post_image bpi
    WHERE bpi.post_id = bp.post_id
);


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
INSERT INTO trade_post (seller_id, title, content, goods_name, work_name, character_name, category, price, trade_type, trade_method, region, status, view_count, like_count, created_at, deleted_yn)
VALUES
            (2,'[귀멸의 칼날] 도우마 AGF 2025 담요','AGF 2025 한정 도우마 담요 판매합니다.','AGF 2025 담요','귀멸의 칼날','도우마','담요',35000,'SELL','DIRECT','홍대','ON_SALE',50,3,NOW(),'N'),
            (2,'[귀멸의 칼날] 아카자 AGF 2025 담요','AGF 2025 한정 아카자 담요입니다.','AGF 2025 담요','귀멸의 칼날','아카자','담요',35000,'SELL','DIRECT','홍대','ON_SALE',42,2,NOW(),'N'),
            (3,'[귀멸의 칼날] 코쿠시보 AGF 2025 담요','코쿠시보 AGF 한정 담요 판매합니다.','AGF 2025 담요','귀멸의 칼날','코쿠시보','담요',38000,'SELL','DIRECT','합정','ON_SALE',61,6,NOW(),'N'),
            (3,'[귀멸의 칼날] 키부츠지 무잔 AGF 2025 담요','무잔 AGF 한정 담요 미개봉 상품입니다.','AGF 2025 담요','귀멸의 칼날','키부츠지 무잔','담요',38000,'SELL','DIRECT','합정','ON_SALE',55,4,NOW(),'N'),
            (4,'[귀멸의 칼날] 코쵸우 시노부 쿄마후 아크릴 스탠드','쿄마후 한정 시노부 아크릴 스탠드입니다.','아크릴 스탠드','귀멸의 칼날','코쵸우 시노부','아크릴',22000,'SELL','DELIVERY','강남','ON_SALE',37,5,NOW(),'N'),
            (4,'[귀멸의 칼날] 토미오카 기유 쿄마후 아크릴 스탠드','쿄마후 한정 기유 아크릴 스탠드 판매합니다.','아크릴 스탠드','귀멸의 칼날','토미오카 기유','아크릴',22000,'SELL','DELIVERY','강남','ON_SALE',40,6,NOW(),'N'),
            (5,'[귀멸의 칼날] 아가츠마 젠이츠 무한성편 아크릴 참','무한성편 젠이츠 아크릴 참입니다.','아크릴 참','귀멸의 칼날','아가츠마 젠이츠','키링',12000,'SELL','DELIVERY','신촌','ON_SALE',28,2,NOW(),'N'),
            (5,'[귀멸의 칼날] 코쵸우 시노부 무한성편 아크릴 참','무한성편 시노부 아크릴 참 판매합니다.','아크릴 참','귀멸의 칼날','코쵸우 시노부','키링',12000,'SELL','DELIVERY','신촌','ON_SALE',25,1,NOW(),'N'),
            (6,'[귀멸의 칼날] 토미오카 기유 무한성편 아크릴 참','무한성편 기유 아크릴 참입니다.','아크릴 참','귀멸의 칼날','토미오카 기유','키링',12000,'SELL','DELIVERY','신촌','ON_SALE',31,3,NOW(),'N'),
            (6,'[귀멸의 칼날] 아카자 무한성편 아크릴 스탠드','무한성편 아카자 아크릴 스탠드 판매합니다.','아크릴 스탠드','귀멸의 칼날','아카자','아크릴',25000,'SELL','DIRECT','홍대','ON_SALE',48,7,NOW(),'N'),
            --11~20--
            (2,'[나루토 질풍전] 하루노 사쿠라 걸즈 시리즈','걸즈 시리즈 사쿠라 피규어 판매합니다.','걸즈 시리즈 피규어','나루토 질풍전','하루노 사쿠라','피규어',98000,'SELL','DELIVERY','홍대','ON_SALE',34,4,NOW(),'N'),
            (3,'[나루토 질풍전] 휴우가 히나타 넨도로이드 No.879','히나타 넨도로이드 상태 양호합니다.','넨도로이드','나루토 질풍전','휴우가 히나타','피규어',72000,'SELL','DELIVERY','강남','ON_SALE',41,6,NOW(),'N'),
            (2,'[나루토 질풍전] 우치하 사스케 룩업 피규어','룩업 시리즈 사스케 피규어입니다.','룩업 피규어','나루토 질풍전','우치하 사스케','피규어',38000,'SELL','DIRECT','홍대','ON_SALE',29,3,NOW(),'N'),
            (4,'[나루토 질풍전] 우치하 이타치 룩업 피규어','이타치 룩업 피규어 판매합니다.','룩업 피규어','나루토 질풍전','우치하 이타치','피규어',42000,'SELL','DIRECT','합정','ON_SALE',52,8,NOW(),'N'),
            (5,'[진격의 거인] 라이너 브라운 POP UP PARADE','POP UP PARADE 라이너 브라운 피규어입니다.','POP UP PARADE','진격의 거인','라이너 브라운','피규어',55000,'SELL','DELIVERY','신촌','ON_SALE',46,5,NOW(),'N'),
            (5,'[진격의 거인] 엘런 예거 POP UP PARADE','엘런 예거 월드 와이드 에프터 파티 버전입니다.','POP UP PARADE','진격의 거인','엘런 예거','피규어',55000,'SELL','DELIVERY','신촌','ON_SALE',63,9,NOW(),'N'),
            (6,'[진격의 거인] 리바이 넨도로이드 돌','넨도로이드 돌 리바이 판매합니다.','넨도로이드 돌','진격의 거인','리바이','피규어',89000,'SELL','DELIVERY','건대','ON_SALE',71,11,NOW(),'N'),
            (3,'[진격의 거인] 리바이 룩업 피규어','룩업 리바이 피규어입니다.','룩업 피규어','진격의 거인','리바이','피규어',39000,'SELL','DIRECT','강남','ON_SALE',58,7,NOW(),'N'),
            (4,'[진격의 거인] 엘런 예거 룩업 피규어','엘런 룩업 피규어 판매합니다.','룩업 피규어','진격의 거인','엘런 예거','피규어',39000,'SELL','DIRECT','강남','ON_SALE',44,6,NOW(),'N'),
            (6,'[진격의 거인] 아르민 알레르토 넨도로이드 조사병단','아르민 넨도로이드 조사병단 버전입니다.','넨도로이드','진격의 거인','아르민 알레르토','피규어',76000,'SELL','DELIVERY','홍대','ON_SALE',67,10,NOW(),'N'),
            --21~31--

            -- 21
            (2,'[블루록] 바치라 메구루 아크릴 스탠드','블루록 2기 콜라보 바치라 메구루 아크릴 스탠드입니다.','아크릴 스탠드','블루록','바치라 메구루','아크릴',18000,'SELL','DELIVERY','홍대','ON_SALE',33,4,NOW(),'N'),

            -- 22
            (2,'[블루록] 치기리 효마 아크릴 스탠드','블루록 2기 콜라보 치기리 효마 아크릴 스탠드입니다.','아크릴 스탠드','블루록','치기리 효마','아크릴',18000,'SELL','DELIVERY','홍대','ON_SALE',29,3,NOW(),'N'),

            -- 23
            (3,'[블루록] 이사기 요이치 아크릴 키홀더','블루록 2기 이사기 요이치 아크릴 스탠드 키홀더입니다.','아크릴 키홀더','블루록','이사기 요이치','키링',15000,'SELL','DELIVERY','강남','ON_SALE',41,6,NOW(),'N'),

            -- 24
            (3,'[블루록] 나기 세이시로 아크릴 키홀더','블루록 2기 나기 세이시로 아크릴 키홀더입니다.','아크릴 키홀더','블루록','나기 세이시로','키링',15000,'SELL','DELIVERY','강남','ON_SALE',38,5,NOW(),'N'),

            -- 25
            (4,'[블루록] 바치라 메구루 아크릴 키홀더','블루록 2기 바치라 메구루 아크릴 키홀더입니다.','아크릴 키홀더','블루록','바치라 메구루','키링',15000,'SELL','DELIVERY','신촌','ON_SALE',36,4,NOW(),'N'),

            -- 26
            (4,'[블루록] 치기리 효마 아크릴 키홀더','블루록 2기 치기리 효마 아크릴 키홀더입니다.','아크릴 키홀더','블루록','치기리 효마','키링',15000,'SELL','DELIVERY','신촌','ON_SALE',34,3,NOW(),'N'),

            -- 27
            (5,'[블루록] 트레이딩 은박 원형 캔뱃지','블루록 트레이딩 은박 원형 캔뱃지 (랜덤) 입니다.','원형 캔뱃지','블루록',NULL,'뱃지',6000,'SELL','DELIVERY','건대','ON_SALE',52,7,NOW(),'N'),

            -- 28
            (5,'[블루록] 나기 세이시로 룩업 피규어','룩업 시리즈 나기 세이시로 피규어입니다.','룩업 피규어','블루록','나기 세이시로','피규어',39000,'SELL','DIRECT','건대','ON_SALE',47,6,NOW(),'N'),

            -- 29
            (6,'[블루록] 이사기 요이치 더블 아크릴 키홀더','데포르메 버전 이사기 요이치 더블 아크릴 키홀더입니다.','더블 아크릴 키홀더','블루록','이사기 요이치','키링',17000,'SELL','DELIVERY','합정','ON_SALE',44,5,NOW(),'N'),

            -- 30
            (6,'[블루록] 나기 세이시로 액션 피규어','블루록 나기 세이시로 슈팅 포즈 액션 피규어입니다.','액션 피규어','블루록','나기 세이시로','피규어',89000,'SELL','DIRECT','홍대','ON_SALE',73,12,NOW(),'N'),
            --31-40--
            (2,'[주술회전] MEGA CAT PROJECT BIG 고죠 사토루','MEGA CAT PROJECT BIG 고죠 사토루 피규어입니다.','MEGA CAT BIG','주술회전','고죠 사토루','피규어',42000,'SELL','DELIVERY','홍대','ON_SALE',36,5,NOW(),'N'),
            (2,'[주술회전] MEGA CAT PROJECT BIG 후시구로 토우지','MEGA CAT PROJECT BIG 후시구로 토우지 피규어입니다.','MEGA CAT BIG','주술회전','후시구로 토우지','피규어',42000,'SELL','DELIVERY','홍대','ON_SALE',31,4,NOW(),'N'),
            (3,'[주술회전] 고죠 사토루 슈트 Ver. 피규어','슈트 버전 고죠 사토루 피규어 판매합니다.','슈트 Ver. 피규어','주술회전','고죠 사토루','피규어',98000,'SELL','DIRECT','강남','ON_SALE',54,8,NOW(),'N'),
            (3,'[주술회전] 넨도로이드 돌 고죠 사토루 (고전)','넨도로이드 돌 고죠 사토루 고전 버전입니다.','넨도로이드 돌','주술회전','고죠 사토루','피규어',89000,'SELL','DELIVERY','강남','ON_SALE',49,7,NOW(),'N'),
            (4,'[주술회전] 룩업 고죠 사토루','룩업 시리즈 고죠 사토루 피규어입니다.','룩업 피규어','주술회전','고죠 사토루','피규어',39000,'SELL','DIRECT','합정','ON_SALE',45,6,NOW(),'N'),
            (5,'[하이큐!!] GEM 시리즈 손바닥 미야 아츠무','GEM 시리즈 손바닥 미야 아츠무 피규어입니다.','GEM 손바닥 시리즈','하이큐!!','미야 아츠무','피규어',68000,'SELL','DIRECT','신촌','ON_SALE',52,7,NOW(),'N'),
            (5,'[하이큐!!] GEM 시리즈 손바닥 츠키시마 케이','GEM 시리즈 손바닥 츠키시마 케이 피규어입니다.','GEM 손바닥 시리즈','하이큐!!','츠키시마 케이','피규어',68000,'SELL','DIRECT','신촌','ON_SALE',48,6,NOW(),'N'),
            (6,'[하이큐!!] GEM 시리즈 손바닥 카게야마 토비오','카게야마 토비오 세컨드 유니폼 버전입니다.','GEM 손바닥 시리즈','하이큐!!','카게야마 토비오','피규어',72000,'SELL','DELIVERY','건대','ON_SALE',61,9,NOW(),'N'),
            (6,'[하이큐!!] GEM 시리즈 손바닥 히나타 쇼요','히나타 쇼요 세컨드 유니폼 버전 피규어입니다.','GEM 손바닥 시리즈','하이큐!!','히나타 쇼요','피규어',72000,'SELL','DELIVERY','건대','ON_SALE',67,11,NOW(),'N'),
            (6,'[하이큐!!] 룩업 츠키시마 케이','룩업 시리즈 츠키시마 케이 피규어입니다.','룩업 피규어','하이큐!!','츠키시마 케이','피규어',39000,'SELL','DIRECT','홍대','ON_SALE',43,5,NOW(),'N'),
            --41~50--
            (2,'[원피스] NEO-MAXIMUM 루피 & 에이스 형제의 연 20TH LIMITED','루피 & 에이스 형제의 연 20주년 한정 피규어입니다.','NEO-MAXIMUM','원피스','몽키 D 루피 / 포트거스 D 에이스','피규어',520000,'SELL','DIRECT','홍대','ON_SALE',84,12,NOW(),'N'),
            (3,'[원피스] P.O.P Evolutionary History 주얼리 보니','Portrait.Of.Pirates 주얼리 보니 피규어입니다.','P.O.P 피규어','원피스','주얼리 보니','피규어',165000,'SELL','DELIVERY','강남','ON_SALE',57,8,NOW(),'N'),
            (3,'[원피스] P.O.P K×MAXIMUM 상디','K×MAXIMUM 상디 한정 피규어 판매합니다.','P.O.P MAXIMUM','원피스','상디','피규어',298000,'SELL','DIRECT','강남','ON_SALE',73,11,NOW(),'N'),
            (4,'[원피스] P.O.P WA.MAXIMUM 백수의 카이도','WA.MAXIMUM 카이도 초한정 복각판입니다.','P.O.P WA.MAXIMUM','원피스','카이도','피규어',480000,'SELL','DIRECT','합정','ON_SALE',96,18,NOW(),'N'),
            (4,'[원피스] P.O.P WA-MAXIMUM 화재의 킹','백수해적단 대간판 화재의 킹 피규어입니다.','P.O.P WA-MAXIMUM','원피스','킹','피규어',330000,'SELL','DIRECT','합정','ON_SALE',69,10,NOW(),'N'),
            (5,'[원피스] 룩업 몽키 D 루피 기어 5','기어 5 루피 룩업 피규어입니다.','룩업 피규어','원피스','몽키 D 루피','피규어',42000,'SELL','DELIVERY','신촌','ON_SALE',61,9,NOW(),'N'),
            (5,'[원피스] 베리어블 액션 히어로즈 롤로노아 조로','베리어블 액션 히어로즈 조로 피규어입니다.','베리어블 액션 히어로즈','원피스','롤로노아 조로','피규어',185000,'SELL','DIRECT','신촌','ON_SALE',67,10,NOW(),'N'),
            (6,'[원피스] 세계의 디바 우타','극장판 등장 세계의 디바 우타 피규어입니다.','스케일 피규어','원피스','우타','피규어',158000,'SELL','DELIVERY','홍대','ON_SALE',72,13,NOW(),'N'),
            (6,'[원피스] P.O.P SA-MAXIMUM 돈키호테 도플라밍고','SA-MAXIMUM 도플라밍고 피규어입니다.','P.O.P SA-MAXIMUM','원피스','돈키호테 도플라밍고','피규어',410000,'SELL','DIRECT','홍대','ON_SALE',88,16,NOW(),'N'),
            (6,'[원피스] 흰수염 에드워드 뉴게이트','전설의 해적 흰수염 에드워드 뉴게이트 피규어입니다.','대형 피규어','원피스','에드워드 뉴게이트','피규어',460000,'SELL','DIRECT','홍대','ON_SALE',91,17,NOW(),'N');
-- 2-22. TRADE_POST_IMAGE
INSERT INTO trade_post_image (trade_id, image_url, sort_order) VALUES
             (1,  'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/trade/%EA%B7%80%EB%A9%B8%EC%9D%98+%EC%B9%BC%EB%82%A0/%5B%EA%B7%80%EB%A9%B8%EC%9D%98+%EC%B9%BC%EB%82%A0%5D+AGF+2025+%EB%8B%B4%EC%9A%94+%EB%8F%84%EC%9A%B0%EB%A7%88.PNG',  1),
             (2,  'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/trade/%EA%B7%80%EB%A9%B8%EC%9D%98+%EC%B9%BC%EB%82%A0/%5B%EA%B7%80%EB%A9%B8%EC%9D%98+%EC%B9%BC%EB%82%A0%5D+AGF+2025+%EB%8B%B4%EC%9A%94+%EC%95%84%EC%B9%B4%EC%9E%90.PNG',  1),
             (3,  'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/trade/%EA%B7%80%EB%A9%B8%EC%9D%98+%EC%B9%BC%EB%82%A0/%5B%EA%B7%80%EB%A9%B8%EC%9D%98+%EC%B9%BC%EB%82%A0%5D+AGF+2025+%EB%8B%B4%EC%9A%94+%EC%BD%94%EC%BF%A0%EC%8B%9C%EB%B3%B4.PNG',  1),
             (4,  'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/trade/%EA%B7%80%EB%A9%B8%EC%9D%98+%EC%B9%BC%EB%82%A0/%5B%EA%B7%80%EB%A9%B8%EC%9D%98+%EC%B9%BC%EB%82%A0%5D+AGF+2025+%EB%8B%B4%EC%9A%94+%ED%82%A4%EB%B6%80%EC%B8%A0%EC%A7%80+%EB%AC%B4%EC%9E%94.PNG',  1),
             (5,  'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/trade/%EA%B7%80%EB%A9%B8%EC%9D%98+%EC%B9%BC%EB%82%A0/%5B%EA%B7%80%EB%A9%B8%EC%9D%98+%EC%B9%BC%EB%82%A0%5D+%EC%BF%84%EB%A7%88%ED%9B%84+%EC%95%84%ED%81%AC%EB%A6%B4+%EC%8A%A4%ED%83%A0%EB%93%9C+-+%EC%BD%94%EC%B5%B8%EC%9A%B0+%EC%8B%9C%EB%85%B8%EB%B6%80.PNG',  1),
             (6,  'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/trade/%EA%B7%80%EB%A9%B8%EC%9D%98+%EC%B9%BC%EB%82%A0/%5B%EA%B7%80%EB%A9%B8%EC%9D%98+%EC%B9%BC%EB%82%A0%5D+%EC%BF%84%EB%A7%88%ED%9B%84+%EC%95%84%ED%81%AC%EB%A6%B4+%EC%8A%A4%ED%83%A0%EB%93%9C+-+%ED%86%A0%EB%AF%B8%EC%98%A4%EC%B9%B4+%EA%B8%B0%EC%9C%A0.PNG',  1),
             (7,  'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/trade/%EA%B7%80%EB%A9%B8%EC%9D%98+%EC%B9%BC%EB%82%A0/%EA%B7%80%EB%A9%B8%EC%9D%98+%EC%B9%BC%EB%82%A0+%EB%AC%B4%ED%95%9C%EC%84%B1%ED%8E%B8+%EA%B2%A9%ED%88%AC+%EC%95%84%ED%81%AC%EB%A6%B4+%EC%B0%B8+%EC%95%84%EA%B0%80%EC%B8%A0%EB%A7%88+%EC%A0%A0%EC%9D%B4%EC%B8%A0.PNG',  1),
             (8,  'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/trade/%EA%B7%80%EB%A9%B8%EC%9D%98+%EC%B9%BC%EB%82%A0/%EA%B7%80%EB%A9%B8%EC%9D%98+%EC%B9%BC%EB%82%A0+%EB%AC%B4%ED%95%9C%EC%84%B1%ED%8E%B8+%EA%B2%A9%ED%88%AC+%EC%95%84%ED%81%AC%EB%A6%B4+%EC%B0%B8+%EC%BD%94%EC%B5%B8%EC%9A%B0+%EC%8B%9C%EB%85%B8%EB%B6%80.PNG',  1),
             (9,  'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/trade/%EA%B7%80%EB%A9%B8%EC%9D%98+%EC%B9%BC%EB%82%A0/%EA%B7%80%EB%A9%B8%EC%9D%98+%EC%B9%BC%EB%82%A0+%EB%AC%B4%ED%95%9C%EC%84%B1%ED%8E%B8+%EA%B2%A9%ED%88%AC+%EC%95%84%ED%81%AC%EB%A6%B4+%EC%B0%B8+%ED%86%A0%EB%AF%B8%EC%98%A4%EC%B9%B4+%EA%B8%B0%EC%9C%A0.PNG',  1),
             (10, 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/trade/%EA%B7%80%EB%A9%B8%EC%9D%98+%EC%B9%BC%EB%82%A0/%EA%B7%80%EB%A9%B8%EC%9D%98+%EC%B9%BC%EB%82%A0+%EB%AC%B4%ED%95%9C%EC%84%B1%ED%8E%B8+%EC%95%84%ED%81%AC%EB%A6%B4+%EC%8A%A4%ED%83%A0%EB%93%9C+%EC%95%84%EC%B9%B4%EC%9E%90.PNG', 1),
             (11, 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/trade/%EB%82%98%EB%A3%A8%ED%86%A0/%5B%EB%82%98%EB%A3%A8%ED%86%A0+%EC%A7%88%ED%92%8D%EC%A0%84%5D+%EA%B1%B8%EC%A6%88+%EC%8B%9C%EB%A6%AC%EC%A6%88+%ED%95%98%EB%A3%A8%EB%85%B8+%EC%82%AC%EC%BF%A0%EB%9D%BC.PNG', 1),
             (12, 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/trade/%EB%82%98%EB%A3%A8%ED%86%A0/%5B%EB%82%98%EB%A3%A8%ED%86%A0+%EC%A7%88%ED%92%8D%EC%A0%84%5D+%EB%84%A8%EB%8F%84%EB%A1%9C%EC%9D%B4%EB%93%9C+No.879+%ED%9C%B4%EC%9A%B0%EA%B0%80+%ED%9E%88%EB%82%98%ED%83%80.PNG', 1),
             (13, 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/trade/%EB%82%98%EB%A3%A8%ED%86%A0/%EB%A3%A9%EC%97%85+%EB%82%98%EB%A3%A8%ED%86%A0+%EC%A7%88%ED%92%8D%EC%A0%84+-+%EC%9A%B0%EC%B9%98%ED%95%98+%EC%82%AC%EC%8A%A4%EC%BC%80.PNG', 1),
             (14, 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/trade/%EB%82%98%EB%A3%A8%ED%86%A0/%EB%A3%A9%EC%97%85+%EB%82%98%EB%A3%A8%ED%86%A0+%EC%A7%88%ED%92%8D%EC%A0%84+-+%EC%9A%B0%EC%B9%98%ED%95%98+%EC%9D%B4%ED%83%80%EC%B9%98.PNG', 1),
             (15, 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/trade/%EC%A7%84%EA%B2%A9%EC%9D%98+%EA%B1%B0%EC%9D%B8/%5B%EC%A7%84%EA%B2%A9%EC%9D%98+%EA%B1%B0%EC%9D%B8%5D+POP+UP+PARADE+%EB%9D%BC%EC%9D%B4%EB%84%88+%EB%B8%8C%EB%9D%BC%EC%9A%B4+%EC%9B%94%EB%93%9C+%EC%99%80%EC%9D%B4%EB%93%9C+%EC%97%90%ED%94%84%ED%84%B0+%ED%8C%8C%ED%8B%B0.PNG', 1),
             (16, 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/trade/%EC%A7%84%EA%B2%A9%EC%9D%98+%EA%B1%B0%EC%9D%B8/%5B%EC%A7%84%EA%B2%A9%EC%9D%98+%EA%B1%B0%EC%9D%B8%5D+POP+UP+PARADE+%EC%97%98%EB%9F%B0+%EC%98%88%EA%B1%B0+%EC%9B%94%EB%93%9C+%EC%99%80%EC%9D%B4%EB%93%9C+%EC%97%90%ED%94%84%ED%84%B0+%ED%8C%8C%ED%8B%B0.PNG', 1),
             (17, 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/trade/%EC%A7%84%EA%B2%A9%EC%9D%98+%EA%B1%B0%EC%9D%B8/%5B%EC%A7%84%EA%B2%A9%EC%9D%98+%EA%B1%B0%EC%9D%B8%5D+%EB%84%A8%EB%8F%84%EB%A1%9C%EC%9D%B4%EB%93%9C+%EB%8F%8C+%EB%A6%AC%EB%B0%94%EC%9D%B4.PNG', 1),
             (18, 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/trade/%EC%A7%84%EA%B2%A9%EC%9D%98+%EA%B1%B0%EC%9D%B8/%5B%EC%A7%84%EA%B2%A9%EC%9D%98+%EA%B1%B0%EC%9D%B8%5D+%EB%A3%A9%EC%97%85+%EB%A6%AC%EB%B0%94%EC%9D%B4.PNG', 1),
             (19, 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/trade/%EC%A7%84%EA%B2%A9%EC%9D%98+%EA%B1%B0%EC%9D%B8/%5B%EC%A7%84%EA%B2%A9%EC%9D%98+%EA%B1%B0%EC%9D%B8%5D+%EB%A3%A9%EC%97%85+%EC%97%98%EB%9F%B0+%EC%98%88%EA%B1%B0.PNG', 1),
             (20, 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/trade/%EC%A7%84%EA%B2%A9%EC%9D%98+%EA%B1%B0%EC%9D%B8/%EB%84%A8%EB%8F%84%EB%A1%9C%EC%9D%B4%EB%93%9C+%EC%A7%84%EA%B2%A9%EC%9D%98+%EA%B1%B0%EC%9D%B8+%EC%95%84%EB%A5%B4%EB%AF%BC+%EC%95%8C%EB%A0%88%EB%A5%B4%ED%86%A0+%EC%A1%B0%EC%82%AC%EB%B3%91%EB%8B%A8.PNG', 1),
             (21, 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/trade/%EB%B8%94%EB%A3%A8+%EB%A1%9D/(%EC%BD%9C%EB%9D%BC%EB%B3%B4)+%5B%EB%B8%94%EB%A3%A8+%EB%A1%9D+2%EA%B8%B0%5D+%EC%95%84%ED%81%AC%EB%A6%B4+%EC%8A%A4%ED%83%A0%EB%93%9C+05+%EB%B0%94%EC%B9%98%EB%9D%BC+%EB%A9%94%EA%B5%AC%EB%A3%A8.PNG', 1),
             (22, 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/trade/%EB%B8%94%EB%A3%A8+%EB%A1%9D/(%EC%BD%9C%EB%9D%BC%EB%B3%B4)+%5B%EB%B8%94%EB%A3%A8+%EB%A1%9D+2%EA%B8%B0%5D+%EC%95%84%ED%81%AC%EB%A6%B4+%EC%8A%A4%ED%83%A0%EB%93%9C+06+%EC%B9%98%EA%B8%B0%EB%A6%AC+%ED%9A%A8%EB%A7%88.PNG', 1),
             (23, 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/trade/%EB%B8%94%EB%A3%A8+%EB%A1%9D/(%EC%BD%9C%EB%9D%BC%EB%B3%B4)+%5B%EB%B8%94%EB%A3%A8+%EB%A1%9D+2%EA%B8%B0%5D+%EC%95%84%ED%81%AC%EB%A6%B4+%EC%8A%A4%ED%83%A0%EB%93%9C+%ED%82%A4%ED%99%80%EB%8D%94+01+%EC%9D%B4%EC%82%AC%EA%B8%B0+%EC%9A%94%EC%9D%B4%EC%B9%98.PNG', 1),
             (24, 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/trade/%EB%B8%94%EB%A3%A8+%EB%A1%9D/(%EC%BD%9C%EB%9D%BC%EB%B3%B4)+%5B%EB%B8%94%EB%A3%A8+%EB%A1%9D+2%EA%B8%B0%5D+%EC%95%84%ED%81%AC%EB%A6%B4+%EC%8A%A4%ED%83%A0%EB%93%9C+%ED%82%A4%ED%99%80%EB%8D%94+03+%EB%82%98%EA%B8%B0+%EC%84%B8%EC%9D%B4%EC%8B%9C%EB%A1%9C.PNG', 1),
             (25, 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/trade/%EB%B8%94%EB%A3%A8+%EB%A1%9D/(%EC%BD%9C%EB%9D%BC%EB%B3%B4)+%5B%EB%B8%94%EB%A3%A8+%EB%A1%9D+2%EA%B8%B0%5D+%EC%95%84%ED%81%AC%EB%A6%B4+%EC%8A%A4%ED%83%A0%EB%93%9C+%ED%82%A4%ED%99%80%EB%8D%94+05+%EB%B0%94%EC%B9%98%EB%9D%BC+%EB%A9%94%EA%B5%AC%EB%A3%A8.PNG', 1),
             (26, 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/trade/%EB%B8%94%EB%A3%A8+%EB%A1%9D/(%EC%BD%9C%EB%9D%BC%EB%B3%B4)+%5B%EB%B8%94%EB%A3%A8+%EB%A1%9D+2%EA%B8%B0%5D+%EC%95%84%ED%81%AC%EB%A6%B4+%EC%8A%A4%ED%83%A0%EB%93%9C+%ED%82%A4%ED%99%80%EB%8D%94+06+%EC%B9%98%EA%B8%B0%EB%A6%AC+%ED%9A%A8%EB%A7%88.PNG', 1),
             (27, 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/trade/%EB%B8%94%EB%A3%A8+%EB%A1%9D/(%EC%BD%9C%EB%9D%BC%EB%B3%B4)+%5B%EB%B8%94%EB%A3%A8+%EB%A1%9D+2%EA%B8%B0%5D+%ED%8A%B8%EB%A0%88%EC%9D%B4%EB%94%A9+%EC%9D%80%EB%B0%95+%EC%9B%90%ED%98%95+%EC%BA%94%EB%B1%83%EC%A7%80+(%EC%A0%84+8%EC%A2%85).PNG', 1),
             (28, 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/trade/%EB%B8%94%EB%A3%A8+%EB%A1%9D/%5B%EB%B8%94%EB%A3%A8%EB%A1%9D%5D+%EB%A3%A9%EC%97%85+%EB%82%98%EA%B8%B0+%EC%84%B8%EC%9D%B4%EC%8B%9C%EB%A1%9C.PNG', 1),
             (29, 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/trade/%EB%B8%94%EB%A3%A8+%EB%A1%9D/%EB%B8%94%EB%A3%A8+%EB%A1%9D+2%EA%B8%B0+%EB%8D%94%EB%B8%94+%EC%95%84%ED%81%AC%EB%A6%B4+%ED%82%A4%ED%99%80%EB%8D%94+%EB%8D%B0%ED%8F%AC%EB%A5%B4%EB%A9%94+%EC%9D%B4%EC%82%AC%EA%B8%B0+%EC%9A%94%EC%9D%B4%EC%B9%98.PNG', 1),
             (30, 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/trade/%EB%B8%94%EB%A3%A8+%EB%A1%9D/%EB%B8%94%EB%A3%A8+%EB%A1%9D+%EB%82%98%EA%B8%B0+%EC%84%B8%EC%9D%B4%EC%8B%9C%EB%A1%9C.PNG', 1),
             (31, 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/trade/%EC%A3%BC%EC%88%A0%ED%9A%8C%EC%A0%84/%5B%EC%A3%BC%EC%88%A0%ED%9A%8C%EC%A0%84%5D+MEGA+CAT+PROJECT+BIG+%EA%B3%A0%EC%A3%A0+%EC%82%AC%ED%86%A0%EB%A3%A8.PNG', 1),
             (32, 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/trade/%EC%A3%BC%EC%88%A0%ED%9A%8C%EC%A0%84/%5B%EC%A3%BC%EC%88%A0%ED%9A%8C%EC%A0%84%5D+MEGA+CAT+PROJECT+BIG+%ED%9B%84%EC%8B%9C%EA%B5%AC%EB%A1%9C+%ED%86%A0%EC%9A%B0%EC%A7%80.PNG', 1),
             (33, 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/trade/%EC%A3%BC%EC%88%A0%ED%9A%8C%EC%A0%84/%5B%EC%A3%BC%EC%88%A0%ED%9A%8C%EC%A0%84%5D+%EA%B3%A0%EC%A3%A0+%EC%82%AC%ED%86%A0%EB%A3%A8+%EC%8A%88%ED%8A%B8Ver..PNG', 1),
             (34, 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/trade/%EC%A3%BC%EC%88%A0%ED%9A%8C%EC%A0%84/%5B%EC%A3%BC%EC%88%A0%ED%9A%8C%EC%A0%84%5D+%EB%84%A8%EB%8F%84%EB%A1%9C%EC%9D%B4%EB%93%9C+%EB%8F%8C+%EA%B3%A0%EC%A3%A0+%EC%82%AC%ED%86%A0%EB%A3%A8+%EA%B3%A0%EC%A0%84.PNG', 1),
             (35, 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/trade/%EC%A3%BC%EC%88%A0%ED%9A%8C%EC%A0%84/%5B%EC%A3%BC%EC%88%A0%ED%9A%8C%EC%A0%84%5D+%EB%A3%A9%EC%97%85+%EA%B3%A0%EC%A3%A0+%EC%82%AC%ED%86%A0%EB%A3%A8.PNG', 1),
             (36, 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/trade/%ED%95%98%EC%9D%B4%ED%81%90/%5B%ED%95%98%EC%9D%B4%ED%81%90!!%5D+GEM+%EC%8B%9C%EB%A6%AC%EC%A6%88+%EC%86%90%EB%B0%94%EB%8B%A5+%EB%AF%B8%EC%95%BC+%EC%95%84%EC%B8%A0%EB%AC%B4.PNG', 1),
             (37, 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/trade/%ED%95%98%EC%9D%B4%ED%81%90/%5B%ED%95%98%EC%9D%B4%ED%81%90!!%5D+GEM+%EC%8B%9C%EB%A6%AC%EC%A6%88+%EC%86%90%EB%B0%94%EB%8B%A5+%EC%B8%A0%ED%82%A4%EC%8B%9C%EB%A7%88+%EC%BC%80%EC%9D%B4.PNG', 1),
             (38, 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/trade/%ED%95%98%EC%9D%B4%ED%81%90/%5B%ED%95%98%EC%9D%B4%ED%81%90!!%5D+GEM+%EC%8B%9C%EB%A6%AC%EC%A6%88+%EC%86%90%EB%B0%94%EB%8B%A5+%EC%B9%B4%EA%B2%8C%EC%95%BC%EB%A7%88+%ED%86%A0%EB%B9%84%EC%98%A4+%EC%84%B8%EC%BB%A8%EB%93%9C+%EC%9C%A0%EB%8B%88%ED%8F%BC+Ver..PNG', 1),
             (39, 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/trade/%ED%95%98%EC%9D%B4%ED%81%90/%5B%ED%95%98%EC%9D%B4%ED%81%90!!%5D+GEM+%EC%8B%9C%EB%A6%AC%EC%A6%88+%EC%86%90%EB%B0%94%EB%8B%A5+%ED%9E%88%EB%82%98%ED%83%80+%EC%86%8C%EC%9A%94+%EC%84%B8%EC%BB%A8%EB%93%9C+%EC%9C%A0%EB%8B%88%ED%8F%BC+Ver..PNG', 1),
             (40, 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/trade/%ED%95%98%EC%9D%B4%ED%81%90/%5B%ED%95%98%EC%9D%B4%ED%81%90!!%5D+%EB%A3%A9%EC%97%85+%EC%B8%A0%ED%82%A4%EC%8B%9C%EB%A7%88+%EC%BC%80%EC%9D%B4.PNG', 1),
             (41, 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/trade/%EC%9B%90%ED%94%BC%EC%8A%A4/%5B%EC%9B%90%ED%94%BC%EC%8A%A4%5D+NEO-MAXIMUM+%EB%A3%A8%ED%94%BC+%26+%EC%97%90%EC%9D%B4%EC%8A%A4+%ED%98%95%EC%A0%9C%EC%9D%98+%EC%97%B0+20TH+LIMITED.PNG', 1),
             (42, 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/trade/%EC%9B%90%ED%94%BC%EC%8A%A4/%5B%EC%9B%90%ED%94%BC%EC%8A%A4%5D+Portrait.Of.Pirates+POP+Evolutionary+History+%EC%A3%BC%EC%96%BC%EB%A6%AC+%EB%B3%B4%EB%8B%88.PNG', 1),
             (43, 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/trade/%EC%9B%90%ED%94%BC%EC%8A%A4/%5B%EC%9B%90%ED%94%BC%EC%8A%A4%5D+Portrait.Of.Pirates+POP+K%C3%97MAXIMUM+%EC%83%81%EB%94%94.PNG', 1),
             (44, 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/trade/%EC%9B%90%ED%94%BC%EC%8A%A4/%5B%EC%9B%90%ED%94%BC%EC%8A%A4%5D+Portrait.Of.Pirates+WA.MAXIMUM+%EB%B0%B1%EC%88%98%EC%9D%98+%EC%B9%B4%EC%9D%B4%EB%8F%84+%EC%B4%88%ED%95%9C%EC%A0%95+%EB%B3%B5%EA%B0%81%ED%8C%90.PNG', 1),
             (45, 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/trade/%EC%9B%90%ED%94%BC%EC%8A%A4/%5B%EC%9B%90%ED%94%BC%EC%8A%A4%5D+Portrait.Of.Pirates+WA-MAXIMUM+%EB%B0%B1%EC%88%98%ED%95%B4%EC%A0%81%EB%8B%A8+%EB%8C%80%EA%B0%84%ED%8C%90+%ED%99%94%EC%9E%AC%EC%9D%98+%ED%82%B9.PNG', 1),
             (46, 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/trade/%EC%9B%90%ED%94%BC%EC%8A%A4/%5B%EC%9B%90%ED%94%BC%EC%8A%A4%5D+%EB%A3%A9%EC%97%85+%EB%AA%BD%ED%82%A4+D+%EB%A3%A8%ED%94%BC+%EA%B8%B0%EC%96%B4+5.PNG', 1),
             (47, 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/trade/%EC%9B%90%ED%94%BC%EC%8A%A4/%5B%EC%9B%90%ED%94%BC%EC%8A%A4%5D+%EB%B2%A0%EB%A6%AC%EC%96%B4%EB%B8%94+%EC%95%A1%EC%85%98+%ED%9E%88%EC%96%B4%EB%A1%9C%EC%A6%88+%EB%A1%A4%EB%A1%9C%EB%85%B8%EC%95%84+%EC%A1%B0%EB%A1%9C.PNG', 1),
             (48, 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/trade/%EC%9B%90%ED%94%BC%EC%8A%A4/%5B%EC%9B%90%ED%94%BC%EC%8A%A4%5D+%EC%84%B8%EA%B3%84%EC%9D%98+%EB%94%94%EB%B0%94+%EC%9A%B0%ED%83%80.PNG', 1),
             (49, 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/trade/%EC%9B%90%ED%94%BC%EC%8A%A4/%EC%9B%90%ED%94%BC%EC%8A%A4+P.O.P+SA-MAXIMUM+%EB%8F%88%ED%82%A4%ED%98%B8%ED%85%8C+%EB%8F%84%ED%94%8C%EB%9D%BC%EB%B0%8D%EA%B3%A0.PNG', 1),
             (50, 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/trade/%EC%9B%90%ED%94%BC%EC%8A%A4/%ED%9D%B0+%EC%88%98%EC%97%BC+%EC%97%90%EB%93%9C%EC%9B%8C%EB%93%9C+%EB%89%B4%EA%B2%8C%EC%9D%B4%ED%8A%B8.PNG', 1),




-- 2-23. TRADE_BOOKMARKfffffffffffffffffffff
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