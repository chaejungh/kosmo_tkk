

USE tkk;

-- 2-1. MEMBER (회원) - 10명
INSERT INTO member (
    login_id, login_pw, nickname, profile_image_url, intro,
    user_level, email, gender, nationality, verify_code, created_at, deleted_yn
) VALUES
      ('kuku011','pw1234!','피규어뉴비','https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/%ED%94%84%EB%A1%9C%ED%95%84/%EB%AF%B8%EC%BF%A0+%ED%94%84%EB%A1%9C%ED%95%84.jfif','가동피규어 입문했어요. 포즈 추천 받습니다!',1,'kuku11@example.com','여자','내국인',NULL,NOW() - INTERVAL 2 DAY,'N'),
      ('kuku012','pw1234!','랜덤뽑기장인','https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/%ED%94%84%EB%A1%9C%ED%95%84/%EC%B5%9C%EC%95%A0%EC%9D%98%EC%95%84%EC%9D%B4.jfif','가챠는 운빨이 아니라 집념이다…',1,'kuku12@example.com','남자','내국인',NULL,NOW() - INTERVAL 5 DAY,'N'),
      ('kuku013','pw1234!','포카수집가','https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/%ED%94%84%EB%A1%9C%ED%95%84/%ED%94%84%EB%A1%9C%ED%95%84-1.jfif','포카 바인더 정리하다가 하루 끝남',1,'kuku13@example.com','여자','내국인',NULL,NOW() - INTERVAL 9 DAY,'N'),
      ('kuku014','pw1234!','전시충','https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/%ED%94%84%EB%A1%9C%ED%95%84/%ED%94%84%EB%A1%9C%ED%95%84-2.jfif','유리장/LED 전시 세팅 정보 공유해요.',1,'kuku14@example.com','남자','내국인',NULL,NOW() - INTERVAL 12 DAY,'N'),
      ('kuku015','pw1234!','홍대출몰러','https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/%ED%94%84%EB%A1%9C%ED%95%84/%ED%94%84%EB%A1%9C%ED%95%84-3.jfif','주말마다 성지 순례합니다. 추천 루트 있나요?',1,'kuku15@example.com','여자','내국인',NULL,NOW() - INTERVAL 15 DAY,'N'),
      ('kuku016','pw1234!','강남팝업러','https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/%ED%94%84%EB%A1%9C%ED%95%84/%ED%9A%8C%EC%83%89+%ED%94%84%EB%A1%9C%ED%95%84.png','팝업스토어 열리면 무조건 출동!',1,'kuku16@example.com','남자','내국인',NULL,NOW() - INTERVAL 18 DAY,'N'),
      ('kuku017','pw1234!','애니정주행','https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/%ED%94%84%EB%A1%9C%ED%95%84/%ED%9A%8C%EC%83%89+%ED%94%84%EB%A1%9C%ED%95%84.png','완결작 정주행이 취미입니다.',1,'kuku17@example.com','여자','내국인',NULL,NOW() - INTERVAL 22 DAY,'N'),
      ('kuku018','pw1234!','굿즈통장파괴','https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/%ED%94%84%EB%A1%9C%ED%95%84/%ED%9A%8C%EC%83%89+%ED%94%84%EB%A1%9C%ED%95%84.png','이번 달도 텅장 확정… 그래도 행복',1,'kuku18@example.com','남자','내국인',NULL,NOW() - INTERVAL 25 DAY,'N'),
      ('kuku019','pw1234!','교환원해요','https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/%ED%94%84%EB%A1%9C%ED%95%84/%ED%9A%8C%EC%83%89+%ED%94%84%EB%A1%9C%ED%95%84.png','포카 교환/양도 매너 좋게 합니다!',1,'kuku19@example.com','여자','외국인',NULL,NOW() - INTERVAL 30 DAY,'N'),
      ('kuku020','pw1234!','한정판사수','https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/%ED%94%84%EB%A1%9C%ED%95%84/%ED%9A%8C%EC%83%89+%ED%94%84%EB%A1%9C%ED%95%84.png','한정판만 보면 심장이 뜁니다.',1,'kuku20@example.com','남자','내국인',NULL,NOW() - INTERVAL 33 DAY,'N'),

      ('kuku021','pw1234!','코스준비중','https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/%ED%94%84%EB%A1%9C%ED%95%84/%ED%9A%8C%EC%83%89+%ED%94%84%EB%A1%9C%ED%95%84.png','코스프레 의상 제작 배우는 중이에요.',1,'kuku21@example.com','여자','내국인',NULL,NOW() - INTERVAL 36 DAY,'N'),
      ('kuku022','pw1234!','렌즈고수','https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/%ED%94%84%EB%A1%9C%ED%95%84/%ED%9A%8C%EC%83%89+%ED%94%84%EB%A1%9C%ED%95%84.png','코스 렌즈/메이크업 팁 공유합니다.',1,'kuku22@example.com','남자','외국인',NULL,NOW() - INTERVAL 40 DAY,'N'),
      ('kuku023','pw1234!','촬영장비병','https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/%ED%94%84%EB%A1%9C%ED%95%84/%ED%9A%8C%EC%83%89+%ED%94%84%EB%A1%9C%ED%95%84.png','조명/렌즈 사다 보니 장비만 늘었음…',1,'kuku23@example.com','여자','내국인',NULL,NOW() - INTERVAL 44 DAY,'N'),
      ('kuku024','pw1234!','다이소개조','https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/%ED%94%84%EB%A1%9C%ED%95%84/%ED%9A%8C%EC%83%89+%ED%94%84%EB%A1%9C%ED%95%84.png','전시 소품은 다이소에서 시작한다!',1,'kuku24@example.com','남자','내국인',NULL,NOW() - INTERVAL 48 DAY,'N'),
      ('kuku025','pw1234!','책장전시러','https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/%ED%94%84%EB%A1%9C%ED%95%84/%ED%9A%8C%EC%83%89+%ED%94%84%EB%A1%9C%ED%95%84.png','책장 전시 감성 좋아요. 먼지 관리가 문제…',1,'kuku25@example.com','여자','내국인',NULL,NOW() - INTERVAL 52 DAY,'N'),
      ('kuku026','pw1234!','스태츄러버','https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/%ED%94%84%EB%A1%9C%ED%95%84/%ED%9A%8C%EC%83%89+%ED%94%84%EB%A1%9C%ED%95%84.png','스태츄는 크기=로망=현실은 공간부족',1,'kuku26@example.com','남자','내국인',NULL,NOW() - INTERVAL 57 DAY,'N'),
      ('kuku027','pw1234!','미니피규어덕','https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/%ED%94%84%EB%A1%9C%ED%95%84/%ED%9A%8C%EC%83%89+%ED%94%84%EB%A1%9C%ED%95%84.png','넨도/미니피규어 위주로 모아요.',1,'kuku27@example.com','여자','외국인',NULL,NOW() - INTERVAL 60 DAY,'N'),
      ('kuku028','pw1234!','박스보관파','https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/%ED%94%84%EB%A1%9C%ED%95%84/%ED%9A%8C%EC%83%89+%ED%94%84%EB%A1%9C%ED%95%84.png','박스 못 버리는 병… 공감하나요',1,'kuku28@example.com','남자','내국인',NULL,NOW() - INTERVAL 63 DAY,'N'),
      ('kuku029','pw1234!','블라인드박스','https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/%ED%94%84%EB%A1%9C%ED%95%84/%ED%9A%8C%EC%83%89+%ED%94%84%EB%A1%9C%ED%95%84.png','블라인드박스 교환 환영!',1,'kuku29@example.com','여자','내국인',NULL,NOW() - INTERVAL 66 DAY,'N'),
      ('kuku030','pw1234!','포스터수집','https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/%ED%94%84%EB%A1%9C%ED%95%84/%ED%9A%8C%EC%83%89+%ED%94%84%EB%A1%9C%ED%95%84.png','특전 포스터 상태 좋게 보관하는 법 찾는 중',1,'kuku30@example.com','남자','외국인',NULL,NOW() - INTERVAL 70 DAY,'N'),

      ('kuku031','pw1234!','애니굿즈여행','https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/%ED%94%84%EB%A1%9C%ED%95%84/%ED%9A%8C%EC%83%89+%ED%94%84%EB%A1%9C%ED%95%84.png','일본 가면 굿즈샵 투어부터 합니다.',1,'kuku31@example.com','여자','내국인',NULL,NOW() - INTERVAL 74 DAY,'N'),
      ('kuku032','pw1234!','굿즈지도러','https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/%ED%94%84%EB%A1%9C%ED%95%84/%ED%9A%8C%EC%83%89+%ED%94%84%EB%A1%9C%ED%95%84.png','좋은 매장 있으면 지도에 저장하는 편',1,'kuku32@example.com','남자','내국인',NULL,NOW() - INTERVAL 77 DAY,'N'),
      ('kuku033','pw1234!','굿즈사진사','https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/%ED%94%84%EB%A1%9C%ED%95%84/%ED%9A%8C%EC%83%89+%ED%94%84%EB%A1%9C%ED%95%84.png','굿즈 사진 찍는 게 취미. 배경지 추천받아요!',1,'kuku33@example.com','여자','내국인',NULL,NOW() - INTERVAL 80 DAY,'N'),
      ('kuku034','pw1234!','아크릴홀릭','https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/%ED%94%84%EB%A1%9C%ED%95%84/%ED%9A%8C%EC%83%89+%ED%94%84%EB%A1%9C%ED%95%84.png','아크릴 스탠드만 보면 일단 장바구니…',1,'kuku34@example.com','남자','내국인',NULL,NOW() - INTERVAL 84 DAY,'N'),
      ('kuku035','pw1234!','스티커덕','https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/%ED%94%84%EB%A1%9C%ED%95%84/%ED%9A%8C%EC%83%89+%ED%94%84%EB%A1%9C%ED%95%84.png','스티커/씰북 모으는 재미가 쏠쏠해요.',1,'kuku35@example.com','여자','외국인',NULL,NOW() - INTERVAL 88 DAY,'N'),
      ('kuku036','pw1234!','뱃지모아','https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/%ED%94%84%EB%A1%9C%ED%95%84/%ED%9A%8C%EC%83%89+%ED%94%84%EB%A1%9C%ED%95%84.png','캔뱃지 교환/나눔 자주 해요.',1,'kuku36@example.com','남자','내국인',NULL,NOW() - INTERVAL 92 DAY,'N'),
      ('kuku037','pw1234!','키링덕후','https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/%ED%94%84%EB%A1%9C%ED%95%84/%ED%9A%8C%EC%83%89+%ED%94%84%EB%A1%9C%ED%95%84.png','가방이 키링으로 가득…',1,'kuku37@example.com','여자','내국인',NULL,NOW() - INTERVAL 96 DAY,'N'),
      ('kuku038','pw1234!','피규어수리공','https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/%ED%94%84%EB%A1%9C%ED%95%84/%ED%9A%8C%EC%83%89+%ED%94%84%EB%A1%9C%ED%95%84.png','관절 헐거움/보수 팁 공유합니다.',1,'kuku38@example.com','남자','외국인',NULL,NOW() - INTERVAL 100 DAY,'N'),
      ('kuku039','pw1234!','전시조명러','https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/%ED%94%84%EB%A1%9C%ED%95%84/%ED%9A%8C%EC%83%89+%ED%94%84%EB%A1%9C%ED%95%84.png','LED 바/간접조명 세팅하는 게 제일 재밌음',1,'kuku39@example.com','여자','내국인',NULL,NOW() - INTERVAL 104 DAY,'N'),
      ('kuku040','pw1234!','굿즈정가파','https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/%ED%94%84%EB%A1%9C%ED%95%84/%ED%9A%8C%EC%83%89+%ED%94%84%EB%A1%9C%ED%95%84.png','정가 구매 지향! 되팔이 싫어요…',1,'kuku40@example.com','남자','내국인',NULL,NOW() - INTERVAL 108 DAY,'N'),

      ('kuku041','pw1234!','코스동료구함','https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/%ED%94%84%EB%A1%9C%ED%95%84/%ED%9A%8C%EC%83%89+%ED%94%84%EB%A1%9C%ED%95%84.png','촬영 같이 갈 코스 동료 구해요!',1,'kuku41@example.com','여자','내국인',NULL,NOW() - INTERVAL 112 DAY,'N'),
      ('kuku042','pw1234!','행사러너','https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/%ED%94%84%EB%A1%9C%ED%95%84/%ED%9A%8C%EC%83%89+%ED%94%84%EB%A1%9C%ED%95%84.png','코믹월드/행사 일정 맞춰 움직입니다.',1,'kuku42@example.com','남자','외국인',NULL,NOW() - INTERVAL 116 DAY,'N'),
      ('kuku043','pw1234!','굿즈리뷰러','https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/%ED%94%84%EB%A1%9C%ED%95%84/%ED%9A%8C%EC%83%89+%ED%94%84%EB%A1%9C%ED%95%84.png','산 굿즈는 꼭 리뷰 남기는 편',1,'kuku43@example.com','여자','내국인',NULL,NOW() - INTERVAL 120 DAY,'N'),
      ('kuku044','pw1234!','앨범특전러','https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/%ED%94%84%EB%A1%9C%ED%95%84/%ED%9A%8C%EC%83%89+%ED%94%84%EB%A1%9C%ED%95%84.png','앨범 특전 포카 모으다 보니 앨범 산더미…',1,'kuku44@example.com','남자','내국인',NULL,NOW() - INTERVAL 124 DAY,'N'),
      ('kuku045','pw1234!','프라조립러','https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/%ED%94%84%EB%A1%9C%ED%95%84/%ED%9A%8C%EC%83%89+%ED%94%84%EB%A1%9C%ED%95%84.png','프라는 조립이 반, 도색이 반…',1,'kuku45@example.com','여자','외국인',NULL,NOW() - INTERVAL 128 DAY,'N'),
      ('kuku046','pw1234!','애니음악파','https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/%ED%94%84%EB%A1%9C%ED%95%84/%ED%9A%8C%EC%83%89+%ED%94%84%EB%A1%9C%ED%95%84.png','OST 들으면서 굿즈 정리하면 개꿀',1,'kuku46@example.com','남자','내국인',NULL,NOW() - INTERVAL 132 DAY,'N'),
      ('kuku047','pw1234!','최애는여러명','https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/%ED%94%84%EB%A1%9C%ED%95%84/%ED%9A%8C%EC%83%89+%ED%94%84%EB%A1%9C%ED%95%84.png','최애 1명만 못 정하는 사람 여기요',1,'kuku47@example.com','여자','내국인',NULL,NOW() - INTERVAL 136 DAY,'N'),
      ('kuku048','pw1234!','굿즈탐험대','https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/%ED%94%84%EB%A1%9C%ED%95%84/%ED%9A%8C%EC%83%89+%ED%94%84%EB%A1%9C%ED%95%84.png','새 매장 발견하면 혼자 뿌듯해짐',1,'kuku48@example.com','남자','외국인',NULL,NOW() - INTERVAL 140 DAY,'N'),
      ('kuku049','pw1234!','피규어촬영러','https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/%ED%94%84%EB%A1%9C%ED%95%84/%ED%9A%8C%EC%83%89+%ED%94%84%EB%A1%9C%ED%95%84.png','액션샷은 각도 싸움… 팁 공유해요',1,'kuku49@example.com','여자','내국인',NULL,NOW() - INTERVAL 144 DAY,'N'),
      ('kuku050','pw1234!','덕질은힐링','https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/%ED%94%84%EB%A1%9C%ED%95%84/%ED%9A%8C%EC%83%89+%ED%94%84%EB%A1%9C%ED%95%84.png','덕질로 스트레스 푸는 중입니다.',1,'kuku50@example.com','남자','내국인',NULL,NOW() - INTERVAL 148 DAY,'N');


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
SET NAMES utf8mb4;
START TRANSACTION;

-- ✅ 여기 값만 바꾸면, 아래 전부 기본 이미지로 한방에 적용됨
SET @DEFAULT_STORE_IMG = 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/store/default.jpg';

INSERT INTO `store`
(`name`, `one_line_desc`, `address`, `region_name`, `latitude`, `longitude`, `avg_rating`, `bookmark_count`, `phone`, `image_url`)
VALUES
    ('피규어프레소 서초점(국전점)','국제전자센터 9층에 위치한 대형 피규어·굿즈샵','서울 서초구 효령로 304 국제전자센터 9층','서초/국전',37.485300,127.016700,4.70,180,'010-9000-0001','https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/store/%EC%8A%A4%ED%86%A0%EC%96%B4+%EC%9D%B4%EB%AF%B8%EC%A7%80/%ED%94%BC%EA%B7%9C%EC%96%B4%ED%94%84%EB%A0%88%EC%86%8C+%EC%84%9C%EC%B4%88%EC%A0%90.PNG'),
    ('피규어프레소 홍대점','홍대 서교동 일대 피규어·굿즈 전문 매장','서울 마포구 잔다리로6길 25 2층','홍대',37.556000,126.923000,4.60,200,'010-9000-0002','https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/store/%EC%8A%A4%ED%86%A0%EC%96%B4+%EC%9D%B4%EB%AF%B8%EC%A7%80/%ED%94%BC%EA%B7%9C%EC%96%B4%ED%94%84%EB%A0%88%EC%86%8C+%ED%99%8D%EB%8C%80%EC%A0%90.PNG'),
    ('피규어프레소 에프피점(FP점)','카페 겸 굿즈샵 컨셉의 홍대 FP점','서울 마포구 와우산로29길 48-11','홍대',37.556500,126.923500,4.50,150,'010-9000-0003','https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/store/%EC%8A%A4%ED%86%A0%EC%96%B4+%EC%9D%B4%EB%AF%B8%EC%A7%80/%ED%94%BC%EA%B7%9C%EC%96%B4%ED%94%84%EB%A0%88%EC%86%8C+%EC%97%90%ED%94%84%ED%94%BC%EC%A0%90.PNG'),
    ('POP MART 코엑스점','코엑스몰 내 라라부·블라인드 피규어 전문 매장','서울 강남구 영동대로 513 코엑스몰','코엑스/삼성',37.511300,127.058800,4.40,220,'010-9000-0004','https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/store/%EC%8A%A4%ED%86%A0%EC%96%B4+%EC%9D%B4%EB%AF%B8%EC%A7%80/POP+MART+%EC%BD%94%EC%97%91%EC%8A%A4%EC%A0%90.PNG'),
    ('토이쩔어스 건대점','토이 스토리·디즈니 피규어 위주 키덜트샵','서울 광진구 아차산로26길 27','건대',37.540000,127.070000,4.30,130,'010-9000-0005','https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/store/%EC%8A%A4%ED%86%A0%EC%96%B4+%EC%9D%B4%EB%AF%B8%EC%A7%80/%ED%86%A0%EC%9D%B4%EC%96%B4%EC%A9%94%EC%8A%A4+%EA%B1%B4%EB%8C%80%EC%A0%90.PNG'),
    ('조아하비 신도림점','프라모델·RC·건담 전문 대형 키덜트샵','서울 구로구 새말로 97','신도림',37.509000,126.889000,4.60,260,'010-9000-0006','https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/store/%EC%8A%A4%ED%86%A0%EC%96%B4+%EC%9D%B4%EB%AF%B8%EC%A7%80/%EC%A1%B0%EC%95%84%ED%95%98%EB%B9%84+%EA%B1%B4%EB%8C%80%EC%A0%90.PNG'),
    ('킨키로봇 한남점','디자이너 토이와 아트토이 중심 편집 굿즈샵','서울 용산구 이태원로54길 16-3','한남',37.539000,127.000000,4.50,190,'010-9000-0007','https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/store/%EC%8A%A4%ED%86%A0%EC%96%B4+%EC%9D%B4%EB%AF%B8%EC%A7%80/%ED%82%A8%ED%82%A4%EB%A1%9C%EB%B4%87+%ED%95%9C%EB%82%A8%EC%A0%90.PNG'),
    ('핑크버스 홍대점','디즈니·산리오 등 캐릭터 소품 위주 굿즈샵','서울 마포구 와우산로27길 31','홍대',37.556500,126.924000,4.20,140,'010-9000-0008','https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/store/%EC%8A%A4%ED%86%A0%EC%96%B4+%EC%9D%B4%EB%AF%B8%EC%A7%80/%ED%95%91%ED%81%AC%EB%B2%84%EC%8A%A4+%ED%99%8D%EB%8C%80%EC%A0%90.PNG'),
    ('장난감놀이터 신림점','레트로 장난감·피규어·RC 등 키덜트 소품샵','서울 관악구 남부순환로172길 7','신림',37.482000,126.929000,4.30,135,'010-9000-0009','https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/store/%EC%8A%A4%ED%86%A0%EC%96%B4+%EC%9D%B4%EB%AF%B8%EC%A7%80/%EC%9E%A5%EB%82%9C%EA%B0%90%EB%86%80%EC%9D%B4%ED%84%B0+%EC%8B%A0%EB%A6%BC%EC%A0%90.PNG'),
    ('애니플러스 합정점','애니메이션 공식 굿즈·피규어 중심 매장','서울 마포구 월드컵로3길 14','합정',37.550000,126.914000,4.50,210,'010-9000-0010','https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/store/%EC%8A%A4%ED%86%A0%EC%96%B4+%EC%9D%B4%EB%AF%B8%EC%A7%80/%EC%95%A0%EB%8B%88%ED%94%8C%EB%9F%AC%EC%8A%A4+%ED%95%A9%EC%A0%95%EC%A0%90.PNG'),
    ('애니통 신림점','코믹북·건프라·제일복권 등 종합 키덜트샵','서울 관악구 남부순환로 1568','신림',37.482500,126.929500,4.30,160,'010-9000-0011','https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/store/%EC%8A%A4%ED%86%A0%EC%96%B4+%EC%9D%B4%EB%AF%B8%EC%A7%80/%EC%95%A0%EB%8B%88%ED%86%B5+%EC%8B%A0%EB%A6%BC%EC%A0%90.PNG'),
    ('POP MART 홍대점','홍대 거리 인근 블라인드 피규어 전문 매장','서울 마포구 와우산로23길 56','홍대',37.556700,126.923500,4.40,230,'010-9000-0012','https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/store/%EC%8A%A4%ED%86%A0%EC%96%B4+%EC%9D%B4%EB%AF%B8%EC%A7%80/POP+MART+%ED%99%8D%EB%8C%80%EC%A0%90.PNG'),
    ('POP MART 명동점','명동 메인 스트리트에 위치한 팝마트 매장','서울 중구 명동8길 36','명동',37.563500,126.985500,4.20,170,'010-9000-0013','https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/store/%EC%8A%A4%ED%86%A0%EC%96%B4+%EC%9D%B4%EB%AF%B8%EC%A7%80/POP+MART+%EB%AA%85%EB%8F%99%EC%A0%90.PNG'),
    ('POP MART 용산 아이파크몰점','용산 아이파크몰 내 팝마트 오프라인 매장','서울 용산구 한강대로23길 55 HDC아이파크몰','용산',37.529900,126.964500,4.30,185,'010-9000-0014','https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/store/%EC%8A%A4%ED%86%A0%EC%96%B4+%EC%9D%B4%EB%AF%B8%EC%A7%80/POP+MART+%EC%9A%A9%EC%82%B0+%EC%95%84%EC%9D%B4%ED%8C%8C%ED%81%AC%EB%AA%B0%EC%A0%90.PNG'),
    ('POP MART 수원점','수원역 인근 쇼핑몰 내 팝마트 매장','경기 수원시 팔달구 덕영대로 일대','수원',37.265000,127.000000,4.10,120,'010-9000-0015','https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/store/%EC%8A%A4%ED%86%A0%EC%96%B4+%EC%9D%B4%EB%AF%B8%EC%A7%80/POP+MART+%EC%88%98%EC%9B%90%EC%A0%90.PNG'),
    ('EGO SHOWROOM 1호점','애니·캐릭터 굿즈 중심의 성수 쇼룸 1호점','서울 성동구 연무장3길 10 1층','성수',37.544000,127.055000,4.30,110,'010-9000-0016',@DEFAULT_STORE_IMG),
    ('EGO SHOWROOM 2호점','EGO 굿즈 추가 전시·판매 공간인 2호점','서울 성동구 연무장3길 9-8 2층','성수',37.544200,127.055200,4.20,95,'010-9000-0017',@DEFAULT_STORE_IMG),
    ('헬로수미코 홍대점','산리오·일본 캐릭터 굿즈 중심 소규모 샵','서울 마포구 월드컵북로1길 26-13 1층','홍대',37.557800,126.921800,4.20,90,'010-9000-0018','https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/store/%EC%8A%A4%ED%86%A0%EC%96%B4+%EC%9D%B4%EB%AF%B8%EC%A7%80/%ED%97%AC%EB%A1%9C%EC%88%98%EB%AF%B8%EC%BD%94+%ED%99%8D%EB%8C%80%EC%A0%90.PNG'),
    ('가챠오션 홍대점','일본식 캡슐토이(가챠) 위주 키덜트샵','서울 마포구 동교로38길 29 1.5층','홍대',37.557000,126.923500,4.10,80,'010-9000-0019','https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/store/%EC%8A%A4%ED%86%A0%EC%96%B4+%EC%9D%B4%EB%AF%B8%EC%A7%80/%EA%B0%80%EC%B1%A0%EC%98%A4%EC%85%98+%ED%99%8D%EB%8C%80%EC%A0%90.PNG'),
    ('츄플레이 홍대점','랜덤 피규어·가챠·굿즈를 모아놓은 홍대 샵','서울 마포구 월드컵북로2길 93 301호','홍대',37.557500,126.922500,4.00,75,'010-9000-0020','https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/store/%EC%8A%A4%ED%86%A0%EC%96%B4+%EC%9D%B4%EB%AF%B8%EC%A7%80/%EC%B8%84%ED%94%8C%EB%A0%88%EC%9D%B4+%ED%99%8D%EB%8C%80%EC%A0%90.PNG'),
    ('덕쿠 홍대점','홍대 랜덤박스·가챠·피규어 전문 굿즈샵','서울 마포구 홍익로6길 38 지하1층','홍대',37.555800,126.924200,4.60,190,'0507-1310-8869',@DEFAULT_STORE_IMG),
    ('제이에스스토어 홍대점','경품 뽑기와 피규어를 함께 즐기는 홍대 경품샵','서울 마포구 와우산로29길 48-24 1층','홍대',37.556200,126.924000,4.40,150,'02-337-3338','https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/store/%EC%8A%A4%ED%86%A0%EC%96%B4+%EC%9D%B4%EB%AF%B8%EC%A7%80/%EC%A0%9C%EC%9D%B4%EC%97%90%EC%8A%A4%EC%8A%A4%ED%86%A0%EC%96%B4+%ED%99%8D%EB%8C%80%EC%A0%90.PNG'),
    ('브라더굿즈 홍대점','일본 애니 굿즈와 가챠 캡슐토이 전문샵','서울 마포구 신촌로6길 24 2층','홍대',37.556800,126.925000,4.50,170,'070-8657-2105','https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/store/%EC%8A%A4%ED%86%A0%EC%96%B4+%EC%9D%B4%EB%AF%B8%EC%A7%80/%EB%B8%8C%EB%9D%BC%EB%8D%94%EA%B5%BF%EC%A6%88+%ED%99%8D%EB%8C%80%EC%A0%90.PNG'),
    ('레인몰 홍대점','아이돌·애니 굿즈와 트레이딩 카드 취급 굿즈샵','서울 마포구 독막로 67-1 3층','홍대',37.553800,126.921500,4.30,120,'010-2691-3912','https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/store/%EC%8A%A4%ED%86%A0%EC%96%B4+%EC%9D%B4%EB%AF%B8%EC%A7%80/%EB%A0%88%EC%9D%B8%EB%AA%B0+%ED%99%8D%EB%8C%80%EC%A0%90.PNG'),
    ('애니메이트 홍대점','일본 애니 공식 굿즈·서적·피규어 대형 매장','서울 마포구 동교동 192-45 AK& 홍대 5층','홍대',37.557000,126.924500,4.70,250,'02-3144-7357','https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/store/%EC%8A%A4%ED%86%A0%EC%96%B4+%EC%9D%B4%EB%AF%B8%EC%A7%80/%EC%97%90%EB%8B%88%EB%A9%94%EC%9D%B4%ED%8A%B8+%ED%99%8D%EB%8C%80%EC%A0%90.PNG'),
    ('피규어프렌즈 홍대점','피규어·프라모델 중심 중고·신품 굿즈샵','서울 마포구 양화로18안길 8 지층','홍대',37.556000,126.922800,4.50,160,'010-8223-7922','https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/store/%EC%8A%A4%ED%86%A0%EC%96%B4+%EC%9D%B4%EB%AF%B8%EC%A7%80/%ED%94%BC%EA%B7%9C%EC%96%B4%ED%94%84%EB%A0%8C%EC%A6%88+%ED%99%8D%EB%8C%80%EC%A0%90.PNG'),
    ('애니세카이 홍대점','애니메이션 캐릭터 굿즈와 피규어 전문 매장','서울 마포구 동교동 170-38 2층','홍대',37.556900,126.923300,4.40,140,'0507-1367-2048','https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/store/%EC%8A%A4%ED%86%A0%EC%96%B4+%EC%9D%B4%EB%AF%B8%EC%A7%80/%EC%95%A0%EB%8B%88%EC%84%B8%EC%B9%B4%EC%9D%B4+%ED%99%8D%EB%8C%80%EC%A0%90.PNG'),
    ('모와즐 홍대점','서브컬처 의류와 굿즈를 모아놓은 편집샵','서울 마포구 양화로18안길 12 지층','홍대',37.555900,126.923000,4.20,110,'0507-1361-3402','https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/store/%EC%8A%A4%ED%86%A0%EC%96%B4+%EC%9D%B4%EB%AF%B8%EC%A7%80/%EB%AA%A8%EC%99%80%EC%A6%90+%ED%99%8D%EB%8C%80%EC%A0%90.PNG'),
    ('CIH+SHOP 홍대점','일본 케이북스와 함께하는 중고 애니 굿즈샵','서울 마포구 동교동 159-5 케이스퀘어','홍대',37.555200,126.922000,4.30,130,'02-6081-2555','https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/store/%EC%8A%A4%ED%86%A0%EC%96%B4+%EC%9D%B4%EB%AF%B8%EC%A7%80/CIH%2BSHOP+%ED%99%8D%EB%8C%80%EC%A0%90.PNG'),
    ('유포테이블 카페 홍대점','귀멸의 칼날 등 콜라보 굿즈 판매 카페','서울 마포구 와우산로23길 9 칼리오페 2층','홍대',37.554000,126.921800,4.10,90,'02-6406-3321','https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/store/%EC%8A%A4%ED%86%A0%EC%96%B4+%EC%9D%B4%EB%AF%B8%EC%A7%80/%EC%9C%A0%ED%8F%AC%ED%85%8C%EC%9D%B4%EB%B8%94+%EC%B9%B4%ED%8E%98+%ED%99%8D%EB%8C%80%EC%A0%90.PNG'),
    ('POP MART 스타필드 안성점','스타필드 안성 내 블라인드 피규어 전문 팝마트','경기 안성시 공도읍 서동대로 3930-39 스타필드 안성','경기/안성',36.997800,127.202500,4.20,100,'031-8092-1658',@DEFAULT_STORE_IMG),
    ('토이킹덤 스타필드 안성점','스타필드 안성 2층 완구·피규어 대형 토이샵','경기 안성시 공도읍 서동대로 3930-39 스타필드 안성 2층 토이킹덤','경기/안성',36.997900,127.202600,4.30,95,'031-8092-1715',@DEFAULT_STORE_IMG),
    ('피규어뮤지엄W 청담점','피규어·토이 전시와 판매를 겸한 피규어 전문 뮤지엄','서울 강남구 선릉로158길 3','청담/강남',37.5257998,127.0403869,4.50,190,'070-7404-2240',@DEFAULT_STORE_IMG),
    ('제이굿즈 수원점','수원역 인근 애니메이션·아이돌 굿즈 전문샵','경기 수원시 팔달구 매산로2가 27-62 헌욱빌딩 2층','수원역',37.2689432,127.0036858,4.40,130,'031-246-4249',@DEFAULT_STORE_IMG),
    ('조이하비 신도림 테크노마트점','건프라·RC·피규어 중심 대형 하비샵','서울 구로구 새말로 97 신도림테크노마트 3층','신도림/테크노마트',37.5063209,126.8903608,4.60,250,'02-2111-5212',@DEFAULT_STORE_IMG),
    ('카카오프렌즈 홍대 플래그십 스토어','홍대입구역 앞 카카오 캐릭터 공식 굿즈샵','서울 마포구 양화로 162 카카오프렌즈 홍대점','홍대',37.556900,126.923500,4.80,320,'02-6010-0104',@DEFAULT_STORE_IMG),
    ('카카오프렌즈 스타필드 코엑스몰점','코엑스몰 지하에 위치한 카카오프렌즈 공식 매장','서울 강남구 영동대로 513 스타필드 코엑스몰 B1층','코엑스/삼성',37.512500,127.058000,4.60,280,'02-6002-1880',@DEFAULT_STORE_IMG),
    ('카카오프렌즈 잠실 롯데월드몰점','롯데월드몰 내 카카오프렌즈·라이언 굿즈 전문샵','서울 송파구 올림픽로 300 롯데월드몰 5층','잠실',37.511000,127.098000,4.70,300,'02-3213-4514',@DEFAULT_STORE_IMG),
    ('카카오프렌즈 영등포 타임스퀘어점','타임스퀘어 1층 캐릭터·문구·인형 굿즈샵','서울 영등포구 영중로 15 타임스퀘어 1층','영등포/타임스퀘어',37.517200,126.903000,4.50,220,'02-2638-2750',@DEFAULT_STORE_IMG),
    ('카카오프렌즈 DDP 동대문점','DDP 지하에 위치한 카카오프렌즈 공식 스토어','서울 중구 을지로 281 동대문디자인플라자 B2층','동대문/DDP',37.566000,127.009500,4.40,190,'02-2231-3552',@DEFAULT_STORE_IMG),
    ('카카오프렌즈 롯데월드타워 면세점','롯데월드타워 내 면세점 카카오프렌즈 숍','서울 송파구 올림픽로 300 롯데월드타워 8층 롯데면세점','잠실',37.513000,127.102000,4.30,160,'02-3213-6743',@DEFAULT_STORE_IMG),
    ('라인프렌즈 스퀘어 명동','브라운·코니·BT21 등 라인프렌즈 플래그십 스토어','서울 중구 명동길 43 라인프렌즈 스퀘어 명동','명동',37.564700,126.985000,4.70,310,'070-4060-3534',@DEFAULT_STORE_IMG),
    ('라인프렌즈 롯데영플라자 명동점','롯데영플라자 내 라인프렌즈 캐릭터 굿즈샵','서울 중구 남대문로 67 롯데영플라자 1층','명동',37.563300,126.981900,4.50,230,'02-318-7942',@DEFAULT_STORE_IMG),
    ('리락쿠마 스미코구라시 플러스 홍대점','AK플라자 3층 SAN-X 공식 리락쿠마·스미코 상설샵','서울 마포구 양화로 188 AK플라자 홍대점 3층','홍대',37.557300,126.923000,4.60,260,'02-789-9800',@DEFAULT_STORE_IMG),
    ('위드뮤 AK플라자 홍대점','K-POP 앨범·아이돌 굿즈 중심 편집샵','서울 마포구 양화로 188 AK플라자 홍대점 내 위드뮤 매장','홍대',37.557400,126.923200,4.50,210,'0507-1343-0429',@DEFAULT_STORE_IMG),
    ('도토리숲 롯데월드몰점','지브리 스튜디오 공식 토토로·키키 캐릭터 샵','서울 송파구 올림픽로 300 쇼핑몰 캐주얼동 지하1층 도토리숲','잠실',37.511200,127.098200,4.60,240,'02-3213-4747',@DEFAULT_STORE_IMG),
    ('애니메이트 잠실 롯데점','애니메이션·만화 공식 굿즈·피규어 전문점','서울 송파구 올림픽로 240 롯데월드 쇼핑몰동 B1층 애니메이트','잠실',37.511400,127.098500,4.70,280,'02-2143-1571',@DEFAULT_STORE_IMG),
    ('팝퍼블 용산 아이파크몰점','원피스·짱구 등 콜라보 팝업·굿즈 카페','서울 용산구 한강대로23길 55 용산역 아이파크몰 6층 팝콘D스퀘어','용산',37.529900,126.964400,4.50,220,'02-6373-3360',@DEFAULT_STORE_IMG),
    ('얌꽁굿즈 병점점','병점 롯데시네마 내 캔뱃지·스티커 위주 굿즈샵','경기 화성시 병점로 31 롯데시네마 병점점 2층 얌꽁굿즈','경기/화성',37.206700,127.032500,4.30,120,'031-000-1111',@DEFAULT_STORE_IMG),
    ('꼼지락 하비샵 & 게임몬스터','프라모델·보드게임·피규어를 함께 파는 하비샵','경기 고양시 덕양구 백양로 84 1층 꼼지락 하비샵 & 게임몬스터','경기/고양',37.632500,126.832000,4.40,140,'0507-1313-3146',@DEFAULT_STORE_IMG),
    ('피규어플렉스 부천시청역점','부천시청역 인근 피규어·가챠·굿즈 전문샵','경기 부천시 석천로177번길 28 2층 피규어플렉스 부천시청역점','경기/부천',37.503500,126.766000,4.40,150,'0507-1367-9530',@DEFAULT_STORE_IMG),
    ('타미야 플라모델 팩토리 양재점','RC카·프라모델 전문 타미야 직영 본점','서울 서초구 바우뫼로 215 타미야빌딩 1층','서초/양재',37.480900,127.041700,4.60,140,'02-2135-3113',@DEFAULT_STORE_IMG),
    ('타미야 플라모델 팩토리 용산 아이파크몰점','아이파크몰 내 대형 프라모델·미니카 전문점','서울 용산구 한강대로23길 55 아이파크몰 리빙파크 6층','용산',37.528907,126.964635,4.50,170,'02-2012-0877',@DEFAULT_STORE_IMG),
    ('타미야 플라모델 팩토리 스타필드 하남점','스타필드 하남에 위치한 타미야 공식 매장','경기 하남시 미사대로 750 스타필드 하남 3층','경기/하남',37.545489,127.224333,4.40,120,'031-8072-8446',@DEFAULT_STORE_IMG),
    ('타미야 플라모델 팩토리 수원 AK플라자점','수원역 AK플라자 내 프라모델 전문샵','경기 수원시 팔달구 덕영대로 924 AK플라자 수원 4층','수원',37.266101,127.000686,4.40,115,'031-240-1953',@DEFAULT_STORE_IMG),
    ('마블 컬렉션 스토어 한양대점','마블·디즈니 캐릭터 굿즈 전문 편집숍','서울 성동구 왕십리로 241 파크에비뉴 엔터식스 한양대점 1층','성동/왕십리',37.557148,127.040146,4.30,95,'02-6454-6130',@DEFAULT_STORE_IMG),
    ('국제전자센터 피규어·가챠존','남부터미널역 인근 피규어·가챠·쿠지 집결지','서울 서초구 효령로 304 국제전자센터 8~9층 일대','서초/국전',37.485300,127.016700,4.70,260,'02-3465-0114',@DEFAULT_STORE_IMG),
    ('신도림 테크노마트 가챠·피규어존','신도림역 직통 키덜트 가챠·쿠지·피규어 존','서울 구로구 구로동 3-25 신도림테크노마트 8~9층','신도림',37.508700,126.890100,4.50,210,'02-2111-1889',@DEFAULT_STORE_IMG),
    ('루나러브굿 나루 공작소','홍대 인근 레트로 피규어·장난감 공방형 샵','서울 마포구 서교동 일대','홍대',37.552000,126.919000,4.20,80,'02-6082-3300',@DEFAULT_STORE_IMG),
    ('애니굿즈 키라키라토모 수원본점','수원역 인근 애니·아이돌 굿즈 전문샵','경기 수원시 팔달구 향교로 4 3층','수원',37.266500,127.000000,4.60,150,'050-6805-2148',@DEFAULT_STORE_IMG),
    ('챌린저 롯데백화점 평촌점','스트리트 브랜드·콜라보 굿즈 팝업 매장','경기 안양시 동안구 시민대로 180 롯데백화점 평촌 6층','안양/평촌',37.390001,126.950349,4.10,70,'010-3713-3215',@DEFAULT_STORE_IMG),
    ('챌린저 신세계 여주 프리미엄 빌리지점','여주 아울렛 내 스트리트 굿즈·의류 매장','경기 여주시 명품로 316-10 1-2호','여주',37.243136,127.617162,4.00,60,'031-883-1072',@DEFAULT_STORE_IMG),
    ('챌린저 현대프리미엄아울렛 김포점','김포 아울렛 2층 스트리트 패션·굿즈 팝업','경기 김포시 고촌읍 아라육로152번길 100 현대프리미엄아울렛 WEST 2층','김포',37.597228,126.785221,4.10,65,'031-8048-2367',@DEFAULT_STORE_IMG),
    ('챌린저 현대시티몰 가든파이브점','가든파이브 내 라이프스타일·스트리트 굿즈샵','서울 송파구 충민로 66 현대시티아울렛 가든파이브 4층','송파/가든파이브',37.477858,127.124712,4.00,55,'02-2673-2456',@DEFAULT_STORE_IMG),
    ('챌린저 스타필드 하남점','스타필드 하남 2층 스트리트 브랜드 팝업스토어','경기 하남시 미사대로 750 스타필드 하남 2층','경기/하남',37.545489,127.224333,4.20,90,'031-8072-8643',@DEFAULT_STORE_IMG),
    ('브라더굿즈 강남점','신논현·강남역 사이 가챠·캐릭터 굿즈 전문샵','서울 강남구 강남대로102길 13 골든포레 지하 1층','강남/신논현',37.501479,127.026967,0.00,0,'070-8657-2790',@DEFAULT_STORE_IMG),
    ('피규어뮤지엄W','청담동에 위치한 피규어 전시·판매 전문 박물관','서울 강남구 선릉로158길 3','청담/강남',37.5257998,127.040352,4.80,320,'미등록',@DEFAULT_STORE_IMG),
    ('POP MART 코엑스몰점','스타필드 코엑스몰 내 블라인드 피규어 전문 매장','서울 강남구 영동대로 513 코엑스몰 B1층','코엑스/삼성',37.51148310935,127.06033711446,4.60,280,'미등록',@DEFAULT_STORE_IMG),
    ('POP MART 용산 아이파크몰점','용산역 아이파크몰 내 팝마트 오프라인 매장','서울 용산구 한강대로23길 55 아이파크몰','용산',37.52890681,126.9646345,4.50,240,'미등록',@DEFAULT_STORE_IMG),
    ('POP MART 수원 AK플라자점','수원역 AK플라자 내 블라인드 피규어·굿즈 매장','경기 수원시 팔달구 덕영대로 924 AK플라자 수원점','수원',37.266124,127.000158,4.40,190,'미등록',@DEFAULT_STORE_IMG),
    ('POP MART 스타필드 안성점','스타필드 안성 내 팝마트 블라인드 피규어샵','경기 안성시 공도읍 서동대로 3930-39 스타필드 안성','안성',36.9946845979,127.1472661744,4.30,160,'미등록',@DEFAULT_STORE_IMG),
    ('POP MART 홍대 플래그십 스토어','홍대 걷고싶은거리 인근 대형 플래그십 굿즈 매장','서울 마포구 와우산로23길 56','홍대',37.555249646612,126.92371442151,4.50,260,'미등록',@DEFAULT_STORE_IMG),
    ('애니플러스 합정점','TV 애니메이션 공식 굿즈·피규어 전문샵','서울 마포구 월드컵로3길 14','합정',37.550494907182,126.91193741226,4.60,210,'미등록',@DEFAULT_STORE_IMG),
    ('브라더굿즈 강남점','역삼역 인근 애니·게임 캐릭터 굿즈 편집샵','서울 강남구 강남대로102길 13 B1층','강남',37.501967358069,127.02683991652,4.70,220,'미등록',@DEFAULT_STORE_IMG),
    ('더쿠 수원점','수원역 인근 애니·게임 굿즈·가챠 전문샵','경기 수원시 팔달구 향교로3번길 17 2층','수원',37.268309157635,127.00144533428,4.50,180,'미등록',@DEFAULT_STORE_IMG),
    ('조이하비 신도림점','신도림 테크노마트 내 프라모델·RC·건담 대형 매장','서울 구로구 새말로 97 신도림테크노마트 3층','신도림',37.5073194,126.8901556,4.60,250,'미등록',@DEFAULT_STORE_IMG),
    ('포켓몬 팝업스토어 롯데월드몰점','잠실 롯데월드몰 아트리움 일대 포켓몬 공식 팝업스토어','서울 송파구 올림픽로 300 롯데월드몰 1층 아트리움','잠실/롯데월드몰',37.513100,127.103400,4.60,240,'미등록',@DEFAULT_STORE_IMG),
    ('카카오프렌즈 롯데월드몰점','카카오프렌즈 캐릭터 중심 공식 굿즈샵','서울 송파구 올림픽로 300 롯데월드몰 5층','잠실/롯데월드몰',37.513100,127.103400,4.50,210,'미등록',@DEFAULT_STORE_IMG),
    ('라인프렌즈 럭키하우스 롯데월드몰점','브라운·코니·BT21 등 라인프렌즈 팝업형 굿즈샵','서울 송파구 올림픽로 300 롯데월드몰 1층','잠실/롯데월드몰',37.513100,127.103400,4.40,190,'미등록',@DEFAULT_STORE_IMG),
    ('타미야 팩토리 롯데월드몰점','프라모델·미니카 등 타미야 제품 전문 매장','서울 송파구 올림픽로 300 롯데월드몰 지하1층','잠실/롯데월드몰',37.513100,127.103400,4.50,160,'미등록',@DEFAULT_STORE_IMG),
    ('레고스토어 롯데월드몰점','공식 레고 스토어, 다양한 시리즈와 피규어 판매','서울 송파구 올림픽로 300 롯데월드몰 지하1층','잠실/롯데월드몰',37.513100,127.103400,4.70,280,'미등록',@DEFAULT_STORE_IMG),
    ('건담베이스 스타필드 코엑스몰점','반다이 건담 프라모델 전문 매장','서울 강남구 영동대로 513 스타필드 코엑스몰 지하2층','코엑스/삼성',37.511483,127.060337,4.70,260,'미등록',@DEFAULT_STORE_IMG),
    ('레고스토어 코엑스점','공식 레고 스토어 코엑스 플래그십 매장','서울 강남구 영동대로 513 스타필드 코엑스몰 지하1층','코엑스/삼성',37.511483,127.060337,4.60,230,'미등록',@DEFAULT_STORE_IMG),
    ('나비타월드 스타필드 코엑스몰점','피규어·프라모델·보드게임 편집 키덜트샵','서울 강남구 영동대로 513 스타필드 코엑스몰 지하1층','코엑스/삼성',37.511483,127.060337,4.40,150,'미등록',@DEFAULT_STORE_IMG),
    ('라인프렌즈 스토어 타임스퀘어점','라인프렌즈·BT21 캐릭터 공식 굿즈샵','서울 영등포구 영중로 15 타임스퀘어 지하2층 원더플레이스 내','영등포/타임스퀘어',37.517834,126.905382,4.50,200,'미등록',@DEFAULT_STORE_IMG),
    ('토이킹덤 타임스퀘어 영등포점','대형 장난감·보드게임·피규어 전문 매장','서울 영등포구 영중로 15 타임스퀘어 지하1층','영등포/타임스퀘어',37.517834,126.905382,4.40,180,'미등록',@DEFAULT_STORE_IMG),
    ('반다이 펀스퀘어 타임스퀘어점','반다이 피규어·프라모델·가챠 전문 편집샵','서울 영등포구 영중로 15 타임스퀘어 4층 펀스퀘어','영등포/타임스퀘어',37.517834,126.905382,4.30,160,'미등록',@DEFAULT_STORE_IMG),
    ('토이킹덤 스타필드 고양점','대형 완구·피규어·보드게임 전문 장난감 왕국','경기 고양시 덕양구 고양대로 1955 스타필드 고양 3층 토이킹덤','고양/스타필드고양',37.647056,126.896011,4.50,190,'미등록',@DEFAULT_STORE_IMG),
    ('레고스토어 스타필드 고양점','공식 레고 스토어, 전시·체험 가능한 매장','경기 고양시 덕양구 고양대로 1955 스타필드 고양 3층 레고스토어','고양/스타필드고양',37.647056,126.896011,4.60,210,'미등록',@DEFAULT_STORE_IMG),
    ('마이크로킥보드 스타필드 고양점','킥보드·키즈 모빌리티 중심 라이프스타일 굿즈샵','경기 고양시 덕양구 고양대로 1955 스타필드 고양 3층 마이크로킥보드','고양/스타필드고양',37.647056,126.896011,4.20,120,'미등록',@DEFAULT_STORE_IMG),
    ('토이킹덤 스타필드 하남점','대형 토이·피규어·보드게임 전문 매장','경기 하남시 미사대로 750 스타필드 하남 3층 토이킹덤','하남/스타필드하남',37.545490,127.224330,4.50,210,'미등록',@DEFAULT_STORE_IMG),
    ('레고스토어 스타필드 하남점','국내 최대 규모 레고 공식 스토어','경기 하남시 미사대로 750 스타필드 하남 3층 레고스토어','하남/스타필드하남',37.545490,127.224330,4.70,260,'미등록',@DEFAULT_STORE_IMG),
    ('브루클린웍스 스타필드 하남점','캠핑·아웃도어 감성 굿즈 전문 편집샵','경기 하남시 미사대로 750 스타필드 하남 2층 브루클린웍스','하남/스타필드하남',37.545490,127.224330,4.30,130,'미등록',@DEFAULT_STORE_IMG),
    ('자라홈 스타필드 하남점','캐릭터·디자인 소품 포함 라이프스타일 홈굿즈샵','경기 하남시 미사대로 750 스타필드 하남 1층 자라홈','하남/스타필드하남',37.545490,127.224330,4.20,140,'미등록',@DEFAULT_STORE_IMG),
    ('레고스토어 현대백화점 판교점','현대백화점 판교점 내 레고 공식 스토어','경기 성남시 분당구 판교역로 146 현대백화점 판교점 지하1층','성남/판교',37.392739,127.112094,4.60,220,'미등록',@DEFAULT_STORE_IMG),
    ('닌텐도 스토어 현대백화점 판교점','닌텐도 콘솔·게임·피규어 굿즈 전문 매장','경기 성남시 분당구 판교역로 146 현대백화점 판교점','성남/판교',37.392739,127.112094,4.50,180,'미등록',@DEFAULT_STORE_IMG),
    ('건담베이스 롯데 영플라자 본점','명동 롯데영플라자 지하1층 반다이 프라모델 전문샵','서울 중구 남대문로 67 롯데영플라자 지하1층 건담베이스','명동/영플라자',37.563630,126.982010,4.70,270,'미등록',@DEFAULT_STORE_IMG),
    ('라인프렌즈 스토어 롯데 영플라자 명동점','라인프렌즈 캐릭터 인형·문구·패션 굿즈샵','서울 중구 남대문로 67 롯데영플라자 1층 라인프렌즈 스토어','명동/영플라자',37.563630,126.982010,4.60,230,'미등록',@DEFAULT_STORE_IMG),
    ('라인프렌즈 월드 팝업스토어 롯데 영플라자점','BT21·미니니 등 IPX 캐릭터 종합 팝업스토어','서울 중구 남대문로 67 롯데영플라자 1층 라인프렌즈 월드 팝업','명동/영플라자',37.563630,126.982010,4.50,190,'미등록',@DEFAULT_STORE_IMG),
    ('모노폴리 롯데 영플라자 명동점','BT21·라인프렌즈 등 라이선스 캐릭터 편집 굿즈샵','서울 중구 남대문로 67 롯데영플라자 지하1층 모노폴리 매장','명동/영플라자',37.563630,126.982010,4.40,160,'미등록',@DEFAULT_STORE_IMG)
;

COMMIT;


-- 2-4. STORE_BOOKMARK (매장 북마크)
INSERT INTO store_bookmark ( member_id, store_id, created_at) VALUES
                                                                                    ( 1, 1, NOW()),
                                                                                    ( 1, 2, NOW()),
                                                                                    ( 2, 1, NOW()),
                                                                                    ( 3, 3, NOW()),
                                                                                    ( 4, 4, NOW()),
                                                                                    ( 5, 1, NOW()),
                                                                                    ( 6, 5, NOW()),
                                                                                    ( 7, 2, NOW()),
                                                                                    ( 8, 6, NOW()),
                                                                                    (9, 1, NOW());

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
INSERT INTO search_log ( member_id, keyword, target_type, target_id, created_at) VALUES
                                                                                               ( 1, '홍대 굿즈샵', 'STORE', 1, NOW()),
                                                                                               ( 2, '피규어', 'GOODS', 3, NOW()),
                                                                                               ( 3, '주술회전', NULL, NULL, NOW()),
                                                                                               ( 4, '블루록 포카', 'GOODS', 1, NOW()),
                                                                                               ( 5, '팝업스토어', NULL, NULL, NOW()),
                                                                                               ( 6, '귀멸의 칼날 굿즈', 'STORE', 2, NOW()),
                                                                                               ( 7, '체인소맨', NULL, NULL, NOW()),
                                                                                               ( 8, '코스프레 소품', NULL, NULL, NOW()),
                                                                                               ( 9, '서울 굿즈샵', 'STORE', 2, NOW()),
                                                                                               (10,'부산 애니샵', 'STORE', 3, NOW());

-- 2-7. RECOMMENDED_SEARCH (추천 검색어)
INSERT INTO recommended_search ( keyword, target_type, sort_order, active_yn) VALUES
                                                                                         ( '홍대 팝업', 'STORE', 1, 'Y'),
                                                                                         ( '강남 피규어', 'STORE', 2, 'Y'),
                                                                                         ( '주술회전 굿즈', 'GOODS', 3, 'Y'),
                                                                                         ( '블루록 포카', 'GOODS', 4, 'Y'),
                                                                                         ( '귀멸의 칼날 피규어', 'GOODS', 5, 'Y'),
                                                                                         ( '서울 굿즈 성지', 'STORE', 6, 'Y'),
                                                                                         ( '코스프레 용품', 'STORE', 7, 'Y'),
                                                                                         ( '랜덤박스', 'GOODS', 8, 'Y'),
                                                                                         ( '애니션 팝업', 'STORE', 9, 'Y'),
                                                                                         ('덕질 여행', 'STORE', 10, 'Y');

-- 2-8. POPUP_STORE (팝업스토어) - 5개
INSERT INTO popup_store (
     title, place_name, address, region_name,
    latitude, longitude, start_date, end_date,
    banner_image_url, description, created_at, deleted_yn
) VALUES
      ( '주술회전 팝업스토어', '더쿠쿠 팝업존', '서울 마포구 어딘가 123', '홍대',
       37.55750000, 126.92400000, '2025-12-01', '2025-12-31',
       NULL, '주술회전 공식 팝업. 포카, 굿즈, 포토존 준비.', NOW(), 'N'),
      ( '블루록 페스티벌', '블루록 존', '서울 강남구 어딘가 456', '강남',
       37.50000000, 127.03000000, '2025-11-15', '2025-12-15',
       NULL, '블루록 팬들을 위한 스페셜 팝업.', NOW(), 'N'),
      ( '귀멸의 칼날 전시', '귀멸 갤러리', '부산 해운대구 어딘가 789', '부산',
       35.16000000, 129.16000000, '2025-10-01', '2025-12-31',
       NULL, '귀멸의 칼날 원화/굿즈 전시.', NOW(), 'N'),
      ( '체인소맨 체험존', '체인소 존', '대구 어딘가 101', '대구',
       35.87000000, 128.59500000, '2025-09-01', '2025-12-30',
       NULL, '체인소맨 체험/포토존.', NOW(), 'N'),
      ( '애니 종합 팝업', '애니월드', '서울 신촌 어딘가 202', '신촌',
       37.56000000, 126.94500000, '2025-11-20', '2026-01-05',
       NULL, '여러 작품 합동 팝업.', NOW(), 'N');

-- 2-9. POPUP_BOOKMARK (팝업 찜)
INSERT INTO popup_bookmark ( member_id, popup_id, created_at) VALUES
                                                                                    ( 1, 1, NOW()),
                                                                                    ( 1, 2, NOW()),
                                                                                    ( 2, 1, NOW()),
                                                                                    ( 3, 3, NOW()),
                                                                                    ( 4, 4, NOW()),
                                                                                    ( 5, 1, NOW()),
                                                                                    ( 6, 2, NOW()),
                                                                                    ( 7, 5, NOW()),
                                                                                    ( 8, 3, NOW()),
                                                                                    (9, 4, NOW());

-- 2-10. POPUP_GOODS
INSERT INTO popup_goods (
     popup_id, name, description, category, price, thumbnail_url
) VALUES
      ( 1, '주술 포카 세트', '한정 포카 5장 세트', '포카', 15000, NULL),
      ( 1, '고죠 굿즈 박스', '랜덤 굿즈 박스', '박스', 39000, NULL),
      ( 2, '블루록 유니폼', '팀 블루록 공식 유니폼', '의류', 69000, NULL),
      ( 2, '블루록 포카', '선수별 랜덤 포카', '포카', 12000, NULL),
      ( 3, '귀멸 스페셜 포스터', 'A2 사이즈 포스터', '포스터', 18000, NULL);

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
INSERT INTO board_category ( code, name) VALUES
                                                         ( 'MY_GOODS', '내새끼 자랑'),
                                                         ( 'COSPLAY', '코스프레'),
                                                         ( 'FREE', '자유게시판');

-- 2-13. BOARD_TAG
INSERT INTO board_tag ( tag_name) VALUES
                                             ( '주술회전'),
                                             ( '블루록'),
                                             ( '귀멸의 칼날'),
                                             ( '체인소맨'),
                                             ('원피스');

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
    post_id, member_id, parent_comment_id, content,
    like_count, created_at, deleted_yn
) VALUES
      ( 1, 2, NULL, '와 포카 진짜 예쁘다...', 2, NOW(), 'N'),
      ( 1, 3, 1, '저도 블루록 포카 모으는 중이에요!', 1, NOW(), 'N'),
      ( 2, 1, NULL, '코스 너무 잘 어울려요!', 3, NOW(), 'N'),
      ( 4, 5, NULL, '렌고쿠 피규어 부럽다...', 1, NOW(), 'N');

-- 2-18. BOARD_LIKE
INSERT INTO board_like ( member_id, post_id, created_at) VALUES
                                                                           ( 1, 2, NOW()),
                                                                           ( 2, 1, NOW()),
                                                                           ( 3, 2, NOW()),
                                                                           ( 4, 4, NOW()),
                                                                           ( 5, 4, NOW());

-- 2-19. BOARD_BOOKMARK
INSERT INTO board_bookmark (member_id, post_id, created_at) VALUES
                                                                                   ( 1, 1, NOW()),
                                                                                   ( 1, 2, NOW()),
                                                                                   ( 2, 3, NOW()),
                                                                                   ( 3, 4, NOW()),
                                                                                   ( 4, 5, NOW());

-- 2-20. BOARD_REPORT
INSERT INTO board_report (
     post_id, comment_id, reporter_id, reason, status, created_at
) VALUES
    ( 3, NULL, 1, '광고성 스팸 같아요.', 'WAIT', NOW());

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
             (50, 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/trade/%EC%9B%90%ED%94%BC%EC%8A%A4/%ED%9D%B0+%EC%88%98%EC%97%BC+%EC%97%90%EB%93%9C%EC%9B%8C%EB%93%9C+%EB%89%B4%EA%B2%8C%EC%9D%B4%ED%8A%B8.PNG', 1);




-- 2-23. TRADE_BOOKMARK
INSERT INTO trade_bookmark ( member_id, trade_id, created_at) VALUES
                                                                                    ( 1, 1, NOW()),
                                                                                    ( 3, 1, NOW()),
                                                                                    ( 4, 2, NOW());

-- 2-24. TRADE_CHAT_ROOM / TRADE_CHAT_MESSAGE
INSERT INTO trade_chat_room (
    trade_id, seller_id, buyer_id, created_at, buyer_left_yn, seller_left_yn
) VALUES
    ( 1, 2, 1, NOW(), 'N', 'N');

INSERT INTO trade_chat_message (
     room_id, sender_id, message, created_at, read_yn
) VALUES
      ( 1, 1, '안녕하세요, 거래 가능할까요?', NOW(), 'N'),
      ( 1, 2, '네, 가능해요! 언제가 편하세요?', NOW(), 'N');

-- 2-25. FAQ_CATEGORY / FAQ
INSERT INTO faq_category ( name) VALUES
                                                     ( '계정'),
                                                     ( '거래'),
                                                     ( '매장/팝업');

INSERT INTO faq (
     faq_category_id, question, answer, sort_order
) VALUES
      ( 1, '비밀번호를 잊어버렸어요.', '로그인 화면에서 비밀번호 찾기를 이용해 주세요.', 1),
      ( 2, '사기 피해가 의심될 때 어떻게 하나요?', '거래 내역과 채팅 로그를 고객센터로 보내 주세요.', 1),
      ( 3, '팝업스토어 정보는 어디서 확인하나요?', '홈 화면 하단의 팝업스토어 영역을 확인해 주세요.', 1);

-- 2-26. INQUIRY (1:1 문의)
INSERT INTO inquiry (
     member_id, category, title, content,
    status, created_at
) VALUES
      ( 1, '계정', '로그인이 안 돼요.', '비밀번호를 여러 번 틀렸는데 어떻게 해야 하나요?', 'WAIT', NOW()),
      ( 2, '거래', '거래 취소 문의', '상대방이 연락이 안 와요.', 'WAIT', NOW());

-- 2-27. SERVICE_NOTICE (공지)
INSERT INTO service_notice (
     title, content, notice_type, start_date, end_date, created_at
) VALUES
      ('더쿠쿠 오픈 안내', '애니 굿즈를 사랑하는 여러분을 위한 플랫폼, 더쿠쿠가 오픈했습니다.', 'NOTICE',
       '2025-11-01', NULL, NOW()),
      ( '주술회전 팝업 연동 이벤트', '주술회전 팝업 방문 인증 시 포인트를 지급합니다.', 'EVENT',
       '2025-12-01', '2025-12-31', NOW());

-- 2-28. NOTIFICATION (알림)
INSERT INTO notification (
    notification_id, member_id, notif_type, message, link_type, link_target_id, read_yn, created_at
) VALUES
      (1, 1, 'COMMENT', '내 게시글에 새로운 댓글이 달렸어요.', 'POST', 1, 'N', NOW()),
      (2, 2, 'TRADE', '내 거래글에 채팅이 도착했어요.', 'TRADE', 1, 'N', NOW());

-- 2-29. ADMIN_USER / ADMIN_ROLE / ADMIN_USER_ROLE / ADMIN_LOG
INSERT INTO admin_user (
     login_id, login_pw, name, email, phone, status, created_at
) VALUES
    ( 'admin', 'admin1234!', '관리자', 'admin@thekuku.com', '010-0000-0000', 'Y', NOW());

INSERT INTO admin_role (
     role_code, role_name, description, created_at
) VALUES
      ( 'SUPER_ADMIN', '슈퍼관리자', '전체 권한 보유', NOW()),
      ( 'CONTENT_MANAGER', '콘텐츠 관리자', '게시글/팝업 관리', NOW());

INSERT INTO admin_user_role (admin_id, role_id, created_at) VALUES
    (1, 1, NOW());

INSERT INTO admin_log (
     admin_id, action_type, target_table, target_id, description, ip_address, created_at
) VALUES
    ( 1, 'LOGIN', NULL, NULL, '관리자 로그인', '127.0.0.1', NOW());