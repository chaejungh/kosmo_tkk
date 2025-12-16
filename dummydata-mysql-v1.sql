

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