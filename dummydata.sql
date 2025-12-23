-- ✅ Oracle (TKK.MEMBER) login_id만 id001 ~ id040으로 교체 (총 40명)
-- created_at: SYSDATE - n 유지

INSERT INTO TKK.MEMBER (login_id, login_pw, nickname, profile_image_url, intro, user_level, email, gender, nationality, verify_code, created_at, deleted_yn)
VALUES ('id001','pw1234!','피규어뉴비','https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/%ED%94%84%EB%A1%9C%ED%95%84/%EB%AF%B8%EC%BF%A0+%ED%94%84%EB%A1%9C%ED%95%84.jfif','가동피규어 입문했어요. 포즈 추천 받습니다!',1,'kuku11@example.com','여자','내국인',NULL,SYSDATE-2,'N');

INSERT INTO TKK.MEMBER (login_id, login_pw, nickname, profile_image_url, intro, user_level, email, gender, nationality, verify_code, created_at, deleted_yn)
VALUES ('id002','pw1234!','랜덤뽑기장인','https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/%ED%94%84%EB%A1%9C%ED%95%84/%EC%B5%9C%EC%95%A0%EC%9D%98%EC%95%84%EC%9D%B4.jfif','가챠는 운빨이 아니라 집념이다…',1,'kuku12@example.com','남자','내국인',NULL,SYSDATE-5,'N');

INSERT INTO TKK.MEMBER (login_id, login_pw, nickname, profile_image_url, intro, user_level, email, gender, nationality, verify_code, created_at, deleted_yn)
VALUES ('id003','pw1234!','포카수집가','https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/%ED%94%84%EB%A1%9C%ED%95%84/%ED%94%84%EB%A1%9C%ED%95%84-1.jfif','포카 바인더 정리하다가 하루 끝남',1,'kuku13@example.com','여자','내국인',NULL,SYSDATE-9,'N');

INSERT INTO TKK.MEMBER (login_id, login_pw, nickname, profile_image_url, intro, user_level, email, gender, nationality, verify_code, created_at, deleted_yn)
VALUES ('id004','pw1234!','전시충','https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/%ED%94%84%EB%A1%9C%ED%95%84/%ED%94%84%EB%A1%9C%ED%95%84-2.jfif','유리장/LED 전시 세팅 정보 공유해요.',1,'kuku14@example.com','남자','내국인',NULL,SYSDATE-12,'N');

INSERT INTO TKK.MEMBER (login_id, login_pw, nickname, profile_image_url, intro, user_level, email, gender, nationality, verify_code, created_at, deleted_yn)
VALUES ('id005','pw1234!','홍대출몰러','https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/%ED%94%84%EB%A1%9C%ED%95%84/%ED%94%84%EB%A1%9C%ED%95%84-3.jfif','주말마다 성지 순례합니다. 추천 루트 있나요?',1,'kuku15@example.com','여자','내국인',NULL,SYSDATE-15,'N');

INSERT INTO TKK.MEMBER (login_id, login_pw, nickname, profile_image_url, intro, user_level, email, gender, nationality, verify_code, created_at, deleted_yn)
VALUES ('id006','pw1234!','강남팝업러','https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/%ED%94%84%EB%A1%9C%ED%95%84/%ED%9A%8C%EC%83%89+%ED%94%84%EB%A1%9C%ED%95%84.png','팝업스토어 열리면 무조건 출동!',1,'kuku16@example.com','남자','내국인',NULL,SYSDATE-18,'N');

INSERT INTO TKK.MEMBER (login_id, login_pw, nickname, profile_image_url, intro, user_level, email, gender, nationality, verify_code, created_at, deleted_yn)
VALUES ('id007','pw1234!','애니정주행','https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/%ED%94%84%EB%A1%9C%ED%95%84/%ED%9A%8C%EC%83%89+%ED%94%84%EB%A1%9C%ED%95%84.png','완결작 정주행이 취미입니다.',1,'kuku17@example.com','여자','내국인',NULL,SYSDATE-22,'N');

INSERT INTO TKK.MEMBER (login_id, login_pw, nickname, profile_image_url, intro, user_level, email, gender, nationality, verify_code, created_at, deleted_yn)
VALUES ('id008','pw1234!','굿즈통장파괴','https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/%ED%94%84%EB%A1%9C%ED%95%84/%ED%9A%8C%EC%83%89+%ED%94%84%EB%A1%9C%ED%95%84.png','이번 달도 텅장 확정… 그래도 행복',1,'kuku18@example.com','남자','내국인',NULL,SYSDATE-25,'N');

INSERT INTO TKK.MEMBER (login_id, login_pw, nickname, profile_image_url, intro, user_level, email, gender, nationality, verify_code, created_at, deleted_yn)
VALUES ('id009','pw1234!','교환원해요','https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/%ED%94%84%EB%A1%9C%ED%95%84/%ED%9A%8C%EC%83%89+%ED%94%84%EB%A1%9C%ED%95%84.png','포카 교환/양도 매너 좋게 합니다!',1,'kuku19@example.com','여자','외국인',NULL,SYSDATE-30,'N');

INSERT INTO TKK.MEMBER (login_id, login_pw, nickname, profile_image_url, intro, user_level, email, gender, nationality, verify_code, created_at, deleted_yn)
VALUES ('id010','pw1234!','한정판사수','https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/%ED%94%84%EB%A1%9C%ED%95%84/%ED%9A%8C%EC%83%89+%ED%94%84%EB%A1%9C%ED%95%84.png','한정판만 보면 심장이 뜁니다.',1,'kuku20@example.com','남자','내국인',NULL,SYSDATE-33,'N');

INSERT INTO TKK.MEMBER (login_id, login_pw, nickname, profile_image_url, intro, user_level, email, gender, nationality, verify_code, created_at, deleted_yn)
VALUES ('id011','pw1234!','코스준비중','https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/%ED%94%84%EB%A1%9C%ED%95%84/%ED%9A%8C%EC%83%89+%ED%94%84%EB%A1%9C%ED%95%84.png','코스프레 의상 제작 배우는 중이에요.',1,'kuku21@example.com','여자','내국인',NULL,SYSDATE-36,'N');

INSERT INTO TKK.MEMBER (login_id, login_pw, nickname, profile_image_url, intro, user_level, email, gender, nationality, verify_code, created_at, deleted_yn)
VALUES ('id012','pw1234!','렌즈고수','https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/%ED%94%84%EB%A1%9C%ED%95%84/%ED%9A%8C%EC%83%89+%ED%94%84%EB%A1%9C%ED%95%84.png','코스 렌즈/메이크업 팁 공유합니다.',1,'kuku22@example.com','남자','외국인',NULL,SYSDATE-40,'N');

INSERT INTO TKK.MEMBER (login_id, login_pw, nickname, profile_image_url, intro, user_level, email, gender, nationality, verify_code, created_at, deleted_yn)
VALUES ('id013','pw1234!','촬영장비병','https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/%ED%94%84%EB%A1%9C%ED%95%84/%ED%9A%8C%EC%83%89+%ED%94%84%EB%A1%9C%ED%95%84.png','조명/렌즈 사다 보니 장비만 늘었음…',1,'kuku23@example.com','여자','내국인',NULL,SYSDATE-44,'N');

INSERT INTO TKK.MEMBER (login_id, login_pw, nickname, profile_image_url, intro, user_level, email, gender, nationality, verify_code, created_at, deleted_yn)
VALUES ('id014','pw1234!','다이소개조','https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/%ED%94%84%EB%A1%9C%ED%95%84/%ED%9A%8C%EC%83%89+%ED%94%84%EB%A1%9C%ED%95%84.png','전시 소품은 다이소에서 시작한다!',1,'kuku24@example.com','남자','내국인',NULL,SYSDATE-48,'N');

INSERT INTO TKK.MEMBER (login_id, login_pw, nickname, profile_image_url, intro, user_level, email, gender, nationality, verify_code, created_at, deleted_yn)
VALUES ('id015','pw1234!','책장전시러','https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/%ED%94%84%EB%A1%9C%ED%95%84/%ED%9A%8C%EC%83%89+%ED%94%84%EB%A1%9C%ED%95%84.png','책장 전시 감성 좋아요. 먼지 관리가 문제…',1,'kuku25@example.com','여자','내국인',NULL,SYSDATE-52,'N');

INSERT INTO TKK.MEMBER (login_id, login_pw, nickname, profile_image_url, intro, user_level, email, gender, nationality, verify_code, created_at, deleted_yn)
VALUES ('id016','pw1234!','스태츄러버','https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/%ED%94%84%EB%A1%9C%ED%95%84/%ED%9A%8C%EC%83%89+%ED%94%84%EB%A1%9C%ED%95%84.png','스태츄는 크기=로망=현실은 공간부족',1,'kuku26@example.com','남자','내국인',NULL,SYSDATE-57,'N');

INSERT INTO TKK.MEMBER (login_id, login_pw, nickname, profile_image_url, intro, user_level, email, gender, nationality, verify_code, created_at, deleted_yn)
VALUES ('id017','pw1234!','미니피규어덕','https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/%ED%94%84%EB%A1%9C%ED%95%84/%ED%9A%8C%EC%83%89+%ED%94%84%EB%A1%9C%ED%95%84.png','넨도/미니피규어 위주로 모아요.',1,'kuku27@example.com','여자','외국인',NULL,SYSDATE-60,'N');

INSERT INTO TKK.MEMBER (login_id, login_pw, nickname, profile_image_url, intro, user_level, email, gender, nationality, verify_code, created_at, deleted_yn)
VALUES ('id018','pw1234!','박스보관파','https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/%ED%94%84%EB%A1%9C%ED%95%84/%ED%9A%8C%EC%83%89+%ED%94%84%EB%A1%9C%ED%95%84.png','박스 못 버리는 병… 공감하나요',1,'kuku28@example.com','남자','내국인',NULL,SYSDATE-63,'N');

INSERT INTO TKK.MEMBER (login_id, login_pw, nickname, profile_image_url, intro, user_level, email, gender, nationality, verify_code, created_at, deleted_yn)
VALUES ('id019','pw1234!','블라인드박스','https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/%ED%94%84%EB%A1%9C%ED%95%84/%ED%9A%8C%EC%83%89+%ED%94%84%EB%A1%9C%ED%95%84.png','블라인드박스 교환 환영!',1,'kuku29@example.com','여자','내국인',NULL,SYSDATE-66,'N');

INSERT INTO TKK.MEMBER (login_id, login_pw, nickname, profile_image_url, intro, user_level, email, gender, nationality, verify_code, created_at, deleted_yn)
VALUES ('id020','pw1234!','포스터수집','https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/%ED%94%84%EB%A1%9C%ED%95%84/%ED%9A%8C%EC%83%89+%ED%94%84%EB%A1%9C%ED%95%84.png','특전 포스터 상태 좋게 보관하는 법 찾는 중',1,'kuku30@example.com','남자','외국인',NULL,SYSDATE-70,'N');

INSERT INTO TKK.MEMBER (login_id, login_pw, nickname, profile_image_url, intro, user_level, email, gender, nationality, verify_code, created_at, deleted_yn)
VALUES ('id021','pw1234!','애니굿즈여행','https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/%ED%94%84%EB%A1%9C%ED%95%84/%ED%9A%8C%EC%83%89+%ED%94%84%EB%A1%9C%ED%95%84.png','일본 가면 굿즈샵 투어부터 합니다.',1,'kuku31@example.com','여자','내국인',NULL,SYSDATE-74,'N');

INSERT INTO TKK.MEMBER (login_id, login_pw, nickname, profile_image_url, intro, user_level, email, gender, nationality, verify_code, created_at, deleted_yn)
VALUES ('id022','pw1234!','굿즈지도러','https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/%ED%94%84%EB%A1%9C%ED%95%84/%ED%9A%8C%EC%83%89+%ED%94%84%EB%A1%9C%ED%95%84.png','좋은 매장 있으면 지도에 저장하는 편',1,'kuku32@example.com','남자','내국인',NULL,SYSDATE-77,'N');

INSERT INTO TKK.MEMBER (login_id, login_pw, nickname, profile_image_url, intro, user_level, email, gender, nationality, verify_code, created_at, deleted_yn)
VALUES ('id023','pw1234!','굿즈사진사','https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/%ED%94%84%EB%A1%9C%ED%95%84/%ED%9A%8C%EC%83%89+%ED%94%84%EB%A1%9C%ED%95%84.png','굿즈 사진 찍는 게 취미. 배경지 추천받아요!',1,'kuku33@example.com','여자','내국인',NULL,SYSDATE-80,'N');

INSERT INTO TKK.MEMBER (login_id, login_pw, nickname, profile_image_url, intro, user_level, email, gender, nationality, verify_code, created_at, deleted_yn)
VALUES ('id024','pw1234!','아크릴홀릭','https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/%ED%94%84%EB%A1%9C%ED%95%84/%ED%9A%8C%EC%83%89+%ED%94%84%EB%A1%9C%ED%95%84.png','아크릴 스탠드만 보면 일단 장바구니…',1,'kuku34@example.com','남자','내국인',NULL,SYSDATE-84,'N');

INSERT INTO TKK.MEMBER (login_id, login_pw, nickname, profile_image_url, intro, user_level, email, gender, nationality, verify_code, created_at, deleted_yn)
VALUES ('id025','pw1234!','스티커덕','https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/%ED%94%84%EB%A1%9C%ED%95%84/%ED%9A%8C%EC%83%89+%ED%94%84%EB%A1%9C%ED%95%84.png','스티커/씰북 모으는 재미가 쏠쏠해요.',1,'kuku35@example.com','여자','외국인',NULL,SYSDATE-88,'N');

INSERT INTO TKK.MEMBER (login_id, login_pw, nickname, profile_image_url, intro, user_level, email, gender, nationality, verify_code, created_at, deleted_yn)
VALUES ('id026','pw1234!','뱃지모아','https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/%ED%94%84%EB%A1%9C%ED%95%84/%ED%9A%8C%EC%83%89+%ED%94%84%EB%A1%9C%ED%95%84.png','캔뱃지 교환/나눔 자주 해요.',1,'kuku36@example.com','남자','내국인',NULL,SYSDATE-92,'N');

INSERT INTO TKK.MEMBER (login_id, login_pw, nickname, profile_image_url, intro, user_level, email, gender, nationality, verify_code, created_at, deleted_yn)
VALUES ('id027','pw1234!','키링덕후','https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/%ED%94%84%EB%A1%9C%ED%95%84/%ED%9A%8C%EC%83%89+%ED%94%84%EB%A1%9C%ED%95%84.png','가방이 키링으로 가득…',1,'kuku37@example.com','여자','내국인',NULL,SYSDATE-96,'N');

INSERT INTO TKK.MEMBER (login_id, login_pw, nickname, profile_image_url, intro, user_level, email, gender, nationality, verify_code, created_at, deleted_yn)
VALUES ('id028','pw1234!','피규어수리공','https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/%ED%94%84%EB%A1%9C%ED%95%84/%ED%9A%8C%EC%83%89+%ED%94%84%EB%A1%9C%ED%95%84.png','관절 헐거움/보수 팁 공유합니다.',1,'kuku38@example.com','남자','외국인',NULL,SYSDATE-100,'N');

INSERT INTO TKK.MEMBER (login_id, login_pw, nickname, profile_image_url, intro, user_level, email, gender, nationality, verify_code, created_at, deleted_yn)
VALUES ('id029','pw1234!','전시조명러','https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/%ED%94%84%EB%A1%9C%ED%95%84/%ED%9A%8C%EC%83%89+%ED%94%84%EB%A1%9C%ED%95%84.png','LED 바/간접조명 세팅하는 게 제일 재밌음',1,'kuku39@example.com','여자','내국인',NULL,SYSDATE-104,'N');

INSERT INTO TKK.MEMBER (login_id, login_pw, nickname, profile_image_url, intro, user_level, email, gender, nationality, verify_code, created_at, deleted_yn)
VALUES ('id030','pw1234!','굿즈정가파','https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/%ED%94%84%EB%A1%9C%ED%95%84/%ED%9A%8C%EC%83%89+%ED%94%84%EB%A1%9C%ED%95%84.png','정가 구매 지향! 되팔이 싫어요…',1,'kuku40@example.com','남자','내국인',NULL,SYSDATE-108,'N');

INSERT INTO TKK.MEMBER (login_id, login_pw, nickname, profile_image_url, intro, user_level, email, gender, nationality, verify_code, created_at, deleted_yn)
VALUES ('id031','pw1234!','코스동료구함','https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/%ED%94%84%EB%A1%9C%ED%95%84/%ED%9A%8C%EC%83%89+%ED%94%84%EB%A1%9C%ED%95%84.png','촬영 같이 갈 코스 동료 구해요!',1,'kuku41@example.com','여자','내국인',NULL,SYSDATE-112,'N');

INSERT INTO TKK.MEMBER (login_id, login_pw, nickname, profile_image_url, intro, user_level, email, gender, nationality, verify_code, created_at, deleted_yn)
VALUES ('id032','pw1234!','행사러너','https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/%ED%94%84%EB%A1%9C%ED%95%84/%ED%9A%8C%EC%83%89+%ED%94%84%EB%A1%9C%ED%95%84.png','코믹월드/행사 일정 맞춰 움직입니다.',1,'kuku42@example.com','남자','외국인',NULL,SYSDATE-116,'N');

INSERT INTO TKK.MEMBER (login_id, login_pw, nickname, profile_image_url, intro, user_level, email, gender, nationality, verify_code, created_at, deleted_yn)
VALUES ('id033','pw1234!','굿즈리뷰러','https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/%ED%94%84%EB%A1%9C%ED%95%84/%ED%9A%8C%EC%83%89+%ED%94%84%EB%A1%9C%ED%95%84.png','산 굿즈는 꼭 리뷰 남기는 편',1,'kuku43@example.com','여자','내국인',NULL,SYSDATE-120,'N');

INSERT INTO TKK.MEMBER (login_id, login_pw, nickname, profile_image_url, intro, user_level, email, gender, nationality, verify_code, created_at, deleted_yn)
VALUES ('id034','pw1234!','앨범특전러','https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/%ED%94%84%EB%A1%9C%ED%95%84/%ED%9A%8C%EC%83%89+%ED%94%84%EB%A1%9C%ED%95%84.png','앨범 특전 포카 모으다 보니 앨범 산더미…',1,'kuku44@example.com','남자','내국인',NULL,SYSDATE-124,'N');

INSERT INTO TKK.MEMBER (login_id, login_pw, nickname, profile_image_url, intro, user_level, email, gender, nationality, verify_code, created_at, deleted_yn)
VALUES ('id035','pw1234!','프라조립러','https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/%ED%94%84%EB%A1%9C%ED%95%84/%ED%9A%8C%EC%83%89+%ED%94%84%EB%A1%9C%ED%95%84.png','프라는 조립이 반, 도색이 반…',1,'kuku45@example.com','여자','외국인',NULL,SYSDATE-128,'N');

INSERT INTO TKK.MEMBER (login_id, login_pw, nickname, profile_image_url, intro, user_level, email, gender, nationality, verify_code, created_at, deleted_yn)
VALUES ('id036','pw1234!','애니음악파','https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/%ED%94%84%EB%A1%9C%ED%95%84/%ED%9A%8C%EC%83%89+%ED%94%84%EB%A1%9C%ED%95%84.png','OST 들으면서 굿즈 정리하면 개꿀',1,'kuku46@example.com','남자','내국인',NULL,SYSDATE-132,'N');

INSERT INTO TKK.MEMBER (login_id, login_pw, nickname, profile_image_url, intro, user_level, email, gender, nationality, verify_code, created_at, deleted_yn)
VALUES ('id037','pw1234!','최애는여러명','https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/%ED%94%84%EB%A1%9C%ED%95%84/%ED%9A%8C%EC%83%89+%ED%94%84%EB%A1%9C%ED%95%84.png','최애 1명만 못 정하는 사람 여기요',1,'kuku47@example.com','여자','내국인',NULL,SYSDATE-136,'N');

INSERT INTO TKK.MEMBER (login_id, login_pw, nickname, profile_image_url, intro, user_level, email, gender, nationality, verify_code, created_at, deleted_yn)
VALUES ('id038','pw1234!','굿즈탐험대','https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/%ED%94%84%EB%A1%9C%ED%95%84/%ED%9A%8C%EC%83%89+%ED%94%84%EB%A1%9C%ED%95%84.png','새 매장 발견하면 혼자 뿌듯해짐',1,'kuku48@example.com','남자','외국인',NULL,SYSDATE-140,'N');

INSERT INTO TKK.MEMBER (login_id, login_pw, nickname, profile_image_url, intro, user_level, email, gender, nationality, verify_code, created_at, deleted_yn)
VALUES ('id039','pw1234!','피규어촬영러','https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/%ED%94%84%EB%A1%9C%ED%95%84/%ED%9A%8C%EC%83%89+%ED%94%84%EB%A1%9C%ED%95%84.png','액션샷은 각도 싸움… 팁 공유해요',1,'kuku49@example.com','여자','내국인',NULL,SYSDATE-144,'N');

INSERT INTO TKK.MEMBER (login_id, login_pw, nickname, profile_image_url, intro, user_level, email, gender, nationality, verify_code, created_at, deleted_yn)
VALUES ('id040','pw1234!','덕질은힐링','https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/%ED%94%84%EB%A1%9C%ED%95%84/%ED%9A%8C%EC%83%89+%ED%94%84%EB%A1%9C%ED%95%84.png','덕질로 스트레스 푸는 중입니다.',1,'kuku50@example.com','남자','내국인',NULL,SYSDATE-148,'N');

COMMIT;

commit ;


-- Oracle (TKK.STORE) 더미데이터
-- & 문자(예: AK&) 때문에 치환 방지

INSERT INTO TKK.store (name, one_line_desc, address, region_name, latitude, longitude, avg_rating, bookmark_count, phone, image_url) VALUES ('피규어프레소 서초점(국전점)','국제전자센터 9층에 위치한 대형 피규어·굿즈샵','서울 서초구 효령로 304 국제전자센터 9층','서초/국전',37.485300,127.016700,4.70,180,'010-9000-0001','https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/store/%EC%8A%A4%ED%86%A0%EC%96%B4+%EC%9D%B4%EB%AF%B8%EC%A7%80/%ED%94%BC%EA%B7%9C%EC%96%B4%ED%94%84%EB%A0%88%EC%86%8C+%EC%84%9C%EC%B4%88%EC%A0%90.PNG');
INSERT INTO TKK.store (name, one_line_desc, address, region_name, latitude, longitude, avg_rating, bookmark_count, phone, image_url) VALUES ('피규어프레소 홍대점','홍대 서교동 일대 피규어·굿즈 전문 매장','서울 마포구 잔다리로6길 25 2층','홍대',37.556000,126.923000,4.60,200,'010-9000-0002','https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/store/%EC%8A%A4%ED%86%A0%EC%96%B4+%EC%9D%B4%EB%AF%B8%EC%A7%80/%ED%94%BC%EA%B7%9C%EC%96%B4%ED%94%84%EB%A0%88%EC%86%8C+%ED%99%8D%EB%8C%80%EC%A0%90.PNG');
INSERT INTO TKK.store (name, one_line_desc, address, region_name, latitude, longitude, avg_rating, bookmark_count, phone, image_url) VALUES ('피규어프레소 에프피점(FP점)','카페 겸 굿즈샵 컨셉의 홍대 FP점','서울 마포구 와우산로29길 48-11','홍대',37.556500,126.923500,4.50,150,'010-9000-0003','https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/store/%EC%8A%A4%ED%86%A0%EC%96%B4+%EC%9D%B4%EB%AF%B8%EC%A7%80/%ED%94%BC%EA%B7%9C%EC%96%B4%ED%94%84%EB%A0%88%EC%86%8C+%EC%97%90%ED%94%84%ED%94%BC%EC%A0%90.PNG');
INSERT INTO TKK.store (name, one_line_desc, address, region_name, latitude, longitude, avg_rating, bookmark_count, phone, image_url) VALUES ('POP MART 코엑스점','코엑스몰 내 라라부·블라인드 피규어 전문 매장','서울 강남구 영동대로 513 코엑스몰','코엑스/삼성',37.511300,127.058800,4.40,220,'010-9000-0004','https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/store/%EC%8A%A4%ED%86%A0%EC%96%B4+%EC%9D%B4%EB%AF%B8%EC%A7%80/POP+MART+%EC%BD%94%EC%97%91%EC%8A%A4%EC%A0%90.PNG');
INSERT INTO TKK.store (name, one_line_desc, address, region_name, latitude, longitude, avg_rating, bookmark_count, phone, image_url) VALUES ('토이쩔어스 건대점','토이 스토리·디즈니 피규어 위주 키덜트샵','서울 광진구 아차산로26길 27','건대',37.540000,127.070000,4.30,130,'010-9000-0005','https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/store/%EC%8A%A4%ED%86%A0%EC%96%B4+%EC%9D%B4%EB%AF%B8%EC%A7%80/%ED%86%A0%EC%9D%B4%EC%96%B4%EC%A9%94%EC%8A%A4+%EA%B1%B4%EB%8C%80%EC%A0%90.PNG');
INSERT INTO TKK.store (name, one_line_desc, address, region_name, latitude, longitude, avg_rating, bookmark_count, phone, image_url) VALUES ('조아하비 신도림점','프라모델·RC·건담 전문 대형 키덜트샵','서울 구로구 새말로 97','신도림',37.509000,126.889000,4.60,260,'010-9000-0006','https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/store/%EC%8A%A4%ED%86%A0%EC%96%B4+%EC%9D%B4%EB%AF%B8%EC%A7%80/%EC%A1%B0%EC%95%84%ED%95%98%EB%B9%84+%EA%B1%B4%EB%8C%80%EC%A0%90.PNG');
INSERT INTO TKK.store (name, one_line_desc, address, region_name, latitude, longitude, avg_rating, bookmark_count, phone, image_url) VALUES ('킨키로봇 한남점','디자이너 토이와 아트토이 중심 편집 굿즈샵','서울 용산구 이태원로54길 16-3','한남',37.539000,127.000000,4.50,190,'010-9000-0007','https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/store/%EC%8A%A4%ED%86%A0%EC%96%B4+%EC%9D%B4%EB%AF%B8%EC%A7%80/%ED%82%A8%ED%82%A4%EB%A1%9C%EB%B4%87+%ED%95%9C%EB%82%A8%EC%A0%90.PNG');
INSERT INTO TKK.store (name, one_line_desc, address, region_name, latitude, longitude, avg_rating, bookmark_count, phone, image_url) VALUES ('핑크버스 홍대점','디즈니·산리오 등 캐릭터 소품 위주 굿즈샵','서울 마포구 와우산로27길 31','홍대',37.556500,126.924000,4.20,140,'010-9000-0008','https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/store/%EC%8A%A4%ED%86%A0%EC%96%B4+%EC%9D%B4%EB%AF%B8%EC%A7%80/%ED%95%91%ED%81%AC%EB%B2%84%EC%8A%A4+%ED%99%8D%EB%8C%80%EC%A0%90.PNG');
INSERT INTO TKK.store (name, one_line_desc, address, region_name, latitude, longitude, avg_rating, bookmark_count, phone, image_url) VALUES ('장난감놀이터 신림점','레트로 장난감·피규어·RC 등 키덜트 소품샵','서울 관악구 남부순환로172길 7','신림',37.482000,126.929000,4.30,135,'010-9000-0009','https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/store/%EC%8A%A4%ED%86%A0%EC%96%B4+%EC%9D%B4%EB%AF%B8%EC%A7%80/%EC%9E%A5%EB%82%9C%EA%B0%90%EB%86%80%EC%9D%B4%ED%84%B0+%EC%8B%A0%EB%A6%BC%EC%A0%90.PNG');
INSERT INTO TKK.store (name, one_line_desc, address, region_name, latitude, longitude, avg_rating, bookmark_count, phone, image_url) VALUES ('애니플러스 합정점','애니메이션 공식 굿즈·피규어 중심 매장','서울 마포구 월드컵로3길 14','합정',37.550000,126.914000,4.50,210,'010-9000-0010','https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/store/%EC%8A%A4%ED%86%A0%EC%96%B4+%EC%9D%B4%EB%AF%B8%EC%A7%80/%EC%95%A0%EB%8B%88%ED%94%8C%EB%9F%AC%EC%8A%A4+%ED%95%A9%EC%A0%95%EC%A0%90.PNG');
INSERT INTO TKK.store (name, one_line_desc, address, region_name, latitude, longitude, avg_rating, bookmark_count, phone, image_url) VALUES ('애니통 신림점','코믹북·건프라·제일복권 등 종합 키덜트샵','서울 관악구 남부순환로 1568','신림',37.482500,126.929500,4.30,160,'010-9000-0011','https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/store/%EC%8A%A4%ED%86%A0%EC%96%B4+%EC%9D%B4%EB%AF%B8%EC%A7%80/%EC%95%A0%EB%8B%88%ED%86%B5+%EC%8B%A0%EB%A6%BC%EC%A0%90.PNG');
INSERT INTO TKK.store (name, one_line_desc, address, region_name, latitude, longitude, avg_rating, bookmark_count, phone, image_url) VALUES ('POP MART 홍대점','홍대 거리 인근 블라인드 피규어 전문 매장','서울 마포구 와우산로23길 56','홍대',37.556700,126.923500,4.40,230,'010-9000-0012','https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/store/%EC%8A%A4%ED%86%A0%EC%96%B4+%EC%9D%B4%EB%AF%B8%EC%A7%80/POP+MART+%ED%99%8D%EB%8C%80%EC%A0%90.PNG');
INSERT INTO TKK.store (name, one_line_desc, address, region_name, latitude, longitude, avg_rating, bookmark_count, phone, image_url) VALUES ('POP MART 명동점','명동 메인 스트리트에 위치한 팝마트 매장','서울 중구 명동8길 36','명동',37.563500,126.985500,4.20,170,'010-9000-0013','https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/store/%EC%8A%A4%ED%86%A0%EC%96%B4+%EC%9D%B4%EB%AF%B8%EC%A7%80/POP+MART+%EB%AA%85%EB%8F%99%EC%A0%90.PNG');
INSERT INTO TKK.store (name, one_line_desc, address, region_name, latitude, longitude, avg_rating, bookmark_count, phone, image_url) VALUES ('POP MART 용산 아이파크몰점','용산 아이파크몰 내 팝마트 오프라인 매장','서울 용산구 한강대로23길 55 HDC아이파크몰','용산',37.529900,126.964500,4.30,185,'010-9000-0014','https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/store/%EC%8A%A4%ED%86%A0%EC%96%B4+%EC%9D%B4%EB%AF%B8%EC%A7%80/POP+MART+%EC%9A%A9%EC%82%B0+%EC%95%84%EC%9D%B4%ED%8C%8C%ED%81%AC%EB%AA%B0%EC%A0%90.PNG');
INSERT INTO TKK.store (name, one_line_desc, address, region_name, latitude, longitude, avg_rating, bookmark_count, phone, image_url) VALUES ('POP MART 수원점','수원역 인근 쇼핑몰 내 팝마트 매장','경기 수원시 팔달구 덕영대로 일대','수원',37.265000,127.000000,4.10,120,'010-9000-0015','https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/store/%EC%8A%A4%ED%86%A0%EC%96%B4+%EC%9D%B4%EB%AF%B8%EC%A7%80/POP+MART+%EC%88%98%EC%9B%90%EC%A0%90.PNG');
INSERT INTO TKK.store (name, one_line_desc, address, region_name, latitude, longitude, avg_rating, bookmark_count, phone, image_url) VALUES ('EGO SHOWROOM 1호점','애니·캐릭터 굿즈 중심의 성수 쇼룸 1호점','서울 성동구 연무장3길 10 1층','성수',37.544000,127.055000,4.30,110,'010-9000-0016','https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/store/default.jpg');
INSERT INTO TKK.store (name, one_line_desc, address, region_name, latitude, longitude, avg_rating, bookmark_count, phone, image_url) VALUES ('EGO SHOWROOM 2호점','EGO 굿즈 추가 전시·판매 공간인 2호점','서울 성동구 연무장3길 9-8 2층','성수',37.544200,127.055200,4.20,95,'010-9000-0017','https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/store/default.jpg');
INSERT INTO TKK.store (name, one_line_desc, address, region_name, latitude, longitude, avg_rating, bookmark_count, phone, image_url) VALUES ('헬로수미코 홍대점','산리오·일본 캐릭터 굿즈 중심 소규모 샵','서울 마포구 월드컵북로1길 26-13 1층','홍대',37.557800,126.921800,4.20,90,'010-9000-0018','https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/store/%EC%8A%A4%ED%86%A0%EC%96%B4+%EC%9D%B4%EB%AF%B8%EC%A7%80/%ED%97%AC%EB%A1%9C%EC%88%98%EB%AF%B8%EC%BD%94+%ED%99%8D%EB%8C%80%EC%A0%90.PNG');
INSERT INTO TKK.store (name, one_line_desc, address, region_name, latitude, longitude, avg_rating, bookmark_count, phone, image_url) VALUES ('가챠오션 홍대점','일본식 캡슐토이(가챠) 위주 키덜트샵','서울 마포구 동교로38길 29 1.5층','홍대',37.557000,126.923500,4.10,80,'010-9000-0019','https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/store/%EC%8A%A4%ED%86%A0%EC%96%B4+%EC%9D%B4%EB%AF%B8%EC%A7%80/%EA%B0%80%EC%B1%A0%EC%98%A4%EC%85%98+%ED%99%8D%EB%8C%80%EC%A0%90.PNG');
INSERT INTO TKK.store (name, one_line_desc, address, region_name, latitude, longitude, avg_rating, bookmark_count, phone, image_url) VALUES ('츄플레이 홍대점','랜덤 피규어·가챠·굿즈를 모아놓은 홍대 샵','서울 마포구 월드컵북로2길 93 301호','홍대',37.557500,126.922500,4.00,75,'010-9000-0020','https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/store/%EC%8A%A4%ED%86%A0%EC%96%B4+%EC%9D%B4%EB%AF%B8%EC%A7%80/%EC%B8%84%ED%94%8C%EB%A0%88%EC%9D%B4+%ED%99%8D%EB%8C%80%EC%A0%90.PNG');
INSERT INTO TKK.store (name, one_line_desc, address, region_name, latitude, longitude, avg_rating, bookmark_count, phone, image_url) VALUES ('덕쿠 홍대점','홍대 랜덤박스·가챠·피규어 전문 굿즈샵','서울 마포구 홍익로6길 38 지하1층','홍대',37.555800,126.924200,4.60,190,'0507-1310-8869','https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/store/default.jpg');
INSERT INTO TKK.store (name, one_line_desc, address, region_name, latitude, longitude, avg_rating, bookmark_count, phone, image_url) VALUES ('제이에스스토어 홍대점','경품 뽑기와 피규어를 함께 즐기는 홍대 경품샵','서울 마포구 와우산로29길 48-24 1층','홍대',37.556200,126.924000,4.40,150,'02-337-3338','https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/store/%EC%8A%A4%ED%86%A0%EC%96%B4+%EC%9D%B4%EB%AF%B8%EC%A7%80/%EC%A0%9C%EC%9D%B4%EC%97%90%EC%8A%A4%EC%8A%A4%ED%86%A0%EC%96%B4+%ED%99%8D%EB%8C%80%EC%A0%90.PNG');
INSERT INTO TKK.store (name, one_line_desc, address, region_name, latitude, longitude, avg_rating, bookmark_count, phone, image_url) VALUES ('브라더굿즈 홍대점','일본 애니 굿즈와 가챠 캡슐토이 전문샵','서울 마포구 신촌로6길 24 2층','홍대',37.556800,126.925000,4.50,170,'070-8657-2105','https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/store/%EC%8A%A4%ED%86%A0%EC%96%B4+%EC%9D%B4%EB%AF%B8%EC%A7%80/%EB%B8%8C%EB%9D%BC%EB%8D%94%EA%B5%BF%EC%A6%88+%ED%99%8D%EB%8C%80%EC%A0%90.PNG');
INSERT INTO TKK.store (name, one_line_desc, address, region_name, latitude, longitude, avg_rating, bookmark_count, phone, image_url) VALUES ('레인몰 홍대점','아이돌·애니 굿즈와 트레이딩 카드 취급 굿즈샵','서울 마포구 독막로 67-1 3층','홍대',37.553800,126.921500,4.30,120,'010-2691-3912','https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/store/%EC%8A%A4%ED%86%A0%EC%96%B4+%EC%9D%B4%EB%AF%B8%EC%A7%80/%EB%A0%88%EC%9D%B8%EB%AA%B0+%ED%99%8D%EB%8C%80%EC%A0%90.PNG');
INSERT INTO TKK.store (name, one_line_desc, address, region_name, latitude, longitude, avg_rating, bookmark_count, phone, image_url) VALUES ('애니메이트 홍대점','일본 애니 공식 굿즈·서적·피규어 대형 매장','서울 마포구 동교동 192-45 AK& 홍대 5층','홍대',37.557000,126.924500,4.70,250,'02-3144-7357','https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/store/%EC%8A%A4%ED%86%A0%EC%96%B4+%EC%9D%B4%EB%AF%B8%EC%A7%80/%EC%97%90%EB%8B%88%EB%A9%94%EC%9D%B4%ED%8A%B8+%ED%99%8D%EB%8C%80%EC%A0%90.PNG');
INSERT INTO TKK.store (name, one_line_desc, address, region_name, latitude, longitude, avg_rating, bookmark_count, phone, image_url) VALUES ('피규어프렌즈 홍대점','피규어·프라모델 중심 중고·신품 굿즈샵','서울 마포구 양화로18안길 8 지층','홍대',37.556000,126.922800,4.50,160,'010-8223-7922','https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/store/%EC%8A%A4%ED%86%A0%EC%96%B4+%EC%9D%B4%EB%AF%B8%EC%A7%80/%ED%94%BC%EA%B7%9C%EC%96%B4%ED%94%84%EB%A0%8C%EC%A6%88+%ED%99%8D%EB%8C%80%EC%A0%90.PNG');
INSERT INTO TKK.store (name, one_line_desc, address, region_name, latitude, longitude, avg_rating, bookmark_count, phone, image_url) VALUES ('애니세카이 홍대점','애니메이션 캐릭터 굿즈와 피규어 전문 매장','서울 마포구 동교동 170-38 2층','홍대',37.556900,126.923300,4.40,140,'0507-1367-2048','https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/store/%EC%8A%A4%ED%86%A0%EC%96%B4+%EC%9D%B4%EB%AF%B8%EC%A7%80/%EC%95%A0%EB%8B%88%EC%84%B8%EC%B9%B4%EC%9D%B4+%ED%99%8D%EB%8C%80%EC%A0%90.PNG');
INSERT INTO TKK.store (name, one_line_desc, address, region_name, latitude, longitude, avg_rating, bookmark_count, phone, image_url) VALUES ('모와즐 홍대점','서브컬처 의류와 굿즈를 모아놓은 편집샵','서울 마포구 양화로18안길 12 지층','홍대',37.555900,126.923000,4.20,110,'0507-1361-3402','https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/store/%EC%8A%A4%ED%86%A0%EC%96%B4+%EC%9D%B4%EB%AF%B8%EC%A7%80/%EB%AA%A8%EC%99%80%EC%A6%90+%ED%99%8D%EB%8C%80%EC%A0%90.PNG');
INSERT INTO TKK.store (name, one_line_desc, address, region_name, latitude, longitude, avg_rating, bookmark_count, phone, image_url) VALUES ('CIH+SHOP 홍대점','일본 케이북스와 함께하는 중고 애니 굿즈샵','서울 마포구 동교동 159-5 케이스퀘어','홍대',37.555200,126.922000,4.30,130,'02-6081-2555','https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/store/%EC%8A%A4%ED%86%A0%EC%96%B4+%EC%9D%B4%EB%AF%B8%EC%A7%80/CIH%2BSHOP+%ED%99%8D%EB%8C%80%EC%A0%90.PNG');
INSERT INTO TKK.store (name, one_line_desc, address, region_name, latitude, longitude, avg_rating, bookmark_count, phone, image_url) VALUES ('유포테이블 카페 홍대점','귀멸의 칼날 등 콜라보 굿즈 판매 카페','서울 마포구 와우산로23길 9 칼리오페 2층','홍대',37.554000,126.921800,4.10,90,'02-6406-3321','https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/store/%EC%8A%A4%ED%86%A0%EC%96%B4+%EC%9D%B4%EB%AF%B8%EC%A7%80/%EC%9C%A0%ED%8F%AC%ED%85%8C%EC%9D%B4%EB%B8%94+%EC%B9%B4%ED%8E%98+%ED%99%8D%EB%8C%80%EC%A0%90.PNG');
INSERT INTO TKK.store (name, one_line_desc, address, region_name, latitude, longitude, avg_rating, bookmark_count, phone, image_url) VALUES ('POP MART 스타필드 안성점','스타필드 안성 내 블라인드 피규어 전문 팝마트','경기 안성시 공도읍 서동대로 3930-39 스타필드 안성','경기/안성',36.997800,127.202500,4.20,100,'031-8092-1658','https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/store/default.jpg');
INSERT INTO TKK.store (name, one_line_desc, address, region_name, latitude, longitude, avg_rating, bookmark_count, phone, image_url) VALUES ('토이킹덤 스타필드 안성점','스타필드 안성 2층 완구·피규어 대형 토이샵','경기 안성시 공도읍 서동대로 3930-39 스타필드 안성 2층 토이킹덤','경기/안성',36.997900,127.202600,4.30,95,'031-8092-1715','https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/store/default.jpg');
INSERT INTO TKK.store (name, one_line_desc, address, region_name, latitude, longitude, avg_rating, bookmark_count, phone, image_url) VALUES ('피규어뮤지엄W 청담점','피규어·토이 전시와 판매를 겸한 피규어 전문 뮤지엄','서울 강남구 선릉로158길 3','청담/강남',37.5257998,127.0403869,4.50,190,'070-7404-2240','https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/store/default.jpg');
INSERT INTO TKK.store (name, one_line_desc, address, region_name, latitude, longitude, avg_rating, bookmark_count, phone, image_url) VALUES ('제이굿즈 수원점','수원역 인근 애니메이션·아이돌 굿즈 전문샵','경기 수원시 팔달구 매산로2가 27-62 헌욱빌딩 2층','수원역',37.2689432,127.0036858,4.40,130,'031-246-4249','https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/store/default.jpg');
INSERT INTO TKK.store (name, one_line_desc, address, region_name, latitude, longitude, avg_rating, bookmark_count, phone, image_url) VALUES ('조이하비 신도림 테크노마트점','건프라·RC·피규어 중심 대형 하비샵','서울 구로구 새말로 97 신도림테크노마트 3층','신도림/테크노마트',37.5063209,126.8903608,4.60,250,'02-2111-5212','https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/store/default.jpg');
INSERT INTO TKK.store (name, one_line_desc, address, region_name, latitude, longitude, avg_rating, bookmark_count, phone, image_url) VALUES ('카카오프렌즈 홍대 플래그십 스토어','홍대입구역 앞 카카오 캐릭터 공식 굿즈샵','서울 마포구 양화로 162 카카오프렌즈 홍대점','홍대',37.556900,126.923500,4.80,320,'02-6010-0104','https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/store/default.jpg');
INSERT INTO TKK.store (name, one_line_desc, address, region_name, latitude, longitude, avg_rating, bookmark_count, phone, image_url) VALUES ('카카오프렌즈 스타필드 코엑스몰점','코엑스몰 지하에 위치한 카카오프렌즈 공식 매장','서울 강남구 영동대로 513 스타필드 코엑스몰 B1층','코엑스/삼성',37.512500,127.058000,4.60,280,'02-6002-1880','https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/store/default.jpg');
INSERT INTO TKK.store (name, one_line_desc, address, region_name, latitude, longitude, avg_rating, bookmark_count, phone, image_url) VALUES ('카카오프렌즈 잠실 롯데월드몰점','롯데월드몰 내 카카오프렌즈·라이언 굿즈 전문샵','서울 송파구 올림픽로 300 롯데월드몰 5층','잠실',37.511000,127.098000,4.70,300,'02-3213-4514','https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/store/default.jpg');
INSERT INTO TKK.store (name, one_line_desc, address, region_name, latitude, longitude, avg_rating, bookmark_count, phone, image_url) VALUES ('카카오프렌즈 영등포 타임스퀘어점','타임스퀘어 1층 캐릭터·문구·인형 굿즈샵','서울 영등포구 영중로 15 타임스퀘어 1층','영등포/타임스퀘어',37.517200,126.903000,4.50,220,'02-2638-2750','https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/store/default.jpg');
INSERT INTO TKK.store (name, one_line_desc, address, region_name, latitude, longitude, avg_rating, bookmark_count, phone, image_url) VALUES ('카카오프렌즈 DDP 동대문점','DDP 지하에 위치한 카카오프렌즈 공식 스토어','서울 중구 을지로 281 동대문디자인플라자 B2층','동대문/DDP',37.566000,127.009500,4.40,190,'02-2231-3552','https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/store/default.jpg');
INSERT INTO TKK.store (name, one_line_desc, address, region_name, latitude, longitude, avg_rating, bookmark_count, phone, image_url) VALUES ('카카오프렌즈 롯데월드타워 면세점','롯데월드타워 내 면세점 카카오프렌즈 숍','서울 송파구 올림픽로 300 롯데월드타워 8층 롯데면세점','잠실',37.513000,127.102000,4.30,160,'02-3213-6743','https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/store/default.jpg');
INSERT INTO TKK.store (name, one_line_desc, address, region_name, latitude, longitude, avg_rating, bookmark_count, phone, image_url) VALUES ('라인프렌즈 스퀘어 명동','브라운·코니·BT21 등 라인프렌즈 플래그십 스토어','서울 중구 명동길 43 라인프렌즈 스퀘어 명동','명동',37.564700,126.985000,4.70,310,'070-4060-3534','https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/store/default.jpg');
INSERT INTO TKK.store (name, one_line_desc, address, region_name, latitude, longitude, avg_rating, bookmark_count, phone, image_url) VALUES ('라인프렌즈 롯데영플라자 명동점','롯데영플라자 내 라인프렌즈 캐릭터 굿즈샵','서울 중구 남대문로 67 롯데영플라자 1층','명동',37.563300,126.981900,4.50,230,'02-318-7942','https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/store/default.jpg');
INSERT INTO TKK.store (name, one_line_desc, address, region_name, latitude, longitude, avg_rating, bookmark_count, phone, image_url) VALUES ('리락쿠마 스미코구라시 플러스 홍대점','AK플라자 3층 SAN-X 공식 리락쿠마·스미코 상설샵','서울 마포구 양화로 188 AK플라자 홍대점 3층','홍대',37.557300,126.923000,4.60,260,'02-789-9800','https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/store/default.jpg');
INSERT INTO TKK.store (name, one_line_desc, address, region_name, latitude, longitude, avg_rating, bookmark_count, phone, image_url) VALUES ('위드뮤 AK플라자 홍대점','K-POP 앨범·아이돌 굿즈 중심 편집샵','서울 마포구 양화로 188 AK플라자 홍대점 내 위드뮤 매장','홍대',37.557400,126.923200,4.50,210,'0507-1343-0429','https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/store/default.jpg');
INSERT INTO TKK.store (name, one_line_desc, address, region_name, latitude, longitude, avg_rating, bookmark_count, phone, image_url) VALUES ('도토리숲 롯데월드몰점','지브리 스튜디오 공식 토토로·키키 캐릭터 샵','서울 송파구 올림픽로 300 쇼핑몰 캐주얼동 지하1층 도토리숲','잠실',37.511200,127.098200,4.60,240,'02-3213-4747','https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/store/default.jpg');
INSERT INTO TKK.store (name, one_line_desc, address, region_name, latitude, longitude, avg_rating, bookmark_count, phone, image_url) VALUES ('애니메이트 잠실 롯데점','애니메이션·만화 공식 굿즈·피규어 전문점','서울 송파구 올림픽로 240 롯데월드 쇼핑몰동 B1층 애니메이트','잠실',37.511400,127.098500,4.70,280,'02-2143-1571','https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/store/default.jpg');
INSERT INTO TKK.store (name, one_line_desc, address, region_name, latitude, longitude, avg_rating, bookmark_count, phone, image_url) VALUES ('팝퍼블 용산 아이파크몰점','원피스·짱구 등 콜라보 팝업·굿즈 카페','서울 용산구 한강대로23길 55 용산역 아이파크몰 6층 팝콘D스퀘어','용산',37.529900,126.964400,4.50,220,'02-6373-3360','https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/store/default.jpg');
INSERT INTO TKK.store (name, one_line_desc, address, region_name, latitude, longitude, avg_rating, bookmark_count, phone, image_url) VALUES ('얌꽁굿즈 병점점','병점 롯데시네마 내 캔뱃지·스티커 위주 굿즈샵','경기 화성시 병점로 31 롯데시네마 병점점 2층 얌꽁굿즈','경기/화성',37.206700,127.032500,4.30,120,'031-000-1111','https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/store/default.jpg');
INSERT INTO TKK.store (name, one_line_desc, address, region_name, latitude, longitude, avg_rating, bookmark_count, phone, image_url) VALUES ('꼼지락 하비샵 & 게임몬스터','프라모델·보드게임·피규어를 함께 파는 하비샵','경기 고양시 덕양구 백양로 84 1층 꼼지락 하비샵 & 게임몬스터','경기/고양',37.632500,126.832000,4.40,140,'0507-1313-3146','https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/store/default.jpg');
INSERT INTO TKK.store (name, one_line_desc, address, region_name, latitude, longitude, avg_rating, bookmark_count, phone, image_url)
VALUES ('피규어플렉스 부천시청역점','부천시청역 인근 피규어·가챠·굿즈 전문샵','경기 부천시 석천로177번길 28 2층 피규어플렉스 부천시청역점','경기/부천',37.503500,126.766000,4.40,150,'0507-1367-9530','https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/store/default.jpg');

INSERT INTO TKK.store (name, one_line_desc, address, region_name, latitude, longitude, avg_rating, bookmark_count, phone, image_url)
VALUES ('타미야 플라모델 팩토리 양재점','RC카·프라모델 전문 타미야 직영 본점','서울 서초구 바우뫼로 215 타미야빌딩 1층','서초/양재',37.480900,127.041700,4.60,140,'02-2135-3113','https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/store/default.jpg');

INSERT INTO TKK.store (name, one_line_desc, address, region_name, latitude, longitude, avg_rating, bookmark_count, phone, image_url)
VALUES ('타미야 플라모델 팩토리 용산 아이파크몰점','아이파크몰 내 대형 프라모델·미니카 전문점','서울 용산구 한강대로23길 55 아이파크몰 리빙파크 6층','용산',37.528907,126.964635,4.50,170,'02-2012-0877','https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/store/default.jpg');

INSERT INTO TKK.store (name, one_line_desc, address, region_name, latitude, longitude, avg_rating, bookmark_count, phone, image_url)
VALUES ('타미야 플라모델 팩토리 스타필드 하남점','스타필드 하남에 위치한 타미야 공식 매장','경기 하남시 미사대로 750 스타필드 하남 3층','경기/하남',37.545489,127.224333,4.40,120,'031-8072-8446','https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/store/default.jpg');

INSERT INTO TKK.store (name, one_line_desc, address, region_name, latitude, longitude, avg_rating, bookmark_count, phone, image_url)
VALUES ('타미야 플라모델 팩토리 수원 AK플라자점','수원역 AK플라자 내 프라모델 전문샵','경기 수원시 팔달구 덕영대로 924 AK플라자 수원 4층','수원',37.266101,127.000686,4.40,115,'031-240-1953','https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/store/default.jpg');

INSERT INTO TKK.store (name, one_line_desc, address, region_name, latitude, longitude, avg_rating, bookmark_count, phone, image_url)
VALUES ('마블 컬렉션 스토어 한양대점','마블·디즈니 캐릭터 굿즈 전문 편집숍','서울 성동구 왕십리로 241 파크에비뉴 엔터식스 한양대점 1층','성동/왕십리',37.557148,127.040146,4.30,95,'02-6454-6130','https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/store/default.jpg');

INSERT INTO TKK.store (name, one_line_desc, address, region_name, latitude, longitude, avg_rating, bookmark_count, phone, image_url)
VALUES ('국제전자센터 피규어·가챠존','남부터미널역 인근 피규어·가챠·쿠지 집결지','서울 서초구 효령로 304 국제전자센터 8~9층 일대','서초/국전',37.485300,127.016700,4.70,260,'02-3465-0114','https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/store/default.jpg');

INSERT INTO TKK.store (name, one_line_desc, address, region_name, latitude, longitude, avg_rating, bookmark_count, phone, image_url)
VALUES ('신도림 테크노마트 가챠·피규어존','신도림역 직통 키덜트 가챠·쿠지·피규어 존','서울 구로구 구로동 3-25 신도림테크노마트 8~9층','신도림',37.508700,126.890100,4.50,210,'02-2111-1889','https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/store/default.jpg');

INSERT INTO TKK.store (name, one_line_desc, address, region_name, latitude, longitude, avg_rating, bookmark_count, phone, image_url)
VALUES ('루나러브굿 나루 공작소','홍대 인근 레트로 피규어·장난감 공방형 샵','서울 마포구 서교동 일대','홍대',37.552000,126.919000,4.20,80,'02-6082-3300','https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/store/default.jpg');

INSERT INTO TKK.store (name, one_line_desc, address, region_name, latitude, longitude, avg_rating, bookmark_count, phone, image_url)
VALUES ('애니굿즈 키라키라토모 수원본점','수원역 인근 애니·아이돌 굿즈 전문샵','경기 수원시 팔달구 향교로 4 3층','수원',37.266500,127.000000,4.60,150,'050-6805-2148','https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/store/default.jpg');

INSERT INTO TKK.store (name, one_line_desc, address, region_name, latitude, longitude, avg_rating, bookmark_count, phone, image_url)
VALUES ('챌린저 롯데백화점 평촌점','스트리트 브랜드·콜라보 굿즈 팝업 매장','경기 안양시 동안구 시민대로 180 롯데백화점 평촌 6층','안양/평촌',37.390001,126.950349,4.10,70,'010-3713-3215','https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/store/default.jpg');

INSERT INTO TKK.store (name, one_line_desc, address, region_name, latitude, longitude, avg_rating, bookmark_count, phone, image_url)
VALUES ('챌린저 신세계 여주 프리미엄 빌리지점','여주 아울렛 내 스트리트 굿즈·의류 매장','경기 여주시 명품로 316-10 1-2호','여주',37.243136,127.617162,4.00,60,'031-883-1072','https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/store/default.jpg');

INSERT INTO TKK.store (name, one_line_desc, address, region_name, latitude, longitude, avg_rating, bookmark_count, phone, image_url)
VALUES ('챌린저 현대프리미엄아울렛 김포점','김포 아울렛 2층 스트리트 패션·굿즈 팝업','경기 김포시 고촌읍 아라육로152번길 100 현대프리미엄아울렛 WEST 2층','김포',37.597228,126.785221,4.10,65,'031-8048-2367','https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/store/default.jpg');

INSERT INTO TKK.store (name, one_line_desc, address, region_name, latitude, longitude, avg_rating, bookmark_count, phone, image_url)
VALUES ('챌린저 현대시티몰 가든파이브점','가든파이브 내 라이프스타일·스트리트 굿즈샵','서울 송파구 충민로 66 현대시티아울렛 가든파이브 4층','송파/가든파이브',37.477858,127.124712,4.00,55,'02-2673-2456','https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/store/default.jpg');

INSERT INTO TKK.store (name, one_line_desc, address, region_name, latitude, longitude, avg_rating, bookmark_count, phone, image_url)
VALUES ('챌린저 스타필드 하남점','스타필드 하남 2층 스트리트 브랜드 팝업스토어','경기 하남시 미사대로 750 스타필드 하남 2층','경기/하남',37.545489,127.224333,4.20,90,'031-8072-8643','https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/store/default.jpg');

INSERT INTO TKK.store (name, one_line_desc, address, region_name, latitude, longitude, avg_rating, bookmark_count, phone, image_url)
VALUES ('브라더굿즈 강남점','신논현·강남역 사이 가챠·캐릭터 굿즈 전문샵','서울 강남구 강남대로102길 13 골든포레 지하 1층','강남/신논현',37.501479,127.026967,0.00,0,'070-8657-2790','https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/store/default.jpg');

INSERT INTO TKK.store (name, one_line_desc, address, region_name, latitude, longitude, avg_rating, bookmark_count, phone, image_url)
VALUES ('피규어뮤지엄W','청담동에 위치한 피규어 전시·판매 전문 박물관','서울 강남구 선릉로158길 3','청담/강남',37.5257998,127.040352,4.80,320,'미등록','https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/store/default.jpg');

INSERT INTO TKK.store (name, one_line_desc, address, region_name, latitude, longitude, avg_rating, bookmark_count, phone, image_url)
VALUES ('POP MART 코엑스몰점','스타필드 코엑스몰 내 블라인드 피규어 전문 매장','서울 강남구 영동대로 513 코엑스몰 B1층','코엑스/삼성',37.51148310935,127.06033711446,4.60,280,'미등록','https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/store/default.jpg');

INSERT INTO TKK.store (name, one_line_desc, address, region_name, latitude, longitude, avg_rating, bookmark_count, phone, image_url)
VALUES ('POP MART 용산 아이파크몰점','용산역 아이파크몰 내 팝마트 오프라인 매장','서울 용산구 한강대로23길 55 아이파크몰','용산',37.52890681,126.9646345,4.50,240,'미등록','https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/store/default.jpg');

INSERT INTO TKK.store (name, one_line_desc, address, region_name, latitude, longitude, avg_rating, bookmark_count, phone, image_url)
VALUES ('POP MART 수원 AK플라자점','수원역 AK플라자 내 블라인드 피규어·굿즈 매장','경기 수원시 팔달구 덕영대로 924 AK플라자 수원점','수원',37.266124,127.000158,4.40,190,'미등록','https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/store/default.jpg');

INSERT INTO TKK.store (name, one_line_desc, address, region_name, latitude, longitude, avg_rating, bookmark_count, phone, image_url)
VALUES ('POP MART 스타필드 안성점','스타필드 안성 내 팝마트 블라인드 피규어샵','경기 안성시 공도읍 서동대로 3930-39 스타필드 안성','안성',36.9946845979,127.1472661744,4.30,160,'미등록','https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/store/default.jpg');

INSERT INTO TKK.store (name, one_line_desc, address, region_name, latitude, longitude, avg_rating, bookmark_count, phone, image_url)
VALUES ('POP MART 홍대 플래그십 스토어','홍대 걷고싶은거리 인근 대형 플래그십 굿즈 매장','서울 마포구 와우산로23길 56','홍대',37.555249646612,126.92371442151,4.50,260,'미등록','https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/store/default.jpg');

INSERT INTO TKK.store (name, one_line_desc, address, region_name, latitude, longitude, avg_rating, bookmark_count, phone, image_url)
VALUES ('애니플러스 합정점','TV 애니메이션 공식 굿즈·피규어 전문샵','서울 마포구 월드컵로3길 14','합정',37.550494907182,126.91193741226,4.60,210,'미등록','https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/store/default.jpg');

INSERT INTO TKK.store (name, one_line_desc, address, region_name, latitude, longitude, avg_rating, bookmark_count, phone, image_url)
VALUES ('브라더굿즈 강남점','역삼역 인근 애니·게임 캐릭터 굿즈 편집샵','서울 강남구 강남대로102길 13 B1층','강남',37.501967358069,127.02683991652,4.70,220,'미등록','https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/store/default.jpg');

INSERT INTO TKK.store (name, one_line_desc, address, region_name, latitude, longitude, avg_rating, bookmark_count, phone, image_url)
VALUES ('더쿠 수원점','수원역 인근 애니·게임 굿즈·가챠 전문샵','경기 수원시 팔달구 향교로3번길 17 2층','수원',37.268309157635,127.00144533428,4.50,180,'미등록','https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/store/default.jpg');

INSERT INTO TKK.store (name, one_line_desc, address, region_name, latitude, longitude, avg_rating, bookmark_count, phone, image_url)
VALUES ('조이하비 신도림점','신도림 테크노마트 내 프라모델·RC·건담 대형 매장','서울 구로구 새말로 97 신도림테크노마트 3층','신도림',37.5073194,126.8901556,4.60,250,'미등록','https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/store/default.jpg');

INSERT INTO TKK.store (name, one_line_desc, address, region_name, latitude, longitude, avg_rating, bookmark_count, phone, image_url)
VALUES ('포켓몬 팝업스토어 롯데월드몰점','잠실 롯데월드몰 아트리움 일대 포켓몬 공식 팝업스토어','서울 송파구 올림픽로 300 롯데월드몰 1층 아트리움','잠실/롯데월드몰',37.513100,127.103400,4.60,240,'미등록','https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/store/default.jpg');

INSERT INTO TKK.store (name, one_line_desc, address, region_name, latitude, longitude, avg_rating, bookmark_count, phone, image_url)
VALUES ('카카오프렌즈 롯데월드몰점','카카오프렌즈 캐릭터 중심 공식 굿즈샵','서울 송파구 올림픽로 300 롯데월드몰 5층','잠실/롯데월드몰',37.513100,127.103400,4.50,210,'미등록','https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/store/default.jpg');

INSERT INTO TKK.store (name, one_line_desc, address, region_name, latitude, longitude, avg_rating, bookmark_count, phone, image_url)
VALUES ('라인프렌즈 럭키하우스 롯데월드몰점','브라운·코니·BT21 등 라인프렌즈 팝업형 굿즈샵','서울 송파구 올림픽로 300 롯데월드몰 1층','잠실/롯데월드몰',37.513100,127.103400,4.40,190,'미등록','https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/store/default.jpg');

INSERT INTO TKK.store (name, one_line_desc, address, region_name, latitude, longitude, avg_rating, bookmark_count, phone, image_url)
VALUES ('타미야 팩토리 롯데월드몰점','프라모델·미니카 등 타미야 제품 전문 매장','서울 송파구 올림픽로 300 롯데월드몰 지하1층','잠실/롯데월드몰',37.513100,127.103400,4.50,160,'미등록','https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/store/default.jpg');

INSERT INTO TKK.store (name, one_line_desc, address, region_name, latitude, longitude, avg_rating, bookmark_count, phone, image_url)
VALUES ('레고스토어 롯데월드몰점','공식 레고 스토어, 다양한 시리즈와 피규어 판매','서울 송파구 올림픽로 300 롯데월드몰 지하1층','잠실/롯데월드몰',37.513100,127.103400,4.70,280,'미등록','https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/store/default.jpg');

INSERT INTO TKK.store (name, one_line_desc, address, region_name, latitude, longitude, avg_rating, bookmark_count, phone, image_url)
VALUES ('건담베이스 스타필드 코엑스몰점','반다이 건담 프라모델 전문 매장','서울 강남구 영동대로 513 스타필드 코엑스몰 지하2층','코엑스/삼성',37.511483,127.060337,4.70,260,'미등록','https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/store/default.jpg');

INSERT INTO TKK.store (name, one_line_desc, address, region_name, latitude, longitude, avg_rating, bookmark_count, phone, image_url)
VALUES ('레고스토어 코엑스점','공식 레고 스토어 코엑스 플래그십 매장','서울 강남구 영동대로 513 스타필드 코엑스몰 지하1층','코엑스/삼성',37.511483,127.060337,4.60,230,'미등록','https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/store/default.jpg');

INSERT INTO TKK.store (name, one_line_desc, address, region_name, latitude, longitude, avg_rating, bookmark_count, phone, image_url)
VALUES ('나비타월드 스타필드 코엑스몰점','피규어·프라모델·보드게임 편집 키덜트샵','서울 강남구 영동대로 513 스타필드 코엑스몰 지하1층','코엑스/삼성',37.511483,127.060337,4.40,150,'미등록','https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/store/default.jpg');

INSERT INTO TKK.store (name, one_line_desc, address, region_name, latitude, longitude, avg_rating, bookmark_count, phone, image_url)
VALUES ('라인프렌즈 스토어 타임스퀘어점','라인프렌즈·BT21 캐릭터 공식 굿즈샵','서울 영등포구 영중로 15 타임스퀘어 지하2층 원더플레이스 내','영등포/타임스퀘어',37.517834,126.905382,4.50,200,'미등록','https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/store/default.jpg');

INSERT INTO TKK.store (name, one_line_desc, address, region_name, latitude, longitude, avg_rating, bookmark_count, phone, image_url)
VALUES ('토이킹덤 타임스퀘어 영등포점','대형 장난감·보드게임·피규어 전문 매장','서울 영등포구 영중로 15 타임스퀘어 지하1층','영등포/타임스퀘어',37.517834,126.905382,4.40,180,'미등록','https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/store/default.jpg');

INSERT INTO TKK.store (name, one_line_desc, address, region_name, latitude, longitude, avg_rating, bookmark_count, phone, image_url)
VALUES ('반다이 펀스퀘어 타임스퀘어점','반다이 피규어·프라모델·가챠 전문 편집샵','서울 영등포구 영중로 15 타임스퀘어 4층 펀스퀘어','영등포/타임스퀘어',37.517834,126.905382,4.30,160,'미등록','https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/store/default.jpg');

INSERT INTO TKK.store (name, one_line_desc, address, region_name, latitude, longitude, avg_rating, bookmark_count, phone, image_url)
VALUES ('토이킹덤 스타필드 고양점','대형 완구·피규어·보드게임 전문 장난감 왕국','경기 고양시 덕양구 고양대로 1955 스타필드 고양 3층 토이킹덤','고양/스타필드고양',37.647056,126.896011,4.50,190,'미등록','https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/store/default.jpg');

INSERT INTO TKK.store (name, one_line_desc, address, region_name, latitude, longitude, avg_rating, bookmark_count, phone, image_url)
VALUES ('레고스토어 스타필드 고양점','공식 레고 스토어, 전시·체험 가능한 매장','경기 고양시 덕양구 고양대로 1955 스타필드 고양 3층 레고스토어','고양/스타필드고양',37.647056,126.896011,4.60,210,'미등록','https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/store/default.jpg');

INSERT INTO TKK.store (name, one_line_desc, address, region_name, latitude, longitude, avg_rating, bookmark_count, phone, image_url)
VALUES ('마이크로킥보드 스타필드 고양점','킥보드·키즈 모빌리티 중심 라이프스타일 굿즈샵','경기 고양시 덕양구 고양대로 1955 스타필드 고양 3층 마이크로킥보드','고양/스타필드고양',37.647056,126.896011,4.20,120,'미등록','https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/store/default.jpg');

INSERT INTO TKK.store (name, one_line_desc, address, region_name, latitude, longitude, avg_rating, bookmark_count, phone, image_url)
VALUES ('토이킹덤 스타필드 하남점','대형 토이·피규어·보드게임 전문 매장','경기 하남시 미사대로 750 스타필드 하남 3층 토이킹덤','하남/스타필드하남',37.545490,127.224330,4.50,210,'미등록','https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/store/default.jpg');

INSERT INTO TKK.store (name, one_line_desc, address, region_name, latitude, longitude, avg_rating, bookmark_count, phone, image_url)
VALUES ('레고스토어 스타필드 하남점','국내 최대 규모 레고 공식 스토어','경기 하남시 미사대로 750 스타필드 하남 3층 레고스토어','하남/스타필드하남',37.545490,127.224330,4.70,260,'미등록','https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/store/default.jpg');

INSERT INTO TKK.store (name, one_line_desc, address, region_name, latitude, longitude, avg_rating, bookmark_count, phone, image_url)
VALUES ('브루클린웍스 스타필드 하남점','캠핑·아웃도어 감성 굿즈 전문 편집샵','경기 하남시 미사대로 750 스타필드 하남 2층 브루클린웍스','하남/스타필드하남',37.545490,127.224330,4.30,130,'미등록','https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/store/default.jpg');

INSERT INTO TKK.store (name, one_line_desc, address, region_name, latitude, longitude, avg_rating, bookmark_count, phone, image_url)
VALUES ('자라홈 스타필드 하남점','캐릭터·디자인 소품 포함 라이프스타일 홈굿즈샵','경기 하남시 미사대로 750 스타필드 하남 1층 자라홈','하남/스타필드하남',37.545490,127.224330,4.20,140,'미등록','https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/store/default.jpg');

INSERT INTO TKK.store (name, one_line_desc, address, region_name, latitude, longitude, avg_rating, bookmark_count, phone, image_url)
VALUES ('레고스토어 현대백화점 판교점','현대백화점 판교점 내 레고 공식 스토어','경기 성남시 분당구 판교역로 146 현대백화점 판교점 지하1층','성남/판교',37.392739,127.112094,4.60,220,'미등록','https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/store/default.jpg');

INSERT INTO TKK.store (name, one_line_desc, address, region_name, latitude, longitude, avg_rating, bookmark_count, phone, image_url)
VALUES ('닌텐도 스토어 현대백화점 판교점','닌텐도 콘솔·게임·피규어 굿즈 전문 매장','경기 성남시 분당구 판교역로 146 현대백화점 판교점','성남/판교',37.392739,127.112094,4.50,180,'미등록','https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/store/default.jpg');

INSERT INTO TKK.store (name, one_line_desc, address, region_name, latitude, longitude, avg_rating, bookmark_count, phone, image_url)
VALUES ('건담베이스 롯데 영플라자 본점','명동 롯데영플라자 지하1층 반다이 프라모델 전문샵','서울 중구 남대문로 67 롯데영플라자 지하1층 건담베이스','명동/영플라자',37.563630,126.982010,4.70,270,'미등록','https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/store/default.jpg');

INSERT INTO TKK.store (name, one_line_desc, address, region_name, latitude, longitude, avg_rating, bookmark_count, phone, image_url)
VALUES ('라인프렌즈 스토어 롯데 영플라자 명동점','라인프렌즈 캐릭터 인형·문구·패션 굿즈샵','서울 중구 남대문로 67 롯데영플라자 1층 라인프렌즈 스토어','명동/영플라자',37.563630,126.982010,4.60,230,'미등록','https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/store/default.jpg');

INSERT INTO TKK.store (name, one_line_desc, address, region_name, latitude, longitude, avg_rating, bookmark_count, phone, image_url)
VALUES ('라인프렌즈 월드 팝업스토어 롯데 영플라자점','BT21·미니니 등 IPX 캐릭터 종합 팝업스토어','서울 중구 남대문로 67 롯데영플라자 1층 라인프렌즈 월드 팝업','명동/영플라자',37.563630,126.982010,4.50,190,'미등록','https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/store/default.jpg');

INSERT INTO TKK.store (name, one_line_desc, address, region_name, latitude, longitude, avg_rating, bookmark_count, phone, image_url)
VALUES ('모노폴리 롯데 영플라자 명동점','BT21·라인프렌즈 등 라이선스 캐릭터 편집 굿즈샵','서울 중구 남대문로 67 롯데영플라자 지하1층 모노폴리 매장','명동/영플라자',37.563630,126.982010,4.40,160,'미등록','https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/store/default.jpg');

SELECT 1 FROM dual;
COMMIT;







-- ✅ Oracle용 (TKK.STORE_GOODS) : NOW() -> SYSDATE, 다건 VALUES -> 단건 INSERT로 변환
-- goods_id는 IDENTITY라서 컬럼에 안 넣음

INSERT INTO TKK.STORE_GOODS (store_id, name, work_name, character_name, category, price, stock_qty, thumbnail_url, created_at)
VALUES (1, 'BIG SOFVIMATES 루피 피규어', '원피스', '몽키 D. 루피', '피규어', 28000, 8, 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/goods/%EC%9B%90%ED%94%BC%EC%8A%A4/%EC%9B%90%ED%94%BC%EC%8A%A4+BIG+SOFVIMATES+%ED%94%BC%EA%B7%9C%EC%96%B4+-+%EB%AA%BD%ED%82%A4+D.+%EB%A3%A8%ED%94%BC.png', SYSDATE);

INSERT INTO TKK.STORE_GOODS (store_id, name, work_name, character_name, category, price, stock_qty, thumbnail_url, created_at)
VALUES (1, 'BIG SOFVIMATES 쵸파 드럼왕국 Ver.', '원피스', '토니토니 쵸파', '피규어', 26000, 10, 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/goods/%EC%9B%90%ED%94%BC%EC%8A%A4/%EC%9B%90%ED%94%BC%EC%8A%A4+BIG+SOFVIMATES+%ED%94%BC%EA%B7%9C%EC%96%B4+-+%EC%B5%B8%ED%8C%8C+%EB%93%9C%EB%9F%BC+%EC%99%95%EA%B5%AD+Ver..png', SYSDATE);

INSERT INTO TKK.STORE_GOODS (store_id, name, work_name, character_name, category, price, stock_qty, thumbnail_url, created_at)
VALUES (1, 'DXF 그랜드라인 스페셜 트라팔가 로우', '원피스', '트라팔가 로우', '피규어', 32000, 6, 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/goods/%EC%9B%90%ED%94%BC%EC%8A%A4/%EC%9B%90%ED%94%BC%EC%8A%A4+DXF+%EA%B7%B8%EB%9E%9C%EB%93%9C%EB%9D%BC%EC%9D%B8+%EC%8B%9C%EB%A6%AC%EC%A6%88+%EC%8A%A4%ED%8E%98%EC%85%9C+%ED%94%BC%EA%B7%9C%EC%96%B4+-+%ED%8A%B8%EB%9D%BC%ED%8C%94%EA%B0%80+%EB%A1%9C%EC%9A%B0.png', SYSDATE);

INSERT INTO TKK.STORE_GOODS (store_id, name, work_name, character_name, category, price, stock_qty, thumbnail_url, created_at)
VALUES (1, 'GRANDISTA 루피 스페셜 에디션', '원피스', '몽키 D. 루피', '피규어', 35000, 5, 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/goods/%EC%9B%90%ED%94%BC%EC%8A%A4/%EC%9B%90%ED%94%BC%EC%8A%A4+GRANDISTA+%EA%B7%B8%EB%9E%9C%EB%94%94%EC%8A%A4%ED%83%80+%ED%94%BC%EA%B7%9C%EC%96%B4+-+%EB%AA%BD%ED%82%A4+D.+%EB%A3%A8%ED%94%BC+%EC%8A%A4%ED%8E%98%EC%85%9C+%EC%97%90%EB%94%94%EC%85%98.png', SYSDATE);

INSERT INTO TKK.STORE_GOODS (store_id, name, work_name, character_name, category, price, stock_qty, thumbnail_url, created_at)
VALUES (1, 'THEORAMA SOUL 샹크스', '원피스', '샹크스', '피규어', 68000, 3, 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/goods/%EC%9B%90%ED%94%BC%EC%8A%A4/%EC%9B%90%ED%94%BC%EC%8A%A4+THEORAMA+SOUL+%ED%94%BC%EA%B7%9C%EC%96%B4+-+%EC%83%B9%ED%81%AC%EC%8A%A4.png', SYSDATE);

INSERT INTO TKK.STORE_GOODS (store_id, name, work_name, character_name, category, price, stock_qty, thumbnail_url, created_at)
VALUES (1, '메가 월드 콜렉터블 루피 VS 키자루', '원피스', '몽키 D. 루피', '피규어', 55000, 4, 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/goods/%EC%9B%90%ED%94%BC%EC%8A%A4/%EC%9B%90%ED%94%BC%EC%8A%A4+%EB%A9%94%EA%B0%80+%EC%9B%94%EB%93%9C+%EC%BD%9C%EB%A0%89%ED%84%B0%EB%B8%94+%ED%94%BC%EA%B7%9C%EC%96%B4+-+%EB%AA%BD%ED%82%A4+D.+%EB%A3%A8%ED%94%BC+VS+%EB%B3%BC%EC%82%AC%EB%A6%AC%EB%85%B8++%ED%82%A4%EC%9E%90%EB%A3%A8.png', SYSDATE);

INSERT INTO TKK.STORE_GOODS (store_id, name, work_name, character_name, category, price, stock_qty, thumbnail_url, created_at)
VALUES (1, 'POP KxMAXIMUM 상디', '원피스', '상디', '포스터', 198000, 2, 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/goods/%EC%9B%90%ED%94%BC%EC%8A%A4/%EC%9B%90%ED%94%BC%EC%8A%A4+%EB%A9%94%EA%B0%80%ED%95%98%EC%9A%B0%EC%8A%A4+PoP+Portrait.Of.Pirates+KxMAXIMUM+%ED%94%BC%EA%B7%9C%EC%96%B4+-+%EC%83%81%EB%94%94.jpg', SYSDATE);

INSERT INTO TKK.STORE_GOODS (store_id, name, work_name, character_name, category, price, stock_qty, thumbnail_url, created_at)
VALUES (1, 'POP NEO-MAXIMUM 흰 수염', '원피스', '에드워드 뉴게이트', '포스터', 298000, 1, 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/goods/%EC%9B%90%ED%94%BC%EC%8A%A4/%EC%9B%90%ED%94%BC%EC%8A%A4+%EB%A9%94%EA%B0%80%ED%95%98%EC%9A%B0%EC%8A%A4+POP+Portrait.Of.Pirates+NEO-MAXIMUM+%ED%94%BC%EA%B7%9C%EC%96%B4+-+%EC%97%90%EB%93%9C%EC%9B%8C%EB%93%9C+%EB%89%B4%EA%B2%8C%EC%9D%B4%ED%8A%B8++%ED%9D%B0+%EC%88%98%EC%97%BC.jpg', SYSDATE);

INSERT INTO TKK.STORE_GOODS (store_id, name, work_name, character_name, category, price, stock_qty, thumbnail_url, created_at)
VALUES (1, 'POP WA-MAXIMUM 바다의 협객 징베', '원피스', '징베', '포스터', 210000, 2, 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/goods/%EC%9B%90%ED%94%BC%EC%8A%A4/%ED%94%BC%EC%8A%A4+%EB%A9%94%EA%B0%80%ED%95%98%EC%9A%B0%EC%8A%A4+PoP+Portrait.Of.Pirates+WA-MAXIMUM+%ED%94%BC%EA%B7%9C%EC%96%B4+-+%EB%B0%94%EB%8B%A4%EC%9D%98+%ED%98%91%EA%B0%9D+%EC%A7%95%EB%B2%A0.jpg', SYSDATE);

INSERT INTO TKK.STORE_GOODS (store_id, name, work_name, character_name, category, price, stock_qty, thumbnail_url, created_at)
VALUES (1, '기어5 루피 스페셜 액션 피규어', '원피스', '몽키 D. 루피', '피규어', 72000, 3, 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/goods/%EC%9B%90%ED%94%BC%EC%8A%A4/%EC%9B%90%ED%94%BC%EC%8A%A4+%EB%A9%94%EA%B0%80%ED%95%98%EC%9A%B0%EC%8A%A4+%EB%A3%A9%EC%97%85+%ED%94%BC%EA%B7%9C%EC%96%B4+-+%EB%AA%BD%ED%82%A4+D.+%EB%A3%A8%ED%94%BC+%EA%B8%B0%EC%96%B4+5.jpg', SYSDATE);

INSERT INTO TKK.STORE_GOODS (store_id, name, work_name, character_name, category, price, stock_qty, thumbnail_url, created_at)
VALUES (1, '하이큐 Yummy 마스코트 A5 엽서 세트', '하이큐', '히나타 쇼요', '엽서', 12000, 15, 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/goods/%ED%95%98%EC%9D%B4%ED%81%90/%ED%95%98%EC%9D%B4%ED%81%90+Yummy+%EB%A7%88%EC%8A%A4%EC%BD%94%ED%8A%B8+%EC%8B%9C%EB%A6%AC%EC%A6%88+%EA%B3%B5%EC%8B%9D+A5+%EC%97%BD%EC%84%9C+%EC%84%B8%ED%8A%B8.png', SYSDATE);

INSERT INTO TKK.STORE_GOODS (store_id, name, work_name, character_name, category, price, stock_qty, thumbnail_url, created_at)
VALUES (1, '푸리누이타치 드림 미니 봉제인형', '하이큐', '보쿠토 코타로', '봉제인형', 22000, 8, 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/goods/%ED%95%98%EC%9D%B4%ED%81%90/%ED%95%98%EC%9D%B4%ED%81%90+%EA%B5%BF%EC%A6%88+%EB%B0%98%EB%8B%A4%EC%9D%B4+%EB%82%A8%EC%BD%94+%EB%88%84%EC%9D%B4+%ED%91%B8%EB%A6%AC%EB%88%84%EC%9D%B4%ED%83%80%EC%B9%98+%EB%93%9C%EB%A6%BC+%EB%AF%B8%EB%8B%88+%EB%B4%89%EC%A0%9C%EC%9D%B8%ED%98%95+-+%EB%B3%B4%EC%BF%A0%ED%86%A0+%EC%BD%94%ED%83%80%EB%A1%9C.jpg', SYSDATE);

INSERT INTO TKK.STORE_GOODS (store_id, name, work_name, character_name, category, price, stock_qty, thumbnail_url, created_at)
VALUES (1, 'Mocho 시리즈 아크릴 스탠드 3탄', '하이큐', '쿠로오 테츠로', '아크릴스탠드', 18000, 10, 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/goods/%ED%95%98%EC%9D%B4%ED%81%90/%ED%95%98%EC%9D%B4%ED%81%90+%EA%B5%BF%EC%A6%88+%EC%8B%B1%ED%81%AC+%EC%9D%B4%EB%85%B8%EB%B2%A0%EC%9D%B4%EC%85%98+Mocho+%EC%8B%9C%EB%A6%AC%EC%A6%88+3%ED%83%84+%EC%95%84%ED%81%AC%EB%A6%B4+%EC%8A%A4%ED%83%A0%EB%93%9C+-+%EC%BF%A0%EB%A1%9C%EC%98%A4+%ED%85%8C%EC%B8%A0%EB%A1%9C.jpg', SYSDATE);

INSERT INTO TKK.STORE_GOODS (store_id, name, work_name, character_name, category, price, stock_qty, thumbnail_url, created_at)
VALUES (1, 'Mocho 시리즈 아크릴 키체인 4탄', '하이큐', '코모리 모토야', '아크릴키링', 9000, 20, 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/goods/%ED%95%98%EC%9D%B4%ED%81%90/%ED%95%98%EC%9D%B4%ED%81%90+%EA%B5%BF%EC%A6%88+%EC%8B%B1%ED%81%AC+%EC%9D%B4%EB%85%B8%EB%B2%A0%EC%9D%B4%EC%85%98+Mocho+%EC%8B%9C%EB%A6%AC%EC%A6%88+4%ED%83%84+%EC%95%84%ED%81%AC%EB%A6%B4+%ED%82%A4%EC%B2%B4%EC%9D%B8+-+%EC%BD%94%EB%AA%A8%EB%A6%AC+%EB%AA%A8%ED%86%A0%EC%95%BC.jpg', SYSDATE);

INSERT INTO TKK.STORE_GOODS (store_id, name, work_name, character_name, category, price, stock_qty, thumbnail_url, created_at)
VALUES (1, '치미케모 마스코트 봉제인형 JF2026', '하이큐', '쿠로오 테츠로', '봉제인형', 32000, 5, 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/goods/%ED%95%98%EC%9D%B4%ED%81%90/%ED%95%98%EC%9D%B4%ED%81%90+%EA%B5%BF%EC%A6%88+%EC%97%94%EC%8A%A4%EC%B9%B4%EC%9D%B4+JF+2026+%EC%B4%88%ED%8A%B9%EB%8C%80+%EC%B9%98%EB%AF%B8%EC%BC%80%EB%AA%A8+%EB%A7%88%EC%8A%A4%EC%BD%94%ED%8A%B8+%EB%B4%89%EC%A0%9C%EC%9D%B8%ED%98%95++%EB%88%84%EC%9D%B4+-+%EC%BF%A0%EB%A1%9C%EC%98%A4+%ED%85%8C%EC%B8%A0%EB%A1%9C.png', SYSDATE);

INSERT INTO TKK.STORE_GOODS (store_id, name, work_name, character_name, category, price, stock_qty, thumbnail_url, created_at)
VALUES (1, '치미케모 마스코트 봉제인형 JF2026', '하이큐', '히나타 쇼요', '봉제인형', 32000, 6, 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/goods/%ED%95%98%EC%9D%B4%ED%81%90/%ED%95%98%EC%9D%B4%ED%81%90+%EA%B5%BF%EC%A6%88+%EC%97%94%EC%8A%A4%EC%B9%B4%EC%9D%B4+JF+2026+%EC%B4%88%ED%8A%B9%EB%8C%80+%EC%B9%98%EB%AF%B8%EC%BC%80%EB%AA%A8+%EB%A7%88%EC%8A%A4%EC%BD%94%ED%8A%B8+%EB%B4%89%EC%A0%9C%EC%9D%B8%ED%98%95++%EB%88%84%EC%9D%B4+-+%ED%9E%88%EB%82%98%ED%83%80+%EC%87%BC%EC%9A%94.png', SYSDATE);

INSERT INTO TKK.STORE_GOODS (store_id, name, work_name, character_name, category, price, stock_qty, thumbnail_url, created_at)
VALUES (1, '점프 아크릴 기가 피규어 스탠드', '하이큐', '아카아시 케이지', '아크릴스탠드', 29000, 7, 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/goods/%ED%95%98%EC%9D%B4%ED%81%90/%ED%95%98%EC%9D%B4%ED%81%90+%EA%B5%BF%EC%A6%88+%EC%A0%90%ED%94%84+%EC%95%84%ED%81%AC%EB%A6%B4+%EA%B8%B0%EA%B0%80+%ED%94%BC%EA%B7%9C%EC%96%B4+%EC%8A%A4%ED%83%A0%EB%93%9C+-+%EC%95%84%EC%B9%B4%EC%95%84%EC%8B%9C+%EC%BC%80%EC%9D%B4%EC%A7%80.png', SYSDATE);

INSERT INTO TKK.STORE_GOODS (store_id, name, work_name, character_name, category, price, stock_qty, thumbnail_url, created_at)
VALUES (1, 'JF2026 아크릴 스탠드', '하이큐', '코즈메 켄마', '아크릴스탠드', 25000, 6, 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/goods/%ED%95%98%EC%9D%B4%ED%81%90/%ED%95%98%EC%9D%B4%ED%81%90+%EA%B5%BF%EC%A6%88+%ED%83%80%EC%B9%B4%EB%9D%BC%ED%86%A0%EB%AF%B8+%EC%95%84%EC%B8%A0+JF+2026+%EC%95%84%ED%81%AC%EB%A6%B4+%EC%8A%A4%ED%83%A0%EB%93%9C+-+%EC%BD%94%EC%A6%88%EB%A9%94+%EC%BC%84%EB%A7%88.png', SYSDATE);

INSERT INTO TKK.STORE_GOODS (store_id, name, work_name, character_name, category, price, stock_qty, thumbnail_url, created_at)
VALUES (1, '룩업 피규어 유니폼 Ver.', '하이큐', '카게야마 토비오', '피규어', 42000, 4, 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/goods/%ED%95%98%EC%9D%B4%ED%81%90/%ED%95%98%EC%9D%B4%ED%81%90+%EB%A9%94%EA%B0%80%ED%95%98%EC%9A%B0%EC%8A%A4+%EB%A3%A9%EC%97%85+%ED%94%BC%EA%B7%9C%EC%96%B4+-+%EC%B9%B4%EA%B2%8C%EC%95%BC%EB%A7%88+%ED%86%A0%EB%B9%84%EC%98%A4+%EC%9C%A0%EB%8B%88%ED%8F%BC+Ver..png', SYSDATE);

INSERT INTO TKK.STORE_GOODS (store_id, name, work_name, character_name, category, price, stock_qty, thumbnail_url, created_at)
VALUES (1, '룩업 피규어 유니폼 Ver.', '하이큐', '히나타 쇼요', '피규어', 42000, 5, 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/goods/%ED%95%98%EC%9D%B4%ED%81%90/%ED%95%98%EC%9D%B4%ED%81%90+%EB%A9%94%EA%B0%80%ED%95%98%EC%9A%B0%EC%8A%A4+%EB%A3%A9%EC%97%85+%ED%94%BC%EA%B7%9C%EC%96%B4+-+%ED%9E%88%EB%82%98%ED%83%80+%EC%87%BC%EC%9A%94+%EC%9C%A0%EB%8B%88%ED%8F%BC+Ver..png', SYSDATE);

INSERT INTO TKK.STORE_GOODS (store_id, name, work_name, character_name, category, price, stock_qty, thumbnail_url, created_at)
VALUES (1, '넨도로이드 1194 카마도 네즈코', '귀멸의 칼날', '카마도 네즈코', '피규어', 62000, 5, 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/goods/%EA%B7%80%EC%B9%BC/%EA%B7%80%EB%A9%B8%EC%9D%98+%EC%B9%BC%EB%82%A0+%EA%B5%BF%EC%8A%A4%EB%A7%88%EC%9D%BC+%EC%BB%B4%ED%8D%BC%EB%8B%88+%EB%84%A8%EB%8F%84%EB%A1%9C%EC%9D%B4%EB%93%9C+1194+%ED%94%BC%EA%B7%9C%EC%96%B4+-+%EC%B9%B4%EB%A7%88%EB%8F%84+%EB%84%A4%EC%A6%88%EC%BD%94.png', SYSDATE);

INSERT INTO TKK.STORE_GOODS (store_id, name, work_name, character_name, category, price, stock_qty, thumbnail_url, created_at)
VALUES (1, '넨도로이드 1334 아가츠마 젠이츠', '귀멸의 칼날', '아가츠마 젠이츠', '피규어', 62000, 4, 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/goods/%EA%B7%80%EC%B9%BC/%EA%B7%80%EB%A9%B8%EC%9D%98+%EC%B9%BC%EB%82%A0+%EA%B5%BF%EC%8A%A4%EB%A7%88%EC%9D%BC+%EC%BB%B4%ED%8D%BC%EB%8B%88+%EB%84%A8%EB%8F%84%EB%A1%9C%EC%9D%B4%EB%93%9C+1334+%ED%94%BC%EA%B7%9C%EC%96%B4+-+%EC%95%84%EA%B0%80%EC%B8%A0%EB%A7%88+%EC%A0%A0%EC%9D%B4%EC%B8%A0.png', SYSDATE);

INSERT INTO TKK.STORE_GOODS (store_id, name, work_name, character_name, category, price, stock_qty, thumbnail_url, created_at)
VALUES (1, 'Fluffy Puffy 챠챠마루 피규어', '귀멸의 칼날', '챠챠마루', '피규어', 28000, 9, 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/goods/%EA%B7%80%EC%B9%BC/%EA%B7%80%EB%A9%B8%EC%9D%98+%EC%B9%BC%EB%82%A0+%EA%B7%80%EC%B9%BC+Fluffy+Puffy+%ED%94%8C%EB%9F%AC%ED%94%BC+%ED%8D%BC%ED%94%BC+%ED%94%BC%EA%B7%9C%EC%96%B4+-+%EC%B1%A0%EC%B1%A0%EB%A7%88%EB%A3%A8.jpg', SYSDATE);

INSERT INTO TKK.STORE_GOODS (store_id, name, work_name, character_name, category, price, stock_qty, thumbnail_url, created_at)
VALUES (1, 'PalVerse 피규어 1탄 랜덤', '귀멸의 칼날', '랜덤', '피규어', 12000, 20, 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/goods/%EA%B7%80%EC%B9%BC/%EA%B7%80%EB%A9%B8%EC%9D%98+%EC%B9%BC%EB%82%A0+%EA%B7%80%EC%B9%BC+%EA%B5%BF%EC%A6%88+%EB%B6%80%EC%8B%9C%EB%A1%9C%EB%93%9C+%ED%81%AC%EB%A6%AC%EC%97%90%EC%9D%B4%ED%8B%B0%EB%B8%8C+PalVerse+%ED%94%BC%EA%B7%9C%EC%96%B4+1%ED%83%84+%EB%9E%9C%EB%8D%A4+%EB%8B%A8%ED%92%88.jpg', SYSDATE);

INSERT INTO TKK.STORE_GOODS (store_id, name, work_name, character_name, category, price, stock_qty, thumbnail_url, created_at)
VALUES (1, '모치코로링 누이 봉제인형 7탄 랜덤', '귀멸의 칼날', '랜덤', '봉제인형', 14000, 18, 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/goods/%EA%B7%80%EC%B9%BC/%EA%B7%80%EB%A9%B8%EC%9D%98+%EC%B9%BC%EB%82%A0+%EA%B7%80%EC%B9%BC+%EA%B5%BF%EC%A6%88+%EC%A4%91%EC%99%B8%EA%B4%91%EC%97%85+%EB%AC%B4%ED%95%9C%EC%84%B1%ED%8E%B8+%EC%A0%9C1%EC%9E%A5+%EB%AA%A8%EC%B9%98%EC%BD%94%EB%A1%9C%EB%A7%81+%EB%88%84%EC%9D%B4+%EB%B4%89%EC%A0%9C%EC%9D%B8%ED%98%95+7%ED%83%84+%EB%9E%9C%EB%8D%A4+%EB%8B%A8%ED%92%88jpg.jpg', SYSDATE);

INSERT INTO TKK.STORE_GOODS (store_id, name, work_name, character_name, category, price, stock_qty, thumbnail_url, created_at)
VALUES (1, '피탄코 러버 스트랩 A 랜덤', '귀멸의 칼날', '랜덤', '러버스트랩', 8000, 25, 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/goods/%EA%B7%80%EC%B9%BC/%EA%B7%80%EB%A9%B8%EC%9D%98+%EC%B9%BC%EB%82%A0+%EA%B7%80%EC%B9%BC+%EA%B5%BF%EC%A6%88+%EC%A4%91%EC%99%B8%EA%B4%91%EC%97%85+%EB%AC%B4%ED%95%9C%EC%84%B1%ED%8E%B8+%EC%A0%9C1%EC%9E%A5+%ED%94%BC%ED%83%84%EC%BD%94+%EB%9F%AC%EB%B2%84+%EC%8A%A4%ED%8A%B8%EB%9E%A9+A+%EB%9E%9C%EB%8D%A4+%EB%8B%A8%ED%92%88.jpg', SYSDATE);

INSERT INTO TKK.STORE_GOODS (store_id, name, work_name, character_name, category, price, stock_qty, thumbnail_url, created_at)
VALUES (1, '룩업 피규어 아가츠마 젠이츠', '귀멸의 칼날', '아가츠마 젠이츠', '피규어', 42000, 6, 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/goods/%EA%B7%80%EC%B9%BC/%EA%B7%80%EB%A9%B8%EC%9D%98+%EC%B9%BC%EB%82%A0+%EA%B7%80%EC%B9%BC+%EB%A9%94%EA%B0%80%ED%95%98%EC%9A%B0%EC%8A%A4+%EB%A3%A9%EC%97%85+%ED%94%BC%EA%B7%9C%EC%96%B4+-+%EC%95%84%EA%B0%80%EC%B8%A0%EB%A7%88+%EC%A0%A0%EC%9D%B4%EC%B8%A0.png', SYSDATE);

INSERT INTO TKK.STORE_GOODS (store_id, name, work_name, character_name, category, price, stock_qty, thumbnail_url, created_at)
VALUES (1, '극장판 무한성편 키 비주얼 A3 포스터', '귀멸의 칼날', '카마도 탄지로', '포스터', 18000, 10, 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/goods/%EA%B7%80%EC%B9%BC/%EA%B7%80%EB%A9%B8%EC%9D%98+%EC%B9%BC%EB%82%A0+%EA%B7%B9%EC%9E%A5%ED%8C%90+%EB%AC%B4%ED%95%9C%EC%84%B1%ED%8E%B8+%EA%B7%80%EC%B9%BC+%EA%B5%BF%EC%A6%88+%ED%82%A4+%EB%B9%84%EC%A3%BC%EC%96%BC+%ED%8A%B9%EC%88%98+%EC%9D%B8%EC%87%84+A3+%ED%8F%AC%EC%8A%A4%ED%84%B0.png', SYSDATE);

INSERT INTO TKK.STORE_GOODS (store_id, name, work_name, character_name, category, price, stock_qty, thumbnail_url, created_at)
VALUES (1, '룩업 피규어 도우마', '귀멸의 칼날', '도우마', '피규어', 44000, 4, 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/goods/%EA%B7%80%EC%B9%BC/%EA%B7%80%EB%A9%B8%EC%9D%98+%EC%B9%BC%EB%82%A0+%EB%A9%94%EA%B0%80%ED%95%98%EC%9A%B0%EC%8A%A4+%EB%A3%A9%EC%97%85+%ED%94%BC%EA%B7%9C%EC%96%B4+-+%EB%8F%84%EC%9A%B0%EB%A7%88.png', SYSDATE);

INSERT INTO TKK.STORE_GOODS (store_id, name, work_name, character_name, category, price, stock_qty, thumbnail_url, created_at)
VALUES (1, '룩업 피규어 코쵸우 시노부 스마일 Ver.', '귀멸의 칼날', '코쵸우 시노부', '피규어', 44000, 5, 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/goods/%EA%B7%80%EC%B9%BC/%EA%B7%80%EB%A9%B8%EC%9D%98+%EC%B9%BC%EB%82%A0+%EB%A9%94%EA%B0%80%ED%95%98%EC%9A%B0%EC%8A%A4+%EB%A3%A9%EC%97%85+%ED%94%BC%EA%B7%9C%EC%96%B4+-+%EC%BD%94%EC%B5%B8%EC%9A%B0+%EC%8B%9C%EB%85%B8%EB%B6%80+%EC%8A%A4%EB%A7%88%EC%9D%BC+Ver..png', SYSDATE);

INSERT INTO TKK.STORE_GOODS (store_id, name, work_name, character_name, category, price, stock_qty, thumbnail_url, created_at)
VALUES (1, 'JF2026 아크릴 스탠드 쵸소우', '주술회전', '쵸소우', '아크릴스탠드', 24000, 7, 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/goods/%EC%A3%BC%EC%88%A0%ED%9A%8C%EC%A0%84/%EC%88%A0%ED%9A%8C%EC%A0%84+%EA%B7%B9%EC%9E%A5%ED%8C%90+%EC%8B%9C%EB%B6%80%EC%95%BC%EC%82%AC%EB%B3%80X%EC%82%AC%EB%A9%B8%ED%9A%8C%EC%9C%A0+%EA%B5%BF%EC%A6%88+%EB%8F%84%ED%98%B8+JF+2026+%EC%95%84%ED%81%AC%EB%A6%B4+%EC%8A%A4%ED%83%A0%EB%93%9C+-+%EC%B5%B8%EC%86%8C%EC%9A%B0.png', SYSDATE);

INSERT INTO TKK.STORE_GOODS (store_id, name, work_name, character_name, category, price, stock_qty, thumbnail_url, created_at)
VALUES (1, '푸리누이타치 드림 미니 봉제인형', '주술회전', '옷코츠 유타', '봉제인형', 22000, 8, 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/goods/%EC%A3%BC%EC%88%A0%ED%9A%8C%EC%A0%84/%EC%A3%BC%EC%88%A0%ED%9A%8C%EC%A0%84+%EA%B5%BF%EC%A6%88+%EB%B0%98%EB%8B%A4%EC%9D%B4+%EB%82%A8%EC%BD%94+%EB%88%84%EC%9D%B4+%ED%91%B8%EB%A6%AC%EB%88%84%EC%9D%B4%ED%83%80%EC%B9%98+%EB%93%9C%EB%A6%BC+%EB%AF%B8%EB%8B%88+%EB%B4%89%EC%A0%9C%EC%9D%B8%ED%98%95++%EB%88%84%EC%9D%B4+-+%EC%98%B7%EC%BD%94%EC%B8%A0+%EC%9C%A0%ED%83%80.jpg', SYSDATE);

INSERT INTO TKK.STORE_GOODS (store_id, name, work_name, character_name, category, price, stock_qty, thumbnail_url, created_at)
VALUES (1, '푸리누이타치 드림 미니 봉제인형', '주술회전', '이타도리 유지', '봉제인형', 22000, 9, 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/goods/%EC%A3%BC%EC%88%A0%ED%9A%8C%EC%A0%84/%EC%A3%BC%EC%88%A0%ED%9A%8C%EC%A0%84+%EA%B5%BF%EC%A6%88+%EB%B0%98%EB%8B%A4%EC%9D%B4+%EB%82%A8%EC%BD%94+%EB%88%84%EC%9D%B4+%ED%91%B8%EB%A6%AC%EB%88%84%EC%9D%B4%ED%83%80%EC%B9%98+%EB%93%9C%EB%A6%BC+%EB%AF%B8%EB%8B%88+%EB%B4%89%EC%A0%9C%EC%9D%B8%ED%98%95++%EB%88%84%EC%9D%B4+-+%EC%9D%B4%ED%83%80%EB%8F%84%EB%A6%AC+%EC%9C%A0%EC%A7%80++%EC%9D%B4%ED%83%80%EB%8F%84%EB%A6%AC+%EC%9C%A0%EC%9A%B0%EC%A7%80.jpg', SYSDATE);

INSERT INTO TKK.STORE_GOODS (store_id, name, work_name, character_name, category, price, stock_qty, thumbnail_url, created_at)
VALUES (1, '트레이딩 글리터 캔 뱃지 할로윈 Ver. 랜덤', '주술회전', '랜덤', '캔뱃지', 7000, 30, 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/goods/%EC%A3%BC%EC%88%A0%ED%9A%8C%EC%A0%84/%EC%A3%BC%EC%88%A0%ED%9A%8C%EC%A0%84+%EA%B5%BF%EC%A6%88+%EC%A4%91%EC%99%B8%EA%B4%91%EC%97%85+%ED%8A%B8%EB%A0%88%EC%9D%B4%EB%94%A9+%EA%B8%80%EB%A6%AC%ED%84%B0+%EC%BA%94+%EB%B1%83%EC%A7%80+%ED%95%A0%EB%A1%9C%EC%9C%88+Ver.+%EB%9E%9C%EB%8D%A4+%EB%8B%A8%ED%92%88.jpg', SYSDATE);

INSERT INTO TKK.STORE_GOODS (store_id, name, work_name, character_name, category, price, stock_qty, thumbnail_url, created_at)
VALUES (1, 'JF2026 아크릴 스탠드 옷코츠 유타', '주술회전', '옷코츠 유타', '아크릴스탠드', 24000, 6, 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/goods/%EC%A3%BC%EC%88%A0%ED%9A%8C%EC%A0%84/%EC%A3%BC%EC%88%A0%ED%9A%8C%EC%A0%84+%EA%B7%B9%EC%9E%A5%ED%8C%90+%EC%8B%9C%EB%B6%80%EC%95%BC%EC%82%AC%EB%B3%80X%EC%82%AC%EB%A9%B8%ED%9A%8C%EC%9C%A0+%EA%B5%BF%EC%A6%88+%EB%8F%84%ED%98%B8+JF+2026+%EC%95%84%ED%81%AC%EB%A6%B4+%EC%8A%A4%ED%83%A0%EB%93%9C+-+%EC%98%B7%EC%BD%94%EC%B8%A0+%EC%9C%A0%ED%83%80.png', SYSDATE);

INSERT INTO TKK.STORE_GOODS (store_id, name, work_name, character_name, category, price, stock_qty, thumbnail_url, created_at)
VALUES (1, '후와푸치 데포르메 피규어', '주술회전', '이타도리 유지', '피규어', 36000, 5, 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/goods/%EC%A3%BC%EC%88%A0%ED%9A%8C%EC%A0%84/%EC%A3%BC%EC%88%A0%ED%9A%8C%EC%A0%84+%EA%B7%B9%EC%9E%A5%ED%8C%90+%EC%8B%9C%EB%B6%80%EC%95%BC%EC%82%AC%EB%B3%80X%EC%82%AC%EB%A9%B8%ED%9A%8C%EC%9C%A0+%ED%94%BC%EA%B7%9C%EC%96%B4+-+%EC%9D%B4%ED%83%80%EB%8F%84%EB%A6%AC+%EC%9C%A0%EC%A7%80+.jpg', SYSDATE);

INSERT INTO TKK.STORE_GOODS (store_id, name, work_name, character_name, category, price, stock_qty, thumbnail_url, created_at)
VALUES (1, '룩업 피규어 이누마키 토게', '주술회전', '이누마키 토게', '피규어', 42000, 4, 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/goods/%EC%A3%BC%EC%88%A0%ED%9A%8C%EC%A0%84/%EC%A3%BC%EC%88%A0%ED%9A%8C%EC%A0%84+%EA%B7%B9%EC%9E%A5%ED%8C%90+%EC%8B%9C%EB%B6%80%EC%95%BC%EC%82%AC%EB%B3%80X%EC%82%AC%EB%A9%B8%ED%9A%8C%EC%9C%A0+%EB%A9%94%EA%B0%80%ED%95%98%EC%9A%B0%EC%8A%A4+%EB%A3%A9%EC%97%85+%ED%94%BC%EA%B7%9C%EC%96%B4+-+%EC%9D%B4%EB%88%84%EB%A7%88%ED%82%A4+%ED%86%A0%EA%B2%8C.png', SYSDATE);

INSERT INTO TKK.STORE_GOODS (store_id, name, work_name, character_name, category, price, stock_qty, thumbnail_url, created_at)
VALUES (1, '아쿠누이 봉제인형', '주술회전', '후시구로 메구미', '봉제인형', 26000, 6, 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/goods/%EC%A3%BC%EC%88%A0%ED%9A%8C%EC%A0%84/%EC%A3%BC%EC%88%A0%ED%9A%8C%EC%A0%84+%EC%95%84%EC%BF%A0%EB%88%84%EC%9D%B4+%EB%B4%89%EC%A0%9C%EC%9D%B8%ED%98%95+-+%ED%9B%84%EC%8B%9C%EA%B5%AC%EB%A1%9C+%EB%A9%94%EA%B5%AC%EB%AF%B8.png', SYSDATE);

INSERT INTO TKK.STORE_GOODS (store_id, name, work_name, character_name, category, price, stock_qty, thumbnail_url, created_at)
VALUES (1, '후와푸치 데포르메 피규어', '주술회전', '게토 스구루', '피규어', 38000, 4, 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/goods/%EC%A3%BC%EC%88%A0%ED%9A%8C%EC%A0%84/%EC%A3%BC%EC%88%A0%ED%9A%8C%EC%A0%84+%ED%9A%8C%EC%98%A5+%EC%98%A5%EC%A0%88+%ED%9B%84%EC%99%80%ED%91%B8%EC%B9%98+%EB%8D%B0%ED%8F%AC%EB%A5%B4%EB%A9%94+%ED%94%BC%EA%B7%9C%EC%96%B4+-+%EA%B2%8C%ED%86%A0+%EC%8A%A4%EA%B5%AC%EB%A3%A8.png', SYSDATE);

INSERT INTO TKK.STORE_GOODS (store_id, name, work_name, character_name, category, price, stock_qty, thumbnail_url, created_at)
VALUES (1, '후와푸치 데포르메 피규어', '주술회전', '고죠 사토루', '피규어', 38000, 5, 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/goods/%EC%A3%BC%EC%88%A0%ED%9A%8C%EC%A0%84/%EC%A3%BC%EC%88%A0%ED%9A%8C%EC%A0%84+%ED%9A%8C%EC%98%A5+%EC%98%A5%EC%A0%88+%ED%9B%84%EC%99%80%ED%91%B8%EC%B9%98+%EB%8D%B0%ED%8F%AC%EB%A5%B4%EB%A9%94+%ED%94%BC%EA%B7%9C%EC%96%B4+-+%EA%B3%A0%EC%A3%A0+%EC%82%AC%ED%86%A0%EB%A3%A8.png', SYSDATE);

INSERT INTO TKK.STORE_GOODS (store_id, name, work_name, character_name, category, price, stock_qty, thumbnail_url, created_at)
VALUES (1, 'Crux 트래블 시리즈 미니 아크릴 스탠드', '블루 록', '시도 류세이', '아크릴스탠드', 19000, 8, 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/goods/%EB%B8%94%EB%A3%A8%EB%A1%9D/%EB%B8%94%EB%A3%A8+%EB%A1%9D+%EA%B5%BF%EC%A6%88+Crux+%ED%8A%B8%EB%9E%98%EB%B8%94+%EC%8B%9C%EB%A6%AC%EC%A6%88+%EB%AF%B8%EB%8B%88+%EC%BA%90%EB%A6%AD%ED%84%B0+%EC%95%84%ED%81%AC%EB%A6%B4+%EC%8A%A4%ED%83%A0%EB%93%9C+-+%EC%8B%9C%EB%8F%84+%EB%A5%98%EC%84%B8%EC%9D%B4.jpg', SYSDATE);

INSERT INTO TKK.STORE_GOODS (store_id, name, work_name, character_name, category, price, stock_qty, thumbnail_url, created_at)
VALUES (1, 'PalVerse Palé 피규어', '블루 록', '나기 세이시로', '피규어', 32000, 6, 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/goods/%EB%B8%94%EB%A3%A8%EB%A1%9D/%EB%B8%94%EB%A3%A8+%EB%A1%9D+%EA%B5%BF%EC%A6%88+%EB%B6%80%EC%8B%9C%EB%A1%9C%EB%93%9C+PalVerse+Pal%C3%A9+%ED%94%BC%EA%B7%9C%EC%96%B4+-+%EB%82%98%EA%B8%B0+%EC%84%B8%EC%9D%B4%EC%8B%9C%EB%A1%9C.jpg', SYSDATE);

INSERT INTO TKK.STORE_GOODS (store_id, name, work_name, character_name, category, price, stock_qty, thumbnail_url, created_at)
VALUES (1, '룩업 피규어 이사기 요이치', '블루 록', '이사기 요이치', '피규어', 42000, 5, 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/goods/%EB%B8%94%EB%A3%A8%EB%A1%9D/%EB%B8%94%EB%A3%A8+%EB%A1%9D+%EB%A9%94%EA%B0%80%ED%95%98%EC%9A%B0%EC%8A%A4+%EB%A3%A9%EC%97%85+%ED%94%BC%EA%B7%9C%EC%96%B4+-+%EC%9D%B4%EC%82%AC%EA%B8%B0+%EC%9A%94%EC%9D%B4%EC%B9%98.png', SYSDATE);

INSERT INTO TKK.STORE_GOODS (store_id, name, work_name, character_name, category, price, stock_qty, thumbnail_url, created_at)
VALUES (1, '반다이 공식 솜누이', '블루 록', '나기 세이시로', '봉제인형', 26000, 7, 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/goods/%EB%B8%94%EB%A3%A8%EB%A1%9D/%EB%B8%94%EB%A3%A8+%EB%A1%9D+%EB%B0%98%EB%8B%A4%EC%9D%B4+%EA%B3%B5%EC%8B%9D+%EC%86%9C%EB%88%84%EC%9D%B4+-+%EB%82%98%EA%B8%B0+%EC%84%B8%EC%9D%B4%EC%8B%9C%EB%A1%9C.png', SYSDATE);

INSERT INTO TKK.STORE_GOODS (store_id, name, work_name, character_name, category, price, stock_qty, thumbnail_url, created_at)
VALUES (1, '아크릴 미니 스탠드 백귀야행 Ver.', '블루 록', '나기 세이시로', '아크릴스탠드', 17000, 9, 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/goods/%EB%B8%94%EB%A3%A8%EB%A1%9D/%EB%B8%94%EB%A3%A8+%EB%A1%9D+%EB%B2%A8%ED%95%98%EC%9A%B0%EC%8A%A4+%EC%95%84%ED%81%AC%EB%A6%B4+%EB%AF%B8%EB%8B%88+%EC%8A%A4%ED%83%A0%EB%93%9C+%EB%B0%B1%EA%B7%80%EC%95%BC%ED%96%89+Ver.+-+%EB%82%98%EA%B8%B0+%EC%84%B8%EC%9D%B4%EC%8B%9C%EB%A1%9C.png', SYSDATE);

INSERT INTO TKK.STORE_GOODS (store_id, name, work_name, character_name, category, price, stock_qty, thumbnail_url, created_at)
VALUES (1, '아크릴 스탠드 랜덤 단품', '블루 록', '랜덤', '아크릴스탠드', 12000, 20, 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/goods/%EB%B8%94%EB%A3%A8%EB%A1%9D/%EB%B8%94%EB%A3%A8+%EB%A1%9D+%EC%95%84%ED%81%AC%EB%A6%B4+%EC%8A%A4%ED%83%A0%EB%93%9C+%EB%9E%9C%EB%8D%A4+%EB%8B%A8%ED%92%88.png', SYSDATE);

INSERT INTO TKK.STORE_GOODS (store_id, name, work_name, character_name, category, price, stock_qty, thumbnail_url, created_at)
VALUES (1, '하네스 Style 미니 아크릴 스탠드', '블루 록', '나기 세이시로', '아크릴스탠드', 18000, 8, 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/goods/%EB%B8%94%EB%A3%A8%EB%A1%9D/%EB%B8%94%EB%A3%A8+%EB%A1%9D+%ED%8C%80+%EC%97%94%ED%84%B0%ED%85%8C%EC%9D%B8%EB%A8%BC%ED%8A%B8+%EB%AF%B8%EB%8B%88+%EC%95%84%ED%81%AC%EB%A6%B4+%EC%8A%A4%ED%83%A0%EB%93%9C+%ED%95%98%EB%84%A4%EC%8A%A4+Style+-+%EB%82%98%EA%B8%B0+%EC%84%B8%EC%9D%B4%EC%8B%9C%EB%A1%9C+.png', SYSDATE);

INSERT INTO TKK.STORE_GOODS (store_id, name, work_name, character_name, category, price, stock_qty, thumbnail_url, created_at)
VALUES (1, '파샤코레 랜덤 단품', '블루 록', '랜덤', '포토카드', 6000, 30, 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/goods/%EB%B8%94%EB%A3%A8%EB%A1%9D/%EB%B8%94%EB%A3%A8+%EB%A1%9D+%ED%8C%8C%EC%83%A4%EC%BD%94%EB%A0%88+%EB%9E%9C%EB%8D%A4+%EB%8B%A8%ED%92%88.png', SYSDATE);

INSERT INTO TKK.STORE_GOODS (store_id, name, work_name, character_name, category, price, stock_qty, thumbnail_url, created_at)
VALUES (1, '푸니토푸 봉제인형 3탄', '블루 록', '바치라 메구루', '봉제인형', 24000, 6, 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/goods/%EB%B8%94%EB%A3%A8%EB%A1%9D/%EB%B8%94%EB%A3%A8+%EB%A1%9D+%ED%91%B8%EB%8B%88%ED%86%A0%ED%91%B8+%EB%B4%89%EC%A0%9C%EC%9D%B8%ED%98%95+3%ED%83%84+-+%EB%B0%94%EC%B9%98%EB%9D%BC+%EB%A9%94%EA%B5%AC%EB%A3%A8.jpg', SYSDATE);

INSERT INTO TKK.STORE_GOODS (store_id, name, work_name, character_name, category, price, stock_qty, thumbnail_url, created_at)
VALUES (1, '푸니토푸 봉제인형 3탄', '블루 록', '치기리 효마', '봉제인형', 24000, 6, 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/goods/%EB%B8%94%EB%A3%A8%EB%A1%9D/%EB%B8%94%EB%A3%A8+%EB%A1%9D+%ED%91%B8%EB%8B%88%ED%86%A0%ED%91%B8+%EB%B4%89%EC%A0%9C%EC%9D%B8%ED%98%95+3%ED%83%84+-+%EC%B9%98%EA%B8%B0%EB%A6%AC+%ED%9A%A8%EB%A7%88.jpg', SYSDATE);

COMMIT;


-- ✅ Oracle용: NOW() -> SYSDATE, 다건 VALUES -> 단건 INSERT로 변환
-- popup_id가 IDENTITY면 컬럼에 안 넣는 게 맞음 (지금처럼)

-- 3) 진짜 팝업 4개 다시 넣기 (ORACLE)

-- 나혼자만레벨업팝업
INSERT INTO TKK.POPUP_STORE
(
    title, place_name, address, region_name,
    latitude, longitude,
    start_date, end_date,
    banner_image_url, description,
    created_at, deleted_yn
)
VALUES
    (
        '나혼자만레벨업팝업',
        '애니플러스 합정',
        '서울 마포구 양화로 186',
        '홍대',
        NULL, NULL,
        DATE '2025-12-19', DATE '2026-01-11',
        'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/popup/%E1%84%82%E1%85%A1%E1%84%92%E1%85%A9%E1%86%AB%E1%84%8C%E1%85%A1%E1%84%86%E1%85%A1%E1%86%AB+%E1%84%85%E1%85%A6%E1%84%87%E1%85%A6%E1%86%AF%E1%84%8B%E1%85%A5%E1%86%B8+%E1%84%91%E1%85%A1%E1%86%B8%E1%84%8B%E1%85%A5%E1%86%B8.png',
        '나 혼자만 레벨업 팝업스토어',
        SYSDATE, 'N'
    );

-- 외모지상주의 팝업
INSERT INTO TKK.POPUP_STORE
(
    title, place_name, address, region_name,
    latitude, longitude,
    start_date, end_date,
    banner_image_url, description,
    created_at, deleted_yn
)
VALUES
    (
        '외모지상주의 팝업',
        '레조네 홍대',
        '<<여기에_외모지상주의_새주소>>',
        '홍대',
        NULL, NULL,
        DATE '2025-12-19', DATE '2026-01-11',
        'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/popup/%E1%84%8B%E1%85%AC%E1%84%86%E1%85%AE%E1%84%8C%E1%85%B5%E1%84%89%E1%85%A1%E1%86%BC%E1%84%8C%E1%85%AE%E1%84%8B%E1%85%B4+%E1%84%91%E1%85%A1%E1%86%B8%E1%84%8B%E1%85%A5%E1%86%B8.png',
        '외모지상주의 팝업스토어',
        SYSDATE, 'N'
    );

-- 주술회전 팝업
INSERT INTO TKK.POPUP_STORE
(
    title, place_name, address, region_name,
    latitude, longitude,
    start_date, end_date,
    banner_image_url, description,
    created_at, deleted_yn
)
VALUES
    (
        '주술회전 팝업',
        '롯데월드타워 서울스카이',
        '롯데월드타워 서울스카이',
        '잠실',
        NULL, NULL,
        DATE '2025-12-12', DATE '2026-02-28',
        'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/popup/%E1%84%8C%E1%85%AE%E1%84%89%E1%85%AE%E1%86%AF%E1%84%92%E1%85%AC%E1%84%8C%E1%85%A5%E1%86%AB+%E1%84%91%E1%85%A1%E1%86%B8%E1%84%8B%E1%85%A5%E1%86%B8.png',
        '주술회전 팝업스토어',
        SYSDATE, 'N'
    );

-- 하이큐 10주년 기념전
INSERT INTO TKK.POPUP_STORE
(
    title, place_name, address, region_name,
    latitude, longitude,
    start_date, end_date,
    banner_image_url, description,
    created_at, deleted_yn
)
VALUES
    (
        '하이큐 10주년 기념전',
        'AK PLAZA 홍대 3층 BOX',
        'AK PLAZA 홍대 3층 BOX',
        '홍대',
        NULL, NULL,
        DATE '2025-12-02', DATE '2025-12-28',
        'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/popup/%E1%84%92%E1%85%A1%E1%84%8B%E1%85%B5%E1%84%8F%E1%85%B2+10%E1%84%8C%E1%85%AE%E1%84%82%E1%85%A7%E1%86%AB+%E1%84%80%E1%85%B5%E1%84%82%E1%85%A7%E1%86%B7%E1%84%8C%E1%85%A5%E1%86%AB.png',
        '하이큐 10주년 기념전',
        SYSDATE, 'N'
    );

COMMIT;

--

INSERT INTO board_category ( code, name)
VALUES ( 'MY_CHILD', '내 새끼 자랑');

INSERT INTO board_category ( code, name)
VALUES ( 'COSPLAY', '코스프레');

INSERT INTO board_category ( code, name)
VALUES ( 'FREE', '자유');

commit ;
INSERT INTO board_post (
    category_id, member_id, title, content,
    thumbnail_url, view_count, like_count, comment_count,
    created_at, updated_at, deleted_yn
) VALUES (
             1, 1,
             '유리장 한 칸 액션 전시 완성',
             '와이어랑 스탠드 각도 맞추느라 2시간 날렸는데… 완성하고 불 켜니까 진짜 “장면”이 됨. 먼지 때문에 유리장 정리하고 LED도 추가함. 사진은 폰 기본 카메라로 찍었는데 생각보다 잘 나왔다.',
             'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/board/%EB%82%B4%EC%83%88%EB%81%BC%EC%9E%90%EB%9E%91/%EB%82%B4%EC%83%88%EC%9E%90-15.jpg',
             312, 29, 7,
             SYSDATE - 18, NULL, 'N'
         );

INSERT INTO board_post (
    category_id, member_id, title, content,
    thumbnail_url, view_count, like_count, comment_count,
    created_at, updated_at, deleted_yn
) VALUES (
             1, 2,
             '이 칸은 해적 라인업으로 꽉 채웠다',
             '이펙트 파츠가 화려해서 앞쪽엔 액션 포즈, 뒤쪽은 키 큰 애들로 세워서 깊이감 살림. 박스는 원래 치울까 했는데 배경으로 써보니까 분위기 좋아서 일부만 남김.',
             'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/board/%EB%82%B4%EC%83%88%EB%81%BC%EC%9E%90%EB%9E%91/%EB%82%B4%EC%83%88%EC%9E%90-16.jpg',
             541, 46, 12,
             SYSDATE - 12, NULL, 'N'
         );

INSERT INTO board_post (
    category_id, member_id, title, content,
    thumbnail_url, view_count, like_count, comment_count,
    created_at, updated_at, deleted_yn
) VALUES (
             1, 3,
             '책장 속 “숨은 최애” 전시',
             '책 사이에 슬쩍 세워두면 튀지 않으면서도 존재감이 있음. 원판 받침이라 안정감도 좋고, 책 정리할 때마다 먼지 털어주는 게 루틴이 됨.',
             'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/board/%EB%82%B4%EC%83%88%EB%81%BC%EC%9E%90%EB%9E%91/%EB%82%B4%EC%83%88%EC%9E%90-17.webp',
             188, 21, 3,
             SYSDATE - 9, NULL, 'N'
         );

INSERT INTO board_post (
    category_id, member_id, title, content,
    thumbnail_url, view_count, like_count, comment_count,
    created_at, updated_at, deleted_yn
) VALUES (
             1, 4,
             '책상 위 미니 피규어… 표정이 너무 귀엽다',
             '앉아있는 포즈라 데스크에 두기 딱 좋음. 집중 안 될 때 한 번 보면 마음이 좀 진정됨ㅋㅋ 헤드폰 디테일이 특히 귀엽고 크기도 부담 없음.',
             'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/board/%EB%82%B4%EC%83%88%EB%81%BC%EC%9E%90%EB%9E%91/%EB%82%B4%EC%83%88%EC%9E%90-18.jfif',
             97, 14, 2,
             SYSDATE - 5, NULL, 'N'
         );

INSERT INTO board_post (
    category_id, member_id, title, content,
    thumbnail_url, view_count, like_count, comment_count,
    created_at, updated_at, deleted_yn
) VALUES (
             1, 5,
             '농구 디오라마 세팅 완료(각도값 미쳤음)',
             '코트 질감이랑 골대 디테일이 생각보다 좋아서 감탄. 투명 스탠드 파츠가 많아서 각도 잡는 데 오래 걸렸는데, 한 번 잡아두니까 진짜 “명장면 캡처” 느낌 제대로남.',
             'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/board/%EB%82%B4%EC%83%88%EB%81%BC%EC%9E%90%EB%9E%91/%EB%82%B4%EC%83%88%EC%9E%90-19.jpg',
             623, 52, 15,
             SYSDATE - 22, NULL, 'N'
         );

INSERT INTO board_post (
    category_id, member_id, title, content,
    thumbnail_url, view_count, like_count, comment_count,
    created_at, updated_at, deleted_yn
) VALUES (
             1, 6,
             '피규어는 박스아트까지 같이 전시해야 진짜다',
             '박스가 너무 예뻐서 버릴 수가 없었음… 그래서 아예 박스까지 전시 컨셉으로 바꿈. 소품 구성도 알차고 옆면 아트가 배경 역할까지 해줘서 만족.',
             'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/board/%EB%82%B4%EC%83%88%EB%81%BC%EC%9E%90%EB%9E%91/%EB%82%B4%EC%83%88%EC%9E%90-20.webp',
             274, 33, 6,
             SYSDATE - 16, NULL, 'N'
         );

INSERT INTO board_post (
    category_id, member_id, title, content,
    thumbnail_url, view_count, like_count, comment_count,
    created_at, updated_at, deleted_yn
) VALUES (
             1, 7,
             '가동피규어는 포즈 바꾸는 재미가 진짜 큼',
             '옷이 실제 천 재질이라 분위기 확 살음. 포즈 세팅 전에 관절 체크 한 번씩 해줘야 오래감. 여분 유니폼 구성품까지 있어서 촬영할 때 조합 바꾸기 좋다.',
             'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/board/%EB%82%B4%EC%83%88%EB%81%BC%EC%9E%90%EB%9E%91/%EB%82%B4%EC%83%88%EC%9E%90-22.jpg',
             356, 40, 9,
             SYSDATE - 7, NULL, 'N'
         );

INSERT INTO board_post (
    category_id, member_id, title, content,
    thumbnail_url, view_count, like_count, comment_count,
    created_at, updated_at, deleted_yn
) VALUES (
             1, 8,
             '교복 피규어는 기본템… 라인 예쁘게 뽑혔다',
             '앉은 포즈라 공간 덜 차지해서 전시하기 편함. 다리/치마 주름 표현 깔끔하고, 패키지 아트도 예뻐서 같이 두니까 인테리어 느낌 남.',
             'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/board/%EB%82%B4%EC%83%88%EB%81%BC%EC%9E%90%EB%9E%91/%EB%82%B4%EC%83%88%EC%9E%90-23.jpg',
             141, 18, 4,
             SYSDATE - 3, NULL, 'N'
         );

INSERT INTO board_post (
    category_id, member_id, title, content,
    thumbnail_url, view_count, like_count, comment_count,
    created_at, updated_at, deleted_yn
) VALUES (
             1, 9,
             '청록 트윈테일 + 판다 소품 조합은 반칙',
             '색감이 너무 예뻐서 계속 보게 됨. 리본/소매 디테일도 좋고 판다 소품이 포인트 확실함. 같은 톤 피규어랑 같이 두면 전시가 훨씬 깔끔해짐.',
             'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/board/%EB%82%B4%EC%83%88%EB%81%BC%EC%9E%90%EB%9E%91/%EB%82%B4%EC%83%88%EC%9E%90-24.jpg',
             487, 55, 11,
             SYSDATE - 11, NULL, 'N'
         );

INSERT INTO board_post (
    category_id, member_id, title, content,
    thumbnail_url, view_count, like_count, comment_count,
    created_at, updated_at, deleted_yn
) VALUES (
             1, 10,
             'SHF 개봉… 파츠가 이렇게 많은 건 반칙이지',
             '오늘 도착해서 바로 개봉. 기본 바디도 좋고 얼굴/손 파츠가 다양해서 포징 바꾸는 맛이 있음. 이펙트 파츠(별 모양)까지 들어있어서 전시할 때 화면이 확 살아남. 다만 파츠가 많아서 잃어버리기 쉬우니 트레이 그대로 보관 추천.',
             'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/board/%EB%82%B4%EC%83%88%EB%81%BC%EC%9E%90%EB%9E%91/%EB%82%B4%EC%83%88%EC%9E%90-25.webp',
             268, 24, 5,
             SYSDATE - 6, NULL, 'N'
         );

INSERT INTO board_post (
    category_id, member_id, title, content,
    thumbnail_url, view_count, like_count, comment_count,
    created_at, updated_at, deleted_yn
) VALUES (
             1, 11,
             '블루아카 피그마 자전거 DX… 박스부터 설렌다',
             '박스 아트 미쳤고 구성도 빵빵함. 자전거 포함이라 공간 차지하긴 하는데, 포즈 잡아두면 진짜 “한 장면”이 됨. 조립 난이도는 중간 정도? 설명서 보면서 하면 충분히 가능. 주말에 제대로 세팅해서 사진 더 찍어볼 예정.',
             'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/board/%EB%82%B4%EC%83%88%EB%81%BC%EC%9E%90%EB%9E%91/%EB%82%B4%EC%83%88%EC%9E%90-26.jpg',
             403, 37, 8,
             SYSDATE - 10, NULL, 'N'
         );

INSERT INTO board_post (
    category_id, member_id, title, content,
    thumbnail_url, view_count, like_count, comment_count,
    created_at, updated_at, deleted_yn
) VALUES (
             1, 13,
             '거실 소파 위 단체샷… 수집의 끝은 결국 전시다',
             '정리하다가 한 번에 꺼내서 단체샷 찍어봄. 장르 섞여도 포즈/높이만 잘 맞추면 생각보다 예쁘게 나옴. 큰 피규어는 뒤로, 작은 애들은 앞에 두니까 꽉 차는 느낌이 좋다. (먼지 닦는 건… 다음 주의 나에게 맡김)',
             'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/board/%EB%82%B4%EC%83%88%EB%81%BC%EC%9E%90%EB%9E%91/%EB%82%B4%EC%83%88%EC%9E%90-27.jfif',
             512, 41, 11,
             SYSDATE - 15, NULL, 'N'
         );

INSERT INTO board_post (
    category_id, member_id, title, content,
    thumbnail_url, view_count, like_count, comment_count,
    created_at, updated_at, deleted_yn
) VALUES (
             1, 14,
             '유리장 한 칸이 아니라 한 “세계관”이 되어버림',
             '처음엔 테마 맞춰서 넣으려 했는데 점점 자리 싸움 나서 그냥 취향대로 배치함ㅋㅋ 메카/미소녀/작은 피규어까지 섞였는데 오히려 풍성해서 보는 재미가 있음. 조명 켜면 반사 때문에 사진 찍기 어렵긴 한데 실물은 만족도 높음.',
             'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/board/%EB%82%B4%EC%83%88%EB%81%BC%EC%9E%90%EB%9E%91/%EB%82%B4%EC%83%88%EC%9E%90-28.jfif',
             634, 49, 14,
             SYSDATE - 21, NULL, 'N'
         );

INSERT INTO board_post (
    category_id, member_id, title, content,
    thumbnail_url, view_count, like_count, comment_count,
    created_at, updated_at, deleted_yn
) VALUES (
             1, 12,
             '원피스 라인업 책상 전시… 포즈 맛이 확실함',
             '책상 위에 쭉 세워두니까 지나갈 때마다 눈이 행복함. 이펙트 파츠 있는 애들은 앞쪽에 두고, 큰 애들은 뒤쪽으로 배치해서 깊이감 살림. 받침 원판이 좀 커서 자리 많이 먹긴 하는데, 완성도 때문에 납득됨.',
             'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/board/%EB%82%B4%EC%83%88%EB%81%BC%EC%9E%90%EB%9E%91/%EB%82%B4%EC%83%88%EC%9E%90-29.jfif',
             289, 28, 6,
             SYSDATE - 8, NULL, 'N'
         );

INSERT INTO board_post (
    category_id, member_id, title, content,
    thumbnail_url, view_count, like_count, comment_count,
    created_at, updated_at, deleted_yn
) VALUES (
             1, 16,
             '에이스 박스 3종 모아두니 뿌듯함이 3배',
             '같은 캐릭터라도 버전별로 박스 톤이 달라서 모아두면 컬렉션 느낌 확 남. 개봉은 하나만 하고 나머지는 박스 보관 중… (언젠가 전부 꺼내겠지) 바닥에 줄 세워두기만 해도 전시가 되는 게 박스 피규어의 매력인 듯.',
             'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/board/%EB%82%B4%EC%83%88%EB%81%BC%EC%9E%90%EB%9E%91/%EB%82%B4%EC%83%88%EC%9E%90-30.jfif',
             176, 19, 3,
             SYSDATE - 4, NULL, 'N'
         );
-- =========================
-- category_id = 2 (코스프레)
-- =========================
INSERT INTO board_post (
    category_id, member_id, title, content,
    thumbnail_url, view_count, like_count, comment_count,
    created_at, updated_at, deleted_yn
) VALUES (
             2, 1,
             '보라 마녀 컨셉 첫 촬영… 모자 각도 잡는 게 제일 어려웠다',
             '드디어 보라색 마녀 컨셉 코스 완성! 모자 고정이랑 망토 라인 잡는 게 생각보다 빡셌는데 결과물이 예쁘게 나와서 만족. 메이크업은 눈매 강조 + 글리터로 포인트 줬고, 별 모양 악세는 따로 제작해서 달아봤어.',
             'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/board/%EC%BD%94%EC%8A%A4%ED%94%84%EB%A0%88/%EC%BD%94%EC%8A%A4%ED%94%84%EB%A0%88-4.jfif',
             462, 58, 14,
             SYSDATE - 20, NULL, 'N'
         );

INSERT INTO board_post (
    category_id, member_id, title, content,
    thumbnail_url, view_count, like_count, comment_count,
    created_at, updated_at, deleted_yn
) VALUES (
             2, 2,
             '야외 행사에서 고양이 컨셉 코스! (리본/소매 디테일 자랑)',
             '행사장에서 찍은 사진들 중 제일 마음에 드는 컷. 귀는 클립형이라 오래 착용하면 조금 아픈데… 사진 찍을 때는 확실히 포인트가 됨. 소매 리본은 풀릴까 봐 안쪽에 실로 한 번 더 고정했어.',
             'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/board/%EC%BD%94%EC%8A%A4%ED%94%84%EB%A0%88/%EC%BD%94%EC%8A%A4%ED%94%84%EB%A0%88-5.jfif',
             517, 66, 18,
             SYSDATE - 14, NULL, 'N'
         );

INSERT INTO board_post (
    category_id, member_id, title, content,
    thumbnail_url, view_count, like_count, comment_count,
    created_at, updated_at, deleted_yn
) VALUES (
             2, 3,
             '실내 촬영: 청백 톤 의상은 조명빨 진짜 잘 받는다',
             '청색/백색 계열 의상이라 조명만 잘 맞추면 피부톤도 깨끗하게 나오더라. 가슴 장식이랑 브로치 디테일이 은근 무게감 있어서 촬영 전엔 테이프로 한 번 고정해줌. 렌즈는 자연스럽게 파란 계열로 맞췄어.',
             'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/board/%EC%BD%94%EC%8A%A4%ED%94%84%EB%A0%88/%EC%BD%94%EC%8A%A4%ED%94%84%EB%A0%88-6.jfif',
             689, 81, 22,
             SYSDATE - 11, NULL, 'N'
         );

INSERT INTO board_post (
    category_id, member_id, title, content,
    thumbnail_url, view_count, like_count, comment_count,
    created_at, updated_at, deleted_yn
) VALUES (
             2, 4,
             '여우귀 검객 컨셉… 소품 칼 들고 찍으니 분위기 확 산다',
             '다리 장비/허리 벨트가 많아서 착용 순서가 제일 중요했음. 소품 칼은 가볍게 들 수 있게 제작된 걸로 준비했고, 포즈는 손목 각도 조금만 바꿔도 느낌 달라져서 여러 컷 찍어봄!',
             'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/board/%EC%BD%94%EC%8A%A4%ED%94%84%EB%A0%88/%EC%BD%94%EC%8A%A4%ED%94%84%EB%A0%88-7.jfif',
             401, 47, 9,
             SYSDATE - 9, NULL, 'N'
         );

INSERT INTO board_post (
    category_id, member_id, title, content,
    thumbnail_url, view_count, like_count, comment_count,
    created_at, updated_at, deleted_yn
) VALUES (
             2, 5,
             '햇살 좋은 날 야외 코스 촬영! 파란 제복은 진리다',
             '날씨가 좋아서 야외 촬영 갔는데 색감이 너무 잘 나와서 행복…! 모자 장식이랑 단추가 반사되면서 포인트가 살아남. 장갑/리본은 바람 불면 흐트러져서 중간중간 정리하면서 촬영했어.',
             'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/board/%EC%BD%94%EC%8A%A4%ED%94%84%EB%A0%88/%EC%BD%94%EC%8A%A4%ED%94%84%EB%A0%88-8.jfif',
             732, 93, 25,
             SYSDATE - 6, NULL, 'N'
         );

INSERT INTO board_post (
    category_id, member_id, title, content,
    thumbnail_url, view_count, like_count, comment_count,
    created_at, updated_at, deleted_yn
) VALUES (
             2, 6,
             '전시장 포토존에서 “악마/집사” 느낌 컨셉샷 찍어봄',
             '현장 조명이 강해서 피부 표현이 잘 나오더라. 헤어는 흰색 단발이라 뒷머리 뜨는 거 잡는 데 스프레이 많이 씀. 악세는 금속 느낌이라 사진에 더 살아서 만족!',
             'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/board/%EC%BD%94%EC%8A%A4%ED%94%84%EB%A0%88/%EC%BD%94%EC%8A%A4%ED%94%84%EB%A0%88-9.jfif',
             358, 44, 7,
             SYSDATE - 17, NULL, 'N'
         );

INSERT INTO board_post (
    category_id, member_id, title, content,
    thumbnail_url, view_count, like_count, comment_count,
    created_at, updated_at, deleted_yn
) VALUES (
             2, 7,
             '블루 계열 남캐 코스 도전! 소품이 많아도 재밌다',
             '이번엔 남캐 느낌으로 스타일링 바꿔봤어. 의상에 끈/장식이 많아서 촬영 전에 꼼꼼히 정리 필수. 소품 무기는 야외에서 들고 촬영하면 진짜 분위기 살아남… 다음엔 연기 포즈 더 연구해볼게.',
             'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/board/%EC%BD%94%EC%8A%A4%ED%94%84%EB%A0%88/%EC%BD%94%EC%8A%A4%ED%94%84%EB%A0%88-10.jfif',
             283, 32, 6,
             SYSDATE - 13, NULL, 'N'
         );

INSERT INTO board_post (
    category_id, member_id, title, content,
    thumbnail_url, view_count, like_count, comment_count,
    created_at, updated_at, deleted_yn
) VALUES (
             2, 8,
             '바디페인팅 코스 첫 도전… 준비/세팅이 가장 힘들었다',
             '처음이라 걱정했는데 결과적으로 너무 재밌었음. 페인팅은 번짐 방지 세팅이 핵심이고, 렌즈/귀/가발까지 맞추니까 캐릭터 느낌이 확 살아나더라. (세팅 시간이 길어서 다음엔 더 간단한 버전도 해보고 싶음)',
             'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/board/%EC%BD%94%EC%8A%A4%ED%94%84%EB%A0%88/%EC%BD%94%EC%8A%A4%ED%94%84%EB%A0%88-11.jfif',
             621, 77, 19,
             SYSDATE - 23, NULL, 'N'
         );

INSERT INTO board_post (
    category_id, member_id, title, content,
    thumbnail_url, view_count, like_count, comment_count,
    created_at, updated_at, deleted_yn
) VALUES (
             2, 1,
             '하오리 스타일 코스 셀카! 햇빛 아래서 색감 최고',
             '날이 좋아서 그냥 가볍게 산책 겸 촬영. 망토(하오리) 라인이 펄럭이는 느낌이 좋아서 걷는 컷도 찍어봤어. 칼 손잡이 장식은 포인트라서 최대한 화면에 들어오게 잡았음.',
             'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/board/%EC%BD%94%EC%8A%A4%ED%94%84%EB%A0%88/%EC%BD%94%EC%8A%A4%ED%94%84%EB%A0%88-12.jfif',
             245, 29, 4,
             SYSDATE - 4, NULL, 'N'
         );

INSERT INTO board_post (
    category_id, member_id, title, content,
    thumbnail_url, view_count, like_count, comment_count,
    created_at, updated_at, deleted_yn
) VALUES (
             2, 11,
             '정원 느낌 장소에서 촬영한 기모노 코스… 분위기 미쳤다',
             '배경이 너무 예뻐서 코스가 더 살아난 날! 옷 패턴이 강해서 포즈는 최대한 깔끔하게 잡고, 헤어는 앞머리 라인만 정리해줬어. 다음엔 같은 장소에서 다른 컨셉도 찍어보고 싶다.',
             'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/board/%EC%BD%94%EC%8A%A4%ED%94%84%EB%A0%88/%EC%BD%94%EC%8A%A4%ED%94%84%EB%A0%88-13.jfif',
             493, 61, 12,
             SYSDATE - 2, NULL, 'N'
         );

INSERT INTO board_post (
    category_id, member_id, title, content,
    thumbnail_url, view_count, like_count, comment_count,
    created_at, updated_at, deleted_yn
) VALUES (
             2, 3,
             '닌자 컨셉 액션샷! 각도 잡느라 무릎 갈렸다…',
             '야외에서 낮광 받을 때가 제일 예쁘길래 바로 포즈컷 찍었어. 머리띠 위치랑 표정이 조금만 틀어져도 느낌이 달라져서 같은 포즈로 여러 장 찍고 베스트만 골랐음. 다음엔 연기(연막) 소품도 들고 가볼까 고민 중.',
             'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/board/%EC%BD%94%EC%8A%A4%ED%94%84%EB%A0%88/%EC%BD%94%EC%8A%A4%ED%94%84%EB%A0%88-14.jfif',
             544, 63, 16,
             SYSDATE - 19, NULL, 'N'
         );

INSERT INTO board_post (
    category_id, member_id, title, content,
    thumbnail_url, view_count, like_count, comment_count,
    created_at, updated_at, deleted_yn
) VALUES (
             2, 5,
             '나비 하오리 + 소품검으로 한 컷… 분위기 너무 좋다',
             '저녁 노을빛에서 찍었더니 색감이 미쳤음. 하오리 패턴이 강해서 포즈는 최대한 깔끔하게 잡았고, 소품은 손목 각도만 바꿔도 느낌이 달라서 여러 컷 시도했어. 머리장식은 고정이 약해서 핀+테이프로 보강함.',
             'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/board/%EC%BD%94%EC%8A%A4%ED%94%84%EB%A0%88/%EC%BD%94%EC%8A%A4%ED%94%84%EB%A0%88-15.jfif',
             487, 58, 12,
             SYSDATE - 13, NULL, 'N'
         );

INSERT INTO board_post (
    category_id, member_id, title, content,
    thumbnail_url, view_count, like_count, comment_count,
    created_at, updated_at, deleted_yn
) VALUES (
             2, 2,
             '레드&블랙 악역 컨셉… 부채 소품이 한 방에 살려줌',
             '컨셉은 “강한 눈빛 + 강한 색감”. 조명이 붉게 들어와서 더 잘 맞았고, 부채 소품이 있어서 손이 어색하지 않게 포즈 잡기 좋았어. 립/아이메이크업은 진하게, 대신 피부 표현은 최대한 깔끔하게 갔음.',
             'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/board/%EC%BD%94%EC%8A%A4%ED%94%84%EB%A0%88/%EC%BD%94%EC%8A%A4%ED%94%84%EB%A0%88-16.jfif',
             701, 84, 23,
             SYSDATE - 22, NULL, 'N'
         );

INSERT INTO board_post (
    category_id, member_id, title, content,
    thumbnail_url, view_count, like_count, comment_count,
    created_at, updated_at, deleted_yn
) VALUES (
             2, 7,
             '눈 오는 날 촬영한 하얀/보라 톤 코스… 겨울감성 제대로',
             '진짜 추웠는데 결과물이 다 했다…🤣 눈 배경 덕분에 의상 색이 더 깨끗하게 떠서 만족. 망토 라인 잡으려고 팔 포즈를 크게 가져갔고, 나비 포인트는 얼굴 옆에 오게 맞춰서 캐릭터 느낌 살렸어.',
             'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/board/%EC%BD%94%EC%8A%A4%ED%94%84%EB%A0%88/%EC%BD%94%EC%8A%A4%ED%94%84%EB%A0%88-18.jfif',
             612, 77, 19,
             SYSDATE - 8, NULL, 'N'
         );

INSERT INTO board_post (
    category_id, member_id, title, content,
    thumbnail_url, view_count, like_count, comment_count,
    created_at, updated_at, deleted_yn
) VALUES (
             2, 4,
             '단체샷은 역시 재미가 다르다(컨셉 통일 최고)',
             '셋이서 컨셉 맞춰서 앉는 포즈로 찍었는데, 분위기가 확 살아남. 의상 톤이랑 코트(망토) 실루엣이 통일돼서 사진이 더 깔끔하게 나왔어. 단체는 시선 처리/손 위치 맞추는 게 은근 어렵더라.',
             'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/board/%EC%BD%94%EC%8A%A4%ED%94%84%EB%A0%88/%EC%BD%94%EC%8A%A4%ED%94%84%EB%A0%88-19.jfif',
             839, 102, 31,
             SYSDATE - 25, NULL, 'N'
         );

INSERT INTO board_post (
    category_id, member_id, title, content,
    thumbnail_url, view_count, like_count, comment_count,
    created_at, updated_at, deleted_yn
) VALUES (
             2, 6,
             '밀짚모자 선장 컨셉! 포즈 하나로 캐릭터 느낌 확 남',
             '이 의상은 포즈가 반 이상이라고 생각함ㅋㅋ 모자 각도랑 손 위치만 잡아도 바로 “그 느낌” 나와서 재밌었어. 상의는 핏이 중요해서 안쪽에 테이핑으로 라인 정리하고 촬영했음.',
             'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/board/%EC%BD%94%EC%8A%A4%ED%94%84%EB%A0%88/%EC%BD%94%EC%8A%A4%ED%94%84%EB%A0%88-20.jfif',
             523, 60, 14,
             SYSDATE - 16, NULL, 'N'
         );

INSERT INTO board_post (
    category_id, member_id, title, content,
    thumbnail_url, view_count, like_count, comment_count,
    created_at, updated_at, deleted_yn
) VALUES (
             2, 1,
             '해변 촬영 도전! 바다 배경 + 색감 조합 너무 예쁘다',
             '햇빛 강한 시간대에 찍었더니 피부톤/의상색이 깔끔하게 나옴. 바람 때문에 가발 정리가 제일 힘들었는데, 촬영 전후로 빗+스프레이로 계속 잡아줬어. 다음엔 소품을 더 준비해서 컨셉을 확실히 잡아볼 예정.',
             'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/board/%EC%BD%94%EC%8A%A4%ED%94%84%EB%A0%88/%EC%BD%94%EC%8A%A4%ED%94%84%EB%A0%88-21.jfif',
             910, 120, 28,
             SYSDATE - 11, NULL, 'N'
         );

INSERT INTO board_post (
    category_id, member_id, title, content,
    thumbnail_url, view_count, like_count, comment_count,
    created_at, updated_at, deleted_yn
) VALUES (
             2, 8,
             '블랙 교복 컨셉… 선글라스 소품 하나로 분위기 끝',
             '올블랙은 조명/배경에 따라 느낌이 크게 바뀌어서 장소 고르는 게 중요하더라. 선글라스는 “들추는 순간” 타이밍으로 잡아서 역동감 살렸고, 표정은 최대한 여유 있는 느낌으로 갔어.',
             'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/board/%EC%BD%94%EC%8A%A4%ED%94%84%EB%A0%88/%EC%BD%94%EC%8A%A4%ED%94%84%EB%A0%88-22.jfif',
             465, 49, 10,
             SYSDATE - 6, NULL, 'N'
         );

INSERT INTO board_post (
    category_id, member_id, title, content,
    thumbnail_url, view_count, like_count, comment_count,
    created_at, updated_at, deleted_yn
) VALUES (
             2, 2,
             '오렌지 단발 + 페이스 포인트 메이크업… 컨셉샷 성공',
             '이번엔 메이크업을 강하게 잡아서 얼굴 중심으로 사진이 잘 나오게 구성했어. 소품 망치는 손 위치가 계속 어색해서 여러 번 찍고 제일 자연스러운 컷으로 선택. 다음엔 동일 컨셉으로 야외에서도 찍어보고 싶다.',
             'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/board/%EC%BD%94%EC%8A%A4%ED%94%84%EB%A0%88/%EC%BD%94%EC%8A%A4%ED%94%84%EB%A0%88-23.jfif',
             578, 71, 17,
             SYSDATE - 9, NULL, 'N'
         );

INSERT INTO board_post (
    category_id, member_id, title, content,
    thumbnail_url, view_count, like_count, comment_count,
    created_at, updated_at, deleted_yn
) VALUES (
             2, 5,
             '블루 롱헤어 + 정장 컨셉… 깔끔하게 “캐릭터감” 살리기',
             '정장 계열은 라인 정리가 생명이라 옷 주름/카라 라인 계속 체크하면서 촬영했어. 렌즈는 너무 튀지 않게 맞췄고, 소품 검은 사진에 안 잡히면 밋밋해서 최대한 프레임 안에 들어오게 구도 잡았음.',
             'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/board/%EC%BD%94%EC%8A%A4%ED%94%84%EB%A0%88/%EC%BD%94%EC%8A%A4%ED%94%84%EB%A0%88-24.jfif',
             392, 43, 8,
             SYSDATE - 3, NULL, 'N'
         );

INSERT INTO board_post (
    category_id, member_id, title, content,
    thumbnail_url, view_count, like_count, comment_count,
    created_at, updated_at, deleted_yn
) VALUES (
             2, 12,
             '단체 망토 코스 완성… 이 각도는 진짜 “그 장면”이다',
             '망토 디테일이랑 헤어 세팅이 핵심이라 촬영 전에 옷 라인/카라 각도부터 잡았어. 야외에서 찍으니까 색 대비가 확 살아나서 만족. 손 포즈는 여러 번 연습했는데, 카메라 앞에 서면 은근 어색해서 결국 제일 자연스러운 컷으로 선택!',
             'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/board/%EC%BD%94%EC%8A%A4%ED%94%84%EB%A0%88/%EC%BD%94%EC%8A%A4%ED%94%84%EB%A0%88-25.jfif',
             681, 79, 18,
             SYSDATE - 12, NULL, 'N'
         );

INSERT INTO board_post (
    category_id, member_id, title, content,
    thumbnail_url, view_count, like_count, comment_count,
    created_at, updated_at, deleted_yn
) VALUES (
             2, 16,
             '단체샷 찍었는데 컨셉이 너무 과몰입이라 웃김ㅋㅋ',
             '여러 명이 같이 찍으니까 각자 포즈/표정 맞추는 게 제일 어려웠음. 그래도 망토 통일감 덕분에 사진이 꽉 차 보이고, 한 컷으로 “집단” 느낌 확 살아나서 만족! 촬영 끝나고 망토 정리만 한참 했다는 건 비밀…',
             'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/board/%EC%BD%94%EC%8A%A4%ED%94%84%EB%A0%88/%EC%BD%94%EC%8A%A4%ED%94%84%EB%A0%88-26.jfif',
             942, 121, 33,
             SYSDATE - 20, NULL, 'N'
         );

INSERT INTO board_post (
    category_id, member_id, title, content,
    thumbnail_url, view_count, like_count, comment_count,
    created_at, updated_at, deleted_yn
) VALUES (
             2, 17,
             '금발 망토 코스 도전! 손 포즈 + 표정이 전부였다',
             '이 캐릭터는 표정이 반이라서 눈썹/아이라인에 힘 줬고, 렌즈도 톤 맞춰서 끼웠어. 손바닥 문양은 촬영 전에 빠르게 보정해서 선명하게 나오게 했고, 배경을 어둡게 잡으니까 의상이 더 튀어나와서 결과물 마음에 듦.',
             'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/board/%EC%BD%94%EC%8A%A4%ED%94%84%EB%A0%88/%EC%BD%94%EC%8A%A4%ED%94%84%EB%A0%88-27.jfif',
             534, 65, 11,
             SYSDATE - 7, NULL, 'N'
         );

-- ======================
-- category_id = 3 (자유)
-- ======================
INSERT INTO board_post (
    category_id, member_id, title, content,
    thumbnail_url, view_count, like_count, comment_count,
    created_at, updated_at, deleted_yn
) VALUES (
             3, 10,
             '오늘 야식 치킨… 소스 조합 미쳤다',
             '바삭한 치킨에 양념/치즈 소스 찍어먹고, 치킨무까지 같이 먹으니까 끝… 한 입 먹고 “아 오늘은 성공이다” 소리 나옴. 다음엔 맥주까지 세트로 가야겠다.',
             'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/board/%EC%9E%90%EC%9C%A0/%EC%9E%90%EC%9C%A0-1.jpg',
             388, 27, 6,
             SYSDATE - 1, NULL, 'N'
         );

INSERT INTO board_post (
    category_id, member_id, title, content,
    thumbnail_url, view_count, like_count, comment_count,
    created_at, updated_at, deleted_yn
) VALUES (
             3, 11,
             '이 짤 볼 때마다 대사 타이밍이 너무 웃김ㅋㅋ',
             '“큰일 났어”로 시작해서 점점 상황이 이상해지는 흐름이 진짜 레전드… 마지막 한 줄이 화룡점정임. 단톡방에 던지면 반응 보장.',
             'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/board/%EC%9E%90%EC%9C%A0/%EC%9E%90%EC%9C%A0-2.png',
             742, 61, 15,
             SYSDATE - 3, NULL, 'N'
         );

INSERT INTO board_post (
    category_id, member_id, title, content,
    thumbnail_url, view_count, like_count, comment_count,
    created_at, updated_at, deleted_yn
) VALUES (
             3, 12,
             '질문 하나로 멘탈 부서지는 순간',
             '짧은 글인데 묘하게 파괴력 있음… “그렇게 보이는 이유”가 더 궁금해지는 글이라 댓글창 들어가게 됨. 이런 건 볼 때마다 웃프다.',
             'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/board/%EC%9E%90%EC%9C%A0/%EC%9E%90%EC%9C%A0-3.jpg',
             529, 44, 9,
             SYSDATE - 8, NULL, 'N'
         );

INSERT INTO board_post (
    category_id, member_id, title, content,
    thumbnail_url, view_count, like_count, comment_count,
    created_at, updated_at, deleted_yn
) VALUES (
             3, 13,
             '서울 살면 말투가 이렇게 변하나 봄',
             '처음엔 “난 절대 안 바뀜”이라고 생각했는데 어느 순간 튀어나오는 말투가 있음ㅋㅋ 지역별로 말투 변화 체감되는 포인트가 재밌다. 다들 이런 경험 있어?',
             'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/board/%EC%9E%90%EC%9C%A0/%EC%9E%90%EC%9C%A0-4.jfif',
             311, 22, 5,
             SYSDATE - 15, NULL, 'N'
         );

INSERT INTO board_post (
    category_id, member_id, title, content,
    thumbnail_url, view_count, like_count, comment_count,
    created_at, updated_at, deleted_yn
) VALUES (
             3, 14,
             '대화가 너무 깔끔하게 끝나서 웃음 터짐',
             '상대가 진지하게 고민 말하는데 갑자기 한 단어로 정리되는 그 느낌…ㅋㅋ 이런 템포는 진짜 센스다. “굿” 한 방이면 종결.',
             'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/board/%EC%9E%90%EC%9C%A0/%EC%9E%90%EC%9C%A0-5.jpeg',
             615, 49, 11,
             SYSDATE - 6, NULL, 'N'
         );

INSERT INTO board_post (
    category_id, member_id, title, content,
    thumbnail_url, view_count, like_count, comment_count,
    created_at, updated_at, deleted_yn
) VALUES (
             3, 15,
             '이런 전/후 비교는 진짜 반칙 아니냐',
             '한 장으로 “변신”이 설명되는 케이스… 포인트는 헤어/눈썹/피부톤인 듯. 셀프 관리의 중요성을 다시 느낀다.',
             'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/board/%EC%9E%90%EC%9C%A0/%EC%9E%90%EC%9C%A0-6.jfif',
             804, 73, 18,
             SYSDATE - 11, NULL, 'N'
         );

INSERT INTO board_post (
    category_id, member_id, title, content,
    thumbnail_url, view_count, like_count, comment_count,
    created_at, updated_at, deleted_yn
) VALUES (
             3, 16,
             '원피스 신권 표지 떴길래 저장함',
             '표지만 봐도 “이번 권은 사건 크다” 느낌이 확 남. 표지 구성 꽉 차 있는 거 너무 좋다… 읽을 시간만 생기면 바로 달릴 예정.',
             'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/board/%EC%9E%90%EC%9C%A0/%EC%9E%90%EC%9C%A0-7.jpg',
             457, 38, 7,
             SYSDATE - 2, NULL, 'N'
         );

INSERT INTO board_post (
    category_id, member_id, title, content,
    thumbnail_url, view_count, like_count, comment_count,
    created_at, updated_at, deleted_yn
) VALUES (
             3, 17,
             '이 장면 캡처… 표정이 너무 강렬해서 저장',
             '그냥 “미친 텐션” 그 자체라서 짤로 저장해둠ㅋㅋ 이런 장면은 설명 필요 없이 짤 하나로 끝나는 느낌.',
             'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/board/%EC%9E%90%EC%9C%A0/%EC%9E%90%EC%9C%A0-8.jfif',
             690, 55, 12,
             SYSDATE - 9, NULL, 'N'
         );

INSERT INTO board_post (
    category_id, member_id, title, content,
    thumbnail_url, view_count, like_count, comment_count,
    created_at, updated_at, deleted_yn
) VALUES (
             3, 18,
             '거인 나오는 그 작품은 역시 스케일이 다르다',
             '압도감 장난 아니고, 한 컷만 봐도 긴장감이 느껴짐. 이런 장면 나오면 다음 화까지 기다리는 게 고역…',
             'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/board/%EC%9E%90%EC%9C%A0/%EC%9E%90%EC%9C%A0-9.jfif',
             733, 62, 14,
             SYSDATE - 4, NULL, 'N'
         );

INSERT INTO board_post (
    category_id, member_id, title, content,
    thumbnail_url, view_count, like_count, comment_count,
    created_at, updated_at, deleted_yn
) VALUES (
             3, 12,
             '이런 잔잔한 컷이 더 오래 기억남',
             '화려한 전투도 좋지만, 가끔은 이런 조용한 장면이 더 마음에 남더라. 분위기랑 표정이 너무 좋음. 그냥 저장각.',
             'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/board/%EC%9E%90%EC%9C%A0/%EC%9E%90%EC%9C%A0-10.jfif',
             402, 33, 6,
             SYSDATE - 9, NULL, 'N'
         );

INSERT INTO board_post (
    category_id, member_id, title, content,
    thumbnail_url, view_count, like_count, comment_count,
    created_at, updated_at, deleted_yn
) VALUES (
             3, 13,
             '요즘 게임/애니 연출… 이펙트 맛이 미쳤다',
             '푸른 오라 이펙트 들어가면 무조건 간지… 화면이 꽉 차는 느낌이라 보는 맛이 있음. 이런 컨셉은 진짜 카메라 워크가 다 하더라.',
             'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/board/%EC%9E%90%EC%9C%A0/%EC%9E%90%EC%9C%A0-11.jfif',
             511, 41, 8,
             SYSDATE - 15, NULL, 'N'
         );

INSERT INTO board_post (
    category_id, member_id, title, content,
    thumbnail_url, view_count, like_count, comment_count,
    created_at, updated_at, deleted_yn
) VALUES (
             3, 14,
             '이 표정은 진짜… 감정선 폭발 컷',
             '상처/피로감까지 다 담긴 표정이라 한 번 보면 안 잊힘. 이런 컷은 대사 없어도 분위기만으로 설명되는 느낌.',
             'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/board/%EC%9E%90%EC%9C%A0/%EC%9E%90%EC%9C%A0-12.jfif',
             748, 64, 13,
             SYSDATE - 4, NULL, 'N'
         );

INSERT INTO board_post (
    category_id, member_id, title, content,
    thumbnail_url, view_count, like_count, comment_count,
    created_at, updated_at, deleted_yn
) VALUES (
             3, 15,
             '오늘의 야식 인증… 양념이 반칙이다',
             '겉바속촉에 양념 촉촉하게 배어있어서 그냥 순삭. “한 조각만” 했다가 결국 다 먹음… 다음엔 콜라/맥주까지 세트로 가야겠다.',
             'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/board/%EC%9E%90%EC%9C%A0/%EC%9E%90%EC%9C%A0-13.jpg',
             368, 29, 7,
             SYSDATE - 2, NULL, 'N'
         );

INSERT INTO board_post (
    category_id, member_id, title, content,
    thumbnail_url, view_count, like_count, comment_count,
    created_at, updated_at, deleted_yn
) VALUES (
             3, 16,
             '길거리 음식은 현장감이 다 한다',
             '막 구워지는 소리 + 냄새 상상만 해도 배고픔. 이런 건 뜨거울 때 바로 먹어야 제맛인데… 사진 보니까 또 먹고 싶다.',
             'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/board/%EC%9E%90%EC%9C%A0/%EC%9E%90%EC%9C%A0-14.jfif',
             295, 21, 5,
             SYSDATE - 7, NULL, 'N'
         );

INSERT INTO board_post (
    category_id, member_id, title, content,
    thumbnail_url, view_count, like_count, comment_count,
    created_at, updated_at, deleted_yn
) VALUES (
             3, 17,
             'AI가 이렇게 생각하는 느낌일 때 있음ㅋㅋ',
             '머리는 돌고 있는데 결론이 안 나는 그 순간… “정리 좀 해줘” 하고 싶어짐. 오늘 내 상태가 딱 이 짤 같았다.',
             'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/board/%EC%9E%90%EC%9C%A0/%EC%9E%90%EC%9C%A0-15.jfif',
             579, 47, 11,
             SYSDATE - 1, NULL, 'N'
         );

INSERT INTO board_bookmark (member_id, post_id, created_at)
VALUES (1, 1, SYSDATE - 30);

INSERT INTO board_bookmark (member_id, post_id, created_at)
VALUES (1, 2, SYSDATE - 29);

INSERT INTO board_bookmark (member_id, post_id, created_at)
VALUES (1, 3, SYSDATE - 28);

INSERT INTO board_bookmark (member_id, post_id, created_at)
VALUES (2, 1, SYSDATE - 27);

INSERT INTO board_bookmark (member_id, post_id, created_at)
VALUES (2, 2, SYSDATE - 26);

INSERT INTO board_bookmark (member_id, post_id, created_at)
VALUES (2, 4, SYSDATE - 25);

INSERT INTO board_bookmark (member_id, post_id, created_at)
VALUES (3, 1, SYSDATE - 24);

INSERT INTO board_bookmark (member_id, post_id, created_at)
VALUES (3, 3, SYSDATE - 23);

INSERT INTO board_bookmark (member_id, post_id, created_at)
VALUES (3, 5, SYSDATE - 22);

INSERT INTO board_bookmark (member_id, post_id, created_at)
VALUES (4, 2, SYSDATE - 21);

INSERT INTO board_bookmark (member_id, post_id, created_at)
VALUES (4, 3, SYSDATE - 20);

INSERT INTO board_bookmark (member_id, post_id, created_at)
VALUES (4, 4, SYSDATE - 19);

INSERT INTO board_bookmark (member_id, post_id, created_at)
VALUES (5, 1, SYSDATE - 18);

INSERT INTO board_bookmark (member_id, post_id, created_at)
VALUES (5, 2, SYSDATE - 17);

INSERT INTO board_bookmark (member_id, post_id, created_at)
VALUES (5, 5, SYSDATE - 16);

INSERT INTO board_bookmark (member_id, post_id, created_at)
VALUES (6, 3, SYSDATE - 15);

INSERT INTO board_bookmark (member_id, post_id, created_at)
VALUES (6, 4, SYSDATE - 14);

INSERT INTO board_bookmark (member_id, post_id, created_at)
VALUES (6, 6, SYSDATE - 13);

INSERT INTO board_bookmark (member_id, post_id, created_at)
VALUES (7, 2, SYSDATE - 12);

INSERT INTO board_bookmark (member_id, post_id, created_at)
VALUES (7, 5, SYSDATE - 11);

INSERT INTO board_bookmark (member_id, post_id, created_at)
VALUES (7, 7, SYSDATE - 10);

INSERT INTO board_bookmark (member_id, post_id, created_at)
VALUES (8, 4, SYSDATE - 9);

INSERT INTO board_bookmark (member_id, post_id, created_at)
VALUES (8, 6, SYSDATE - 8);

INSERT INTO board_bookmark (member_id, post_id, created_at)
VALUES (8, 8, SYSDATE - 7);

INSERT INTO board_bookmark (member_id, post_id, created_at)
VALUES (9, 5, SYSDATE - 6);

INSERT INTO board_bookmark (member_id, post_id, created_at)
VALUES (9, 7, SYSDATE - 5);

INSERT INTO board_bookmark (member_id, post_id, created_at)
VALUES (9, 9, SYSDATE - 4);

INSERT INTO board_bookmark (member_id, post_id, created_at)
VALUES (10, 6, SYSDATE - 3);

INSERT INTO board_bookmark (member_id, post_id, created_at)
VALUES (10, 8, SYSDATE - 2);

INSERT INTO board_bookmark (member_id, post_id, created_at)
VALUES (10, 10, SYSDATE - 1);
commit;
INSERT INTO board_comment (
    post_id, member_id, parent_comment_id,
    content, like_count, created_at, updated_at, deleted_yn
) VALUES (
             1, 1, NULL,
             '테스트 댓글 001번 내용입니다.', 0, SYSDATE, NULL, 'N'
         );

INSERT INTO board_comment (
    post_id, member_id, parent_comment_id,
    content, like_count, created_at, updated_at, deleted_yn
) VALUES (
             2, 2, NULL,
             '테스트 댓글 002번 내용입니다.', 0, SYSDATE, NULL, 'N'
         );

INSERT INTO board_comment (
    post_id, member_id, parent_comment_id,
    content, like_count, created_at, updated_at, deleted_yn
) VALUES (
             3, 3, NULL,
             '테스트 댓글 003번 내용입니다.', 0, SYSDATE, NULL, 'N'
         );

INSERT INTO board_comment (
    post_id, member_id, parent_comment_id,
    content, like_count, created_at, updated_at, deleted_yn
) VALUES (
             4, 4, NULL,
             '테스트 댓글 004번 내용입니다.', 0, SYSDATE, NULL, 'N'
         );

INSERT INTO board_comment (
    post_id, member_id, parent_comment_id,
    content, like_count, created_at, updated_at, deleted_yn
) VALUES (
             5, 5, NULL,
             '테스트 댓글 005번 내용입니다.', 0, SYSDATE, NULL, 'N'
         );

INSERT INTO board_comment (
    post_id, member_id, parent_comment_id,
    content, like_count, created_at, updated_at, deleted_yn
) VALUES (
             6, 1, NULL,
             '테스트 댓글 006번 내용입니다.', 0, SYSDATE, NULL, 'N'
         );

INSERT INTO board_comment (
    post_id, member_id, parent_comment_id,
    content, like_count, created_at, updated_at, deleted_yn
) VALUES (
             7, 2, NULL,
             '테스트 댓글 007번 내용입니다.', 0, SYSDATE, NULL, 'N'
         );

INSERT INTO board_comment (
    post_id, member_id, parent_comment_id,
    content, like_count, created_at, updated_at, deleted_yn
) VALUES (
             8, 3, NULL,
             '테스트 댓글 008번 내용입니다.', 0, SYSDATE, NULL, 'N'
         );

INSERT INTO board_comment (
    post_id, member_id, parent_comment_id,
    content, like_count, created_at, updated_at, deleted_yn
) VALUES (
             9, 4, NULL,
             '테스트 댓글 009번 내용입니다.', 0, SYSDATE, NULL, 'N'
         );

INSERT INTO board_comment (
    post_id, member_id, parent_comment_id,
    content, like_count, created_at, updated_at, deleted_yn
) VALUES (
             10, 5, NULL,
             '테스트 댓글 010번 내용입니다.', 0, SYSDATE, NULL, 'N'
         );

-- 11 ~ 20
INSERT INTO board_comment (
    post_id, member_id, parent_comment_id,
    content, like_count, created_at, updated_at, deleted_yn
) VALUES (
             1, 1, NULL,
             '테스트 댓글 011번 내용입니다.', 0, SYSDATE, NULL, 'N'
         );

INSERT INTO board_comment (
    post_id, member_id, parent_comment_id,
    content, like_count, created_at, updated_at, deleted_yn
) VALUES (
             2, 2, NULL,
             '테스트 댓글 012번 내용입니다.', 0, SYSDATE, NULL, 'N'
         );

INSERT INTO board_comment (
    post_id, member_id, parent_comment_id,
    content, like_count, created_at, updated_at, deleted_yn
) VALUES (
             3, 3, NULL,
             '테스트 댓글 013번 내용입니다.', 0, SYSDATE, NULL, 'N'
         );

INSERT INTO board_comment (
    post_id, member_id, parent_comment_id,
    content, like_count, created_at, updated_at, deleted_yn
) VALUES (
             4, 4, NULL,
             '테스트 댓글 014번 내용입니다.', 0, SYSDATE, NULL, 'N'
         );

INSERT INTO board_comment (
    post_id, member_id, parent_comment_id,
    content, like_count, created_at, updated_at, deleted_yn
) VALUES (
             5, 5, NULL,
             '테스트 댓글 015번 내용입니다.', 0, SYSDATE, NULL, 'N'
         );

INSERT INTO board_comment (
    post_id, member_id, parent_comment_id,
    content, like_count, created_at, updated_at, deleted_yn
) VALUES (
             6, 1, NULL,
             '테스트 댓글 016번 내용입니다.', 0, SYSDATE, NULL, 'N'
         );

INSERT INTO board_comment (
    post_id, member_id, parent_comment_id,
    content, like_count, created_at, updated_at, deleted_yn
) VALUES (
             7, 2, NULL,
             '테스트 댓글 017번 내용입니다.', 0, SYSDATE, NULL, 'N'
         );

INSERT INTO board_comment (
    post_id, member_id, parent_comment_id,
    content, like_count, created_at, updated_at, deleted_yn
) VALUES (
             8, 3, NULL,
             '테스트 댓글 018번 내용입니다.', 0, SYSDATE, NULL, 'N'
         );

INSERT INTO board_comment (
    post_id, member_id, parent_comment_id,
    content, like_count, created_at, updated_at, deleted_yn
) VALUES (
             9, 4, NULL,
             '테스트 댓글 019번 내용입니다.', 0, SYSDATE, NULL, 'N'
         );

INSERT INTO board_comment (
    post_id, member_id, parent_comment_id,
    content, like_count, created_at, updated_at, deleted_yn
) VALUES (
             10, 5, NULL,
             '테스트 댓글 020번 내용입니다.', 0, SYSDATE, NULL, 'N'
         );

-- 21 ~ 30
INSERT INTO board_comment (
    post_id, member_id, parent_comment_id,
    content, like_count, created_at, updated_at, deleted_yn
) VALUES (
             1, 1, NULL,
             '테스트 댓글 021번 내용입니다.', 0, SYSDATE, NULL, 'N'
         );

INSERT INTO board_comment (
    post_id, member_id, parent_comment_id,
    content, like_count, created_at, updated_at, deleted_yn
) VALUES (
             2, 2, NULL,
             '테스트 댓글 022번 내용입니다.', 0, SYSDATE, NULL, 'N'
         );

INSERT INTO board_comment (
    post_id, member_id, parent_comment_id,
    content, like_count, created_at, updated_at, deleted_yn
) VALUES (
             3, 3, NULL,
             '테스트 댓글 023번 내용입니다.', 0, SYSDATE, NULL, 'N'
         );

INSERT INTO board_comment (
    post_id, member_id, parent_comment_id,
    content, like_count, created_at, updated_at, deleted_yn
) VALUES (
             4, 4, NULL,
             '테스트 댓글 024번 내용입니다.', 0, SYSDATE, NULL, 'N'
         );

INSERT INTO board_comment (
    post_id, member_id, parent_comment_id,
    content, like_count, created_at, updated_at, deleted_yn
) VALUES (
             5, 5, NULL,
             '테스트 댓글 025번 내용입니다.', 0, SYSDATE, NULL, 'N'
         );

INSERT INTO board_comment (
    post_id, member_id, parent_comment_id,
    content, like_count, created_at, updated_at, deleted_yn
) VALUES (
             6, 1, NULL,
             '테스트 댓글 026번 내용입니다.', 0, SYSDATE, NULL, 'N'
         );

INSERT INTO board_comment (
    post_id, member_id, parent_comment_id,
    content, like_count, created_at, updated_at, deleted_yn
) VALUES (
             7, 2, NULL,
             '테스트 댓글 027번 내용입니다.', 0, SYSDATE, NULL, 'N'
         );

INSERT INTO board_comment (
    post_id, member_id, parent_comment_id,
    content, like_count, created_at, updated_at, deleted_yn
) VALUES (
             8, 3, NULL,
             '테스트 댓글 028번 내용입니다.', 0, SYSDATE, NULL, 'N'
         );

INSERT INTO board_comment (
    post_id, member_id, parent_comment_id,
    content, like_count, created_at, updated_at, deleted_yn
) VALUES (
             9, 4, NULL,
             '테스트 댓글 029번 내용입니다.', 0, SYSDATE, NULL, 'N'
         );

INSERT INTO board_comment (
    post_id, member_id, parent_comment_id,
    content, like_count, created_at, updated_at, deleted_yn
) VALUES (
             10, 5, NULL,
             '테스트 댓글 030번 내용입니다.', 0, SYSDATE, NULL, 'N'
         );

-- 31 ~ 40
INSERT INTO board_comment (
    post_id, member_id, parent_comment_id,
    content, like_count, created_at, updated_at, deleted_yn
) VALUES (
             1, 1, NULL,
             '테스트 댓글 031번 내용입니다.', 0, SYSDATE, NULL, 'N'
         );

INSERT INTO board_comment (
    post_id, member_id, parent_comment_id,
    content, like_count, created_at, updated_at, deleted_yn
) VALUES (
             2, 2, NULL,
             '테스트 댓글 032번 내용입니다.', 0, SYSDATE, NULL, 'N'
         );

INSERT INTO board_comment (
    post_id, member_id, parent_comment_id,
    content, like_count, created_at, updated_at, deleted_yn
) VALUES (
             3, 3, NULL,
             '테스트 댓글 033번 내용입니다.', 0, SYSDATE, NULL, 'N'
         );

INSERT INTO board_comment (
    post_id, member_id, parent_comment_id,
    content, like_count, created_at, updated_at, deleted_yn
) VALUES (
             4, 4, NULL,
             '테스트 댓글 034번 내용입니다.', 0, SYSDATE, NULL, 'N'
         );

INSERT INTO board_comment (
    post_id, member_id, parent_comment_id,
    content, like_count, created_at, updated_at, deleted_yn
) VALUES (
             5, 5, NULL,
             '테스트 댓글 035번 내용입니다.', 0, SYSDATE, NULL, 'N'
         );

INSERT INTO board_comment (
    post_id, member_id, parent_comment_id,
    content, like_count, created_at, updated_at, deleted_yn
) VALUES (
             6, 1, NULL,
             '테스트 댓글 036번 내용입니다.', 0, SYSDATE, NULL, 'N'
         );

INSERT INTO board_comment (
    post_id, member_id, parent_comment_id,
    content, like_count, created_at, updated_at, deleted_yn
) VALUES (
             7, 2, NULL,
             '테스트 댓글 037번 내용입니다.', 0, SYSDATE, NULL, 'N'
         );

INSERT INTO board_comment (
    post_id, member_id, parent_comment_id,
    content, like_count, created_at, updated_at, deleted_yn
) VALUES (
             8, 3, NULL,
             '테스트 댓글 038번 내용입니다.', 0, SYSDATE, NULL, 'N'
         );

INSERT INTO board_comment (
    post_id, member_id, parent_comment_id,
    content, like_count, created_at, updated_at, deleted_yn
) VALUES (
             9, 4, NULL,
             '테스트 댓글 039번 내용입니다.', 0, SYSDATE, NULL, 'N'
         );

INSERT INTO board_comment (
    post_id, member_id, parent_comment_id,
    content, like_count, created_at, updated_at, deleted_yn
) VALUES (
             10, 5, NULL,
             '테스트 댓글 040번 내용입니다.', 0, SYSDATE, NULL, 'N'
         );

-- 41 ~ 50
INSERT INTO board_comment (
    post_id, member_id, parent_comment_id,
    content, like_count, created_at, updated_at, deleted_yn
) VALUES (
             1, 1, NULL,
             '테스트 댓글 041번 내용입니다.', 0, SYSDATE, NULL, 'N'
         );

INSERT INTO board_comment (
    post_id, member_id, parent_comment_id,
    content, like_count, created_at, updated_at, deleted_yn
) VALUES (
             2, 2, NULL,
             '테스트 댓글 042번 내용입니다.', 0, SYSDATE, NULL, 'N'
         );

INSERT INTO board_comment (
    post_id, member_id, parent_comment_id,
    content, like_count, created_at, updated_at, deleted_yn
) VALUES (
             3, 3, NULL,
             '테스트 댓글 043번 내용입니다.', 0, SYSDATE, NULL, 'N'
         );

INSERT INTO board_comment (
    post_id, member_id, parent_comment_id,
    content, like_count, created_at, updated_at, deleted_yn
) VALUES (
             4, 4, NULL,
             '테스트 댓글 044번 내용입니다.', 0, SYSDATE, NULL, 'N'
         );

INSERT INTO board_comment (
    post_id, member_id, parent_comment_id,
    content, like_count, created_at, updated_at, deleted_yn
) VALUES (
             5, 5, NULL,
             '테스트 댓글 045번 내용입니다.', 0, SYSDATE, NULL, 'N'
         );

INSERT INTO board_comment (
    post_id, member_id, parent_comment_id,
    content, like_count, created_at, updated_at, deleted_yn
) VALUES (
             6, 1, NULL,
             '테스트 댓글 046번 내용입니다.', 0, SYSDATE, NULL, 'N'
         );

INSERT INTO board_comment (
    post_id, member_id, parent_comment_id,
    content, like_count, created_at, updated_at, deleted_yn
) VALUES (
             7, 2, NULL,
             '테스트 댓글 047번 내용입니다.', 0, SYSDATE, NULL, 'N'
         );

INSERT INTO board_comment (
    post_id, member_id, parent_comment_id,
    content, like_count, created_at, updated_at, deleted_yn
) VALUES (
             8, 3, NULL,
             '테스트 댓글 048번 내용입니다.', 0, SYSDATE, NULL, 'N'
         );

INSERT INTO board_comment (
    post_id, member_id, parent_comment_id,
    content, like_count, created_at, updated_at, deleted_yn
) VALUES (
             9, 4, NULL,
             '테스트 댓글 049번 내용입니다.', 0, SYSDATE, NULL, 'N'
         );

INSERT INTO board_comment (
    post_id, member_id, parent_comment_id,
    content, like_count, created_at, updated_at, deleted_yn
) VALUES (
             10, 5, NULL,
             '테스트 댓글 050번 내용입니다.', 0, SYSDATE, NULL, 'N'
         );

-- 51 ~ 60
INSERT INTO board_comment (
    post_id, member_id, parent_comment_id,
    content, like_count, created_at, updated_at, deleted_yn
) VALUES (
             1, 1, NULL,
             '테스트 댓글 051번 내용입니다.', 0, SYSDATE, NULL, 'N'
         );

INSERT INTO board_comment (
    post_id, member_id, parent_comment_id,
    content, like_count, created_at, updated_at, deleted_yn
) VALUES (
             2, 2, NULL,
             '테스트 댓글 052번 내용입니다.', 0, SYSDATE, NULL, 'N'
         );

INSERT INTO board_comment (
    post_id, member_id, parent_comment_id,
    content, like_count, created_at, updated_at, deleted_yn
) VALUES (
             3, 3, NULL,
             '테스트 댓글 053번 내용입니다.', 0, SYSDATE, NULL, 'N'
         );

INSERT INTO board_comment (
    post_id, member_id, parent_comment_id,
    content, like_count, created_at, updated_at, deleted_yn
) VALUES (
             4, 4, NULL,
             '테스트 댓글 054번 내용입니다.', 0, SYSDATE, NULL, 'N'
         );

INSERT INTO board_comment (
    post_id, member_id, parent_comment_id,
    content, like_count, created_at, updated_at, deleted_yn
) VALUES (
             5, 5, NULL,
             '테스트 댓글 055번 내용입니다.', 0, SYSDATE, NULL, 'N'
         );

INSERT INTO board_comment (
    post_id, member_id, parent_comment_id,
    content, like_count, created_at, updated_at, deleted_yn
) VALUES (
             6, 1, NULL,
             '테스트 댓글 056번 내용입니다.', 0, SYSDATE, NULL, 'N'
         );

INSERT INTO board_comment (
    post_id, member_id, parent_comment_id,
    content, like_count, created_at, updated_at, deleted_yn
) VALUES (
             7, 2, NULL,
             '테스트 댓글 057번 내용입니다.', 0, SYSDATE, NULL, 'N'
         );

INSERT INTO board_comment (
    post_id, member_id, parent_comment_id,
    content, like_count, created_at, updated_at, deleted_yn
) VALUES (
             8, 3, NULL,
             '테스트 댓글 058번 내용입니다.', 0, SYSDATE, NULL, 'N'
         );

INSERT INTO board_comment (
    post_id, member_id, parent_comment_id,
    content, like_count, created_at, updated_at, deleted_yn
) VALUES (
             9, 4, NULL,
             '테스트 댓글 059번 내용입니다.', 0, SYSDATE, NULL, 'N'
         );

INSERT INTO board_comment (
    post_id, member_id, parent_comment_id,
    content, like_count, created_at, updated_at, deleted_yn
) VALUES (
             10, 5, NULL,
             '테스트 댓글 060번 내용입니다.', 0, SYSDATE, NULL, 'N'
         );

-- 61 ~ 70
INSERT INTO board_comment (
    post_id, member_id, parent_comment_id,
    content, like_count, created_at, updated_at, deleted_yn
) VALUES (
             1, 1, NULL,
             '테스트 댓글 061번 내용입니다.', 0, SYSDATE, NULL, 'N'
         );

INSERT INTO board_comment (
    post_id, member_id, parent_comment_id,
    content, like_count, created_at, updated_at, deleted_yn
) VALUES (
             2, 2, NULL,
             '테스트 댓글 062번 내용입니다.', 0, SYSDATE, NULL, 'N'
         );

INSERT INTO board_comment (
    post_id, member_id, parent_comment_id,
    content, like_count, created_at, updated_at, deleted_yn
) VALUES (
             3, 3, NULL,
             '테스트 댓글 063번 내용입니다.', 0, SYSDATE, NULL, 'N'
         );

INSERT INTO board_comment (
    post_id, member_id, parent_comment_id,
    content, like_count, created_at, updated_at, deleted_yn
) VALUES (
             4, 4, NULL,
             '테스트 댓글 064번 내용입니다.', 0, SYSDATE, NULL, 'N'
         );

INSERT INTO board_comment (
    post_id, member_id, parent_comment_id,
    content, like_count, created_at, updated_at, deleted_yn
) VALUES (
             5, 5, NULL,
             '테스트 댓글 065번 내용입니다.', 0, SYSDATE, NULL, 'N'
         );

INSERT INTO board_comment (
    post_id, member_id, parent_comment_id,
    content, like_count, created_at, updated_at, deleted_yn
) VALUES (
             6, 1, NULL,
             '테스트 댓글 066번 내용입니다.', 0, SYSDATE, NULL, 'N'
         );

INSERT INTO board_comment (
    post_id, member_id, parent_comment_id,
    content, like_count, created_at, updated_at, deleted_yn
) VALUES (
             7, 2, NULL,
             '테스트 댓글 067번 내용입니다.', 0, SYSDATE, NULL, 'N'
         );

INSERT INTO board_comment (
    post_id, member_id, parent_comment_id,
    content, like_count, created_at, updated_at, deleted_yn
) VALUES (
             8, 3, NULL,
             '테스트 댓글 068번 내용입니다.', 0, SYSDATE, NULL, 'N'
         );

INSERT INTO board_comment (
    post_id, member_id, parent_comment_id,
    content, like_count, created_at, updated_at, deleted_yn
) VALUES (
             9, 4, NULL,
             '테스트 댓글 069번 내용입니다.', 0, SYSDATE, NULL, 'N'
         );

INSERT INTO board_comment (
    post_id, member_id, parent_comment_id,
    content, like_count, created_at, updated_at, deleted_yn
) VALUES (
             10, 5, NULL,
             '테스트 댓글 070번 내용입니다.', 0, SYSDATE, NULL, 'N'
         );

-- 71 ~ 80
INSERT INTO board_comment (
    post_id, member_id, parent_comment_id,
    content, like_count, created_at, updated_at, deleted_yn
) VALUES (
             1, 1, NULL,
             '테스트 댓글 071번 내용입니다.', 0, SYSDATE, NULL, 'N'
         );

INSERT INTO board_comment (
    post_id, member_id, parent_comment_id,
    content, like_count, created_at, updated_at, deleted_yn
) VALUES (
             2, 2, NULL,
             '테스트 댓글 072번 내용입니다.', 0, SYSDATE, NULL, 'N'
         );

INSERT INTO board_comment (
    post_id, member_id, parent_comment_id,
    content, like_count, created_at, updated_at, deleted_yn
) VALUES (
             3, 3, NULL,
             '테스트 댓글 073번 내용입니다.', 0, SYSDATE, NULL, 'N'
         );

INSERT INTO board_comment (
    post_id, member_id, parent_comment_id,
    content, like_count, created_at, updated_at, deleted_yn
) VALUES (
             4, 4, NULL,
             '테스트 댓글 074번 내용입니다.', 0, SYSDATE, NULL, 'N'
         );

INSERT INTO board_comment (
    post_id, member_id, parent_comment_id,
    content, like_count, created_at, updated_at, deleted_yn
) VALUES (
             5, 5, NULL,
             '테스트 댓글 075번 내용입니다.', 0, SYSDATE, NULL, 'N'
         );

INSERT INTO board_comment (
    post_id, member_id, parent_comment_id,
    content, like_count, created_at, updated_at, deleted_yn
) VALUES (
             6, 1, NULL,
             '테스트 댓글 076번 내용입니다.', 0, SYSDATE, NULL, 'N'
         );

INSERT INTO board_comment (
    post_id, member_id, parent_comment_id,
    content, like_count, created_at, updated_at, deleted_yn
) VALUES (
             7, 2, NULL,
             '테스트 댓글 077번 내용입니다.', 0, SYSDATE, NULL, 'N'
         );

INSERT INTO board_comment (
    post_id, member_id, parent_comment_id,
    content, like_count, created_at, updated_at, deleted_yn
) VALUES (
             8, 3, NULL,
             '테스트 댓글 078번 내용입니다.', 0, SYSDATE, NULL, 'N'
         );

INSERT INTO board_comment (
    post_id, member_id, parent_comment_id,
    content, like_count, created_at, updated_at, deleted_yn
) VALUES (
             9, 4, NULL,
             '테스트 댓글 079번 내용입니다.', 0, SYSDATE, NULL, 'N'
         );

INSERT INTO board_comment (
    post_id, member_id, parent_comment_id,
    content, like_count, created_at, updated_at, deleted_yn
) VALUES (
             10, 5, NULL,
             '테스트 댓글 080번 내용입니다.', 0, SYSDATE, NULL, 'N'
         );

-- 81 ~ 90
INSERT INTO board_comment (
    post_id, member_id, parent_comment_id,
    content, like_count, created_at, updated_at, deleted_yn
) VALUES (
             1, 1, NULL,
             '테스트 댓글 081번 내용입니다.', 0, SYSDATE, NULL, 'N'
         );

INSERT INTO board_comment (
    post_id, member_id, parent_comment_id,
    content, like_count, created_at, updated_at, deleted_yn
) VALUES (
             2, 2, NULL,
             '테스트 댓글 082번 내용입니다.', 0, SYSDATE, NULL, 'N'
         );

INSERT INTO board_comment (
    post_id, member_id, parent_comment_id,
    content, like_count, created_at, updated_at, deleted_yn
) VALUES (
             3, 3, NULL,
             '테스트 댓글 083번 내용입니다.', 0, SYSDATE, NULL, 'N'
         );

INSERT INTO board_comment (
    post_id, member_id, parent_comment_id,
    content, like_count, created_at, updated_at, deleted_yn
) VALUES (
             4, 4, NULL,
             '테스트 댓글 084번 내용입니다.', 0, SYSDATE, NULL, 'N'
         );

INSERT INTO board_comment (
    post_id, member_id, parent_comment_id,
    content, like_count, created_at, updated_at, deleted_yn
) VALUES (
             5, 5, NULL,
             '테스트 댓글 085번 내용입니다.', 0, SYSDATE, NULL, 'N'
         );

INSERT INTO board_comment (
    post_id, member_id, parent_comment_id,
    content, like_count, created_at, updated_at, deleted_yn
) VALUES (
             6, 1, NULL,
             '테스트 댓글 086번 내용입니다.', 0, SYSDATE, NULL, 'N'
         );

INSERT INTO board_comment (
    post_id, member_id, parent_comment_id,
    content, like_count, created_at, updated_at, deleted_yn
) VALUES (
             7, 2, NULL,
             '테스트 댓글 087번 내용입니다.', 0, SYSDATE, NULL, 'N'
         );

INSERT INTO board_comment (
    post_id, member_id, parent_comment_id,
    content, like_count, created_at, updated_at, deleted_yn
) VALUES (
             8, 3, NULL,
             '테스트 댓글 088번 내용입니다.', 0, SYSDATE, NULL, 'N'
         );

INSERT INTO board_comment (
    post_id, member_id, parent_comment_id,
    content, like_count, created_at, updated_at, deleted_yn
) VALUES (
             9, 4, NULL,
             '테스트 댓글 089번 내용입니다.', 0, SYSDATE, NULL, 'N'
         );

INSERT INTO board_comment (
    post_id, member_id, parent_comment_id,
    content, like_count, created_at, updated_at, deleted_yn
) VALUES (
             10, 5, NULL,
             '테스트 댓글 090번 내용입니다.', 0, SYSDATE, NULL, 'N'
         );

-- 91 ~ 100
INSERT INTO board_comment (
    post_id, member_id, parent_comment_id,
    content, like_count, created_at, updated_at, deleted_yn
) VALUES (
             1, 1, NULL,
             '테스트 댓글 091번 내용입니다.', 0, SYSDATE, NULL, 'N'
         );

INSERT INTO board_comment (
    post_id, member_id, parent_comment_id,
    content, like_count, created_at, updated_at, deleted_yn
) VALUES (
             2, 2, NULL,
             '테스트 댓글 092번 내용입니다.', 0, SYSDATE, NULL, 'N'
         );

INSERT INTO board_comment (
    post_id, member_id, parent_comment_id,
    content, like_count, created_at, updated_at, deleted_yn
) VALUES (
             3, 3, NULL,
             '테스트 댓글 093번 내용입니다.', 0, SYSDATE, NULL, 'N'
         );

INSERT INTO board_comment (
    post_id, member_id, parent_comment_id,
    content, like_count, created_at, updated_at, deleted_yn
) VALUES (
             4, 4, NULL,
             '테스트 댓글 094번 내용입니다.', 0, SYSDATE, NULL, 'N'
         );

INSERT INTO board_comment (
    post_id, member_id, parent_comment_id,
    content, like_count, created_at, updated_at, deleted_yn
) VALUES (
             5, 5, NULL,
             '테스트 댓글 095번 내용입니다.', 0, SYSDATE, NULL, 'N'
         );

INSERT INTO board_comment (
    post_id, member_id, parent_comment_id,
    content, like_count, created_at, updated_at, deleted_yn
) VALUES (
             6, 1, NULL,
             '테스트 댓글 096번 내용입니다.', 0, SYSDATE, NULL, 'N'
         );

INSERT INTO board_comment (
    post_id, member_id, parent_comment_id,
    content, like_count, created_at, updated_at, deleted_yn
) VALUES (
             7, 2, NULL,
             '테스트 댓글 097번 내용입니다.', 0, SYSDATE, NULL, 'N'
         );

INSERT INTO board_comment (
    post_id, member_id, parent_comment_id,
    content, like_count, created_at, updated_at, deleted_yn
) VALUES (
             8, 3, NULL,
             '테스트 댓글 098번 내용입니다.', 0, SYSDATE, NULL, 'N'
         );

INSERT INTO board_comment (
    post_id, member_id, parent_comment_id,
    content, like_count, created_at, updated_at, deleted_yn
) VALUES (
             9, 4, NULL,
             '테스트 댓글 099번 내용입니다.', 0, SYSDATE, NULL, 'N'
         );

INSERT INTO board_comment (
    post_id, member_id, parent_comment_id,
    content, like_count, created_at, updated_at, deleted_yn
) VALUES (
             10, 5, NULL,
             '테스트 댓글 100번 내용입니다.', 0, SYSDATE, NULL, 'N'
         );

commit ;

INSERT INTO board_like (member_id, post_id, created_at)
VALUES (1, 1, SYSDATE);

INSERT INTO board_like (member_id, post_id, created_at)
VALUES (1, 2, SYSDATE);

INSERT INTO board_like (member_id, post_id, created_at)
VALUES (1, 3, SYSDATE);

INSERT INTO board_like (member_id, post_id, created_at)
VALUES (1, 4, SYSDATE);

INSERT INTO board_like (member_id, post_id, created_at)
VALUES (1, 5, SYSDATE);

INSERT INTO board_like (member_id, post_id, created_at)
VALUES (1, 6, SYSDATE);

INSERT INTO board_like (member_id, post_id, created_at)
VALUES (1, 7, SYSDATE);

INSERT INTO board_like (member_id, post_id, created_at)
VALUES (1, 8, SYSDATE);

INSERT INTO board_like (member_id, post_id, created_at)
VALUES (1, 9, SYSDATE);

INSERT INTO board_like (member_id, post_id, created_at)
VALUES (1, 10, SYSDATE);

-- member 2
INSERT INTO board_like (member_id, post_id, created_at)
VALUES (2, 1, SYSDATE);

INSERT INTO board_like (member_id, post_id, created_at)
VALUES (2, 2, SYSDATE);

INSERT INTO board_like (member_id, post_id, created_at)
VALUES (2, 3, SYSDATE);

INSERT INTO board_like (member_id, post_id, created_at)
VALUES (2, 4, SYSDATE);

INSERT INTO board_like (member_id, post_id, created_at)
VALUES (2, 5, SYSDATE);

INSERT INTO board_like (member_id, post_id, created_at)
VALUES (2, 6, SYSDATE);

INSERT INTO board_like (member_id, post_id, created_at)
VALUES (2, 7, SYSDATE);

INSERT INTO board_like (member_id, post_id, created_at)
VALUES (2, 8, SYSDATE);

INSERT INTO board_like (member_id, post_id, created_at)
VALUES (2, 9, SYSDATE);

INSERT INTO board_like (member_id, post_id, created_at)
VALUES (2, 10, SYSDATE);

-- member 3
INSERT INTO board_like (member_id, post_id, created_at)
VALUES (3, 1, SYSDATE);

INSERT INTO board_like (member_id, post_id, created_at)
VALUES (3, 2, SYSDATE);

INSERT INTO board_like (member_id, post_id, created_at)
VALUES (3, 3, SYSDATE);

INSERT INTO board_like (member_id, post_id, created_at)
VALUES (3, 4, SYSDATE);

INSERT INTO board_like (member_id, post_id, created_at)
VALUES (3, 5, SYSDATE);

INSERT INTO board_like (member_id, post_id, created_at)
VALUES (3, 6, SYSDATE);

INSERT INTO board_like (member_id, post_id, created_at)
VALUES (3, 7, SYSDATE);

INSERT INTO board_like (member_id, post_id, created_at)
VALUES (3, 8, SYSDATE);

INSERT INTO board_like (member_id, post_id, created_at)
VALUES (3, 9, SYSDATE);

INSERT INTO board_like (member_id, post_id, created_at)
VALUES (3, 10, SYSDATE);

-- member 4
INSERT INTO board_like (member_id, post_id, created_at)
VALUES (4, 1, SYSDATE);

INSERT INTO board_like (member_id, post_id, created_at)
VALUES (4, 2, SYSDATE);

INSERT INTO board_like (member_id, post_id, created_at)
VALUES (4, 3, SYSDATE);

INSERT INTO board_like (member_id, post_id, created_at)
VALUES (4, 4, SYSDATE);

INSERT INTO board_like (member_id, post_id, created_at)
VALUES (4, 5, SYSDATE);

INSERT INTO board_like (member_id, post_id, created_at)
VALUES (4, 6, SYSDATE);

INSERT INTO board_like (member_id, post_id, created_at)
VALUES (4, 7, SYSDATE);

INSERT INTO board_like (member_id, post_id, created_at)
VALUES (4, 8, SYSDATE);

INSERT INTO board_like (member_id, post_id, created_at)
VALUES (4, 9, SYSDATE);

INSERT INTO board_like (member_id, post_id, created_at)
VALUES (4, 10, SYSDATE);

-- member 5
INSERT INTO board_like (member_id, post_id, created_at)
VALUES (5, 1, SYSDATE);

INSERT INTO board_like (member_id, post_id, created_at)
VALUES (5, 2, SYSDATE);

INSERT INTO board_like (member_id, post_id, created_at)
VALUES (5, 3, SYSDATE);

INSERT INTO board_like (member_id, post_id, created_at)
VALUES (5, 4, SYSDATE);

INSERT INTO board_like (member_id, post_id, created_at)
VALUES (5, 5, SYSDATE);

INSERT INTO board_like (member_id, post_id, created_at)
VALUES (5, 6, SYSDATE);

INSERT INTO board_like (member_id, post_id, created_at)
VALUES (5, 7, SYSDATE);

INSERT INTO board_like (member_id, post_id, created_at)
VALUES (5, 8, SYSDATE);

INSERT INTO board_like (member_id, post_id, created_at)
VALUES (5, 9, SYSDATE);

INSERT INTO board_like (member_id, post_id, created_at)
VALUES (5, 10, SYSDATE);

-- member 6
INSERT INTO board_like (member_id, post_id, created_at)
VALUES (6, 1, SYSDATE);

INSERT INTO board_like (member_id, post_id, created_at)
VALUES (6, 2, SYSDATE);

INSERT INTO board_like (member_id, post_id, created_at)
VALUES (6, 3, SYSDATE);

INSERT INTO board_like (member_id, post_id, created_at)
VALUES (6, 4, SYSDATE);

INSERT INTO board_like (member_id, post_id, created_at)
VALUES (6, 5, SYSDATE);

INSERT INTO board_like (member_id, post_id, created_at)
VALUES (6, 6, SYSDATE);

INSERT INTO board_like (member_id, post_id, created_at)
VALUES (6, 7, SYSDATE);

INSERT INTO board_like (member_id, post_id, created_at)
VALUES (6, 8, SYSDATE);

INSERT INTO board_like (member_id, post_id, created_at)
VALUES (6, 9, SYSDATE);

INSERT INTO board_like (member_id, post_id, created_at)
VALUES (6, 10, SYSDATE);

-- member 7
INSERT INTO board_like (member_id, post_id, created_at)
VALUES (7, 1, SYSDATE);

INSERT INTO board_like (member_id, post_id, created_at)
VALUES (7, 2, SYSDATE);

INSERT INTO board_like (member_id, post_id, created_at)
VALUES (7, 3, SYSDATE);

INSERT INTO board_like (member_id, post_id, created_at)
VALUES (7, 4, SYSDATE);

INSERT INTO board_like (member_id, post_id, created_at)
VALUES (7, 5, SYSDATE);

INSERT INTO board_like (member_id, post_id, created_at)
VALUES (7, 6, SYSDATE);

INSERT INTO board_like (member_id, post_id, created_at)
VALUES (7, 7, SYSDATE);

INSERT INTO board_like (member_id, post_id, created_at)
VALUES (7, 8, SYSDATE);

INSERT INTO board_like (member_id, post_id, created_at)
VALUES (7, 9, SYSDATE);

INSERT INTO board_like (member_id, post_id, created_at)
VALUES (7, 10, SYSDATE);

-- member 8
INSERT INTO board_like (member_id, post_id, created_at)
VALUES (8, 1, SYSDATE);

INSERT INTO board_like (member_id, post_id, created_at)
VALUES (8, 2, SYSDATE);

INSERT INTO board_like (member_id, post_id, created_at)
VALUES (8, 3, SYSDATE);

INSERT INTO board_like (member_id, post_id, created_at)
VALUES (8, 4, SYSDATE);

INSERT INTO board_like (member_id, post_id, created_at)
VALUES (8, 5, SYSDATE);

INSERT INTO board_like (member_id, post_id, created_at)
VALUES (8, 6, SYSDATE);

INSERT INTO board_like (member_id, post_id, created_at)
VALUES (8, 7, SYSDATE);

INSERT INTO board_like (member_id, post_id, created_at)
VALUES (8, 8, SYSDATE);

INSERT INTO board_like (member_id, post_id, created_at)
VALUES (8, 9, SYSDATE);

INSERT INTO board_like (member_id, post_id, created_at)
VALUES (8, 10, SYSDATE);

-- member 9
INSERT INTO board_like (member_id, post_id, created_at)
VALUES (9, 1, SYSDATE);

INSERT INTO board_like (member_id, post_id, created_at)
VALUES (9, 2, SYSDATE);

INSERT INTO board_like (member_id, post_id, created_at)
VALUES (9, 3, SYSDATE);

INSERT INTO board_like (member_id, post_id, created_at)
VALUES (9, 4, SYSDATE);

INSERT INTO board_like (member_id, post_id, created_at)
VALUES (9, 5, SYSDATE);

INSERT INTO board_like (member_id, post_id, created_at)
VALUES (9, 6, SYSDATE);

INSERT INTO board_like (member_id, post_id, created_at)
VALUES (9, 7, SYSDATE);

INSERT INTO board_like (member_id, post_id, created_at)
VALUES (9, 8, SYSDATE);

INSERT INTO board_like (member_id, post_id, created_at)
VALUES (9, 9, SYSDATE);

INSERT INTO board_like (member_id, post_id, created_at)
VALUES (9, 10, SYSDATE);

-- member 10
INSERT INTO board_like (member_id, post_id, created_at)
VALUES (10, 1, SYSDATE);

INSERT INTO board_like (member_id, post_id, created_at)
VALUES (10, 2, SYSDATE);

INSERT INTO board_like (member_id, post_id, created_at)
VALUES (10, 3, SYSDATE);

INSERT INTO board_like (member_id, post_id, created_at)
VALUES (10, 4, SYSDATE);

INSERT INTO board_like (member_id, post_id, created_at)
VALUES (10, 5, SYSDATE);

INSERT INTO board_like (member_id, post_id, created_at)
VALUES (10, 6, SYSDATE);

INSERT INTO board_like (member_id, post_id, created_at)
VALUES (10, 7, SYSDATE);

INSERT INTO board_like (member_id, post_id, created_at)
VALUES (10, 8, SYSDATE);

INSERT INTO board_like (member_id, post_id, created_at)
VALUES (10, 9, SYSDATE);

INSERT INTO board_like (member_id, post_id, created_at)
VALUES (10, 10, SYSDATE);
commit;
INSERT INTO board_post_image (post_id, image_url, sort_order)
SELECT bp.post_id, bp.thumbnail_url, 1
FROM board_post bp
WHERE bp.category_id = 1 AND bp.member_id = 1
  AND bp.title = '유리장 한 칸 액션 전시 완성'
  AND bp.thumbnail_url = 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/board/%EB%82%B4%EC%83%88%EB%81%BC%EC%9E%90%EB%9E%91/%EB%82%B4%EC%83%88%EC%9E%90-15.jpg'
  AND bp.thumbnail_url IS NOT NULL AND TRIM(bp.thumbnail_url) <> ''
  AND bp.thumbnail_url LIKE 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/board/%'
  AND NOT EXISTS (SELECT 1 FROM board_post_image bpi WHERE bpi.post_id = bp.post_id);

INSERT INTO board_post_image (post_id, image_url, sort_order)
SELECT bp.post_id, bp.thumbnail_url, 1
FROM board_post bp
WHERE bp.category_id = 1 AND bp.member_id = 2
  AND bp.title = '이 칸은 해적 라인업으로 꽉 채웠다'
  AND bp.thumbnail_url = 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/board/%EB%82%B4%EC%83%88%EB%81%BC%EC%9E%90%EB%9E%91/%EB%82%B4%EC%83%88%EC%9E%90-16.jpg'
  AND bp.thumbnail_url IS NOT NULL AND TRIM(bp.thumbnail_url) <> ''
  AND bp.thumbnail_url LIKE 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/board/%'
  AND NOT EXISTS (SELECT 1 FROM board_post_image bpi WHERE bpi.post_id = bp.post_id);

INSERT INTO board_post_image (post_id, image_url, sort_order)
SELECT bp.post_id, bp.thumbnail_url, 1
FROM board_post bp
WHERE bp.category_id = 1 AND bp.member_id = 3
  AND bp.title = '책장 속 “숨은 최애” 전시'
  AND bp.thumbnail_url = 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/board/%EB%82%B4%EC%83%88%EB%81%BC%EC%9E%90%EB%9E%91/%EB%82%B4%EC%83%88%EC%9E%90-17.webp'
  AND bp.thumbnail_url IS NOT NULL AND TRIM(bp.thumbnail_url) <> ''
  AND bp.thumbnail_url LIKE 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/board/%'
  AND NOT EXISTS (SELECT 1 FROM board_post_image bpi WHERE bpi.post_id = bp.post_id);

INSERT INTO board_post_image (post_id, image_url, sort_order)
SELECT bp.post_id, bp.thumbnail_url, 1
FROM board_post bp
WHERE bp.category_id = 1 AND bp.member_id = 4
  AND bp.title = '책상 위 미니 피규어… 표정이 너무 귀엽다'
  AND bp.thumbnail_url = 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/board/%EB%82%B4%EC%83%88%EB%81%BC%EC%9E%90%EB%9E%91/%EB%82%B4%EC%83%88%EC%9E%90-18.jfif'
  AND bp.thumbnail_url IS NOT NULL AND TRIM(bp.thumbnail_url) <> ''
  AND bp.thumbnail_url LIKE 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/board/%'
  AND NOT EXISTS (SELECT 1 FROM board_post_image bpi WHERE bpi.post_id = bp.post_id);

INSERT INTO board_post_image (post_id, image_url, sort_order)
SELECT bp.post_id, bp.thumbnail_url, 1
FROM board_post bp
WHERE bp.category_id = 1 AND bp.member_id = 5
  AND bp.title = '농구 디오라마 세팅 완료(각도값 미쳤음)'
  AND bp.thumbnail_url = 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/board/%EB%82%B4%EC%83%88%EB%81%BC%EC%9E%90%EB%9E%91/%EB%82%B4%EC%83%88%EC%9E%90-19.jpg'
  AND bp.thumbnail_url IS NOT NULL AND TRIM(bp.thumbnail_url) <> ''
  AND bp.thumbnail_url LIKE 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/board/%'
  AND NOT EXISTS (SELECT 1 FROM board_post_image bpi WHERE bpi.post_id = bp.post_id);

INSERT INTO board_post_image (post_id, image_url, sort_order)
SELECT bp.post_id, bp.thumbnail_url, 1
FROM board_post bp
WHERE bp.category_id = 1 AND bp.member_id = 6
  AND bp.title = '피규어는 박스아트까지 같이 전시해야 진짜다'
  AND bp.thumbnail_url = 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/board/%EB%82%B4%EC%83%88%EB%81%BC%EC%9E%90%EB%9E%91/%EB%82%B4%EC%83%88%EC%9E%90-20.webp'
  AND bp.thumbnail_url IS NOT NULL AND TRIM(bp.thumbnail_url) <> ''
  AND bp.thumbnail_url LIKE 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/board/%'
  AND NOT EXISTS (SELECT 1 FROM board_post_image bpi WHERE bpi.post_id = bp.post_id);

INSERT INTO board_post_image (post_id, image_url, sort_order)
SELECT bp.post_id, bp.thumbnail_url, 1
FROM board_post bp
WHERE bp.category_id = 1 AND bp.member_id = 7
  AND bp.title = '가동피규어는 포즈 바꾸는 재미가 진짜 큼'
  AND bp.thumbnail_url = 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/board/%EB%82%B4%EC%83%88%EB%81%BC%EC%9E%90%EB%9E%91/%EB%82%B4%EC%83%88%EC%9E%90-22.jpg'
  AND bp.thumbnail_url IS NOT NULL AND TRIM(bp.thumbnail_url) <> ''
  AND bp.thumbnail_url LIKE 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/board/%'
  AND NOT EXISTS (SELECT 1 FROM board_post_image bpi WHERE bpi.post_id = bp.post_id);

INSERT INTO board_post_image (post_id, image_url, sort_order)
SELECT bp.post_id, bp.thumbnail_url, 1
FROM board_post bp
WHERE bp.category_id = 1 AND bp.member_id = 8
  AND bp.title = '교복 피규어는 기본템… 라인 예쁘게 뽑혔다'
  AND bp.thumbnail_url = 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/board/%EB%82%B4%EC%83%88%EB%81%BC%EC%9E%90%EB%9E%91/%EB%82%B4%EC%83%88%EC%9E%90-23.jpg'
  AND bp.thumbnail_url IS NOT NULL AND TRIM(bp.thumbnail_url) <> ''
  AND bp.thumbnail_url LIKE 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/board/%'
  AND NOT EXISTS (SELECT 1 FROM board_post_image bpi WHERE bpi.post_id = bp.post_id);

INSERT INTO board_post_image (post_id, image_url, sort_order)
SELECT bp.post_id, bp.thumbnail_url, 1
FROM board_post bp
WHERE bp.category_id = 1 AND bp.member_id = 9
  AND bp.title = '청록 트윈테일 + 판다 소품 조합은 반칙'
  AND bp.thumbnail_url = 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/board/%EB%82%B4%EC%83%88%EB%81%BC%EC%9E%90%EB%9E%91/%EB%82%B4%EC%83%88%EC%9E%90-24.jpg'
  AND bp.thumbnail_url IS NOT NULL AND TRIM(bp.thumbnail_url) <> ''
  AND bp.thumbnail_url LIKE 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/board/%'
  AND NOT EXISTS (SELECT 1 FROM board_post_image bpi WHERE bpi.post_id = bp.post_id);

INSERT INTO board_post_image (post_id, image_url, sort_order)
SELECT bp.post_id, bp.thumbnail_url, 1
FROM board_post bp
WHERE bp.category_id = 1 AND bp.member_id = 10
  AND bp.title = 'SHF 개봉… 파츠가 이렇게 많은 건 반칙이지'
  AND bp.thumbnail_url = 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/board/%EB%82%B4%EC%83%88%EB%81%BC%EC%9E%90%EB%9E%91/%EB%82%B4%EC%83%88%EC%9E%90-25.webp'
  AND bp.thumbnail_url IS NOT NULL AND TRIM(bp.thumbnail_url) <> ''
  AND bp.thumbnail_url LIKE 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/board/%'
  AND NOT EXISTS (SELECT 1 FROM board_post_image bpi WHERE bpi.post_id = bp.post_id);

INSERT INTO board_post_image (post_id, image_url, sort_order)
SELECT bp.post_id, bp.thumbnail_url, 1
FROM board_post bp
WHERE bp.category_id = 1 AND bp.member_id = 11
  AND bp.title = '블루아카 피그마 자전거 DX… 박스부터 설렌다'
  AND bp.thumbnail_url = 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/board/%EB%82%B4%EC%83%88%EB%81%BC%EC%9E%90%EB%9E%91/%EB%82%B4%EC%83%88%EC%9E%90-26.jpg'
  AND bp.thumbnail_url IS NOT NULL AND TRIM(bp.thumbnail_url) <> ''
  AND bp.thumbnail_url LIKE 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/board/%'
  AND NOT EXISTS (SELECT 1 FROM board_post_image bpi WHERE bpi.post_id = bp.post_id);

INSERT INTO board_post_image (post_id, image_url, sort_order)
SELECT bp.post_id, bp.thumbnail_url, 1
FROM board_post bp
WHERE bp.category_id = 1 AND bp.member_id = 13
  AND bp.title = '거실 소파 위 단체샷… 수집의 끝은 결국 전시다'
  AND bp.thumbnail_url = 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/board/%EB%82%B4%EC%83%88%EB%81%BC%EC%9E%90%EB%9E%91/%EB%82%B4%EC%83%88%EC%9E%90-27.jfif'
  AND bp.thumbnail_url IS NOT NULL AND TRIM(bp.thumbnail_url) <> ''
  AND bp.thumbnail_url LIKE 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/board/%'
  AND NOT EXISTS (SELECT 1 FROM board_post_image bpi WHERE bpi.post_id = bp.post_id);

INSERT INTO board_post_image (post_id, image_url, sort_order)
SELECT bp.post_id, bp.thumbnail_url, 1
FROM board_post bp
WHERE bp.category_id = 1 AND bp.member_id = 14
  AND bp.title = '유리장 한 칸이 아니라 한 “세계관”이 되어버림'
  AND bp.thumbnail_url = 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/board/%EB%82%B4%EC%83%88%EB%81%BC%EC%9E%90%EB%9E%91/%EB%82%B4%EC%83%88%EC%9E%90-28.jfif'
  AND bp.thumbnail_url IS NOT NULL AND TRIM(bp.thumbnail_url) <> ''
  AND bp.thumbnail_url LIKE 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/board/%'
  AND NOT EXISTS (SELECT 1 FROM board_post_image bpi WHERE bpi.post_id = bp.post_id);

INSERT INTO board_post_image (post_id, image_url, sort_order)
SELECT bp.post_id, bp.thumbnail_url, 1
FROM board_post bp
WHERE bp.category_id = 1 AND bp.member_id = 12
  AND bp.title = '원피스 라인업 책상 전시… 포즈 맛이 확실함'
  AND bp.thumbnail_url = 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/board/%EB%82%B4%EC%83%88%EB%81%BC%EC%9E%90%EB%9E%91/%EB%82%B4%EC%83%88%EC%9E%90-29.jfif'
  AND bp.thumbnail_url IS NOT NULL AND TRIM(bp.thumbnail_url) <> ''
  AND bp.thumbnail_url LIKE 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/board/%'
  AND NOT EXISTS (SELECT 1 FROM board_post_image bpi WHERE bpi.post_id = bp.post_id);

INSERT INTO board_post_image (post_id, image_url, sort_order)
SELECT bp.post_id, bp.thumbnail_url, 1
FROM board_post bp
WHERE bp.category_id = 1 AND bp.member_id = 16
  AND bp.title = '에이스 박스 3종 모아두니 뿌듯함이 3배'
  AND bp.thumbnail_url = 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/board/%EB%82%B4%EC%83%88%EB%81%BC%EC%9E%90%EB%9E%91/%EB%82%B4%EC%83%88%EC%9E%90-30.jfif'
  AND bp.thumbnail_url IS NOT NULL AND TRIM(bp.thumbnail_url) <> ''
  AND bp.thumbnail_url LIKE 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/board/%'
  AND NOT EXISTS (SELECT 1 FROM board_post_image bpi WHERE bpi.post_id = bp.post_id);

INSERT INTO board_post_image (post_id, image_url, sort_order)
SELECT bp.post_id, bp.thumbnail_url, 1
FROM board_post bp
WHERE bp.category_id = 2 AND bp.member_id = 1
  AND bp.title = '보라 마녀 컨셉 첫 촬영… 모자 각도 잡는 게 제일 어려웠다'
  AND bp.thumbnail_url = 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/board/%EC%BD%94%EC%8A%A4%ED%94%84%EB%A0%88/%EC%BD%94%EC%8A%A4%ED%94%84%EB%A0%88-4.jfif'
  AND bp.thumbnail_url IS NOT NULL AND TRIM(bp.thumbnail_url) <> ''
  AND bp.thumbnail_url LIKE 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/board/%'
  AND NOT EXISTS (SELECT 1 FROM board_post_image bpi WHERE bpi.post_id = bp.post_id);

INSERT INTO board_post_image (post_id, image_url, sort_order)
SELECT bp.post_id, bp.thumbnail_url, 1
FROM board_post bp
WHERE bp.category_id = 2 AND bp.member_id = 2
  AND bp.title = '야외 행사에서 고양이 컨셉 코스! (리본/소매 디테일 자랑)'
  AND bp.thumbnail_url = 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/board/%EC%BD%94%EC%8A%A4%ED%94%84%EB%A0%88/%EC%BD%94%EC%8A%A4%ED%94%84%EB%A0%88-5.jfif'
  AND bp.thumbnail_url IS NOT NULL AND TRIM(bp.thumbnail_url) <> ''
  AND bp.thumbnail_url LIKE 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/board/%'
  AND NOT EXISTS (SELECT 1 FROM board_post_image bpi WHERE bpi.post_id = bp.post_id);

INSERT INTO board_post_image (post_id, image_url, sort_order)
SELECT bp.post_id, bp.thumbnail_url, 1
FROM board_post bp
WHERE bp.category_id = 2 AND bp.member_id = 3
  AND bp.title = '실내 촬영: 청백 톤 의상은 조명빨 진짜 잘 받는다'
  AND bp.thumbnail_url = 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/board/%EC%BD%94%EC%8A%A4%ED%94%84%EB%A0%88/%EC%BD%94%EC%8A%A4%ED%94%84%EB%A0%88-6.jfif'
  AND bp.thumbnail_url IS NOT NULL AND TRIM(bp.thumbnail_url) <> ''
  AND bp.thumbnail_url LIKE 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/board/%'
  AND NOT EXISTS (SELECT 1 FROM board_post_image bpi WHERE bpi.post_id = bp.post_id);

INSERT INTO board_post_image (post_id, image_url, sort_order)
SELECT bp.post_id, bp.thumbnail_url, 1
FROM board_post bp
WHERE bp.category_id = 2 AND bp.member_id = 4
  AND bp.title = '여우귀 검객 컨셉… 소품 칼 들고 찍으니 분위기 확 산다'
  AND bp.thumbnail_url = 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/board/%EC%BD%94%EC%8A%A4%ED%94%84%EB%A0%88/%EC%BD%94%EC%8A%A4%ED%94%84%EB%A0%88-7.jfif'
  AND bp.thumbnail_url IS NOT NULL AND TRIM(bp.thumbnail_url) <> ''
  AND bp.thumbnail_url LIKE 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/board/%'
  AND NOT EXISTS (SELECT 1 FROM board_post_image bpi WHERE bpi.post_id = bp.post_id);

INSERT INTO board_post_image (post_id, image_url, sort_order)
SELECT bp.post_id, bp.thumbnail_url, 1
FROM board_post bp
WHERE bp.category_id = 2 AND bp.member_id = 5
  AND bp.title = '햇살 좋은 날 야외 코스 촬영! 파란 제복은 진리다'
  AND bp.thumbnail_url = 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/board/%EC%BD%94%EC%8A%A4%ED%94%84%EB%A0%88/%EC%BD%94%EC%8A%A4%ED%94%84%EB%A0%88-8.jfif'
  AND bp.thumbnail_url IS NOT NULL AND TRIM(bp.thumbnail_url) <> ''
  AND bp.thumbnail_url LIKE 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/board/%'
  AND NOT EXISTS (SELECT 1 FROM board_post_image bpi WHERE bpi.post_id = bp.post_id);

INSERT INTO board_post_image (post_id, image_url, sort_order)
SELECT bp.post_id, bp.thumbnail_url, 1
FROM board_post bp
WHERE bp.category_id = 2 AND bp.member_id = 6
  AND bp.title = '전시장 포토존에서 “악마/집사” 느낌 컨셉샷 찍어봄'
  AND bp.thumbnail_url = 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/board/%EC%BD%94%EC%8A%A4%ED%94%84%EB%A0%88/%EC%BD%94%EC%8A%A4%ED%94%84%EB%A0%88-9.jfif'
  AND bp.thumbnail_url IS NOT NULL AND TRIM(bp.thumbnail_url) <> ''
  AND bp.thumbnail_url LIKE 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/board/%'
  AND NOT EXISTS (SELECT 1 FROM board_post_image bpi WHERE bpi.post_id = bp.post_id);

INSERT INTO board_post_image (post_id, image_url, sort_order)
SELECT bp.post_id, bp.thumbnail_url, 1
FROM board_post bp
WHERE bp.category_id = 2 AND bp.member_id = 7
  AND bp.title = '블루 계열 남캐 코스 도전! 소품이 많아도 재밌다'
  AND bp.thumbnail_url = 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/board/%EC%BD%94%EC%8A%A4%ED%94%84%EB%A0%88/%EC%BD%94%EC%8A%A4%ED%94%84%EB%A0%88-10.jfif'
  AND bp.thumbnail_url IS NOT NULL AND TRIM(bp.thumbnail_url) <> ''
  AND bp.thumbnail_url LIKE 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/board/%'
  AND NOT EXISTS (SELECT 1 FROM board_post_image bpi WHERE bpi.post_id = bp.post_id);

INSERT INTO board_post_image (post_id, image_url, sort_order)
SELECT bp.post_id, bp.thumbnail_url, 1
FROM board_post bp
WHERE bp.category_id = 2 AND bp.member_id = 8
  AND bp.title = '바디페인팅 코스 첫 도전… 준비/세팅이 가장 힘들었다'
  AND bp.thumbnail_url = 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/board/%EC%BD%94%EC%8A%A4%ED%94%84%EB%A0%88/%EC%BD%94%EC%8A%A4%ED%94%84%EB%A0%88-11.jfif'
  AND bp.thumbnail_url IS NOT NULL AND TRIM(bp.thumbnail_url) <> ''
  AND bp.thumbnail_url LIKE 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/board/%'
  AND NOT EXISTS (SELECT 1 FROM board_post_image bpi WHERE bpi.post_id = bp.post_id);

INSERT INTO board_post_image (post_id, image_url, sort_order)
SELECT bp.post_id, bp.thumbnail_url, 1
FROM board_post bp
WHERE bp.category_id = 2 AND bp.member_id = 1
  AND bp.title = '하오리 스타일 코스 셀카! 햇빛 아래서 색감 최고'
  AND bp.thumbnail_url = 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/board/%EC%BD%94%EC%8A%A4%ED%94%84%EB%A0%88/%EC%BD%94%EC%8A%A4%ED%94%84%EB%A0%88-12.jfif'
  AND bp.thumbnail_url IS NOT NULL AND TRIM(bp.thumbnail_url) <> ''
  AND bp.thumbnail_url LIKE 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/board/%'
  AND NOT EXISTS (SELECT 1 FROM board_post_image bpi WHERE bpi.post_id = bp.post_id);

INSERT INTO board_post_image (post_id, image_url, sort_order)
SELECT bp.post_id, bp.thumbnail_url, 1
FROM board_post bp
WHERE bp.category_id = 2 AND bp.member_id = 11
  AND bp.title = '정원 느낌 장소에서 촬영한 기모노 코스… 분위기 미쳤다'
  AND bp.thumbnail_url = 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/board/%EC%BD%94%EC%8A%A4%ED%94%84%EB%A0%88/%EC%BD%94%EC%8A%A4%ED%94%84%EB%A0%88-13.jfif'
  AND bp.thumbnail_url IS NOT NULL AND TRIM(bp.thumbnail_url) <> ''
  AND bp.thumbnail_url LIKE 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/board/%'
  AND NOT EXISTS (SELECT 1 FROM board_post_image bpi WHERE bpi.post_id = bp.post_id);

INSERT INTO board_post_image (post_id, image_url, sort_order)
SELECT bp.post_id, bp.thumbnail_url, 1
FROM board_post bp
WHERE bp.category_id = 2 AND bp.member_id = 3
  AND bp.title = '닌자 컨셉 액션샷! 각도 잡느라 무릎 갈렸다…'
  AND bp.thumbnail_url = 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/board/%EC%BD%94%EC%8A%A4%ED%94%84%EB%A0%88/%EC%BD%94%EC%8A%A4%ED%94%84%EB%A0%88-14.jfif'
  AND bp.thumbnail_url IS NOT NULL AND TRIM(bp.thumbnail_url) <> ''
  AND bp.thumbnail_url LIKE 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/board/%'
  AND NOT EXISTS (SELECT 1 FROM board_post_image bpi WHERE bpi.post_id = bp.post_id);

INSERT INTO board_post_image (post_id, image_url, sort_order)
SELECT bp.post_id, bp.thumbnail_url, 1
FROM board_post bp
WHERE bp.category_id = 2 AND bp.member_id = 5
  AND bp.title = '나비 하오리 + 소품검으로 한 컷… 분위기 너무 좋다'
  AND bp.thumbnail_url = 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/board/%EC%BD%94%EC%8A%A4%ED%94%84%EB%A0%88/%EC%BD%94%EC%8A%A4%ED%94%84%EB%A0%88-15.jfif'
  AND bp.thumbnail_url IS NOT NULL AND TRIM(bp.thumbnail_url) <> ''
  AND bp.thumbnail_url LIKE 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/board/%'
  AND NOT EXISTS (SELECT 1 FROM board_post_image bpi WHERE bpi.post_id = bp.post_id);

INSERT INTO board_post_image (post_id, image_url, sort_order)
SELECT bp.post_id, bp.thumbnail_url, 1
FROM board_post bp
WHERE bp.category_id = 2 AND bp.member_id = 2
  AND bp.title = '레드&블랙 악역 컨셉… 부채 소품이 한 방에 살려줌'
  AND bp.thumbnail_url = 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/board/%EC%BD%94%EC%8A%A4%ED%94%84%EB%A0%88/%EC%BD%94%EC%8A%A4%ED%94%84%EB%A0%88-16.jfif'
  AND bp.thumbnail_url IS NOT NULL AND TRIM(bp.thumbnail_url) <> ''
  AND bp.thumbnail_url LIKE 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/board/%'
  AND NOT EXISTS (SELECT 1 FROM board_post_image bpi WHERE bpi.post_id = bp.post_id);

INSERT INTO board_post_image (post_id, image_url, sort_order)
SELECT bp.post_id, bp.thumbnail_url, 1
FROM board_post bp
WHERE bp.category_id = 2 AND bp.member_id = 7
  AND bp.title = '눈 오는 날 촬영한 하얀/보라 톤 코스… 겨울감성 제대로'
  AND bp.thumbnail_url = 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/board/%EC%BD%94%EC%8A%A4%ED%94%84%EB%A0%88/%EC%BD%94%EC%8A%A4%ED%94%84%EB%A0%88-18.jfif'
  AND bp.thumbnail_url IS NOT NULL AND TRIM(bp.thumbnail_url) <> ''
  AND bp.thumbnail_url LIKE 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/board/%'
  AND NOT EXISTS (SELECT 1 FROM board_post_image bpi WHERE bpi.post_id = bp.post_id);

INSERT INTO board_post_image (post_id, image_url, sort_order)
SELECT bp.post_id, bp.thumbnail_url, 1
FROM board_post bp
WHERE bp.category_id = 2 AND bp.member_id = 4
  AND bp.title = '단체샷은 역시 재미가 다르다(컨셉 통일 최고)'
  AND bp.thumbnail_url = 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/board/%EC%BD%94%EC%8A%A4%ED%94%84%EB%A0%88/%EC%BD%94%EC%8A%A4%ED%94%84%EB%A0%88-19.jfif'
  AND bp.thumbnail_url IS NOT NULL AND TRIM(bp.thumbnail_url) <> ''
  AND bp.thumbnail_url LIKE 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/board/%'
  AND NOT EXISTS (SELECT 1 FROM board_post_image bpi WHERE bpi.post_id = bp.post_id);

INSERT INTO board_post_image (post_id, image_url, sort_order)
SELECT bp.post_id, bp.thumbnail_url, 1
FROM board_post bp
WHERE bp.category_id = 2 AND bp.member_id = 6
  AND bp.title = '밀짚모자 선장 컨셉! 포즈 하나로 캐릭터 느낌 확 남'
  AND bp.thumbnail_url = 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/board/%EC%BD%94%EC%8A%A4%ED%94%84%EB%A0%88/%EC%BD%94%EC%8A%A4%ED%94%84%EB%A0%88-20.jfif'
  AND bp.thumbnail_url IS NOT NULL AND TRIM(bp.thumbnail_url) <> ''
  AND bp.thumbnail_url LIKE 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/board/%'
  AND NOT EXISTS (SELECT 1 FROM board_post_image bpi WHERE bpi.post_id = bp.post_id);

INSERT INTO board_post_image (post_id, image_url, sort_order)
SELECT bp.post_id, bp.thumbnail_url, 1
FROM board_post bp
WHERE bp.category_id = 2 AND bp.member_id = 1
  AND bp.title = '해변 촬영 도전! 바다 배경 + 색감 조합 너무 예쁘다'
  AND bp.thumbnail_url = 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/board/%EC%BD%94%EC%8A%A4%ED%94%84%EB%A0%88/%EC%BD%94%EC%8A%A4%ED%94%84%EB%A0%88-21.jfif'
  AND bp.thumbnail_url IS NOT NULL AND TRIM(bp.thumbnail_url) <> ''
  AND bp.thumbnail_url LIKE 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/board/%'
  AND NOT EXISTS (SELECT 1 FROM board_post_image bpi WHERE bpi.post_id = bp.post_id);

INSERT INTO board_post_image (post_id, image_url, sort_order)
SELECT bp.post_id, bp.thumbnail_url, 1
FROM board_post bp
WHERE bp.category_id = 2 AND bp.member_id = 8
  AND bp.title = '블랙 교복 컨셉… 선글라스 소품 하나로 분위기 끝'
  AND bp.thumbnail_url = 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/board/%EC%BD%94%EC%8A%A4%ED%94%84%EB%A0%88/%EC%BD%94%EC%8A%A4%ED%94%84%EB%A0%88-22.jfif'
  AND bp.thumbnail_url IS NOT NULL AND TRIM(bp.thumbnail_url) <> ''
  AND bp.thumbnail_url LIKE 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/board/%'
  AND NOT EXISTS (SELECT 1 FROM board_post_image bpi WHERE bpi.post_id = bp.post_id);

INSERT INTO board_post_image (post_id, image_url, sort_order)
SELECT bp.post_id, bp.thumbnail_url, 1
FROM board_post bp
WHERE bp.category_id = 2 AND bp.member_id = 2
  AND bp.title = '오렌지 단발 + 페이스 포인트 메이크업… 컨셉샷 성공'
  AND bp.thumbnail_url = 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/board/%EC%BD%94%EC%8A%A4%ED%94%84%EB%A0%88/%EC%BD%94%EC%8A%A4%ED%94%84%EB%A0%88-23.jfif'
  AND bp.thumbnail_url IS NOT NULL AND TRIM(bp.thumbnail_url) <> ''
  AND bp.thumbnail_url LIKE 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/board/%'
  AND NOT EXISTS (SELECT 1 FROM board_post_image bpi WHERE bpi.post_id = bp.post_id);

INSERT INTO board_post_image (post_id, image_url, sort_order)
SELECT bp.post_id, bp.thumbnail_url, 1
FROM board_post bp
WHERE bp.category_id = 2 AND bp.member_id = 5
  AND bp.title = '블루 롱헤어 + 정장 컨셉… 깔끔하게 “캐릭터감” 살리기'
  AND bp.thumbnail_url = 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/board/%EC%BD%94%EC%8A%A4%ED%94%84%EB%A0%88/%EC%BD%94%EC%8A%A4%ED%94%84%EB%A0%88-24.jfif'
  AND bp.thumbnail_url IS NOT NULL AND TRIM(bp.thumbnail_url) <> ''
  AND bp.thumbnail_url LIKE 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/board/%'
  AND NOT EXISTS (SELECT 1 FROM board_post_image bpi WHERE bpi.post_id = bp.post_id);

INSERT INTO board_post_image (post_id, image_url, sort_order)
SELECT bp.post_id, bp.thumbnail_url, 1
FROM board_post bp
WHERE bp.category_id = 2 AND bp.member_id = 12
  AND bp.title = '단체 망토 코스 완성… 이 각도는 진짜 “그 장면”이다'
  AND bp.thumbnail_url = 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/board/%EC%BD%94%EC%8A%A4%ED%94%84%EB%A0%88/%EC%BD%94%EC%8A%A4%ED%94%84%EB%A0%88-25.jfif'
  AND bp.thumbnail_url IS NOT NULL AND TRIM(bp.thumbnail_url) <> ''
  AND bp.thumbnail_url LIKE 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/board/%'
  AND NOT EXISTS (SELECT 1 FROM board_post_image bpi WHERE bpi.post_id = bp.post_id);

INSERT INTO board_post_image (post_id, image_url, sort_order)
SELECT bp.post_id, bp.thumbnail_url, 1
FROM board_post bp
WHERE bp.category_id = 2 AND bp.member_id = 16
  AND bp.title = '단체샷 찍었는데 컨셉이 너무 과몰입이라 웃김ㅋㅋ'
  AND bp.thumbnail_url = 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/board/%EC%BD%94%EC%8A%A4%ED%94%84%EB%A0%88/%EC%BD%94%EC%8A%A4%ED%94%84%EB%A0%88-26.jfif'
  AND bp.thumbnail_url IS NOT NULL AND TRIM(bp.thumbnail_url) <> ''
  AND bp.thumbnail_url LIKE 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/board/%'
  AND NOT EXISTS (SELECT 1 FROM board_post_image bpi WHERE bpi.post_id = bp.post_id);

INSERT INTO board_post_image (post_id, image_url, sort_order)
SELECT bp.post_id, bp.thumbnail_url, 1
FROM board_post bp
WHERE bp.category_id = 2 AND bp.member_id = 17
  AND bp.title = '금발 망토 코스 도전! 손 포즈 + 표정이 전부였다'
  AND bp.thumbnail_url = 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/board/%EC%BD%94%EC%8A%A4%ED%94%84%EB%A0%88/%EC%BD%94%EC%8A%A4%ED%94%84%EB%A0%88-27.jfif'
  AND bp.thumbnail_url IS NOT NULL AND TRIM(bp.thumbnail_url) <> ''
  AND bp.thumbnail_url LIKE 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/board/%'
  AND NOT EXISTS (SELECT 1 FROM board_post_image bpi WHERE bpi.post_id = bp.post_id);

INSERT INTO board_post_image (post_id, image_url, sort_order)
SELECT bp.post_id, bp.thumbnail_url, 1
FROM board_post bp
WHERE bp.category_id = 3 AND bp.member_id = 10
  AND bp.title = '오늘 야식 치킨… 소스 조합 미쳤다'
  AND bp.thumbnail_url = 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/board/%EC%9E%90%EC%9C%A0/%EC%9E%90%EC%9C%A0-1.jpg'
  AND bp.thumbnail_url IS NOT NULL AND TRIM(bp.thumbnail_url) <> ''
  AND bp.thumbnail_url LIKE 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/board/%'
  AND NOT EXISTS (SELECT 1 FROM board_post_image bpi WHERE bpi.post_id = bp.post_id);

INSERT INTO board_post_image (post_id, image_url, sort_order)
SELECT bp.post_id, bp.thumbnail_url, 1
FROM board_post bp
WHERE bp.category_id = 3 AND bp.member_id = 11
  AND bp.title = '이 짤 볼 때마다 대사 타이밍이 너무 웃김ㅋㅋ'
  AND bp.thumbnail_url = 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/board/%EC%9E%90%EC%9C%A0/%EC%9E%90%EC%9C%A0-2.png'
  AND bp.thumbnail_url IS NOT NULL AND TRIM(bp.thumbnail_url) <> ''
  AND bp.thumbnail_url LIKE 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/board/%'
  AND NOT EXISTS (SELECT 1 FROM board_post_image bpi WHERE bpi.post_id = bp.post_id);

INSERT INTO board_post_image (post_id, image_url, sort_order)
SELECT bp.post_id, bp.thumbnail_url, 1
FROM board_post bp
WHERE bp.category_id = 3 AND bp.member_id = 12
  AND bp.title = '질문 하나로 멘탈 부서지는 순간'
  AND bp.thumbnail_url = 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/board/%EC%9E%90%EC%9C%A0/%EC%9E%90%EC%9C%A0-3.jpg'
  AND bp.thumbnail_url IS NOT NULL AND TRIM(bp.thumbnail_url) <> ''
  AND bp.thumbnail_url LIKE 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/board/%'
  AND NOT EXISTS (SELECT 1 FROM board_post_image bpi WHERE bpi.post_id = bp.post_id);

INSERT INTO board_post_image (post_id, image_url, sort_order)
SELECT bp.post_id, bp.thumbnail_url, 1
FROM board_post bp
WHERE bp.category_id = 3 AND bp.member_id = 13
  AND bp.title = '서울 살면 말투가 이렇게 변하나 봄'
  AND bp.thumbnail_url = 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/board/%EC%9E%90%EC%9C%A0/%EC%9E%90%EC%9C%A0-4.jfif'
  AND bp.thumbnail_url IS NOT NULL AND TRIM(bp.thumbnail_url) <> ''
  AND bp.thumbnail_url LIKE 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/board/%'
  AND NOT EXISTS (SELECT 1 FROM board_post_image bpi WHERE bpi.post_id = bp.post_id);

INSERT INTO board_post_image (post_id, image_url, sort_order)
SELECT bp.post_id, bp.thumbnail_url, 1
FROM board_post bp
WHERE bp.category_id = 3 AND bp.member_id = 14
  AND bp.title = '대화가 너무 깔끔하게 끝나서 웃음 터짐'
  AND bp.thumbnail_url = 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/board/%EC%9E%90%EC%9C%A0/%EC%9E%90%EC%9C%A0-5.jpeg'
  AND bp.thumbnail_url IS NOT NULL AND TRIM(bp.thumbnail_url) <> ''
  AND bp.thumbnail_url LIKE 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/board/%'
  AND NOT EXISTS (SELECT 1 FROM board_post_image bpi WHERE bpi.post_id = bp.post_id);

INSERT INTO board_post_image (post_id, image_url, sort_order)
SELECT bp.post_id, bp.thumbnail_url, 1
FROM board_post bp
WHERE bp.category_id = 3 AND bp.member_id = 15
  AND bp.title = '이런 전/후 비교는 진짜 반칙 아니냐'
  AND bp.thumbnail_url = 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/board/%EC%9E%90%EC%9C%A0/%EC%9E%90%EC%9C%A0-6.jfif'
  AND bp.thumbnail_url IS NOT NULL AND TRIM(bp.thumbnail_url) <> ''
  AND bp.thumbnail_url LIKE 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/board/%'
  AND NOT EXISTS (SELECT 1 FROM board_post_image bpi WHERE bpi.post_id = bp.post_id);

INSERT INTO board_post_image (post_id, image_url, sort_order)
SELECT bp.post_id, bp.thumbnail_url, 1
FROM board_post bp
WHERE bp.category_id = 3 AND bp.member_id = 16
  AND bp.title = '원피스 신권 표지 떴길래 저장함'
  AND bp.thumbnail_url = 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/board/%EC%9E%90%EC%9C%A0/%EC%9E%90%EC%9C%A0-7.jpg'
  AND bp.thumbnail_url IS NOT NULL AND TRIM(bp.thumbnail_url) <> ''
  AND bp.thumbnail_url LIKE 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/board/%'
  AND NOT EXISTS (SELECT 1 FROM board_post_image bpi WHERE bpi.post_id = bp.post_id);

INSERT INTO board_post_image (post_id, image_url, sort_order)
SELECT bp.post_id, bp.thumbnail_url, 1
FROM board_post bp
WHERE bp.category_id = 3 AND bp.member_id = 17
  AND bp.title = '이 장면 캡처… 표정이 너무 강렬해서 저장'
  AND bp.thumbnail_url = 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/board/%EC%9E%90%EC%9C%A0/%EC%9E%90%EC%9C%A0-8.jfif'
  AND bp.thumbnail_url IS NOT NULL AND TRIM(bp.thumbnail_url) <> ''
  AND bp.thumbnail_url LIKE 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/board/%'
  AND NOT EXISTS (SELECT 1 FROM board_post_image bpi WHERE bpi.post_id = bp.post_id);

INSERT INTO board_post_image (post_id, image_url, sort_order)
SELECT bp.post_id, bp.thumbnail_url, 1
FROM board_post bp
WHERE bp.category_id = 3 AND bp.member_id = 18
  AND bp.title = '거인 나오는 그 작품은 역시 스케일이 다르다'
  AND bp.thumbnail_url = 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/board/%EC%9E%90%EC%9C%A0/%EC%9E%90%EC%9C%A0-9.jfif'
  AND bp.thumbnail_url IS NOT NULL AND TRIM(bp.thumbnail_url) <> ''
  AND bp.thumbnail_url LIKE 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/board/%'
  AND NOT EXISTS (SELECT 1 FROM board_post_image bpi WHERE bpi.post_id = bp.post_id);

INSERT INTO board_post_image (post_id, image_url, sort_order)
SELECT bp.post_id, bp.thumbnail_url, 1
FROM board_post bp
WHERE bp.category_id = 3 AND bp.member_id = 12
  AND bp.title = '이런 잔잔한 컷이 더 오래 기억남'
  AND bp.thumbnail_url = 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/board/%EC%9E%90%EC%9C%A0/%EC%9E%90%EC%9C%A0-10.jfif'
  AND bp.thumbnail_url IS NOT NULL AND TRIM(bp.thumbnail_url) <> ''
  AND bp.thumbnail_url LIKE 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/board/%'
  AND NOT EXISTS (SELECT 1 FROM board_post_image bpi WHERE bpi.post_id = bp.post_id);

INSERT INTO board_post_image (post_id, image_url, sort_order)
SELECT bp.post_id, bp.thumbnail_url, 1
FROM board_post bp
WHERE bp.category_id = 3 AND bp.member_id = 13
  AND bp.title = '요즘 게임/애니 연출… 이펙트 맛이 미쳤다'
  AND bp.thumbnail_url = 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/board/%EC%9E%90%EC%9C%A0/%EC%9E%90%EC%9C%A0-11.jfif'
  AND bp.thumbnail_url IS NOT NULL AND TRIM(bp.thumbnail_url) <> ''
  AND bp.thumbnail_url LIKE 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/board/%'
  AND NOT EXISTS (SELECT 1 FROM board_post_image bpi WHERE bpi.post_id = bp.post_id);

INSERT INTO board_post_image (post_id, image_url, sort_order)
SELECT bp.post_id, bp.thumbnail_url, 1
FROM board_post bp
WHERE bp.category_id = 3 AND bp.member_id = 14
  AND bp.title = '이 표정은 진짜… 감정선 폭발 컷'
  AND bp.thumbnail_url = 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/board/%EC%9E%90%EC%9C%A0/%EC%9E%90%EC%9C%A0-12.jfif'
  AND bp.thumbnail_url IS NOT NULL AND TRIM(bp.thumbnail_url) <> ''
  AND bp.thumbnail_url LIKE 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/board/%'
  AND NOT EXISTS (SELECT 1 FROM board_post_image bpi WHERE bpi.post_id = bp.post_id);

INSERT INTO board_post_image (post_id, image_url, sort_order)
SELECT bp.post_id, bp.thumbnail_url, 1
FROM board_post bp
WHERE bp.category_id = 3 AND bp.member_id = 15
  AND bp.title = '오늘의 야식 인증… 양념이 반칙이다'
  AND bp.thumbnail_url = 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/board/%EC%9E%90%EC%9C%A0/%EC%9E%90%EC%9C%A0-13.jpg'
  AND bp.thumbnail_url IS NOT NULL AND TRIM(bp.thumbnail_url) <> ''
  AND bp.thumbnail_url LIKE 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/board/%'
  AND NOT EXISTS (SELECT 1 FROM board_post_image bpi WHERE bpi.post_id = bp.post_id);

INSERT INTO board_post_image (post_id, image_url, sort_order)
SELECT bp.post_id, bp.thumbnail_url, 1
FROM board_post bp
WHERE bp.category_id = 3 AND bp.member_id = 16
  AND bp.title = '길거리 음식은 현장감이 다 한다'
  AND bp.thumbnail_url = 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/board/%EC%9E%90%EC%9C%A0/%EC%9E%90%EC%9C%A0-14.jfif'
  AND bp.thumbnail_url IS NOT NULL AND TRIM(bp.thumbnail_url) <> ''
  AND bp.thumbnail_url LIKE 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/board/%'
  AND NOT EXISTS (SELECT 1 FROM board_post_image bpi WHERE bpi.post_id = bp.post_id);

INSERT INTO board_post_image (post_id, image_url, sort_order)
SELECT bp.post_id, bp.thumbnail_url, 1
FROM board_post bp
WHERE bp.category_id = 3 AND bp.member_id = 17
  AND bp.title = 'AI가 이렇게 생각하는 느낌일 때 있음ㅋㅋ'
  AND bp.thumbnail_url = 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/board/%EC%9E%90%EC%9C%A0/%EC%9E%90%EC%9C%A0-15.jfif'
  AND bp.thumbnail_url IS NOT NULL AND TRIM(bp.thumbnail_url) <> ''
  AND bp.thumbnail_url LIKE 'https://tkuku-bucket.s3.ap-northeast-2.amazonaws.com/board/%'
  AND NOT EXISTS (SELECT 1 FROM board_post_image bpi WHERE bpi.post_id = bp.post_id);

commit ;

INSERT INTO board_tag (tag_id, tag_name)
VALUES (1, '포카');

INSERT INTO board_tag (tag_id, tag_name)
VALUES (2, '피규어');

INSERT INTO board_tag (tag_id, tag_name)
VALUES (3, '키링');

INSERT INTO board_tag (tag_id, tag_name)
VALUES (4, '스티커');

INSERT INTO board_tag (tag_id, tag_name)
VALUES (5, '아크릴스탠드');

INSERT INTO board_tag (tag_id, tag_name)
VALUES (6, '브로마이드');

INSERT INTO board_tag (tag_id, tag_name)
VALUES (7, '팬사인회');

INSERT INTO board_tag (tag_id, tag_name)
VALUES (8, '한정판');

INSERT INTO board_tag (tag_id, tag_name)
VALUES (9, '팝업스토어');

INSERT INTO board_tag (tag_id, tag_name)
VALUES (10, '굿즈교환');

INSERT INTO board_tag (tag_id, tag_name)
VALUES (11, '랜덤박스');

INSERT INTO board_tag (tag_id, tag_name)
VALUES (12, '응원봉');

INSERT INTO board_tag (tag_id, tag_name)
VALUES (13, '포스터');

INSERT INTO board_tag (tag_id, tag_name)
VALUES (14, '코스프레');

INSERT INTO board_tag (tag_id, tag_name)
VALUES (15, '아이돌');

INSERT INTO board_tag (tag_id, tag_name)
VALUES (16, '애니메이션');

INSERT INTO board_tag (tag_id, tag_name)
VALUES (17, '게임굿즈');

INSERT INTO board_tag (tag_id, tag_name)
VALUES (18, '카페콜라보');

INSERT INTO board_tag (tag_id, tag_name)
VALUES (19, '레어템');

INSERT INTO board_tag (tag_id, tag_name)
VALUES (20, '중고거래');
commit;
INSERT INTO board_post_tag (post_id, tag_id)
VALUES (1, 1);

INSERT INTO board_post_tag (post_id, tag_id)
VALUES (1, 2);

INSERT INTO board_post_tag (post_id, tag_id)
VALUES (2, 1);

INSERT INTO board_post_tag (post_id, tag_id)
VALUES (2, 3);

INSERT INTO board_post_tag (post_id, tag_id)
VALUES (3, 2);

INSERT INTO board_post_tag (post_id, tag_id)
VALUES (3, 4);

INSERT INTO board_post_tag (post_id, tag_id)
VALUES (4, 1);

INSERT INTO board_post_tag (post_id, tag_id)
VALUES (4, 5);

INSERT INTO board_post_tag (post_id, tag_id)
VALUES (5, 3);

INSERT INTO board_post_tag (post_id, tag_id)
VALUES (5, 4);

INSERT INTO board_post_tag (post_id, tag_id)
VALUES (6, 2);

INSERT INTO board_post_tag (post_id, tag_id)
VALUES (6, 5);

INSERT INTO board_post_tag (post_id, tag_id)
VALUES (7, 1);

INSERT INTO board_post_tag (post_id, tag_id)
VALUES (7, 4);

INSERT INTO board_post_tag (post_id, tag_id)
VALUES (8, 2);

INSERT INTO board_post_tag (post_id, tag_id)
VALUES (8, 3);

INSERT INTO board_post_tag (post_id, tag_id)
VALUES (9, 1);

INSERT INTO board_post_tag (post_id, tag_id)
VALUES (9, 5);

INSERT INTO board_post_tag (post_id, tag_id)
VALUES (10, 2);

INSERT INTO board_post_tag (post_id, tag_id)
VALUES (10, 4);
commit;
INSERT INTO faq_category (faq_category_id, name)
VALUES (1, '매장 안내');

INSERT INTO faq_category (faq_category_id, name)
VALUES (2, '매장 위치/영업시간');

INSERT INTO faq_category (faq_category_id, name)
VALUES (3, '매장 재고/상품문의');

INSERT INTO faq_category (faq_category_id, name)
VALUES (4, '팝업스토어 일정');

INSERT INTO faq_category (faq_category_id, name)
VALUES (5, '예약/번호표 시스템');

INSERT INTO faq_category (faq_category_id, name)
VALUES (6, '온라인 주문');

INSERT INTO faq_category (faq_category_id, name)
VALUES (7, '결제 수단');

INSERT INTO faq_category (faq_category_id, name)
VALUES (8, '환불/취소');

INSERT INTO faq_category (faq_category_id, name)
VALUES (9, '배송/픽업');

INSERT INTO faq_category (faq_category_id, name)
VALUES (10, '프로모션/이벤트');

INSERT INTO faq_category (faq_category_id, name)
VALUES (11, '포인트/적립');

INSERT INTO faq_category (faq_category_id, name)
VALUES (12, '쿠폰/할인');

INSERT INTO faq_category (faq_category_id, name)
VALUES (13, '계정 생성/가입');

INSERT INTO faq_category (faq_category_id, name)
VALUES (14, '로그인/비밀번호 찾기');

INSERT INTO faq_category (faq_category_id, name)
VALUES (15, '회원정보 수정/탈퇴');

INSERT INTO faq_category (faq_category_id, name)
VALUES (16, '알림/푸시 설정');

INSERT INTO faq_category (faq_category_id, name)
VALUES (17, '앱/웹 오류');

INSERT INTO faq_category (faq_category_id, name)
VALUES (18, '신고/차단/운영정책');

INSERT INTO faq_category (faq_category_id, name)
VALUES (19, '개인정보/보안');

INSERT INTO faq_category (faq_category_id, name)
VALUES (20, '기타 문의');
commit ;INSERT INTO faq (faq_category_id, question, answer, sort_order)
        VALUES (
                   1,
                   '오프라인 매장은 어떤 컨셉의 매장인가요?',
                   '굿즈로드 오프라인 매장은 애니메이션, 아이돌, 게임 등 다양한 굿즈를 한 곳에서 만날 수 있는 셀렉트샵 형태의 매장입니다. 팝업스토어와 연계된 한정 상품도 입고됩니다.',
                   1
               );

INSERT INTO faq (faq_category_id, question, answer, sort_order)
VALUES (
           1,
           '오프라인 매장의 운영 시간은 어떻게 되나요?',
           '오프라인 매장은 평일과 주말 모두 11:00~21:00까지 운영합니다. 명절 및 공휴일에는 별도의 공지사항을 통해 운영 시간을 안내해 드립니다.',
           2
       );

INSERT INTO faq (faq_category_id, question, answer, sort_order)
VALUES (
           1,
           '매장에 항상 동일한 상품이 있나요?',
           '매장 상품은 시즌, 팝업스토어 일정, 공급 상황에 따라 수시로 변경됩니다. 인기 상품이나 한정판 상품은 조기 품절될 수 있습니다.',
           3
       );

INSERT INTO faq (faq_category_id, question, answer, sort_order)
VALUES (
           1,
           '온라인에 보이는 상품을 매장에서 바로 구매할 수 있나요?',
           '일부 상품은 온라인 전용이거나 매장 전용 상품일 수 있습니다. 동일 상품이라도 재고 상황이 다를 수 있으므로 방문 전 매장에 문의해 주시는 것을 권장합니다.',
           4
       );

INSERT INTO faq (faq_category_id, question, answer, sort_order)
VALUES (
           1,
           '팝업스토어 연계 상품은 어디에서 확인할 수 있나요?',
           '홈 화면의 팝업스토어 메뉴와 공지사항을 통해 현재 진행 중인 팝업스토어 정보와 연계 굿즈를 확인하실 수 있습니다.',
           5
       );

INSERT INTO faq (faq_category_id, question, answer, sort_order)
VALUES (
           1,
           '매장에 방문하기 전에 재고를 확인할 수 있나요?',
           '일부 매장에 한해 실시간 재고 조회 기능을 제공하고 있습니다. 매장 상세 페이지의 재고 안내 영역을 확인해 주세요.',
           6
       );

INSERT INTO faq (faq_category_id, question, answer, sort_order)
VALUES (
           1,
           '매장 내에서 사진 촬영이 가능한가요?',
           '일반 매장 공간은 개인 소장용 사진 촬영이 가능하지만, 일부 전시 존과 한정존은 촬영이 제한될 수 있습니다. 매장 내 안내문을 꼭 확인해 주세요.',
           7
       );

INSERT INTO faq (faq_category_id, question, answer, sort_order)
VALUES (
           1,
           '매장에서 포장 서비스도 제공하나요?',
           '기본 쇼핑백은 무료로 제공되며, 선물용 포장 서비스는 일부 매장에 한해 유료로 제공됩니다. 자세한 내용은 매장 직원에게 문의해 주세요.',
           8
       );

INSERT INTO faq (faq_category_id, question, answer, sort_order)
VALUES (
           1,
           '오프라인 매장만의 한정 굿즈가 있나요?',
           '네, 특정 기간에는 오프라인 매장 방문 고객만 구매할 수 있는 한정 굿즈가 준비됩니다. 관련 내용은 이벤트 안내를 통해 미리 공지됩니다.',
           9
       );

INSERT INTO faq (faq_category_id, question, answer, sort_order)
VALUES (
           1,
           '매장 내에서 카드, 현금 외에 다른 결제 수단도 사용 가능한가요?',
           '신용·체크카드, 간편결제(일부 서비스), 모바일 결제가 가능하며, 사용 가능한 결제 수단은 매장별로 조금씩 다를 수 있습니다.',
           10
       );

-- 주문/결제 관련 (카테고리 2)

INSERT INTO faq (faq_category_id, question, answer, sort_order)
VALUES (
           2,
           '온라인으로 주문한 상품은 어떻게 결제할 수 있나요?',
           '온라인 주문 시 신용·체크카드, 계좌이체, 간편결제 등 다양한 결제 수단을 지원합니다. 결제 수단은 결제 화면에서 확인하실 수 있습니다.',
           11
       );

INSERT INTO faq (faq_category_id, question, answer, sort_order)
VALUES (
           2,
           '주문 후 결제 수단을 변경할 수 있나요?',
           '이미 결제가 완료된 주문의 결제 수단은 변경이 불가능합니다. 결제 수단을 바꾸고 싶으시다면 기존 주문을 취소 후 다시 주문해 주세요.',
           12
       );

INSERT INTO faq (faq_category_id, question, answer, sort_order)
VALUES (
           2,
           '주문 내역을 어디서 확인할 수 있나요?',
           '로그인 후 마이페이지의 주문 내역 메뉴에서 지금까지의 주문 기록과 상세 정보를 확인하실 수 있습니다.',
           13
       );

INSERT INTO faq (faq_category_id, question, answer, sort_order)
VALUES (
           2,
           '주문이 정상적으로 완료되었는지 어떻게 확인하나요?',
           '결제가 완료되면 주문 완료 페이지가 표시되며, 동시에 안내 메일이 발송됩니다. 마이페이지 주문 내역에서도 주문 상태를 확인하실 수 있습니다.',
           14
       );

INSERT INTO faq (faq_category_id, question, answer, sort_order)
VALUES (
           2,
           '주문 후 결제가 계속 실패합니다. 어떻게 해야 하나요?',
           '결제 실패 시 결제 수단, 카드 한도, 보안 프로그램 등을 확인해 주세요. 문제가 계속될 경우 카드사 또는 결제 대행사 고객센터에 문의하시기 바랍니다.',
           15
       );

INSERT INTO faq (faq_category_id, question, answer, sort_order)
VALUES (
           2,
           '비회원도 주문이 가능한가요?',
           '일부 상품은 비회원 구매가 가능하지만, 주문 내역 조회 및 사후 서비스를 위해 회원 가입 후 이용하시는 것을 추천드립니다.',
           16
       );

INSERT INTO faq (faq_category_id, question, answer, sort_order)
VALUES (
           2,
           '입금 기한을 넘기면 주문은 어떻게 되나요?',
           '무통장 입금 등 입금이 필요한 결제 수단의 경우, 안내된 기한 내에 입금이 완료되지 않으면 주문이 자동 취소될 수 있습니다.',
           17
       );

INSERT INTO faq (faq_category_id, question, answer, sort_order)
VALUES (
           2,
           '주문 금액이 두 번 결제된 것 같습니다. 어떻게 처리되나요?',
           '결제 시스템 오류 등으로 중복 결제가 발생한 경우, 확인 후 한 건은 자동 또는 수동 환불 처리됩니다. 상세 내역은 고객센터로 문의해 주세요.',
           18
       );

INSERT INTO faq (faq_category_id, question, answer, sort_order)
VALUES (
           2,
           '주문을 취소했는데 카드 승인 내역이 남아 있습니다.',
           '카드 결제의 경우 취소 후 실제 승인 취소 반영까지 영업일 기준 며칠이 소요될 수 있습니다. 자세한 처리 일정은 카드사에 문의해 주세요.',
           19
       );

INSERT INTO faq (faq_category_id, question, answer, sort_order)
VALUES (
           2,
           '주문서에 기재한 정보(주소, 연락처)를 수정하고 싶어요.',
           '상품 준비 전 단계에서는 고객센터를 통해 정보를 수정해 드릴 수 있습니다. 배송 준비가 시작된 후에는 변경이 어려울 수 있습니다.',
           20
       );

-- 배송/픽업 관련 (카테고리 3)

INSERT INTO faq (faq_category_id, question, answer, sort_order)
VALUES (
           3,
           '온라인 주문 상품의 배송 기간은 얼마나 걸리나요?',
           '일반적인 경우 결제 완료 후 2~3영업일 이내 출고되며, 택배사의 사정에 따라 추가 시간이 소요될 수 있습니다. 예약 상품은 별도 안내된 일정을 따릅니다.',
           21
       );

INSERT INTO faq (faq_category_id, question, answer, sort_order)
VALUES (
           3,
           '배송비는 어떻게 책정되나요?',
           '기본 배송비는 주문 금액 또는 지역에 따라 다르게 적용됩니다. 일정 금액 이상 구매 시 무료 배송 혜택이 제공될 수 있으며, 상세 기준은 배송 안내를 참고해 주세요.',
           22
       );

INSERT INTO faq (faq_category_id, question, answer, sort_order)
VALUES (
           3,
           '해외 배송도 가능한가요?',
           '현재는 국내 배송만 지원하고 있으며, 추후 해외 배송 서비스가 오픈될 경우 공지사항을 통해 안내해 드릴 예정입니다.',
           23
       );

INSERT INTO faq (faq_category_id, question, answer, sort_order)
VALUES (
           3,
           '배송 조회는 어디에서 할 수 있나요?',
           '마이페이지의 주문 상세 화면에서 택배사와 송장번호를 확인할 수 있으며, 해당 정보를 통해 배송 추적이 가능합니다.',
           24
       );

INSERT INTO faq (faq_category_id, question, answer, sort_order)
VALUES (
           3,
           '여러 상품을 함께 주문하면 부분 배송이 되나요?',
           '상품 준비 상황에 따라 일부 상품이 먼저 발송될 수 있습니다. 부분 배송 여부 및 추가 배송비 발생은 상품 및 프로모션 정책에 따라 달라질 수 있습니다.',
           25
       );

INSERT INTO faq (faq_category_id, question, answer, sort_order)
VALUES (
           3,
           '배송 중 박스가 파손되었을 경우 어떻게 해야 하나요?',
           '수령 즉시 박스 상태와 상품을 촬영해 두시고, 고객센터로 사진과 함께 문의해 주시면 확인 후 교환 또는 환불 절차를 안내해 드립니다.',
           26
       );

INSERT INTO faq (faq_category_id, question, answer, sort_order)
VALUES (
           3,
           '수령 주소를 잘못 입력했어요. 변경이 가능할까요?',
           '상품이 출고되기 전이라면 주소 변경이 가능할 수 있지만, 이미 택배사에 인계된 경우에는 변경이 불가능할 수 있습니다. 최대한 빠르게 고객센터로 문의해 주세요.',
           27
       );

INSERT INTO faq (faq_category_id, question, answer, sort_order)
VALUES (
           3,
           '매장 픽업 서비스를 이용할 수 있나요?',
           '일부 상품은 매장 픽업 기능을 제공하고 있으며, 주문 시 수령 방법에서 매장 픽업을 선택할 수 있습니다. 픽업 가능 매장과 일정은 주문 화면에 안내됩니다.',
           28
       );

INSERT INTO faq (faq_category_id, question, answer, sort_order)
VALUES (
           3,
           '배송이 지연되고 있다는 안내를 받았습니다. 어떻게 처리되나요?',
           '입고 지연, 물류 센터 이슈 등으로 배송이 늦어질 경우 문자, 메일 등으로 안내해 드립니다. 원하실 경우 주문 취소 및 환불도 가능합니다.',
           29
       );

INSERT INTO faq (faq_category_id, question, answer, sort_order)
VALUES (
           3,
           '배송 완료라고 뜨지만 상품을 받지 못했습니다.',
           '가족 또는 경비실 수령 여부를 먼저 확인해 주시고, 그래도 찾지 못하셨다면 택배사와 고객센터로 문의해 주시면 위치 확인을 도와드리겠습니다.',
           30
       );

-- 회원/계정/포인트 관련 (카테고리 4)

INSERT INTO faq (faq_category_id, question, answer, sort_order)
VALUES (
           4,
           '회원 가입은 어떻게 하나요?',
           '홈 화면 우측 상단의 회원 가입 버튼을 눌러 이메일 또는 소셜 계정으로 간편하게 가입하실 수 있습니다.',
           31
       );

INSERT INTO faq (faq_category_id, question, answer, sort_order)
VALUES (
           4,
           '비밀번호를 잊어버렸습니다. 어떻게 재설정할 수 있나요?',
           '로그인 화면의 비밀번호 찾기 기능을 통해 가입 시 등록한 이메일로 비밀번호 재설정 링크를 보내드립니다.',
           32
       );

INSERT INTO faq (faq_category_id, question, answer, sort_order)
VALUES (
           4,
           '회원 탈퇴는 어디서 할 수 있나요?',
           '마이페이지의 계정 관리 메뉴에서 회원 탈퇴를 진행하실 수 있습니다. 탈퇴 시 보유 포인트 및 쿠폰은 모두 소멸됩니다.',
           33
       );

INSERT INTO faq (faq_category_id, question, answer, sort_order)
VALUES (
           4,
           '포인트는 어떻게 적립되나요?',
           '상품 구매 금액의 일정 비율이 포인트로 적립되며, 이벤트 참여나 리뷰 작성 등을 통해 추가 적립이 가능합니다. 적립 비율은 프로모션에 따라 변동될 수 있습니다.',
           34
       );

INSERT INTO faq (faq_category_id, question, answer, sort_order)
VALUES (
           4,
           '포인트는 어떻게 사용할 수 있나요?',
           '결제 화면에서 사용 가능한 포인트를 확인하고, 원하는 만큼 입력하여 상품 결제 금액 일부를 차감하실 수 있습니다. 최소 사용 단위와 조건은 안내를 참고해 주세요.',
           35
       );

INSERT INTO faq (faq_category_id, question, answer, sort_order)
VALUES (
           4,
           '포인트의 유효 기간이 있나요?',
           '기본적으로 포인트는 적립일로부터 일정 기간 동안 유효합니다. 유효 기간이 지난 포인트는 자동으로 소멸되며, 마이페이지에서 소멸 예정 포인트를 확인하실 수 있습니다.',
           36
       );

INSERT INTO faq (faq_category_id, question, answer, sort_order)
VALUES (
           4,
           '여러 계정의 포인트를 합칠 수 있나요?',
           '보안 및 정책상 서로 다른 계정의 포인트를 합산하거나 이전하는 것은 불가능합니다. 하나의 계정을 집중적으로 사용해 주시기를 권장드립니다.',
           37
       );

INSERT INTO faq (faq_category_id, question, answer, sort_order)
VALUES (
           4,
           '아이디(이메일)를 변경하고 싶습니다.',
           '보안을 위해 이메일 변경은 고객센터 확인 후 처리됩니다. 본인 인증 절차가 필요할 수 있습니다.',
           38
       );

INSERT INTO faq (faq_category_id, question, answer, sort_order)
VALUES (
           4,
           '휴면 계정은 어떻게 해제하나요?',
           '장기간 미사용으로 휴면 전환된 계정은 로그인 후 본인 확인 절차를 거치면 자동으로 해제됩니다.',
           39
       );

INSERT INTO faq (faq_category_id, question, answer, sort_order)
VALUES (
           4,
           '알림 수신 설정을 바꾸고 싶어요.',
           '마이페이지의 알림 설정 메뉴에서 이메일, 푸시 알림 등 수신 여부를 자유롭게 변경하실 수 있습니다.',
           40
       );

-- 서비스 이용/기타 (카테고리 5)

INSERT INTO faq (faq_category_id, question, answer, sort_order)
VALUES (
           5,
           '지도에서 굿즈 매장을 검색하는 방법을 알려주세요.',
           '홈 화면 상단의 검색창에서 작품명, 매장명, 지역명을 입력하거나, 지도 화면에서 확대·이동을 통해 근처 굿즈 매장을 확인할 수 있습니다.',
           41
       );

INSERT INTO faq (faq_category_id, question, answer, sort_order)
VALUES (
           5,
           '매장을 즐겨찾기(북마크)하면 어떤 점이 편리한가요?',
           '자주 방문하는 매장을 북마크해 두면, 마이페이지 또는 지도 화면에서 바로 확인할 수 있고, 해당 매장의 새 소식이나 팝업 일정도 빠르게 확인할 수 있습니다.',
           42
       );

INSERT INTO faq (faq_category_id, question, answer, sort_order)
VALUES (
           5,
           '리뷰 작성은 어떻게 할 수 있나요?',
           '로그인 후 매장 또는 상품 상세 페이지에서 리뷰 작성 버튼을 눌러 별점과 함께 후기를 남기실 수 있습니다.',
           43
       );

INSERT INTO faq (faq_category_id, question, answer, sort_order)
VALUES (
           5,
           '작성한 리뷰를 수정하거나 삭제할 수 있나요?',
           '마이페이지의 리뷰 관리 메뉴에서 본인이 작성한 리뷰를 확인하고, 일정 기간 내에는 수정 또는 삭제가 가능합니다.',
           44
       );

INSERT INTO faq (faq_category_id, question, answer, sort_order)
VALUES (
           5,
           '고객센터에 문의를 남기고 싶습니다. 어디서 할 수 있나요?',
           '앱 또는 웹 하단의 고객센터 메뉴를 통해 1:1 문의를 남기실 수 있으며, 운영 시간 내 순차적으로 답변을 드리고 있습니다.',
           45
       );

INSERT INTO faq (faq_category_id, question, answer, sort_order)
VALUES (
           5,
           '이벤트 및 프로모션 소식은 어디에서 확인하나요?',
           '이벤트 페이지와 공지사항, 그리고 메인 배너를 통해 진행 중인 이벤트와 예정된 프로모션 정보를 확인하실 수 있습니다.',
           46
       );

INSERT INTO faq (faq_category_id, question, answer, sort_order)
VALUES (
           5,
           '서비스 이용 중 오류가 발생했을 때 어떻게 해야 하나요?',
           '오류 화면을 캡처한 뒤, 사용 기기와 브라우저 정보와 함께 고객센터에 문의해 주시면 보다 빠른 원인 파악과 해결에 도움이 됩니다.',
           47
       );

INSERT INTO faq (faq_category_id, question, answer, sort_order)
VALUES (
           5,
           '지도에 표시되지 않는 매장을 제보할 수 있나요?',
           '네, 고객센터 또는 제휴 문의를 통해 매장 정보를 보내주시면 검토 후 지도에 반영될 수 있습니다.',
           48
       );

INSERT INTO faq (faq_category_id, question, answer, sort_order)
VALUES (
           5,
           '제휴 및 광고 문의는 어떻게 진행되나요?',
           '하단의 제휴 문의 메뉴를 통해 기본 정보를 남겨 주시면 담당자가 확인 후 메일 또는 전화로 연락을 드립니다.',
           49
       );

INSERT INTO faq (faq_category_id, question, answer, sort_order)
VALUES (
           5,
           '서비스 공지사항은 어디에서 확인할 수 있나요?',
           '홈 화면 또는 설정 메뉴의 공지사항 페이지에서 서비스 업데이트, 점검 일정, 정책 변경 등 중요한 안내를 확인하실 수 있습니다.',
           50
       );

commit ;INSERT INTO inquiry (
    member_id, category, title, content,
    status, answer_content, created_at, answered_at
) VALUES (
             1, 'ACCOUNT', '[테스트 문의 001] 서비스 이용 관련 문의드립니다.',
             '테스트용 더미 문의 001번입니다. 로그인, 주문, 결제, 매장 이용 등 서비스 전반에 대한 문의 내용을 예시로 작성하였습니다.',
             'DONE', '문의 001번에 대한 답변입니다. 확인 후 추가 문의 사항이 있으시면 다시 문의해 주세요.', SYSDATE - 40, SYSDATE - 39
         );

INSERT INTO inquiry (
    member_id, category, title, content,
    status, answer_content, created_at, answered_at
) VALUES (
             2, 'ACCOUNT', '[테스트 문의 002] 서비스 이용 관련 문의드립니다.',
             '테스트용 더미 문의 002번입니다. 로그인, 주문, 결제, 매장 이용 등 서비스 전반에 대한 문의 내용을 예시로 작성하였습니다.',
             'DONE', '문의 002번에 대한 답변입니다. 확인 후 추가 문의 사항이 있으시면 다시 문의해 주세요.', SYSDATE - 39, SYSDATE - 38
         );

INSERT INTO inquiry (
    member_id, category, title, content,
    status, answer_content, created_at, answered_at
) VALUES (
             3, 'ACCOUNT', '[테스트 문의 003] 서비스 이용 관련 문의드립니다.',
             '테스트용 더미 문의 003번입니다. 로그인, 주문, 결제, 매장 이용 등 서비스 전반에 대한 문의 내용을 예시로 작성하였습니다.',
             'DONE', '문의 003번에 대한 답변입니다. 확인 후 추가 문의 사항이 있으시면 다시 문의해 주세요.', SYSDATE - 38, SYSDATE - 37
         );

INSERT INTO inquiry (
    member_id, category, title, content,
    status, answer_content, created_at, answered_at
) VALUES (
             4, 'ACCOUNT', '[테스트 문의 004] 서비스 이용 관련 문의드립니다.',
             '테스트용 더미 문의 004번입니다. 로그인, 주문, 결제, 매장 이용 등 서비스 전반에 대한 문의 내용을 예시로 작성하였습니다.',
             'DONE', '문의 004번에 대한 답변입니다. 확인 후 추가 문의 사항이 있으시면 다시 문의해 주세요.', SYSDATE - 37, SYSDATE - 36
         );

INSERT INTO inquiry (
    member_id, category, title, content,
    status, answer_content, created_at, answered_at
) VALUES (
             5, 'ACCOUNT', '[테스트 문의 005] 서비스 이용 관련 문의드립니다.',
             '테스트용 더미 문의 005번입니다. 로그인, 주문, 결제, 매장 이용 등 서비스 전반에 대한 문의 내용을 예시로 작성하였습니다.',
             'DONE', '문의 005번에 대한 답변입니다. 확인 후 추가 문의 사항이 있으시면 다시 문의해 주세요.', SYSDATE - 36, SYSDATE - 35
         );

INSERT INTO inquiry (
    member_id, category, title, content,
    status, answer_content, created_at, answered_at
) VALUES (
             1, 'ACCOUNT', '[테스트 문의 006] 서비스 이용 관련 문의드립니다.',
             '테스트용 더미 문의 006번입니다. 로그인, 주문, 결제, 매장 이용 등 서비스 전반에 대한 문의 내용을 예시로 작성하였습니다.',
             'DONE', '문의 006번에 대한 답변입니다. 확인 후 추가 문의 사항이 있으시면 다시 문의해 주세요.', SYSDATE - 35, SYSDATE - 34
         );

INSERT INTO inquiry (
    member_id, category, title, content,
    status, answer_content, created_at, answered_at
) VALUES (
             2, 'ACCOUNT', '[테스트 문의 007] 서비스 이용 관련 문의드립니다.',
             '테스트용 더미 문의 007번입니다. 로그인, 주문, 결제, 매장 이용 등 서비스 전반에 대한 문의 내용을 예시로 작성하였습니다.',
             'DONE', '문의 007번에 대한 답변입니다. 확인 후 추가 문의 사항이 있으시면 다시 문의해 주세요.', SYSDATE - 34, SYSDATE - 33
         );

INSERT INTO inquiry (
    member_id, category, title, content,
    status, answer_content, created_at, answered_at
) VALUES (
             3, 'ACCOUNT', '[테스트 문의 008] 서비스 이용 관련 문의드립니다.',
             '테스트용 더미 문의 008번입니다. 로그인, 주문, 결제, 매장 이용 등 서비스 전반에 대한 문의 내용을 예시로 작성하였습니다.',
             'DONE', '문의 008번에 대한 답변입니다. 확인 후 추가 문의 사항이 있으시면 다시 문의해 주세요.', SYSDATE - 33, SYSDATE - 32
         );

INSERT INTO inquiry (
    member_id, category, title, content,
    status, answer_content, created_at, answered_at
) VALUES (
             4, 'ACCOUNT', '[테스트 문의 009] 서비스 이용 관련 문의드립니다.',
             '테스트용 더미 문의 009번입니다. 로그인, 주문, 결제, 매장 이용 등 서비스 전반에 대한 문의 내용을 예시로 작성하였습니다.',
             'DONE', '문의 009번에 대한 답변입니다. 확인 후 추가 문의 사항이 있으시면 다시 문의해 주세요.', SYSDATE - 32, SYSDATE - 31
         );

INSERT INTO inquiry (
    member_id, category, title, content,
    status, answer_content, created_at, answered_at
) VALUES (
             5, 'ACCOUNT', '[테스트 문의 010] 서비스 이용 관련 문의드립니다.',
             '테스트용 더미 문의 010번입니다. 로그인, 주문, 결제, 매장 이용 등 서비스 전반에 대한 문의 내용을 예시로 작성하였습니다.',
             'DONE', '문의 010번에 대한 답변입니다. 확인 후 추가 문의 사항이 있으시면 다시 문의해 주세요.', SYSDATE - 31, SYSDATE - 30
         );

INSERT INTO inquiry (
    member_id, category, title, content,
    status, answer_content, created_at, answered_at
) VALUES (
             1, 'ORDER', '[테스트 문의 011] 서비스 이용 관련 문의드립니다.',
             '테스트용 더미 문의 011번입니다. 로그인, 주문, 결제, 매장 이용 등 서비스 전반에 대한 문의 내용을 예시로 작성하였습니다.',
             'DONE', '문의 011번에 대한 답변입니다. 확인 후 추가 문의 사항이 있으시면 다시 문의해 주세요.', SYSDATE - 30, SYSDATE - 29
         );

INSERT INTO inquiry (
    member_id, category, title, content,
    status, answer_content, created_at, answered_at
) VALUES (
             2, 'ORDER', '[테스트 문의 012] 서비스 이용 관련 문의드립니다.',
             '테스트용 더미 문의 012번입니다. 로그인, 주문, 결제, 매장 이용 등 서비스 전반에 대한 문의 내용을 예시로 작성하였습니다.',
             'DONE', '문의 012번에 대한 답변입니다. 확인 후 추가 문의 사항이 있으시면 다시 문의해 주세요.', SYSDATE - 29, SYSDATE - 28
         );

INSERT INTO inquiry (
    member_id, category, title, content,
    status, answer_content, created_at, answered_at
) VALUES (
             3, 'ORDER', '[테스트 문의 013] 서비스 이용 관련 문의드립니다.',
             '테스트용 더미 문의 013번입니다. 로그인, 주문, 결제, 매장 이용 등 서비스 전반에 대한 문의 내용을 예시로 작성하였습니다.',
             'DONE', '문의 013번에 대한 답변입니다. 확인 후 추가 문의 사항이 있으시면 다시 문의해 주세요.', SYSDATE - 28, SYSDATE - 27
         );

INSERT INTO inquiry (
    member_id, category, title, content,
    status, answer_content, created_at, answered_at
) VALUES (
             4, 'ORDER', '[테스트 문의 014] 서비스 이용 관련 문의드립니다.',
             '테스트용 더미 문의 014번입니다. 로그인, 주문, 결제, 매장 이용 등 서비스 전반에 대한 문의 내용을 예시로 작성하였습니다.',
             'DONE', '문의 014번에 대한 답변입니다. 확인 후 추가 문의 사항이 있으시면 다시 문의해 주세요.', SYSDATE - 27, SYSDATE - 26
         );

INSERT INTO inquiry (
    member_id, category, title, content,
    status, answer_content, created_at, answered_at
) VALUES (
             5, 'ORDER', '[테스트 문의 015] 서비스 이용 관련 문의드립니다.',
             '테스트용 더미 문의 015번입니다. 로그인, 주문, 결제, 매장 이용 등 서비스 전반에 대한 문의 내용을 예시로 작성하였습니다.',
             'DONE', '문의 015번에 대한 답변입니다. 확인 후 추가 문의 사항이 있으시면 다시 문의해 주세요.', SYSDATE - 26, SYSDATE - 25
         );

INSERT INTO inquiry (
    member_id, category, title, content,
    status, answer_content, created_at, answered_at
) VALUES (
             1, 'ORDER', '[테스트 문의 016] 서비스 이용 관련 문의드립니다.',
             '테스트용 더미 문의 016번입니다. 로그인, 주문, 결제, 매장 이용 등 서비스 전반에 대한 문의 내용을 예시로 작성하였습니다.',
             'DONE', '문의 016번에 대한 답변입니다. 확인 후 추가 문의 사항이 있으시면 다시 문의해 주세요.', SYSDATE - 25, SYSDATE - 24
         );

INSERT INTO inquiry (
    member_id, category, title, content,
    status, answer_content, created_at, answered_at
) VALUES (
             2, 'ORDER', '[테스트 문의 017] 서비스 이용 관련 문의드립니다.',
             '테스트용 더미 문의 017번입니다. 로그인, 주문, 결제, 매장 이용 등 서비스 전반에 대한 문의 내용을 예시로 작성하였습니다.',
             'DONE', '문의 017번에 대한 답변입니다. 확인 후 추가 문의 사항이 있으시면 다시 문의해 주세요.', SYSDATE - 24, SYSDATE - 23
         );

INSERT INTO inquiry (
    member_id, category, title, content,
    status, answer_content, created_at, answered_at
) VALUES (
             3, 'ORDER', '[테스트 문의 018] 서비스 이용 관련 문의드립니다.',
             '테스트용 더미 문의 018번입니다. 로그인, 주문, 결제, 매장 이용 등 서비스 전반에 대한 문의 내용을 예시로 작성하였습니다.',
             'DONE', '문의 018번에 대한 답변입니다. 확인 후 추가 문의 사항이 있으시면 다시 문의해 주세요.', SYSDATE - 23, SYSDATE - 22
         );

INSERT INTO inquiry (
    member_id, category, title, content,
    status, answer_content, created_at, answered_at
) VALUES (
             4, 'ORDER', '[테스트 문의 019] 서비스 이용 관련 문의드립니다.',
             '테스트용 더미 문의 019번입니다. 로그인, 주문, 결제, 매장 이용 등 서비스 전반에 대한 문의 내용을 예시로 작성하였습니다.',
             'DONE', '문의 019번에 대한 답변입니다. 확인 후 추가 문의 사항이 있으시면 다시 문의해 주세요.', SYSDATE - 22, SYSDATE - 21
         );

INSERT INTO inquiry (
    member_id, category, title, content,
    status, answer_content, created_at, answered_at
) VALUES (
             5, 'ORDER', '[테스트 문의 020] 서비스 이용 관련 문의드립니다.',
             '테스트용 더미 문의 020번입니다. 로그인, 주문, 결제, 매장 이용 등 서비스 전반에 대한 문의 내용을 예시로 작성하였습니다.',
             'DONE', '문의 020번에 대한 답변입니다. 확인 후 추가 문의 사항이 있으시면 다시 문의해 주세요.', SYSDATE - 21, SYSDATE - 20
         );

INSERT INTO inquiry (
    member_id, category, title, content,
    status, answer_content, created_at, answered_at
) VALUES (
             1, 'PAYMENT', '[테스트 문의 021] 서비스 이용 관련 문의드립니다.',
             '테스트용 더미 문의 021번입니다. 로그인, 주문, 결제, 매장 이용 등 서비스 전반에 대한 문의 내용을 예시로 작성하였습니다.',
             'DONE', '문의 021번에 대한 답변입니다. 확인 후 추가 문의 사항이 있으시면 다시 문의해 주세요.', SYSDATE - 20, SYSDATE - 19
         );

INSERT INTO inquiry (
    member_id, category, title, content,
    status, answer_content, created_at, answered_at
) VALUES (
             2, 'PAYMENT', '[테스트 문의 022] 서비스 이용 관련 문의드립니다.',
             '테스트용 더미 문의 022번입니다. 로그인, 주문, 결제, 매장 이용 등 서비스 전반에 대한 문의 내용을 예시로 작성하였습니다.',
             'DONE', '문의 022번에 대한 답변입니다. 확인 후 추가 문의 사항이 있으시면 다시 문의해 주세요.', SYSDATE - 19, SYSDATE - 18
         );

INSERT INTO inquiry (
    member_id, category, title, content,
    status, answer_content, created_at, answered_at
) VALUES (
             3, 'PAYMENT', '[테스트 문의 023] 서비스 이용 관련 문의드립니다.',
             '테스트용 더미 문의 023번입니다. 로그인, 주문, 결제, 매장 이용 등 서비스 전반에 대한 문의 내용을 예시로 작성하였습니다.',
             'DONE', '문의 023번에 대한 답변입니다. 확인 후 추가 문의 사항이 있으시면 다시 문의해 주세요.', SYSDATE - 18, SYSDATE - 17
         );

INSERT INTO inquiry (
    member_id, category, title, content,
    status, answer_content, created_at, answered_at
) VALUES (
             4, 'PAYMENT', '[테스트 문의 024] 서비스 이용 관련 문의드립니다.',
             '테스트용 더미 문의 024번입니다. 로그인, 주문, 결제, 매장 이용 등 서비스 전반에 대한 문의 내용을 예시로 작성하였습니다.',
             'DONE', '문의 024번에 대한 답변입니다. 확인 후 추가 문의 사항이 있으시면 다시 문의해 주세요.', SYSDATE - 17, SYSDATE - 16
         );

INSERT INTO inquiry (
    member_id, category, title, content,
    status, answer_content, created_at, answered_at
) VALUES (
             5, 'PAYMENT', '[테스트 문의 025] 서비스 이용 관련 문의드립니다.',
             '테스트용 더미 문의 025번입니다. 로그인, 주문, 결제, 매장 이용 등 서비스 전반에 대한 문의 내용을 예시로 작성하였습니다.',
             'DONE', '문의 025번에 대한 답변입니다. 확인 후 추가 문의 사항이 있으시면 다시 문의해 주세요.', SYSDATE - 16, SYSDATE - 15
         );

-- 여기까지 1~25번: 답변 완료(DONE)

-- 26~50번: 답변 대기(WAIT), answer_content/answered_at NULL

INSERT INTO inquiry (
    member_id, category, title, content,
    status, answer_content, created_at, answered_at
) VALUES (
             1, 'PAYMENT', '[테스트 문의 026] 서비스 이용 관련 문의드립니다.',
             '테스트용 더미 문의 026번입니다. 로그인, 주문, 결제, 매장 이용 등 서비스 전반에 대한 문의 내용을 예시로 작성하였습니다.',
             'WAIT', NULL, SYSDATE - 5, NULL
         );

INSERT INTO inquiry (
    member_id, category, title, content,
    status, answer_content, created_at, answered_at
) VALUES (
             2, 'PAYMENT', '[테스트 문의 027] 서비스 이용 관련 문의드립니다.',
             '테스트용 더미 문의 027번입니다. 로그인, 주문, 결제, 매장 이용 등 서비스 전반에 대한 문의 내용을 예시로 작성하였습니다.',
             'WAIT', NULL, SYSDATE - 5, NULL
         );

INSERT INTO inquiry (
    member_id, category, title, content,
    status, answer_content, created_at, answered_at
) VALUES (
             3, 'PAYMENT', '[테스트 문의 028] 서비스 이용 관련 문의드립니다.',
             '테스트용 더미 문의 028번입니다. 로그인, 주문, 결제, 매장 이용 등 서비스 전반에 대한 문의 내용을 예시로 작성하였습니다.',
             'WAIT', NULL, SYSDATE - 5, NULL
         );

INSERT INTO inquiry (
    member_id, category, title, content,
    status, answer_content, created_at, answered_at
) VALUES (
             4, 'PAYMENT', '[테스트 문의 029] 서비스 이용 관련 문의드립니다.',
             '테스트용 더미 문의 029번입니다. 로그인, 주문, 결제, 매장 이용 등 서비스 전반에 대한 문의 내용을 예시로 작성하였습니다.',
             'WAIT', NULL, SYSDATE - 5, NULL
         );

INSERT INTO inquiry (
    member_id, category, title, content,
    status, answer_content, created_at, answered_at
) VALUES (
             5, 'PAYMENT', '[테스트 문의 030] 서비스 이용 관련 문의드립니다.',
             '테스트용 더미 문의 030번입니다. 로그인, 주문, 결제, 매장 이용 등 서비스 전반에 대한 문의 내용을 예시로 작성하였습니다.',
             'WAIT', NULL, SYSDATE - 5, NULL
         );

INSERT INTO inquiry (
    member_id, category, title, content,
    status, answer_content, created_at, answered_at
) VALUES (
             1, 'STORE', '[테스트 문의 031] 서비스 이용 관련 문의드립니다.',
             '테스트용 더미 문의 031번입니다. 로그인, 주문, 결제, 매장 이용 등 서비스 전반에 대한 문의 내용을 예시로 작성하였습니다.',
             'WAIT', NULL, SYSDATE - 5, NULL
         );

INSERT INTO inquiry (
    member_id, category, title, content,
    status, answer_content, created_at, answered_at
) VALUES (
             2, 'STORE', '[테스트 문의 032] 서비스 이용 관련 문의드립니다.',
             '테스트용 더미 문의 032번입니다. 로그인, 주문, 결제, 매장 이용 등 서비스 전반에 대한 문의 내용을 예시로 작성하였습니다.',
             'WAIT', NULL, SYSDATE - 5, NULL
         );

INSERT INTO inquiry (
    member_id, category, title, content,
    status, answer_content, created_at, answered_at
) VALUES (
             3, 'STORE', '[테스트 문의 033] 서비스 이용 관련 문의드립니다.',
             '테스트용 더미 문의 033번입니다. 로그인, 주문, 결제, 매장 이용 등 서비스 전반에 대한 문의 내용을 예시로 작성하였습니다.',
             'WAIT', NULL, SYSDATE - 5, NULL
         );

INSERT INTO inquiry (
    member_id, category, title, content,
    status, answer_content, created_at, answered_at
) VALUES (
             4, 'STORE', '[테스트 문의 034] 서비스 이용 관련 문의드립니다.',
             '테스트용 더미 문의 034번입니다. 로그인, 주문, 결제, 매장 이용 등 서비스 전반에 대한 문의 내용을 예시로 작성하였습니다.',
             'WAIT', NULL, SYSDATE - 5, NULL
         );

INSERT INTO inquiry (
    member_id, category, title, content,
    status, answer_content, created_at, answered_at
) VALUES (
             5, 'STORE', '[테스트 문의 035] 서비스 이용 관련 문의드립니다.',
             '테스트용 더미 문의 035번입니다. 로그인, 주문, 결제, 매장 이용 등 서비스 전반에 대한 문의 내용을 예시로 작성하였습니다.',
             'WAIT', NULL, SYSDATE - 5, NULL
         );

INSERT INTO inquiry (
    member_id, category, title, content,
    status, answer_content, created_at, answered_at
) VALUES (
             1, 'STORE', '[테스트 문의 036] 서비스 이용 관련 문의드립니다.',
             '테스트용 더미 문의 036번입니다. 로그인, 주문, 결제, 매장 이용 등 서비스 전반에 대한 문의 내용을 예시로 작성하였습니다.',
             'WAIT', NULL, SYSDATE - 5, NULL
         );

INSERT INTO inquiry (
    member_id, category, title, content,
    status, answer_content, created_at, answered_at
) VALUES (
             2, 'STORE', '[테스트 문의 037] 서비스 이용 관련 문의드립니다.',
             '테스트용 더미 문의 037번입니다. 로그인, 주문, 결제, 매장 이용 등 서비스 전반에 대한 문의 내용을 예시로 작성하였습니다.',
             'WAIT', NULL, SYSDATE - 5, NULL
         );

INSERT INTO inquiry (
    member_id, category, title, content,
    status, answer_content, created_at, answered_at
) VALUES (
             3, 'STORE', '[테스트 문의 038] 서비스 이용 관련 문의드립니다.',
             '테스트용 더미 문의 038번입니다. 로그인, 주문, 결제, 매장 이용 등 서비스 전반에 대한 문의 내용을 예시로 작성하였습니다.',
             'WAIT', NULL, SYSDATE - 5, NULL
         );

INSERT INTO inquiry (
    member_id, category, title, content,
    status, answer_content, created_at, answered_at
) VALUES (
             4, 'STORE', '[테스트 문의 039] 서비스 이용 관련 문의드립니다.',
             '테스트용 더미 문의 039번입니다. 로그인, 주문, 결제, 매장 이용 등 서비스 전반에 대한 문의 내용을 예시로 작성하였습니다.',
             'WAIT', NULL, SYSDATE - 5, NULL
         );

INSERT INTO inquiry (
    member_id, category, title, content,
    status, answer_content, created_at, answered_at
) VALUES (
             5, 'STORE', '[테스트 문의 040] 서비스 이용 관련 문의드립니다.',
             '테스트용 더미 문의 040번입니다. 로그인, 주문, 결제, 매장 이용 등 서비스 전반에 대한 문의 내용을 예시로 작성하였습니다.',
             'WAIT', NULL, SYSDATE - 5, NULL
         );

INSERT INTO inquiry (
    member_id, category, title, content,
    status, answer_content, created_at, answered_at
) VALUES (
             1, 'ETC', '[테스트 문의 041] 서비스 이용 관련 문의드립니다.',
             '테스트용 더미 문의 041번입니다. 로그인, 주문, 결제, 매장 이용 등 서비스 전반에 대한 문의 내용을 예시로 작성하였습니다.',
             'WAIT', NULL, SYSDATE - 5, NULL
         );

INSERT INTO inquiry (
    member_id, category, title, content,
    status, answer_content, created_at, answered_at
) VALUES (
             2, 'ETC', '[테스트 문의 042] 서비스 이용 관련 문의드립니다.',
             '테스트용 더미 문의 042번입니다. 로그인, 주문, 결제, 매장 이용 등 서비스 전반에 대한 문의 내용을 예시로 작성하였습니다.',
             'WAIT', NULL, SYSDATE - 5, NULL
         );

INSERT INTO inquiry (
    member_id, category, title, content,
    status, answer_content, created_at, answered_at
) VALUES (
             3, 'ETC', '[테스트 문의 043] 서비스 이용 관련 문의드립니다.',
             '테스트용 더미 문의 043번입니다. 로그인, 주문, 결제, 매장 이용 등 서비스 전반에 대한 문의 내용을 예시로 작성하였습니다.',
             'WAIT', NULL, SYSDATE - 5, NULL
         );

INSERT INTO inquiry (
    member_id, category, title, content,
    status, answer_content, created_at, answered_at
) VALUES (
             4, 'ETC', '[테스트 문의 044] 서비스 이용 관련 문의드립니다.',
             '테스트용 더미 문의 044번입니다. 로그인, 주문, 결제, 매장 이용 등 서비스 전반에 대한 문의 내용을 예시로 작성하였습니다.',
             'WAIT', NULL, SYSDATE - 5, NULL
         );

INSERT INTO inquiry (
    member_id, category, title, content,
    status, answer_content, created_at, answered_at
) VALUES (
             5, 'ETC', '[테스트 문의 045] 서비스 이용 관련 문의드립니다.',
             '테스트용 더미 문의 045번입니다. 로그인, 주문, 결제, 매장 이용 등 서비스 전반에 대한 문의 내용을 예시로 작성하였습니다.',
             'WAIT', NULL, SYSDATE - 5, NULL
         );

INSERT INTO inquiry (
    member_id, category, title, content,
    status, answer_content, created_at, answered_at
) VALUES (
             1, 'ETC', '[테스트 문의 046] 서비스 이용 관련 문의드립니다.',
             '테스트용 더미 문의 046번입니다. 로그인, 주문, 결제, 매장 이용 등 서비스 전반에 대한 문의 내용을 예시로 작성하였습니다.',
             'WAIT', NULL, SYSDATE - 5, NULL
         );

INSERT INTO inquiry (
    member_id, category, title, content,
    status, answer_content, created_at, answered_at
) VALUES (
             2, 'ETC', '[테스트 문의 047] 서비스 이용 관련 문의드립니다.',
             '테스트용 더미 문의 047번입니다. 로그인, 주문, 결제, 매장 이용 등 서비스 전반에 대한 문의 내용을 예시로 작성하였습니다.',
             'WAIT', NULL, SYSDATE - 5, NULL
         );

INSERT INTO inquiry (
    member_id, category, title, content,
    status, answer_content, created_at, answered_at
) VALUES (
             3, 'ETC', '[테스트 문의 048] 서비스 이용 관련 문의드립니다.',
             '테스트용 더미 문의 048번입니다. 로그인, 주문, 결제, 매장 이용 등 서비스 전반에 대한 문의 내용을 예시로 작성하였습니다.',
             'WAIT', NULL, SYSDATE - 5, NULL
         );

INSERT INTO inquiry (
    member_id, category, title, content,
    status, answer_content, created_at, answered_at
) VALUES (
             4, 'ETC', '[테스트 문의 049] 서비스 이용 관련 문의드립니다.',
             '테스트용 더미 문의 049번입니다. 로그인, 주문, 결제, 매장 이용 등 서비스 전반에 대한 문의 내용을 예시로 작성하였습니다.',
             'WAIT', NULL, SYSDATE - 5, NULL
         );

INSERT INTO inquiry (
    member_id, category, title, content,
    status, answer_content, created_at, answered_at
) VALUES (
             5, 'ETC', '[테스트 문의 050] 서비스 이용 관련 문의드립니다.',
             '테스트용 더미 문의 050번입니다. 로그인, 주문, 결제, 매장 이용 등 서비스 전반에 대한 문의 내용을 예시로 작성하였습니다.',
             'WAIT', NULL, SYSDATE - 5, NULL
         );

commit ;
INSERT INTO main_banner (
    banner_id, title, image_url,
    link_type, link_target_id, link_url,
    start_date, end_date,
    sort_order, active_yn
) VALUES (
             1,
             '굿즈로드 오픈 기념 메인 이벤트',
             'https://example.com/banner/main_open_event.jpg',
             'EVENT',
             1001,
             '/event/1001',
             SYSDATE - 7,
             SYSDATE + 7,
             1,
             'Y'
         );

INSERT INTO main_banner (
    banner_id, title, image_url,
    link_type, link_target_id, link_url,
    start_date, end_date,
    sort_order, active_yn
) VALUES (
             2,
             '홍대 한정 팝업스토어 안내',
             'https://example.com/banner/popup_hongdae.jpg',
             'POPUP',
             1,
             '/popup/1',
             SYSDATE - 3,
             SYSDATE + 10,
             2,
             'Y'
         );

INSERT INTO main_banner (
    banner_id, title, image_url,
    link_type, link_target_id, link_url,
    start_date, end_date,
    sort_order, active_yn
) VALUES (
             3,
             '주말 한정 럭키박스 타임세일',
             'https://example.com/banner/weekend_luckybox.jpg',
             'EVENT',
             1002,
             '/event/1002',
             SYSDATE - 1,
             SYSDATE + 2,
             3,
             'Y'
         );

INSERT INTO main_banner (
    banner_id, title, image_url,
    link_type, link_target_id, link_url,
    start_date, end_date,
    sort_order, active_yn
) VALUES (
             4,
             '굿즈 교환 · 나눔 가이드 확인하기',
             'https://example.com/banner/trade_guide.jpg',
             'URL',
             NULL,
             '/guide/trade',
             SYSDATE - 30,
             SYSDATE + 365,
             4,
             'Y'
         );

INSERT INTO main_banner (
    banner_id, title, image_url,
    link_type, link_target_id, link_url,
    start_date, end_date,
    sort_order, active_yn
) VALUES (
             5,
             '신규 회원 가입 시 웰컴 쿠폰 지급',
             'https://example.com/banner/welcome_coupon.jpg',
             'EVENT',
             1003,
             '/event/1003',
             SYSDATE - 10,
             SYSDATE + 20,
             5,
             'Y'
         );

INSERT INTO main_banner (
    banner_id, title, image_url,
    link_type, link_target_id, link_url,
    start_date, end_date,
    sort_order, active_yn
) VALUES (
             6,
             '포인트 2배 적립 프로모션',
             'https://example.com/banner/point_x2.jpg',
             'EVENT',
             1004,
             '/event/1004',
             SYSDATE - 5,
             SYSDATE + 5,
             6,
             'Y'
         );

INSERT INTO main_banner (
    banner_id, title, image_url,
    link_type, link_target_id, link_url,
    start_date, end_date,
    sort_order, active_yn
) VALUES (
             7,
             '굿즈로드 앱 다운로드 안내',
             'https://example.com/banner/app_download.jpg',
             'URL',
             NULL,
             'https://example.com/app',
             SYSDATE - 60,
             SYSDATE + 365,
             7,
             'Y'
         );

INSERT INTO main_banner (
    banner_id, title, image_url,
    link_type, link_target_id, link_url,
    start_date, end_date,
    sort_order, active_yn
) VALUES (
             8,
             '지난 시즌 한정 굿즈 아카이브',
             'https://example.com/banner/archive_season1.jpg',
             'URL',
             NULL,
             '/archive/season1',
             SYSDATE - 90,
             SYSDATE - 1,
             8,
             'N'
         );

INSERT INTO main_banner (
    banner_id, title, image_url,
    link_type, link_target_id, link_url,
    start_date, end_date,
    sort_order, active_yn
) VALUES (
             9,
             '다음 주 오픈 예정 신규 팝업 선공개',
             'https://example.com/banner/upcoming_popup.jpg',
             'POPUP',
             2,
             '/popup/2',
             SYSDATE + 3,
             SYSDATE + 20,
             9,
             'Y'
         );

INSERT INTO main_banner (
    banner_id, title, image_url,
    link_type, link_target_id, link_url,
    start_date, end_date,
    sort_order, active_yn
) VALUES (
             10,
             '자주 묻는 질문(FAQ) 바로가기',
             'https://example.com/banner/faq_shortcut.jpg',
             'URL',
             NULL,
             '/faq',
             SYSDATE - 15,
             SYSDATE + 365,
             10,
             'Y'
         );
INSERT INTO member_notification_setting (
    member_id, comment_yn, like_yn, trade_yn, event_yn, created_at, updated_at
) VALUES (1,  'Y', 'Y', 'Y', 'Y', SYSDATE - 10, SYSDATE - 1);

INSERT INTO member_notification_setting (
    member_id, comment_yn, like_yn, trade_yn, event_yn, created_at, updated_at
) VALUES (2,  'Y', 'Y', 'Y', 'Y', SYSDATE - 10, SYSDATE - 1);

INSERT INTO member_notification_setting (
    member_id, comment_yn, like_yn, trade_yn, event_yn, created_at, updated_at
) VALUES (3,  'Y', 'Y', 'Y', 'Y', SYSDATE - 10, SYSDATE - 1);

INSERT INTO member_notification_setting (
    member_id, comment_yn, like_yn, trade_yn, event_yn, created_at, updated_at
) VALUES (4,  'Y', 'Y', 'Y', 'Y', SYSDATE - 10, SYSDATE - 1);

INSERT INTO member_notification_setting (
    member_id, comment_yn, like_yn, trade_yn, event_yn, created_at, updated_at
) VALUES (5,  'Y', 'Y', 'Y', 'Y', SYSDATE - 10, SYSDATE - 1);

INSERT INTO member_notification_setting (
    member_id, comment_yn, like_yn, trade_yn, event_yn, created_at, updated_at
) VALUES (6,  'Y', 'Y', 'Y', 'Y', SYSDATE - 10, SYSDATE - 1);

INSERT INTO member_notification_setting (
    member_id, comment_yn, like_yn, trade_yn, event_yn, created_at, updated_at
) VALUES (7,  'Y', 'Y', 'Y', 'Y', SYSDATE - 10, SYSDATE - 1);

INSERT INTO member_notification_setting (
    member_id, comment_yn, like_yn, trade_yn, event_yn, created_at, updated_at
) VALUES (8,  'Y', 'Y', 'Y', 'Y', SYSDATE - 10, SYSDATE - 1);

INSERT INTO member_notification_setting (
    member_id, comment_yn, like_yn, trade_yn, event_yn, created_at, updated_at
) VALUES (9,  'Y', 'Y', 'Y', 'Y', SYSDATE - 10, SYSDATE - 1);

INSERT INTO member_notification_setting (
    member_id, comment_yn, like_yn, trade_yn, event_yn, created_at, updated_at
) VALUES (10, 'Y', 'Y', 'Y', 'Y', SYSDATE - 10, SYSDATE - 1);

-- 11 ~ 20
INSERT INTO member_notification_setting (
    member_id, comment_yn, like_yn, trade_yn, event_yn, created_at, updated_at
) VALUES (11, 'Y', 'Y', 'Y', 'Y', SYSDATE - 9, SYSDATE - 1);

INSERT INTO member_notification_setting (
    member_id, comment_yn, like_yn, trade_yn, event_yn, created_at, updated_at
) VALUES (12, 'Y', 'Y', 'Y', 'Y', SYSDATE - 9, SYSDATE - 1);

INSERT INTO member_notification_setting (
    member_id, comment_yn, like_yn, trade_yn, event_yn, created_at, updated_at
) VALUES (13, 'Y', 'Y', 'Y', 'Y', SYSDATE - 9, SYSDATE - 1);

INSERT INTO member_notification_setting (
    member_id, comment_yn, like_yn, trade_yn, event_yn, created_at, updated_at
) VALUES (14, 'Y', 'Y', 'Y', 'Y', SYSDATE - 9, SYSDATE - 1);

INSERT INTO member_notification_setting (
    member_id, comment_yn, like_yn, trade_yn, event_yn, created_at, updated_at
) VALUES (15, 'Y', 'Y', 'Y', 'Y', SYSDATE - 9, SYSDATE - 1);

INSERT INTO member_notification_setting (
    member_id, comment_yn, like_yn, trade_yn, event_yn, created_at, updated_at
) VALUES (16, 'Y', 'Y', 'Y', 'Y', SYSDATE - 9, SYSDATE - 1);

INSERT INTO member_notification_setting (
    member_id, comment_yn, like_yn, trade_yn, event_yn, created_at, updated_at
) VALUES (17, 'Y', 'Y', 'Y', 'Y', SYSDATE - 9, SYSDATE - 1);

INSERT INTO member_notification_setting (
    member_id, comment_yn, like_yn, trade_yn, event_yn, created_at, updated_at
) VALUES (18, 'Y', 'Y', 'Y', 'Y', SYSDATE - 9, SYSDATE - 1);

INSERT INTO member_notification_setting (
    member_id, comment_yn, like_yn, trade_yn, event_yn, created_at, updated_at
) VALUES (19, 'Y', 'Y', 'Y', 'Y', SYSDATE - 9, SYSDATE - 1);

INSERT INTO member_notification_setting (
    member_id, comment_yn, like_yn, trade_yn, event_yn, created_at, updated_at
) VALUES (20, 'Y', 'Y', 'Y', 'Y', SYSDATE - 9, SYSDATE - 1);

-- 21 ~ 30
INSERT INTO member_notification_setting (
    member_id, comment_yn, like_yn, trade_yn, event_yn, created_at, updated_at
) VALUES (21, 'Y', 'Y', 'Y', 'Y', SYSDATE - 8, SYSDATE - 1);

INSERT INTO member_notification_setting (
    member_id, comment_yn, like_yn, trade_yn, event_yn, created_at, updated_at
) VALUES (22, 'Y', 'Y', 'Y', 'Y', SYSDATE - 8, SYSDATE - 1);

INSERT INTO member_notification_setting (
    member_id, comment_yn, like_yn, trade_yn, event_yn, created_at, updated_at
) VALUES (23, 'Y', 'Y', 'Y', 'Y', SYSDATE - 8, SYSDATE - 1);

INSERT INTO member_notification_setting (
    member_id, comment_yn, like_yn, trade_yn, event_yn, created_at, updated_at
) VALUES (24, 'Y', 'Y', 'Y', 'Y', SYSDATE - 8, SYSDATE - 1);

INSERT INTO member_notification_setting (
    member_id, comment_yn, like_yn, trade_yn, event_yn, created_at, updated_at
) VALUES (25, 'Y', 'Y', 'Y', 'Y', SYSDATE - 8, SYSDATE - 1);

INSERT INTO member_notification_setting (
    member_id, comment_yn, like_yn, trade_yn, event_yn, created_at, updated_at
) VALUES (26, 'Y', 'Y', 'Y', 'Y', SYSDATE - 8, SYSDATE - 1);

INSERT INTO member_notification_setting (
    member_id, comment_yn, like_yn, trade_yn, event_yn, created_at, updated_at
) VALUES (27, 'Y', 'Y', 'Y', 'Y', SYSDATE - 8, SYSDATE - 1);

INSERT INTO member_notification_setting (
    member_id, comment_yn, like_yn, trade_yn, event_yn, created_at, updated_at
) VALUES (28, 'Y', 'Y', 'Y', 'Y', SYSDATE - 8, SYSDATE - 1);

INSERT INTO member_notification_setting (
    member_id, comment_yn, like_yn, trade_yn, event_yn, created_at, updated_at
) VALUES (29, 'Y', 'Y', 'Y', 'Y', SYSDATE - 8, SYSDATE - 1);

INSERT INTO member_notification_setting (
    member_id, comment_yn, like_yn, trade_yn, event_yn, created_at, updated_at
) VALUES (30, 'Y', 'Y', 'Y', 'Y', SYSDATE - 8, SYSDATE - 1);

-- 31 ~ 40
INSERT INTO member_notification_setting (
    member_id, comment_yn, like_yn, trade_yn, event_yn, created_at, updated_at
) VALUES (31, 'Y', 'Y', 'Y', 'Y', SYSDATE - 7, SYSDATE - 1);

INSERT INTO member_notification_setting (
    member_id, comment_yn, like_yn, trade_yn, event_yn, created_at, updated_at
) VALUES (32, 'Y', 'Y', 'Y', 'Y', SYSDATE - 7, SYSDATE - 1);

INSERT INTO member_notification_setting (
    member_id, comment_yn, like_yn, trade_yn, event_yn, created_at, updated_at
) VALUES (33, 'Y', 'Y', 'Y', 'Y', SYSDATE - 7, SYSDATE - 1);

INSERT INTO member_notification_setting (
    member_id, comment_yn, like_yn, trade_yn, event_yn, created_at, updated_at
) VALUES (34, 'Y', 'Y', 'Y', 'Y', SYSDATE - 7, SYSDATE - 1);

INSERT INTO member_notification_setting (
    member_id, comment_yn, like_yn, trade_yn, event_yn, created_at, updated_at
) VALUES (35, 'Y', 'Y', 'Y', 'Y', SYSDATE - 7, SYSDATE - 1);

INSERT INTO member_notification_setting (
    member_id, comment_yn, like_yn, trade_yn, event_yn, created_at, updated_at
) VALUES (36, 'Y', 'Y', 'Y', 'Y', SYSDATE - 7, SYSDATE - 1);

INSERT INTO member_notification_setting (
    member_id, comment_yn, like_yn, trade_yn, event_yn, created_at, updated_at
) VALUES (37, 'Y', 'Y', 'Y', 'Y', SYSDATE - 7, SYSDATE - 1);

INSERT INTO member_notification_setting (
    member_id, comment_yn, like_yn, trade_yn, event_yn, created_at, updated_at
) VALUES (38, 'Y', 'Y', 'Y', 'Y', SYSDATE - 7, SYSDATE - 1);

INSERT INTO member_notification_setting (
    member_id, comment_yn, like_yn, trade_yn, event_yn, created_at, updated_at
) VALUES (39, 'Y', 'Y', 'Y', 'Y', SYSDATE - 7, SYSDATE - 1);

INSERT INTO member_notification_setting (
    member_id, comment_yn, like_yn, trade_yn, event_yn, created_at, updated_at
) VALUES (40, 'Y', 'Y', 'Y', 'Y', SYSDATE - 7, SYSDATE - 1);
commit ;
INSERT INTO notification (
     member_id, notif_type, message,
    link_type, link_target_id, read_yn, created_at
) VALUES (
              1, 'COMMENT',
             '회원님의 게시글에 새로운 댓글이 달렸습니다.',
             'POST', 1, 'N', SYSDATE - 5
         );

INSERT INTO notification (
     member_id, notif_type, message,
    link_type, link_target_id, read_yn, created_at
) VALUES (
              2, 'COMMENT',
             '작성하신 리뷰에 답글이 등록되었습니다.',
             'POST', 2, 'N', SYSDATE - 5
         );

INSERT INTO notification (
     member_id, notif_type, message,
    link_type, link_target_id, read_yn, created_at
) VALUES (
              3, 'COMMENT',
             '회원님의 게시글에 새로운 대댓글이 달렸습니다.',
             'POST', 3, 'Y', SYSDATE - 4
         );

INSERT INTO notification (
     member_id, notif_type, message,
    link_type, link_target_id, read_yn, created_at
) VALUES (
              4, 'COMMENT',
             '관심 등록한 팝업 후기에 새 댓글이 추가되었습니다.',
             'POST', 4, 'N', SYSDATE - 4
         );

INSERT INTO notification (
     member_id, notif_type, message,
    link_type, link_target_id, read_yn, created_at
) VALUES (
              5, 'COMMENT',
             '작성하신 거래 후기 글에 댓글이 달렸습니다.',
             'POST', 5, 'Y', SYSDATE - 3
         );

-- LIKE 알림
INSERT INTO notification (
     member_id, notif_type, message,
    link_type, link_target_id, read_yn, created_at
) VALUES (
              1, 'LIKE',
             '회원님의 게시글을 5명이 좋아합니다.',
             'POST', 1, 'N', SYSDATE - 3
         );

INSERT INTO notification (
     member_id, notif_type, message,
    link_type, link_target_id, read_yn, created_at
) VALUES (
              2, 'LIKE',
             '작성하신 리뷰에 새로운 좋아요가 추가되었습니다.',
             'POST', 6, 'Y', SYSDATE - 3
         );

INSERT INTO notification (
     member_id, notif_type, message,
    link_type, link_target_id, read_yn, created_at
) VALUES (
              3, 'LIKE',
             '북마크한 팝업 후기 글에 좋아요 10개가 달렸습니다.',
             'POST', 7, 'N', SYSDATE - 2
         );

INSERT INTO notification (
     member_id, notif_type, message,
    link_type, link_target_id, read_yn, created_at
) VALUES (
              4, 'LIKE',
             '회원님의 댓글을 다른 사용자가 좋아합니다.',
             'POST', 8, 'Y', SYSDATE - 2
         );

INSERT INTO notification (
     member_id, notif_type, message,
    link_type, link_target_id, read_yn, created_at
) VALUES (
              5, 'LIKE',
             '작성하신 거래 글이 인기 글로 선정되었습니다.',
             'POST', 9, 'N', SYSDATE - 2
         );

-- TRADE 알림
INSERT INTO notification (
     member_id, notif_type, message,
    link_type, link_target_id, read_yn, created_at
) VALUES (
              6, 'TRADE',
             '등록하신 거래 글에 새로운 신청이 도착했습니다.',
             'TRADE', 101, 'N', SYSDATE - 1
         );

INSERT INTO notification (
     member_id, notif_type, message,
    link_type, link_target_id, read_yn, created_at
) VALUES (
              7, 'TRADE',
             '상대방이 거래 요청을 수락했습니다.',
             'TRADE', 102, 'Y', SYSDATE - 1
         );

INSERT INTO notification (
     member_id, notif_type, message,
    link_type, link_target_id, read_yn, created_at
) VALUES (
              8, 'TRADE',
             '거래가 완료 상태로 변경되었습니다. 후기를 남겨보세요.',
             'TRADE', 103, 'N', SYSDATE
         );

INSERT INTO notification (
     member_id, notif_type, message,
    link_type, link_target_id, read_yn, created_at
) VALUES (
              9, 'TRADE',
             '거래 일정이 오늘로 예정되어 있습니다. 약속 시간을 다시 한 번 확인해 주세요.',
             'TRADE', 104, 'N', SYSDATE
         );

-- EVENT / POPUP / STORE 알림
INSERT INTO notification (
     member_id, notif_type, message,
    link_type, link_target_id, read_yn, created_at
) VALUES (
              10, 'EVENT',
             '관심 등록한 팝업스토어의 오픈 D-1입니다.',
             'POPUP', 1, 'N', SYSDATE - 1
         );

INSERT INTO notification (
     member_id, notif_type, message,
    link_type, link_target_id, read_yn, created_at
) VALUES (
              1, 'EVENT',
             '한정 굿즈 증정 이벤트가 곧 마감됩니다. 지금 참여해 보세요.',
             'EVENT', 2001, 'Y', SYSDATE - 1
         );

INSERT INTO notification (
     member_id, notif_type, message,
    link_type, link_target_id, read_yn, created_at
) VALUES (
              2, 'EVENT',
             '지난 이벤트에 당첨되셨습니다. 마이페이지에서 당첨 내역을 확인해 주세요.',
             'EVENT', 2002, 'N', SYSDATE
         );

INSERT INTO notification (
     member_id, notif_type, message,
    link_type, link_target_id, read_yn, created_at
) VALUES (
              3, 'EVENT',
             '오늘 방문 시 사용 가능한 전용 쿠폰이 발급되었습니다.',
             'EVENT', 2003, 'N', SYSDATE
         );

INSERT INTO notification (
     member_id, notif_type, message,
    link_type, link_target_id, read_yn, created_at
) VALUES (
              4, 'STORE',
             '즐겨찾기한 매장에 신규 굿즈가 입고되었습니다.',
             'STORE', 10, 'N', SYSDATE
         );

INSERT INTO notification (
     member_id, notif_type, message,
    link_type, link_target_id, read_yn, created_at
) VALUES (
              5, 'STORE',
             '즐겨찾기한 매장의 영업 시간이 오늘만 단축 운영됩니다.',
             'STORE', 11, 'Y', SYSDATE
         );
INSERT INTO popup_bookmark (member_id, popup_id, created_at)
VALUES (1, 1, SYSDATE - 10);

INSERT INTO popup_bookmark (member_id, popup_id, created_at)
VALUES (1, 2, SYSDATE - 9);

INSERT INTO popup_bookmark (member_id, popup_id, created_at)
VALUES (2, 1, SYSDATE - 8);

INSERT INTO popup_bookmark (member_id, popup_id, created_at)
VALUES (2, 3, SYSDATE - 7);

INSERT INTO popup_bookmark (member_id, popup_id, created_at)
VALUES (3, 2, SYSDATE - 6);

INSERT INTO popup_bookmark (member_id, popup_id, created_at)
VALUES (3, 4, SYSDATE - 5);

INSERT INTO popup_bookmark (member_id, popup_id, created_at)
VALUES (4, 3, SYSDATE - 4);

INSERT INTO recommended_search(keyword,target_type,sort_order,active_yn) VALUES('홍대 팝업스토어','STORE',1,'Y');
INSERT INTO recommended_search(keyword,target_type,sort_order,active_yn) VALUES('강남 아이돌 굿즈','STORE',2,'Y');
INSERT INTO recommended_search(keyword,target_type,sort_order,active_yn) VALUES('포토카드 랜덤팩','GOODS',3,'Y');
INSERT INTO recommended_search(keyword,target_type,sort_order,active_yn) VALUES('피규어 한정판','GOODS',4,'Y');
INSERT INTO recommended_search(keyword,target_type,sort_order,active_yn) VALUES('팝업 굿즈 교환','GOODS',5,'Y');
INSERT INTO recommended_search(keyword,target_type,sort_order,active_yn) VALUES('카페 콜라보','STORE',6,'Y');
INSERT INTO recommended_search(keyword,target_type,sort_order,active_yn) VALUES('애니메이션 굿즈','GOODS',7,'Y');
INSERT INTO recommended_search(keyword,target_type,sort_order,active_yn) VALUES('게임 한정 굿즈','GOODS',8,'Y');
INSERT INTO recommended_search(keyword,target_type,sort_order,active_yn) VALUES('응원봉','GOODS',9,'Y');
INSERT INTO recommended_search(keyword,target_type,sort_order,active_yn) VALUES('랜덤박스','GOODS',10,'Y');
INSERT INTO recommended_search(keyword,target_type,sort_order,active_yn) VALUES('팝업 일정','STORE',11,'Y');
INSERT INTO recommended_search(keyword,target_type,sort_order,active_yn) VALUES('굿즈로드 신규 매장','STORE',12,'Y');
INSERT INTO recommended_search(keyword,target_type,sort_order,active_yn) VALUES('중고 굿즈 거래','GOODS',13,'Y');
INSERT INTO recommended_search(keyword,target_type,sort_order,active_yn) VALUES('특전 포카','GOODS',14,'Y');
INSERT INTO recommended_search(keyword,target_type,sort_order,active_yn) VALUES('아이돌 팬사인회 굿즈','GOODS',15,'Y');
INSERT INTO recommended_search(keyword,target_type,sort_order,active_yn) VALUES('서울 팝업 지도','STORE',16,'Y');
INSERT INTO recommended_search(keyword,target_type,sort_order,active_yn) VALUES('브랜드 콜라보 팝업','STORE',17,'Y');
INSERT INTO recommended_search(keyword,target_type,sort_order,active_yn) VALUES('코스프레 소품','GOODS',18,'Y');
INSERT INTO recommended_search(keyword,target_type,sort_order,active_yn) VALUES('지난 시즌 굿즈','GOODS',19,'N');
INSERT INTO recommended_search(keyword,target_type,sort_order,active_yn) VALUES('품절 임박 굿즈','GOODS',20,'Y');
--
INSERT INTO search_log (member_id, keyword, target_type, target_id, created_at)
VALUES (1, '홍대 팝업스토어 검색 001', 'STORE', 1, SYSDATE - 50);

INSERT INTO search_log (member_id, keyword, target_type, target_id, created_at)
VALUES (2, '강남 팝업스토어 검색 002', 'GOODS', 2, SYSDATE - 50);

INSERT INTO search_log (member_id, keyword, target_type, target_id, created_at)
VALUES (3, '신촌 굿즈샵 검색 003', 'POST', 3, SYSDATE - 49);

INSERT INTO search_log (member_id, keyword, target_type, target_id, created_at)
VALUES (4, '부산 애니 굿즈샵 004', 'STORE', 4, SYSDATE - 49);

INSERT INTO search_log (member_id, keyword, target_type, target_id, created_at)
VALUES (5, '서울 팝업 일정 005', 'GOODS', 5, SYSDATE - 48);

INSERT INTO search_log (member_id, keyword, target_type, target_id, created_at)
VALUES (6, '홍대 팝업스토어 검색 006', 'POST', 6, SYSDATE - 48);

INSERT INTO search_log (member_id, keyword, target_type, target_id, created_at)
VALUES (7, '강남 팝업스토어 검색 007', 'STORE', 7, SYSDATE - 47);

INSERT INTO search_log (member_id, keyword, target_type, target_id, created_at)
VALUES (8, '신촌 굿즈샵 검색 008', 'GOODS', 8, SYSDATE - 47);

INSERT INTO search_log (member_id, keyword, target_type, target_id, created_at)
VALUES (9, '부산 애니 굿즈샵 009', 'POST', 9, SYSDATE - 46);

INSERT INTO search_log (member_id, keyword, target_type, target_id, created_at)
VALUES (10, '서울 팝업 일정 010', 'STORE', 10, SYSDATE - 46);

INSERT INTO search_log (member_id, keyword, target_type, target_id, created_at)
VALUES (1, '홍대 팝업스토어 검색 011', 'GOODS', 11, SYSDATE - 45);

INSERT INTO search_log (member_id, keyword, target_type, target_id, created_at)
VALUES (2, '강남 팝업스토어 검색 012', 'POST', 12, SYSDATE - 45);

INSERT INTO search_log (member_id, keyword, target_type, target_id, created_at)
VALUES (3, '신촌 굿즈샵 검색 013', 'STORE', 13, SYSDATE - 44);

INSERT INTO search_log (member_id, keyword, target_type, target_id, created_at)
VALUES (4, '부산 애니 굿즈샵 014', 'GOODS', 14, SYSDATE - 44);

INSERT INTO search_log (member_id, keyword, target_type, target_id, created_at)
VALUES (5, '서울 팝업 일정 015', 'POST', 15, SYSDATE - 43);

INSERT INTO search_log (member_id, keyword, target_type, target_id, created_at)
VALUES (6, '홍대 팝업스토어 검색 016', 'STORE', 16, SYSDATE - 43);

INSERT INTO search_log (member_id, keyword, target_type, target_id, created_at)
VALUES (7, '강남 팝업스토어 검색 017', 'GOODS', 17, SYSDATE - 42);

INSERT INTO search_log (member_id, keyword, target_type, target_id, created_at)
VALUES (8, '신촌 굿즈샵 검색 018', 'POST', 18, SYSDATE - 42);

INSERT INTO search_log (member_id, keyword, target_type, target_id, created_at)
VALUES (9, '부산 애니 굿즈샵 019', 'STORE', 19, SYSDATE - 41);

INSERT INTO search_log (member_id, keyword, target_type, target_id, created_at)
VALUES (10, '서울 팝업 일정 020', 'GOODS', 20, SYSDATE - 41);

INSERT INTO search_log (member_id, keyword, target_type, target_id, created_at)
VALUES (1, '홍대 팝업스토어 검색 021', 'POST', 1, SYSDATE - 40);

INSERT INTO search_log (member_id, keyword, target_type, target_id, created_at)
VALUES (2, '강남 팝업스토어 검색 022', 'STORE', 2, SYSDATE - 40);

INSERT INTO search_log (member_id, keyword, target_type, target_id, created_at)
VALUES (3, '신촌 굿즈샵 검색 023', 'GOODS', 3, SYSDATE - 39);

INSERT INTO search_log (member_id, keyword, target_type, target_id, created_at)
VALUES (4, '부산 애니 굿즈샵 024', 'POST', 4, SYSDATE - 39);

INSERT INTO search_log (member_id, keyword, target_type, target_id, created_at)
VALUES (5, '서울 팝업 일정 025', 'STORE', 5, SYSDATE - 38);

INSERT INTO search_log (member_id, keyword, target_type, target_id, created_at)
VALUES (6, '홍대 팝업스토어 검색 026', 'GOODS', 6, SYSDATE - 38);

INSERT INTO search_log (member_id, keyword, target_type, target_id, created_at)
VALUES (7, '강남 팝업스토어 검색 027', 'POST', 7, SYSDATE - 37);

INSERT INTO search_log (member_id, keyword, target_type, target_id, created_at)
VALUES (8, '신촌 굿즈샵 검색 028', 'STORE', 8, SYSDATE - 37);

INSERT INTO search_log (member_id, keyword, target_type, target_id, created_at)
VALUES (9, '부산 애니 굿즈샵 029', 'GOODS', 9, SYSDATE - 36);

INSERT INTO search_log (member_id, keyword, target_type, target_id, created_at)
VALUES (10, '서울 팝업 일정 030', 'POST', 10, SYSDATE - 36);

INSERT INTO search_log (member_id, keyword, target_type, target_id, created_at)
VALUES (1, '홍대 팝업스토어 검색 031', 'STORE', 11, SYSDATE - 35);

INSERT INTO search_log (member_id, keyword, target_type, target_id, created_at)
VALUES (2, '강남 팝업스토어 검색 032', 'GOODS', 12, SYSDATE - 35);

INSERT INTO search_log (member_id, keyword, target_type, target_id, created_at)
VALUES (3, '신촌 굿즈샵 검색 033', 'POST', 13, SYSDATE - 34);

INSERT INTO search_log (member_id, keyword, target_type, target_id, created_at)
VALUES (4, '부산 애니 굿즈샵 034', 'STORE', 14, SYSDATE - 34);

INSERT INTO search_log (member_id, keyword, target_type, target_id, created_at)
VALUES (5, '서울 팝업 일정 035', 'GOODS', 15, SYSDATE - 33);

INSERT INTO search_log (member_id, keyword, target_type, target_id, created_at)
VALUES (6, '홍대 팝업스토어 검색 036', 'POST', 16, SYSDATE - 33);

INSERT INTO search_log (member_id, keyword, target_type, target_id, created_at)
VALUES (7, '강남 팝업스토어 검색 037', 'STORE', 17, SYSDATE - 32);

INSERT INTO search_log (member_id, keyword, target_type, target_id, created_at)
VALUES (8, '신촌 굿즈샵 검색 038', 'GOODS', 18, SYSDATE - 32);

INSERT INTO search_log (member_id, keyword, target_type, target_id, created_at)

VALUES (9, '부산 애니 굿즈샵 039', 'POST', 19, SYSDATE - 31);

INSERT INTO search_log (member_id, keyword, target_type, target_id, created_at)
VALUES (10, '서울 팝업 일정 040', 'STORE', 20, SYSDATE - 31);

INSERT INTO search_log (member_id, keyword, target_type, target_id, created_at)
VALUES (1, '홍대 팝업스토어 검색 041', 'GOODS', 1, SYSDATE - 30);

INSERT INTO search_log (member_id, keyword, target_type, target_id, created_at)
VALUES (2, '강남 팝업스토어 검색 042', 'POST', 2, SYSDATE - 30);

INSERT INTO search_log (member_id, keyword, target_type, target_id, created_at)
VALUES (3, '신촌 굿즈샵 검색 043', 'STORE', 3, SYSDATE - 29);

INSERT INTO search_log (member_id, keyword, target_type, target_id, created_at)
VALUES (4, '부산 애니 굿즈샵 044', 'GOODS', 4, SYSDATE - 29);

INSERT INTO search_log (member_id, keyword, target_type, target_id, created_at)
VALUES (5, '서울 팝업 일정 045', 'POST', 5, SYSDATE - 28);

INSERT INTO search_log (member_id, keyword, target_type, target_id, created_at)
VALUES (6, '홍대 팝업스토어 검색 046', 'STORE', 6, SYSDATE - 28);

INSERT INTO search_log (member_id, keyword, target_type, target_id, created_at)
VALUES (7, '강남 팝업스토어 검색 047', 'GOODS', 7, SYSDATE - 27);

INSERT INTO search_log (member_id, keyword, target_type, target_id, created_at)
VALUES (8, '신촌 굿즈샵 검색 048', 'POST', 8, SYSDATE - 27);

INSERT INTO search_log (member_id, keyword, target_type, target_id, created_at)
VALUES (9, '부산 애니 굿즈샵 049', 'STORE', 9, SYSDATE - 26);

INSERT INTO search_log (member_id, keyword, target_type, target_id, created_at)
VALUES (10, '서울 팝업 일정 050', 'GOODS', 10, SYSDATE - 26);

INSERT INTO search_log (member_id, keyword, target_type, target_id, created_at)
VALUES (1, '홍대 팝업스토어 검색 051', 'POST', 11, SYSDATE - 25);

INSERT INTO search_log (member_id, keyword, target_type, target_id, created_at)
VALUES (2, '강남 팝업스토어 검색 052', 'STORE', 12, SYSDATE - 25);

INSERT INTO search_log (member_id, keyword, target_type, target_id, created_at)
VALUES (3, '신촌 굿즈샵 검색 053', 'GOODS', 13, SYSDATE - 24);

INSERT INTO search_log (member_id, keyword, target_type, target_id, created_at)
VALUES (4, '부산 애니 굿즈샵 054', 'POST', 14, SYSDATE - 24);

INSERT INTO search_log (member_id, keyword, target_type, target_id, created_at)
VALUES (5, '서울 팝업 일정 055', 'STORE', 15, SYSDATE - 23);

INSERT INTO search_log (member_id, keyword, target_type, target_id, created_at)
VALUES (6, '홍대 팝업스토어 검색 056', 'GOODS', 16, SYSDATE - 23);

INSERT INTO search_log (member_id, keyword, target_type, target_id, created_at)
VALUES (7, '강남 팝업스토어 검색 057', 'POST', 17, SYSDATE - 22);

INSERT INTO search_log (member_id, keyword, target_type, target_id, created_at)
VALUES (8, '신촌 굿즈샵 검색 058', 'STORE', 18, SYSDATE - 22);

INSERT INTO search_log (member_id, keyword, target_type, target_id, created_at)
VALUES (9, '부산 애니 굿즈샵 059', 'GOODS', 19, SYSDATE - 21);

INSERT INTO search_log (member_id, keyword, target_type, target_id, created_at)
VALUES (10, '서울 팝업 일정 060', 'POST', 20, SYSDATE - 21);

INSERT INTO search_log (member_id, keyword, target_type, target_id, created_at)
VALUES (1, '홍대 팝업스토어 검색 061', 'STORE', 1, SYSDATE - 20);

INSERT INTO search_log (member_id, keyword, target_type, target_id, created_at)
VALUES (2, '강남 팝업스토어 검색 062', 'GOODS', 2, SYSDATE - 20);

INSERT INTO search_log (member_id, keyword, target_type, target_id, created_at)
VALUES (3, '신촌 굿즈샵 검색 063', 'POST', 3, SYSDATE - 19);

INSERT INTO search_log (member_id, keyword, target_type, target_id, created_at)
VALUES (4, '부산 애니 굿즈샵 064', 'STORE', 4, SYSDATE - 19);

INSERT INTO search_log (member_id, keyword, target_type, target_id, created_at)
VALUES (5, '서울 팝업 일정 065', 'GOODS', 5, SYSDATE - 18);

INSERT INTO search_log (member_id, keyword, target_type, target_id, created_at)
VALUES (6, '홍대 팝업스토어 검색 066', 'POST', 6, SYSDATE - 18);

INSERT INTO search_log (member_id, keyword, target_type, target_id, created_at)
VALUES (7, '강남 팝업스토어 검색 067', 'STORE', 7, SYSDATE - 17);

INSERT INTO search_log (member_id, keyword, target_type, target_id, created_at)
VALUES (8, '신촌 굿즈샵 검색 068', 'GOODS', 8, SYSDATE - 17);

INSERT INTO search_log (member_id, keyword, target_type, target_id, created_at)
VALUES (9, '부산 애니 굿즈샵 069', 'POST', 9, SYSDATE - 16);

INSERT INTO search_log (member_id, keyword, target_type, target_id, created_at)
VALUES (10, '서울 팝업 일정 070', 'STORE', 10, SYSDATE - 16);

INSERT INTO search_log (member_id, keyword, target_type, target_id, created_at)
VALUES (1, '홍대 팝업스토어 검색 071', 'GOODS', 11, SYSDATE - 15);

INSERT INTO search_log (member_id, keyword, target_type, target_id, created_at)
VALUES (2, '강남 팝업스토어 검색 072', 'POST', 12, SYSDATE - 15);

INSERT INTO search_log (member_id, keyword, target_type, target_id, created_at)
VALUES (3, '신촌 굿즈샵 검색 073', 'STORE', 13, SYSDATE - 14);

INSERT INTO search_log (member_id, keyword, target_type, target_id, created_at)
VALUES (4, '부산 애니 굿즈샵 074', 'GOODS', 14, SYSDATE - 14);

INSERT INTO search_log (member_id, keyword, target_type, target_id, created_at)
VALUES (5, '서울 팝업 일정 075', 'POST', 15, SYSDATE - 13);

INSERT INTO search_log (member_id, keyword, target_type, target_id, created_at)
VALUES (6, '홍대 팝업스토어 검색 076', 'STORE', 16, SYSDATE - 13);

INSERT INTO search_log (member_id, keyword, target_type, target_id, created_at)
VALUES (7, '강남 팝업스토어 검색 077', 'GOODS', 17, SYSDATE - 12);

INSERT INTO search_log (member_id, keyword, target_type, target_id, created_at)
VALUES (8, '신촌 굿즈샵 검색 078', 'POST', 18, SYSDATE - 12);

INSERT INTO search_log (member_id, keyword, target_type, target_id, created_at)
VALUES (9, '부산 애니 굿즈샵 079', 'STORE', 19, SYSDATE - 11);

INSERT INTO search_log (member_id, keyword, target_type, target_id, created_at)
VALUES (10, '서울 팝업 일정 080', 'GOODS', 20, SYSDATE - 11);

INSERT INTO search_log (member_id, keyword, target_type, target_id, created_at)
VALUES (1, '홍대 팝업스토어 검색 081', 'POST', 1, SYSDATE - 10);

INSERT INTO search_log (member_id, keyword, target_type, target_id, created_at)
VALUES (2, '강남 팝업스토어 검색 082', 'STORE', 2, SYSDATE - 10);

INSERT INTO search_log (member_id, keyword, target_type, target_id, created_at)
VALUES (3, '신촌 굿즈샵 검색 083', 'GOODS', 3, SYSDATE - 9);

INSERT INTO search_log (member_id, keyword, target_type, target_id, created_at)
VALUES (4, '부산 애니 굿즈샵 084', 'POST', 4, SYSDATE - 9);

INSERT INTO search_log (member_id, keyword, target_type, target_id, created_at)
VALUES (5, '서울 팝업 일정 085', 'STORE', 5, SYSDATE - 8);

INSERT INTO search_log (member_id, keyword, target_type, target_id, created_at)
VALUES (6, '홍대 팝업스토어 검색 086', 'GOODS', 6, SYSDATE - 8);

INSERT INTO search_log (member_id, keyword, target_type, target_id, created_at)
VALUES (7, '강남 팝업스토어 검색 087', 'POST', 7, SYSDATE - 7);

INSERT INTO search_log (member_id, keyword, target_type, target_id, created_at)
VALUES (8, '신촌 굿즈샵 검색 088', 'STORE', 8, SYSDATE - 7);

INSERT INTO search_log (member_id, keyword, target_type, target_id, created_at)
VALUES (9, '부산 애니 굿즈샵 089', 'GOODS', 9, SYSDATE - 6);

INSERT INTO search_log (member_id, keyword, target_type, target_id, created_at)
VALUES (10, '서울 팝업 일정 090', 'POST', 10, SYSDATE - 6);

INSERT INTO search_log (member_id, keyword, target_type, target_id, created_at)
VALUES (1, '홍대 팝업스토어 검색 091', 'STORE', 11, SYSDATE - 5);

INSERT INTO search_log (member_id, keyword, target_type, target_id, created_at)
VALUES (2, '강남 팝업스토어 검색 092', 'GOODS', 12, SYSDATE - 5);

INSERT INTO search_log (member_id, keyword, target_type, target_id, created_at)
VALUES (3, '신촌 굿즈샵 검색 093', 'POST', 13, SYSDATE - 4);

INSERT INTO search_log (member_id, keyword, target_type, target_id, created_at)
VALUES (4, '부산 애니 굿즈샵 094', 'STORE', 14, SYSDATE - 4);

INSERT INTO search_log (member_id, keyword, target_type, target_id, created_at)
VALUES (5, '서울 팝업 일정 095', 'GOODS', 15, SYSDATE - 3);

INSERT INTO search_log (member_id, keyword, target_type, target_id, created_at)
VALUES (6, '홍대 팝업스토어 검색 096', 'POST', 16, SYSDATE - 3);

INSERT INTO search_log (member_id, keyword, target_type, target_id, created_at)
VALUES (7, '강남 팝업스토어 검색 097', 'STORE', 17, SYSDATE - 2);

INSERT INTO search_log (member_id, keyword, target_type, target_id, created_at)
VALUES (8, '신촌 굿즈샵 검색 098', 'GOODS', 18, SYSDATE - 2);

INSERT INTO search_log (member_id, keyword, target_type, target_id, created_at)
VALUES (9, '부산 애니 굿즈샵 099', 'POST', 19, SYSDATE - 1);

INSERT INTO search_log (member_id, keyword, target_type, target_id, created_at)
VALUES (10, '서울 팝업 일정 100', 'STORE', 20, SYSDATE - 1);

INSERT INTO service_notice(title,content,notice_type,start_date,end_date,created_at)
VALUES('굿즈로드 서비스 오픈 안내',
       '굿즈로드 서비스를 이용해 주셔서 감사합니다. 정식 오픈과 함께 다양한 팝업스토어 및 굿즈 정보를 제공해 드립니다.',
       'NOTICE',SYSDATE-30,NULL,SYSDATE-30);

INSERT INTO service_notice(title,content,notice_type,start_date,end_date,created_at)
VALUES('개인정보 처리방침 개정 안내',
       '서비스 이용 약관 및 개인정보 처리방침이 개정되었습니다. 자세한 내용은 공지 상세 페이지를 통해 확인해 주세요.',
       'UPDATE',SYSDATE-20,NULL,SYSDATE-20);

INSERT INTO service_notice(title,content,notice_type,start_date,end_date,created_at)
VALUES('서버 점검 안내(00:00~04:00)',
       '더 안정적인 서비스 제공을 위해 새벽 시간대 서버 점검을 진행합니다. 점검 시간 동안 일부 기능 이용이 제한될 수 있습니다.',
       'NOTICE',SYSDATE-10,SYSDATE-9,SYSDATE-10);

INSERT INTO service_notice(title,content,notice_type,start_date,end_date,created_at)
VALUES('굿즈로드 앱 업데이트 안내',
       '새로운 버전의 앱이 출시되었습니다. 검색 속도 개선 및 버그 수정이 포함되어 있으니 업데이트 후 이용을 권장드립니다.',
       'UPDATE',SYSDATE-7,NULL,SYSDATE-7);

INSERT INTO service_notice(title,content,notice_type,start_date,end_date,created_at)
VALUES('오픈 기념 포인트 2배 적립 이벤트',
       '이벤트 기간 동안 매장 및 온라인에서 결제 시 기본 적립 포인트가 2배로 제공됩니다. 자세한 조건은 이벤트 상세를 확인해 주세요.',
       'EVENT',SYSDATE-5,SYSDATE+5,SYSDATE-5);

INSERT INTO service_notice(title,content,notice_type,start_date,end_date,created_at)
VALUES('팝업스토어 방문 인증 이벤트 안내',
       '지정된 팝업스토어 방문 후 인증샷을 업로드하면 추첨을 통해 한정 굿즈를 드립니다. 참여 방법은 이벤트 상세 페이지에서 확인 가능합니다.',
       'EVENT',SYSDATE-3,SYSDATE+7,SYSDATE-3);

INSERT INTO service_notice(title,content,notice_type,start_date,end_date,created_at)
VALUES('고객센터 운영 시간 변경 안내',
       '내부 사정으로 인해 고객센터 상담 가능 시간이 평일 10:00~18:00으로 변경됩니다. 챗봇 상담은 24시간 이용 가능합니다.',
       'NOTICE',SYSDATE-2,NULL,SYSDATE-2);

INSERT INTO service_notice(title,content,notice_type,start_date,end_date,created_at)
VALUES('검색 기능 개선 업데이트',
       '검색 랭킹 및 추천 검색어 기능이 개선되었습니다. 자주 찾는 팝업과 굿즈를 더 빠르게 찾을 수 있습니다.',
       'UPDATE',SYSDATE-1,NULL,SYSDATE-1);

INSERT INTO service_notice(title,content,notice_type,start_date,end_date,created_at)
VALUES('시스템 점검 완료 안내',
       '예정되었던 시스템 점검이 정상적으로 완료되었습니다. 현재 모든 서비스를 안정적으로 이용하실 수 있습니다.',
       'NOTICE',SYSDATE-1,SYSDATE-1,SYSDATE-1);

INSERT INTO service_notice(title,content,notice_type,start_date,end_date,created_at)
VALUES('연말 굿즈 페스티벌 사전 안내',
       '연말을 맞아 대규모 굿즈 페스티벌을 준비 중입니다. 참여 브랜드와 상세 일정은 추후 별도 공지를 통해 안내해 드리겠습니다.',
       'EVENT',SYSDATE+7,SYSDATE+30,SYSDATE);
commit;
INSERT INTO store_bookmark(member_id,store_id,created_at) VALUES(1,1,SYSDATE-10);
INSERT INTO store_bookmark(member_id,store_id,created_at) VALUES(1,2,SYSDATE-9);
INSERT INTO store_bookmark(member_id,store_id,created_at) VALUES(2,3,SYSDATE-8);
INSERT INTO store_bookmark(member_id,store_id,created_at) VALUES(2,4,SYSDATE-8);
INSERT INTO store_bookmark(member_id,store_id,created_at) VALUES(3,5,SYSDATE-7);
INSERT INTO store_bookmark(member_id,store_id,created_at) VALUES(3,6,SYSDATE-7);
INSERT INTO store_bookmark(member_id,store_id,created_at) VALUES(4,7,SYSDATE-6);
INSERT INTO store_bookmark(member_id,store_id,created_at) VALUES(4,8,SYSDATE-6);
INSERT INTO store_bookmark(member_id,store_id,created_at) VALUES(5,9,SYSDATE-5);
INSERT INTO store_bookmark(member_id,store_id,created_at) VALUES(5,10,SYSDATE-5);
INSERT INTO store_bookmark(member_id,store_id,created_at) VALUES(6,11,SYSDATE-4);
INSERT INTO store_bookmark(member_id,store_id,created_at) VALUES(6,12,SYSDATE-4);
INSERT INTO store_bookmark(member_id,store_id,created_at) VALUES(7,13,SYSDATE-3);
INSERT INTO store_bookmark(member_id,store_id,created_at) VALUES(7,14,SYSDATE-3);
INSERT INTO store_bookmark(member_id,store_id,created_at) VALUES(8,15,SYSDATE-2);
INSERT INTO store_bookmark(member_id,store_id,created_at) VALUES(8,16,SYSDATE-2);
INSERT INTO store_bookmark(member_id,store_id,created_at) VALUES(9,17,SYSDATE-1);
INSERT INTO store_bookmark(member_id,store_id,created_at) VALUES(9,18,SYSDATE-1);
INSERT INTO store_bookmark(member_id,store_id,created_at) VALUES(10,19,SYSDATE);
INSERT INTO store_bookmark(member_id,store_id,created_at) VALUES(10,20,SYSDATE);-- ✅ Oracle용: 다건 VALUES -> INSERT ALL, NOW() -> SYSDATE
-- (테이블명이 스키마 포함이면 TKK.TRADE_POST로 맞춰서 사용)
INSERT INTO TKK.TRADE_POST
(seller_id, title, content, goods_name, work_name, character_name, category, price,
 trade_type, trade_method, region, status, view_count, like_count, created_at, deleted_yn)
VALUES
    (2,'[귀멸의 칼날] 도우마 AGF 2025 담요','AGF 2025 한정 도우마 담요 판매합니다.','AGF 2025 담요','귀멸의 칼날','도우마','담요',35000,'SELL','DIRECT','홍대','ON_SALE',50,3,SYSDATE,'N');

INSERT INTO TKK.TRADE_POST
(seller_id, title, content, goods_name, work_name, character_name, category, price,
 trade_type, trade_method, region, status, view_count, like_count, created_at, deleted_yn)
VALUES
    (2,'[귀멸의 칼날] 아카자 AGF 2025 담요','AGF 2025 한정 아카자 담요입니다.','AGF 2025 담요','귀멸의 칼날','아카자','담요',35000,'SELL','DIRECT','홍대','ON_SALE',42,2,SYSDATE,'N');

INSERT INTO TKK.TRADE_POST
(seller_id, title, content, goods_name, work_name, character_name, category, price,
 trade_type, trade_method, region, status, view_count, like_count, created_at, deleted_yn)
VALUES
    (3,'[귀멸의 칼날] 코쿠시보 AGF 2025 담요','코쿠시보 AGF 한정 담요 판매합니다.','AGF 2025 담요','귀멸의 칼날','코쿠시보','담요',38000,'SELL','DIRECT','합정','ON_SALE',61,6,SYSDATE,'N');

INSERT INTO TKK.TRADE_POST
(seller_id, title, content, goods_name, work_name, character_name, category, price,
 trade_type, trade_method, region, status, view_count, like_count, created_at, deleted_yn)
VALUES
    (3,'[귀멸의 칼날] 키부츠지 무잔 AGF 2025 담요','무잔 AGF 한정 담요 미개봉 상품입니다.','AGF 2025 담요','귀멸의 칼날','키부츠지 무잔','담요',38000,'SELL','DIRECT','합정','ON_SALE',55,4,SYSDATE,'N');

INSERT INTO TKK.TRADE_POST
(seller_id, title, content, goods_name, work_name, character_name, category, price,
 trade_type, trade_method, region, status, view_count, like_count, created_at, deleted_yn)
VALUES
    (4,'[귀멸의 칼날] 코쵸우 시노부 쿄마후 아크릴 스탠드','쿄마후 한정 시노부 아크릴 스탠드입니다.','아크릴 스탠드','귀멸의 칼날','코쵸우 시노부','아크릴',22000,'SELL','DELIVERY','강남','ON_SALE',37,5,SYSDATE,'N');

INSERT INTO TKK.TRADE_POST
(seller_id, title, content, goods_name, work_name, character_name, category, price,
 trade_type, trade_method, region, status, view_count, like_count, created_at, deleted_yn)
VALUES
    (4,'[귀멸의 칼날] 토미오카 기유 쿄마후 아크릴 스탠드','쿄마후 한정 기유 아크릴 스탠드 판매합니다.','아크릴 스탠드','귀멸의 칼날','토미오카 기유','아크릴',22000,'SELL','DELIVERY','강남','ON_SALE',40,6,SYSDATE,'N');

INSERT INTO TKK.TRADE_POST
(seller_id, title, content, goods_name, work_name, character_name, category, price,
 trade_type, trade_method, region, status, view_count, like_count, created_at, deleted_yn)
VALUES
    (5,'[귀멸의 칼날] 아가츠마 젠이츠 무한성편 아크릴 참','무한성편 젠이츠 아크릴 참입니다.','아크릴 참','귀멸의 칼날','아가츠마 젠이츠','키링',12000,'SELL','DELIVERY','신촌','ON_SALE',28,2,SYSDATE,'N');

INSERT INTO TKK.TRADE_POST
(seller_id, title, content, goods_name, work_name, character_name, category, price,
 trade_type, trade_method, region, status, view_count, like_count, created_at, deleted_yn)
VALUES
    (5,'[귀멸의 칼날] 코쵸우 시노부 무한성편 아크릴 참','무한성편 시노부 아크릴 참 판매합니다.','아크릴 참','귀멸의 칼날','코쵸우 시노부','키링',12000,'SELL','DELIVERY','신촌','ON_SALE',25,1,SYSDATE,'N');

INSERT INTO TKK.TRADE_POST
(seller_id, title, content, goods_name, work_name, character_name, category, price,
 trade_type, trade_method, region, status, view_count, like_count, created_at, deleted_yn)
VALUES
    (6,'[귀멸의 칼날] 토미오카 기유 무한성편 아크릴 참','무한성편 기유 아크릴 참입니다.','아크릴 참','귀멸의 칼날','토미오카 기유','키링',12000,'SELL','DELIVERY','신촌','ON_SALE',31,3,SYSDATE,'N');

INSERT INTO TKK.TRADE_POST
(seller_id, title, content, goods_name, work_name, character_name, category, price,
 trade_type, trade_method, region, status, view_count, like_count, created_at, deleted_yn)
VALUES
    (6,'[귀멸의 칼날] 아카자 무한성편 아크릴 스탠드','무한성편 아카자 아크릴 스탠드 판매합니다.','아크릴 스탠드','귀멸의 칼날','아카자','아크릴',25000,'SELL','DIRECT','홍대','ON_SALE',48,7,SYSDATE,'N');

-- 11~20
INSERT INTO TKK.TRADE_POST
(seller_id, title, content, goods_name, work_name, character_name, category, price,
 trade_type, trade_method, region, status, view_count, like_count, created_at, deleted_yn)
VALUES
    (2,'[나루토 질풍전] 하루노 사쿠라 걸즈 시리즈','걸즈 시리즈 사쿠라 피규어 판매합니다.','걸즈 시리즈 피규어','나루토 질풍전','하루노 사쿠라','피규어',98000,'SELL','DELIVERY','홍대','ON_SALE',34,4,SYSDATE,'N');

INSERT INTO TKK.TRADE_POST
(seller_id, title, content, goods_name, work_name, character_name, category, price,
 trade_type, trade_method, region, status, view_count, like_count, created_at, deleted_yn)
VALUES
    (3,'[나루토 질풍전] 휴우가 히나타 넨도로이드 No.879','히나타 넨도로이드 상태 양호합니다.','넨도로이드','나루토 질풍전','휴우가 히나타','피규어',72000,'SELL','DELIVERY','강남','ON_SALE',41,6,SYSDATE,'N');

INSERT INTO TKK.TRADE_POST
(seller_id, title, content, goods_name, work_name, character_name, category, price,
 trade_type, trade_method, region, status, view_count, like_count, created_at, deleted_yn)
VALUES
    (2,'[나루토 질풍전] 우치하 사스케 룩업 피규어','룩업 시리즈 사스케 피규어입니다.','룩업 피규어','나루토 질풍전','우치하 사스케','피규어',38000,'SELL','DIRECT','홍대','ON_SALE',29,3,SYSDATE,'N');

INSERT INTO TKK.TRADE_POST
(seller_id, title, content, goods_name, work_name, character_name, category, price,
 trade_type, trade_method, region, status, view_count, like_count, created_at, deleted_yn)
VALUES
    (4,'[나루토 질풍전] 우치하 이타치 룩업 피규어','이타치 룩업 피규어 판매합니다.','룩업 피규어','나루토 질풍전','우치하 이타치','피규어',42000,'SELL','DIRECT','합정','ON_SALE',52,8,SYSDATE,'N');

INSERT INTO TKK.TRADE_POST
(seller_id, title, content, goods_name, work_name, character_name, category, price,
 trade_type, trade_method, region, status, view_count, like_count, created_at, deleted_yn)
VALUES
    (5,'[진격의 거인] 라이너 브라운 POP UP PARADE','POP UP PARADE 라이너 브라운 피규어입니다.','POP UP PARADE','진격의 거인','라이너 브라운','피규어',55000,'SELL','DELIVERY','신촌','ON_SALE',46,5,SYSDATE,'N');

INSERT INTO TKK.TRADE_POST
(seller_id, title, content, goods_name, work_name, character_name, category, price,
 trade_type, trade_method, region, status, view_count, like_count, created_at, deleted_yn)
VALUES
    (5,'[진격의 거인] 엘런 예거 POP UP PARADE','엘런 예거 월드 와이드 에프터 파티 버전입니다.','POP UP PARADE','진격의 거인','엘런 예거','피규어',55000,'SELL','DELIVERY','신촌','ON_SALE',63,9,SYSDATE,'N');

INSERT INTO TKK.TRADE_POST
(seller_id, title, content, goods_name, work_name, character_name, category, price,
 trade_type, trade_method, region, status, view_count, like_count, created_at, deleted_yn)
VALUES
    (6,'[진격의 거인] 리바이 넨도로이드 돌','넨도로이드 돌 리바이 판매합니다.','넨도로이드 돌','진격의 거인','리바이','피규어',89000,'SELL','DELIVERY','건대','ON_SALE',71,11,SYSDATE,'N');

INSERT INTO TKK.TRADE_POST
(seller_id, title, content, goods_name, work_name, character_name, category, price,
 trade_type, trade_method, region, status, view_count, like_count, created_at, deleted_yn)
VALUES
    (3,'[진격의 거인] 리바이 룩업 피규어','룩업 리바이 피규어입니다.','룩업 피규어','진격의 거인','리바이','피규어',39000,'SELL','DIRECT','강남','ON_SALE',58,7,SYSDATE,'N');

INSERT INTO TKK.TRADE_POST
(seller_id, title, content, goods_name, work_name, character_name, category, price,
 trade_type, trade_method, region, status, view_count, like_count, created_at, deleted_yn)
VALUES
    (4,'[진격의 거인] 엘런 예거 룩업 피규어','엘런 룩업 피규어 판매합니다.','룩업 피규어','진격의 거인','엘런 예거','피규어',39000,'SELL','DIRECT','강남','ON_SALE',44,6,SYSDATE,'N');

INSERT INTO TKK.TRADE_POST
(seller_id, title, content, goods_name, work_name, character_name, category, price,
 trade_type, trade_method, region, status, view_count, like_count, created_at, deleted_yn)
VALUES
    (6,'[진격의 거인] 아르민 알레르토 넨도로이드 조사병단','아르민 넨도로이드 조사병단 버전입니다.','넨도로이드','진격의 거인','아르민 알레르토','피규어',76000,'SELL','DELIVERY','홍대','ON_SALE',67,10,SYSDATE,'N');

-- 21~30
INSERT INTO TKK.TRADE_POST
(seller_id, title, content, goods_name, work_name, character_name, category, price,
 trade_type, trade_method, region, status, view_count, like_count, created_at, deleted_yn)
VALUES
    (2,'[블루록] 바치라 메구루 아크릴 스탠드','블루록 2기 콜라보 바치라 메구루 아크릴 스탠드입니다.','아크릴 스탠드','블루록','바치라 메구루','아크릴',18000,'SELL','DELIVERY','홍대','ON_SALE',33,4,SYSDATE,'N');

INSERT INTO TKK.TRADE_POST
(seller_id, title, content, goods_name, work_name, character_name, category, price,
 trade_type, trade_method, region, status, view_count, like_count, created_at, deleted_yn)
VALUES
    (12,'[블루록] 치기리 효마 아크릴 스탠드','블루록 2기 콜라보 치기리 효마 아크릴 스탠드입니다.','아크릴 스탠드','블루록','치기리 효마','아크릴',18000,'SELL','DELIVERY','홍대','ON_SALE',29,3,SYSDATE,'N');

INSERT INTO TKK.TRADE_POST
(seller_id, title, content, goods_name, work_name, character_name, category, price,
 trade_type, trade_method, region, status, view_count, like_count, created_at, deleted_yn)
VALUES
    (13,'[블루록] 이사기 요이치 아크릴 키홀더','블루록 2기 이사기 요이치 아크릴 스탠드 키홀더입니다.','아크릴 키홀더','블루록','이사기 요이치','키링',15000,'SELL','DELIVERY','강남','ON_SALE',41,6,SYSDATE,'N');

INSERT INTO TKK.TRADE_POST
(seller_id, title, content, goods_name, work_name, character_name, category, price,
 trade_type, trade_method, region, status, view_count, like_count, created_at, deleted_yn)
VALUES
    (23,'[블루록] 나기 세이시로 아크릴 키홀더','블루록 2기 나기 세이시로 아크릴 키홀더입니다.','아크릴 키홀더','블루록','나기 세이시로','키링',15000,'SELL','DELIVERY','강남','ON_SALE',38,5,SYSDATE,'N');

INSERT INTO TKK.TRADE_POST
(seller_id, title, content, goods_name, work_name, character_name, category, price,
 trade_type, trade_method, region, status, view_count, like_count, created_at, deleted_yn)
VALUES
    (14,'[블루록] 바치라 메구루 아크릴 키홀더','블루록 2기 바치라 메구루 아크릴 키홀더입니다.','아크릴 키홀더','블루록','바치라 메구루','키링',15000,'SELL','DELIVERY','신촌','ON_SALE',36,4,SYSDATE,'N');

INSERT INTO TKK.TRADE_POST
(seller_id, title, content, goods_name, work_name, character_name, category, price,
 trade_type, trade_method, region, status, view_count, like_count, created_at, deleted_yn)
VALUES
    (24,'[블루록] 치기리 효마 아크릴 키홀더','블루록 2기 치기리 효마 아크릴 키홀더입니다.','아크릴 키홀더','블루록','치기리 효마','키링',15000,'SELL','DELIVERY','신촌','ON_SALE',34,3,SYSDATE,'N');

INSERT INTO TKK.TRADE_POST
(seller_id, title, content, goods_name, work_name, character_name, category, price,
 trade_type, trade_method, region, status, view_count, like_count, created_at, deleted_yn)
VALUES
    (15,'[블루록] 트레이딩 은박 원형 캔뱃지','블루록 트레이딩 은박 원형 캔뱃지 (랜덤) 입니다.','원형 캔뱃지','블루록',NULL,'뱃지',6000,'SELL','DELIVERY','건대','ON_SALE',52,7,SYSDATE,'N');

INSERT INTO TKK.TRADE_POST
(seller_id, title, content, goods_name, work_name, character_name, category, price,
 trade_type, trade_method, region, status, view_count, like_count, created_at, deleted_yn)
VALUES
    (25,'[블루록] 나기 세이시로 룩업 피규어','룩업 시리즈 나기 세이시로 피규어입니다.','룩업 피규어','블루록','나기 세이시로','피규어',39000,'SELL','DIRECT','건대','ON_SALE',47,6,SYSDATE,'N');

INSERT INTO TKK.TRADE_POST
(seller_id, title, content, goods_name, work_name, character_name, category, price,
 trade_type, trade_method, region, status, view_count, like_count, created_at, deleted_yn)
VALUES
    (16,'[블루록] 이사기 요이치 더블 아크릴 키홀더','데포르메 버전 이사기 요이치 더블 아크릴 키홀더입니다.','더블 아크릴 키홀더','블루록','이사기 요이치','키링',17000,'SELL','DELIVERY','합정','ON_SALE',44,5,SYSDATE,'N');

INSERT INTO TKK.TRADE_POST
(seller_id, title, content, goods_name, work_name, character_name, category, price,
 trade_type, trade_method, region, status, view_count, like_count, created_at, deleted_yn)
VALUES
    (26,'[블루록] 나기 세이시로 액션 피규어','블루록 나기 세이시로 슈팅 포즈 액션 피규어입니다.','액션 피규어','블루록','나기 세이시로','피규어',89000,'SELL','DIRECT','홍대','ON_SALE',73,12,SYSDATE,'N');

-- 31~40
INSERT INTO TKK.TRADE_POST
(seller_id, title, content, goods_name, work_name, character_name, category, price,
 trade_type, trade_method, region, status, view_count, like_count, created_at, deleted_yn)
VALUES
    (32,'[주술회전] MEGA CAT PROJECT BIG 고죠 사토루','MEGA CAT PROJECT BIG 고죠 사토루 피규어입니다.','MEGA CAT BIG','주술회전','고죠 사토루','피규어',42000,'SELL','DELIVERY','홍대','ON_SALE',36,5,SYSDATE,'N');

INSERT INTO TKK.TRADE_POST
(seller_id, title, content, goods_name, work_name, character_name, category, price,
 trade_type, trade_method, region, status, view_count, like_count, created_at, deleted_yn)
VALUES
    (2,'[주술회전] MEGA CAT PROJECT BIG 후시구로 토우지','MEGA CAT PROJECT BIG 후시구로 토우지 피규어입니다.','MEGA CAT BIG','주술회전','후시구로 토우지','피규어',42000,'SELL','DELIVERY','홍대','ON_SALE',31,4,SYSDATE,'N');

INSERT INTO TKK.TRADE_POST
(seller_id, title, content, goods_name, work_name, character_name, category, price,
 trade_type, trade_method, region, status, view_count, like_count, created_at, deleted_yn)
VALUES
    (33,'[주술회전] 고죠 사토루 슈트 Ver. 피규어','슈트 버전 고죠 사토루 피규어 판매합니다.','슈트 Ver. 피규어','주술회전','고죠 사토루','피규어',98000,'SELL','DIRECT','강남','ON_SALE',54,8,SYSDATE,'N');

INSERT INTO TKK.TRADE_POST
(seller_id, title, content, goods_name, work_name, character_name, category, price,
 trade_type, trade_method, region, status, view_count, like_count, created_at, deleted_yn)
VALUES
    (3,'[주술회전] 넨도로이드 돌 고죠 사토루 (고전)','넨도로이드 돌 고죠 사토루 고전 버전입니다.','넨도로이드 돌','주술회전','고죠 사토루','피규어',89000,'SELL','DELIVERY','강남','ON_SALE',49,7,SYSDATE,'N');

INSERT INTO TKK.TRADE_POST
(seller_id, title, content, goods_name, work_name, character_name, category, price,
 trade_type, trade_method, region, status, view_count, like_count, created_at, deleted_yn)
VALUES
    (34,'[주술회전] 룩업 고죠 사토루','룩업 시리즈 고죠 사토루 피규어입니다.','룩업 피규어','주술회전','고죠 사토루','피규어',39000,'SELL','DIRECT','합정','ON_SALE',45,6,SYSDATE,'N');

INSERT INTO TKK.TRADE_POST
(seller_id, title, content, goods_name, work_name, character_name, category, price,
 trade_type, trade_method, region, status, view_count, like_count, created_at, deleted_yn)
VALUES
    (35,'[하이큐!!] GEM 시리즈 손바닥 미야 아츠무','GEM 시리즈 손바닥 미야 아츠무 피규어입니다.','GEM 손바닥 시리즈','하이큐!!','미야 아츠무','피규어',68000,'SELL','DIRECT','신촌','ON_SALE',52,7,SYSDATE,'N');

INSERT INTO TKK.TRADE_POST
(seller_id, title, content, goods_name, work_name, character_name, category, price,
 trade_type, trade_method, region, status, view_count, like_count, created_at, deleted_yn)
VALUES
    (5,'[하이큐!!] GEM 시리즈 손바닥 츠키시마 케이','GEM 시리즈 손바닥 츠키시마 케이 피규어입니다.','GEM 손바닥 시리즈','하이큐!!','츠키시마 케이','피규어',68000,'SELL','DIRECT','신촌','ON_SALE',48,6,SYSDATE,'N');

INSERT INTO TKK.TRADE_POST
(seller_id, title, content, goods_name, work_name, character_name, category, price,
 trade_type, trade_method, region, status, view_count, like_count, created_at, deleted_yn)
VALUES
    (36,'[하이큐!!] GEM 시리즈 손바닥 카게야마 토비오','카게야마 토비오 세컨드 유니폼 버전입니다.','GEM 손바닥 시리즈','하이큐!!','카게야마 토비오','피규어',72000,'SELL','DELIVERY','건대','ON_SALE',61,9,SYSDATE,'N');

INSERT INTO TKK.TRADE_POST
(seller_id, title, content, goods_name, work_name, character_name, category, price,
 trade_type, trade_method, region, status, view_count, like_count, created_at, deleted_yn)
VALUES
    (6,'[하이큐!!] GEM 시리즈 손바닥 히나타 쇼요','히나타 쇼요 세컨드 유니폼 버전 피규어입니다.','GEM 손바닥 시리즈','하이큐!!','히나타 쇼요','피규어',72000,'SELL','DELIVERY','건대','ON_SALE',67,11,SYSDATE,'N');

INSERT INTO TKK.TRADE_POST
(seller_id, title, content, goods_name, work_name, character_name, category, price,
 trade_type, trade_method, region, status, view_count, like_count, created_at, deleted_yn)
VALUES
    (6,'[하이큐!!] 룩업 츠키시마 케이','룩업 시리즈 츠키시마 케이 피규어입니다.','룩업 피규어','하이큐!!','츠키시마 케이','피규어',39000,'SELL','DIRECT','홍대','ON_SALE',43,5,SYSDATE,'N');

-- 41~50
INSERT INTO TKK.TRADE_POST
(seller_id, title, content, goods_name, work_name, character_name, category, price,
 trade_type, trade_method, region, status, view_count, like_count, created_at, deleted_yn)
VALUES
    (2,'[원피스] NEO-MAXIMUM 루피 & 에이스 형제의 연 20TH LIMITED','루피 & 에이스 형제의 연 20주년 한정 피규어입니다.','NEO-MAXIMUM','원피스','몽키 D 루피 / 포트거스 D 에이스','피규어',520000,'SELL','DIRECT','홍대','ON_SALE',84,12,SYSDATE,'N');

INSERT INTO TKK.TRADE_POST
(seller_id, title, content, goods_name, work_name, character_name, category, price,
 trade_type, trade_method, region, status, view_count, like_count, created_at, deleted_yn)
VALUES
    (3,'[원피스] P.O.P Evolutionary History 주얼리 보니','Portrait.Of.Pirates 주얼리 보니 피규어입니다.','P.O.P 피규어','원피스','주얼리 보니','피규어',165000,'SELL','DELIVERY','강남','ON_SALE',57,8,SYSDATE,'N');

INSERT INTO TKK.TRADE_POST
(seller_id, title, content, goods_name, work_name, character_name, category, price,
 trade_type, trade_method, region, status, view_count, like_count, created_at, deleted_yn)
VALUES
    (3,'[원피스] P.O.P K×MAXIMUM 상디','K×MAXIMUM 상디 한정 피규어 판매합니다.','P.O.P MAXIMUM','원피스','상디','피규어',298000,'SELL','DIRECT','강남','ON_SALE',73,11,SYSDATE,'N');

INSERT INTO TKK.TRADE_POST
(seller_id, title, content, goods_name, work_name, character_name, category, price,
 trade_type, trade_method, region, status, view_count, like_count, created_at, deleted_yn)
VALUES
    (4,'[원피스] P.O.P WA.MAXIMUM 백수의 카이도','WA.MAXIMUM 카이도 초한정 복각판입니다.','P.O.P WA.MAXIMUM','원피스','카이도','피규어',480000,'SELL','DIRECT','합정','ON_SALE',96,18,SYSDATE,'N');

INSERT INTO TKK.TRADE_POST
(seller_id, title, content, goods_name, work_name, character_name, category, price,
 trade_type, trade_method, region, status, view_count, like_count, created_at, deleted_yn)
VALUES
    (4,'[원피스] P.O.P WA-MAXIMUM 화재의 킹','백수해적단 대간판 화재의 킹 피규어입니다.','P.O.P WA-MAXIMUM','원피스','킹','피규어',330000,'SELL','DIRECT','합정','ON_SALE',69,10,SYSDATE,'N');

INSERT INTO TKK.TRADE_POST
(seller_id, title, content, goods_name, work_name, character_name, category, price,
 trade_type, trade_method, region, status, view_count, like_count, created_at, deleted_yn)
VALUES
    (5,'[원피스] 룩업 몽키 D 루피 기어 5','기어 5 루피 룩업 피규어입니다.','룩업 피규어','원피스','몽키 D 루피','피규어',42000,'SELL','DELIVERY','신촌','ON_SALE',61,9,SYSDATE,'N');

INSERT INTO TKK.TRADE_POST
(seller_id, title, content, goods_name, work_name, character_name, category, price,
 trade_type, trade_method, region, status, view_count, like_count, created_at, deleted_yn)
VALUES
    (5,'[원피스] 베리어블 액션 히어로즈 롤로노아 조로','베리어블 액션 히어로즈 조로 피규어입니다.','베리어블 액션 히어로즈','원피스','롤로노아 조로','피규어',185000,'SELL','DIRECT','신촌','ON_SALE',67,10,SYSDATE,'N');

INSERT INTO TKK.TRADE_POST
(seller_id, title, content, goods_name, work_name, character_name, category, price,
 trade_type, trade_method, region, status, view_count, like_count, created_at, deleted_yn)
VALUES
    (6,'[원피스] 세계의 디바 우타','극장판 등장 세계의 디바 우타 피규어입니다.','스케일 피규어','원피스','우타','피규어',158000,'SELL','DELIVERY','홍대','ON_SALE',72,13,SYSDATE,'N');

INSERT INTO TKK.TRADE_POST
(seller_id, title, content, goods_name, work_name, character_name, category, price,
 trade_type, trade_method, region, status, view_count, like_count, created_at, deleted_yn)
VALUES
    (6,'[원피스] P.O.P SA-MAXIMUM 돈키호테 도플라밍고','SA-MAXIMUM 도플라밍고 피규어입니다.','P.O.P SA-MAXIMUM','원피스','돈키호테 도플라밍고','피규어',410000,'SELL','DIRECT','홍대','ON_SALE',88,16,SYSDATE,'N');

INSERT INTO TKK.TRADE_POST
(seller_id, title, content, goods_name, work_name, character_name, category, price,
 trade_type, trade_method, region, status, view_count, like_count, created_at, deleted_yn)
VALUES
    (6,'[원피스] 흰수염 에드워드 뉴게이트','전설의 해적 흰수염 에드워드 뉴게이트 피규어입니다.','대형 피규어','원피스','에드워드 뉴게이트','피규어',460000,'SELL','DIRECT','홍대','ON_SALE',91,17,SYSDATE,'N');
commit ;

INSERT INTO trade_bookmark(member_id,trade_id,created_at) VALUES(1,1,SYSDATE-10);
INSERT INTO trade_bookmark(member_id,trade_id,created_at) VALUES(1,2,SYSDATE-9);
INSERT INTO trade_bookmark(member_id,trade_id,created_at) VALUES(2,3,SYSDATE-8);
INSERT INTO trade_bookmark(member_id,trade_id,created_at) VALUES(2,4,SYSDATE-7);
INSERT INTO trade_bookmark(member_id,trade_id,created_at) VALUES(3,5,SYSDATE-6);
INSERT INTO trade_bookmark(member_id,trade_id,created_at) VALUES(3,6,SYSDATE-5);
INSERT INTO trade_bookmark(member_id,trade_id,created_at) VALUES(4,7,SYSDATE-4);
INSERT INTO trade_bookmark(member_id,trade_id,created_at) VALUES(4,8,SYSDATE-3);
INSERT INTO trade_bookmark(member_id,trade_id,created_at) VALUES(5,9,SYSDATE-2);
INSERT INTO trade_bookmark(member_id,trade_id,created_at) VALUES(5,10,SYSDATE-1);

INSERT INTO trade_bookmark(member_id,trade_id,created_at) VALUES(6,11,SYSDATE-10);
INSERT INTO trade_bookmark(member_id,trade_id,created_at) VALUES(6,12,SYSDATE-9);
INSERT INTO trade_bookmark(member_id,trade_id,created_at) VALUES(7,13,SYSDATE-8);
INSERT INTO trade_bookmark(member_id,trade_id,created_at) VALUES(7,14,SYSDATE-7);
INSERT INTO trade_bookmark(member_id,trade_id,created_at) VALUES(8,15,SYSDATE-6);
INSERT INTO trade_bookmark(member_id,trade_id,created_at) VALUES(8,16,SYSDATE-5);
INSERT INTO trade_bookmark(member_id,trade_id,created_at) VALUES(9,17,SYSDATE-4);
INSERT INTO trade_bookmark(member_id,trade_id,created_at) VALUES(9,18,SYSDATE-3);
INSERT INTO trade_bookmark(member_id,trade_id,created_at) VALUES(10,19,SYSDATE-2);
INSERT INTO trade_bookmark(member_id,trade_id,created_at) VALUES(10,20,SYSDATE-1);

INSERT INTO trade_bookmark(member_id,trade_id,created_at) VALUES(1,21,SYSDATE-10);
INSERT INTO trade_bookmark(member_id,trade_id,created_at) VALUES(2,22,SYSDATE-9);
INSERT INTO trade_bookmark(member_id,trade_id,created_at) VALUES(3,23,SYSDATE-8);
INSERT INTO trade_bookmark(member_id,trade_id,created_at) VALUES(4,24,SYSDATE-7);
INSERT INTO trade_bookmark(member_id,trade_id,created_at) VALUES(5,25,SYSDATE-6);
INSERT INTO trade_bookmark(member_id,trade_id,created_at) VALUES(6,26,SYSDATE-5);
INSERT INTO trade_bookmark(member_id,trade_id,created_at) VALUES(7,27,SYSDATE-4);
INSERT INTO trade_bookmark(member_id,trade_id,created_at) VALUES(8,28,SYSDATE-3);
INSERT INTO trade_bookmark(member_id,trade_id,created_at) VALUES(9,29,SYSDATE-2);
INSERT INTO trade_bookmark(member_id,trade_id,created_at) VALUES(10,30,SYSDATE-1);

INSERT INTO trade_bookmark(member_id,trade_id,created_at) VALUES(11,31,SYSDATE-10);
INSERT INTO trade_bookmark(member_id,trade_id,created_at) VALUES(11,32,SYSDATE-9);
INSERT INTO trade_bookmark(member_id,trade_id,created_at) VALUES(12,33,SYSDATE-8);
INSERT INTO trade_bookmark(member_id,trade_id,created_at) VALUES(12,34,SYSDATE-7);
INSERT INTO trade_bookmark(member_id,trade_id,created_at) VALUES(13,35,SYSDATE-6);
INSERT INTO trade_bookmark(member_id,trade_id,created_at) VALUES(13,36,SYSDATE-5);
INSERT INTO trade_bookmark(member_id,trade_id,created_at) VALUES(14,37,SYSDATE-4);
INSERT INTO trade_bookmark(member_id,trade_id,created_at) VALUES(14,38,SYSDATE-3);
INSERT INTO trade_bookmark(member_id,trade_id,created_at) VALUES(15,39,SYSDATE-2);
INSERT INTO trade_bookmark(member_id,trade_id,created_at) VALUES(15,40,SYSDATE-1);

INSERT INTO popup_goods (popup_id, name, description, category, price, thumbnail_url)
VALUES (1, '원피스 올스타 포토카드 세트', '원피스 주요 캐릭터 10종 한정 포카 세트', '포카', 8000, 'g001.jpg');
INSERT INTO popup_goods (popup_id, name, description, category, price, thumbnail_url)
VALUES (1, '귀멸의 칼날 탄지로 미니 인형', '탄지로 SD 버전 봉제 인형 굿즈', '인형', 9000, 'g002.jpg');
INSERT INTO popup_goods (popup_id, name, description, category, price, thumbnail_url)
VALUES (1, '주술회전 이타도리 유우지 키링', '이타도리 캐릭터 아크릴 키링', '키링', 10000, 'g003.jpg');
INSERT INTO popup_goods (popup_id, name, description, category, price, thumbnail_url)
VALUES (1, '체인소맨 덴지 아크릴 스탠드', '전기톱맨 변신 포즈 아크릴 스탠드', '아크릴스탠드', 11000, 'g004.jpg');
INSERT INTO popup_goods (popup_id, name, description, category, price, thumbnail_url)
VALUES (1, '덕후로드 시즌1 로고 스티커 팩', '덕후로드 팝업 시즌1 한정 홀로그램 스티커 세트', '기타', 12000, 'g005.jpg');
INSERT INTO popup_goods (popup_id, name, description, category, price, thumbnail_url)
VALUES (1, '나루토 팀7 포토카드 세트', '나루토·사스케·사쿠라가 담긴 팀7 포카 세트', '포카', 8000, 'g006.jpg');
INSERT INTO popup_goods (popup_id, name, description, category, price, thumbnail_url)
VALUES (1, '하이큐 히나타 쇼요 마스코트 인형', '카라스노 에이스 히나타 점프 포즈 봉제 인형', '인형', 9000, 'g007.jpg');
INSERT INTO popup_goods (popup_id, name, description, category, price, thumbnail_url)
VALUES (1, '블루록 이사기 요이치 키링', '스트라이커 유니폼 버전 아크릴 키링', '키링', 10000, 'g008.jpg');
INSERT INTO popup_goods (popup_id, name, description, category, price, thumbnail_url)
VALUES (1, '진격의 거인 엘런&미카사 스탠드', '성벽 위 전투 장면을 담은 아크릴 스탠드', '아크릴스탠드', 11000, 'g009.jpg');
INSERT INTO popup_goods (popup_id, name, description, category, price, thumbnail_url)
VALUES (1, '주술회전×체인소맨 클리어파일 세트', '두 작품 일러스트가 들어간 한정판 클리어파일 세트', '기타', 12000, 'g010.jpg');

INSERT INTO popup_goods (popup_id, name, description, category, price, thumbnail_url)
VALUES (2, '블루록 스트라이커 포카 세트', '블루록 주요 스트라이커 8종 콜렉션 포토카드', '포카', 8000, 'g011.jpg');
INSERT INTO popup_goods (popup_id, name, description, category, price, thumbnail_url)
VALUES (2, '나루토 카카시 안대 미니 인형', '사륜안 가면을 쓴 카카시 봉제 인형', '인형', 9000, 'g012.jpg');
INSERT INTO popup_goods (popup_id, name, description, category, price, thumbnail_url)
VALUES (2, '스파이 패밀리 아냐 페이스 키링', '아냐 표정이 담긴 동그란 아크릴 키링', '키링', 10000, 'g013.jpg');
INSERT INTO popup_goods (popup_id, name, description, category, price, thumbnail_url)
VALUES (2, '귀멸의 칼날 9귀 기둥 아크릴 스탠드', '기둥 전원이 모인 단체 일러스트 스탠드', '아크릴스탠드', 11000, 'g014.jpg');
INSERT INTO popup_goods (popup_id, name, description, category, price, thumbnail_url)
VALUES (2, '원피스 조로 메탈 배지 세트', '조로 일러스트 메탈 뱃지 3종 세트', '기타', 12000, 'g015.jpg');
INSERT INTO popup_goods (popup_id, name, description, category, price, thumbnail_url)
VALUES (2, '체인소맨 1기 키 비주얼 포카', '애니 키 비주얼을 담은 포토카드 세트', '포카', 8000, 'g016.jpg');
INSERT INTO popup_goods (popup_id, name, description, category, price, thumbnail_url)
VALUES (2, '진격의 거인 초대형 거인 쿠션', '밤하늘 배경 초대형 거인 미니 쿠션 인형', '인형', 9000, 'g017.jpg');
INSERT INTO popup_goods (popup_id, name, description, category, price, thumbnail_url)
VALUES (2, '하이큐 카라스노 배구공 키링', '오렌지 배구공 모양 러버 키링', '키링', 10000, 'g018.jpg');
INSERT INTO popup_goods (popup_id, name, description, category, price, thumbnail_url)
VALUES (2, '나루토 나선환 디오라마 스탠드', '나루토가 나선환을 쓰는 장면 아크릴 디오라마', '아크릴스탠드', 11000, 'g019.jpg');
INSERT INTO popup_goods (popup_id, name, description, category, price, thumbnail_url)
VALUES (2, '주술회전 스페셜 티켓 홀더', '극장판 티켓 전용 홀더와 목걸이 세트', '기타', 12000, 'g020.jpg');

INSERT INTO popup_goods (popup_id, name, description, category, price, thumbnail_url)
VALUES (3, '드래곤볼Z 초사이어인 포카', '손오공·베지터 변신 장면을 담은 포토카드 세트', '포카', 8000, 'g021.jpg');
INSERT INTO popup_goods (popup_id, name, description, category, price, thumbnail_url)
VALUES (3, '세일러문 루나 고양이 인형', '달빛에서 빛나는 루나 캐릭터 봉제 인형', '인형', 9000, 'g022.jpg');
INSERT INTO popup_goods (popup_id, name, description, category, price, thumbnail_url)
VALUES (3, '슬램덩크 강백호 유니폼 키링', '경기 유니폼 디자인의 아크릴 키링', '키링', 10000, 'g023.jpg');
INSERT INTO popup_goods (popup_id, name, description, category, price, thumbnail_url)
VALUES (3, '카드캡터 사쿠라 매직 서클 스탠드', '매직 서클과 열쇠가 들어간 아크릴 스탠드', '아크릴스탠드', 11000, 'g024.jpg');
INSERT INTO popup_goods (popup_id, name, description, category, price, thumbnail_url)
VALUES (3, '포켓몬스터 1세대 레트로 자석 세트', '레드·피카츄 일러스트 미니 자석 4종', '기타', 12000, 'g025.jpg');
INSERT INTO popup_goods (popup_id, name, description, category, price, thumbnail_url)
VALUES (3, '디지몬 어드벤처 파트너 포카', '태일&아구몬 등 파트너 조합 포토카드 세트', '포카', 8000, 'g026.jpg');
INSERT INTO popup_goods (popup_id, name, description, category, price, thumbnail_url)
VALUES (3, '유유백서 쿠라마 미니 인형', '장미채찍을 든 쿠라마 레트로 스타일 인형', '인형', 9000, 'g027.jpg');
INSERT INTO popup_goods (popup_id, name, description, category, price, thumbnail_url)
VALUES (3, '이누야샤 철쇄아 미니 검 키링', '철쇄아 모양 메탈 키링', '키링', 10000, 'g028.jpg');
INSERT INTO popup_goods (popup_id, name, description, category, price, thumbnail_url)
VALUES (3, '신기동전기 건담W 윙제로 스탠드', '윙제로 버스트 모드 일러스트 아크릴 스탠드', '아크릴스탠드', 11000, 'g029.jpg');
INSERT INTO popup_goods (popup_id, name, description, category, price, thumbnail_url)
VALUES (3, '명탐정 코난 극장판 레트로 포스터 카드', '초기 극장판 포스터 엽서형 카드 세트', '기타', 12000, 'g030.jpg');

INSERT INTO popup_goods (popup_id, name, description, category, price, thumbnail_url)
VALUES (4, 'BTS 컴백 스페셜 포카 세트', '멤버 7인 개인컷과 단체컷 포토카드', '포카', 8000, 'g031.jpg');
INSERT INTO popup_goods (popup_id, name, description, category, price, thumbnail_url)
VALUES (4, '세븐틴 캐럿봉 마스코트 인형', '응원봉 모양 포근한 쿠션 인형', '인형', 9000, 'g032.jpg');
INSERT INTO popup_goods (popup_id, name, description, category, price, thumbnail_url)
VALUES (4, '뉴진스 버니 로고 키링', '버니 로고 실루엣 아크릴 키링', '키링', 10000, 'g033.jpg');
INSERT INTO popup_goods (popup_id, name, description, category, price, thumbnail_url)
VALUES (4, '르세라핌 단체 콘셉트 스탠드', '타이틀 곡 무대 의상 일러스트 스탠드', '아크릴스탠드', 11000, 'g034.jpg');
INSERT INTO popup_goods (popup_id, name, description, category, price, thumbnail_url)
VALUES (4, '아이브 앨범 아트 미니 포스터', '앨범 재킷 일러스트 미니 포스터 3종 세트', '기타', 12000, 'g035.jpg');
INSERT INTO popup_goods (popup_id, name, description, category, price, thumbnail_url)
VALUES (4, '스트레이 키즈 유닛 포카 콜렉션', '유닛별 셀카 포토카드 모음 세트', '포카', 8000, 'g036.jpg');
INSERT INTO popup_goods (popup_id, name, description, category, price, thumbnail_url)
VALUES (4, '에스파 카리나 캐릭터 인형', '아바타 컨셉을 반영한 SD 봉제 인형', '인형', 9000, 'g037.jpg');
INSERT INTO popup_goods (popup_id, name, description, category, price, thumbnail_url)
VALUES (4, '엔하이픈 로고 메탈 키링', '로고 플레이트와 참 장식이 달린 키링', '키링', 10000, 'g038.jpg');
INSERT INTO popup_goods (popup_id, name, description, category, price, thumbnail_url)
VALUES (4, '투모로우바이투게더 스테이지 스탠드', '야간 무대 콘셉트 아크릴 스탠드', '아크릴스탠드', 11000, 'g039.jpg');
INSERT INTO popup_goods (popup_id, name, description, category, price, thumbnail_url)
VALUES (4, 'NCT DREAM 응원 슬로건 패키지', '슬로건 천과 스티커, 포카가 포함된 세트', '기타', 12000, 'g040.jpg');

INSERT INTO popup_goods (popup_id, name, description, category, price, thumbnail_url)
VALUES (1, '밤하늘 피규어 라인업 카드', '팝업 한정 피규어 라인업을 소개하는 포카 세트', '포카', 8000, 'g041.jpg');
INSERT INTO popup_goods (popup_id, name, description, category, price, thumbnail_url)
VALUES (1, '진격의 거인 야간 전투 피규어', '야경 조명 효과가 들어간 엘런 피규어', '인형', 9000, 'g042.jpg');
INSERT INTO popup_goods (popup_id, name, description, category, price, thumbnail_url)
VALUES (1, '주술회전 야간 배틀 SD 피규어 키링', '야간 전투 컨셉 SD 피규어 키링', '키링', 10000, 'g043.jpg');
INSERT INTO popup_goods (popup_id, name, description, category, price, thumbnail_url)
VALUES (1, '체인소맨 네온 시티 디오라마 스탠드', '도시 야경과 덴지가 함께 있는 아크릴 스탠드', '아크릴스탠드', 11000, 'g044.jpg');
INSERT INTO popup_goods (popup_id, name, description, category, price, thumbnail_url)
VALUES (1, '원피스 조로 나이트 버전 피규어', '녹색 오라 연출이 있는 한정판 조로 피규어', '기타', 12000, 'g045.jpg');
INSERT INTO popup_goods (popup_id, name, description, category, price, thumbnail_url)
VALUES (1, '피규어 구매 특전 일러스트 카드', '밤하늘 테마 일러스트 특전 포토카드 세트', '포카', 8000, 'g046.jpg');
INSERT INTO popup_goods (popup_id, name, description, category, price, thumbnail_url)
VALUES (1, '귀멸의 칼날 야간 전투 탄지로 피규어', '물의 호흡 이펙트가 있는 프리미엄 피규어', '인형', 9000, 'g047.jpg');
INSERT INTO popup_goods (popup_id, name, description, category, price, thumbnail_url)
VALUES (1, '하이큐 야간 체육관 미니 피규어 키링', '야간 연습 장면을 모티브로 한 키링', '키링', 10000, 'g048.jpg');
INSERT INTO popup_goods (popup_id, name, description, category, price, thumbnail_url)
VALUES (1, '블루록 스타 스트라이커 LED 스탠드', '야간 경기장 배경 LED 아크릴 스탠드', '아크릴스탠드', 11000, 'g049.jpg');
INSERT INTO popup_goods (popup_id, name, description, category, price, thumbnail_url)
VALUES (1, '은하철도999 디오라마 피규어 세트', '기차와 별자리를 표현한 디오라마 피규어', '기타', 12000, 'g050.jpg');

INSERT INTO popup_goods (popup_id, name, description, category, price, thumbnail_url)
VALUES (2, '나루토 아트 엽서 포카 세트', '원화 느낌 일러스트를 담은 엽서형 포토카드', '포카', 8000, 'g051.jpg');
INSERT INTO popup_goods (popup_id, name, description, category, price, thumbnail_url)
VALUES (2, '굿즈 캔버스 마스코트 인형', '브랜드 마스코트 일러스트가 새겨진 쿠션 인형', '인형', 9000, 'g052.jpg');
INSERT INTO popup_goods (popup_id, name, description, category, price, thumbnail_url)
VALUES (2, '원피스 캔버스 로고 키링', '붓터치 스타일 로고가 인쇄된 키링', '키링', 10000, 'g053.jpg');
INSERT INTO popup_goods (popup_id, name, description, category, price, thumbnail_url)
VALUES (2, '귀멸의 칼날 수채화 아크릴 스탠드', '수채화 느낌 배경과 캐릭터가 있는 스탠드', '아크릴스탠드', 11000, 'g054.jpg');
INSERT INTO popup_goods (popup_id, name, description, category, price, thumbnail_url)
VALUES (2, '체인소맨 B2 아트 포스터', '전시용으로도 좋은 대형 아트 포스터', '기타', 12000, 'g055.jpg');
INSERT INTO popup_goods (popup_id, name, description, category, price, thumbnail_url)
VALUES (2, '블루록 콘셉트 아트 포카', '컨셉 아트 원화를 바탕으로 한 포토카드', '포카', 8000, 'g056.jpg');
INSERT INTO popup_goods (popup_id, name, description, category, price, thumbnail_url)
VALUES (2, '하이큐 볼 아트 쿠션', '일러스트가 인쇄된 배구공 모양 쿠션 인형', '인형', 9000, 'g057.jpg');
INSERT INTO popup_goods (popup_id, name, description, category, price, thumbnail_url)
VALUES (2, '주술회전 캘리그라피 로고 키링', '붓글씨 로고와 부적 디자인이 들어간 키링', '키링', 10000, 'g058.jpg');
INSERT INTO popup_goods (popup_id, name, description, category, price, thumbnail_url)
VALUES (2, '진격의 거인 스케치 아크릴 패널', '연필 스케치 스타일 일러스트 스탠드', '아크릴스탠드', 11000, 'g059.jpg');
INSERT INTO popup_goods (popup_id, name, description, category, price, thumbnail_url)
VALUES (2, '스파이 패밀리 한정 아트 프린트 세트', '고급 용지에 인쇄된 아트 프린트 3종', '기타', 12000, 'g060.jpg');

INSERT INTO popup_goods (popup_id, name, description, category, price, thumbnail_url)
VALUES (3, '서머 비치 콘셉트 포카 세트', '여름 해변 배경의 캐릭터 포토카드 모음', '포카', 8000, 'g061.jpg');
INSERT INTO popup_goods (popup_id, name, description, category, price, thumbnail_url)
VALUES (3, '원피스 초파 서머 인형', '수박 모자와 튜브를 낀 초파 봉제 인형', '인형', 9000, 'g062.jpg');
INSERT INTO popup_goods (popup_id, name, description, category, price, thumbnail_url)
VALUES (3, '블루록 서머 유니폼 키링', '여름 한정 유니폼 일러스트 아크릴 키링', '키링', 10000, 'g063.jpg');
INSERT INTO popup_goods (popup_id, name, description, category, price, thumbnail_url)
VALUES (3, '하이큐 해변 배구 아크릴 스탠드', '해변에서 스파이크하는 장면을 담은 스탠드', '아크릴스탠드', 11000, 'g064.jpg');
INSERT INTO popup_goods (popup_id, name, description, category, price, thumbnail_url)
VALUES (3, '귀멸의 칼날 여름 유카타 부채', '유카타 차림 캐릭터가 그려진 접이식 부채', '기타', 12000, 'g065.jpg');
INSERT INTO popup_goods (popup_id, name, description, category, price, thumbnail_url)
VALUES (3, '체인소맨 서머 일러스트 포카', '바다 배경 일러스트 특전 포토카드', '포카', 8000, 'g066.jpg');
INSERT INTO popup_goods (popup_id, name, description, category, price, thumbnail_url)
VALUES (3, '프리! 수영부 튜브 인형', '튜브를 낀 마스코트 캐릭터 봉제 인형', '인형', 9000, 'g067.jpg');
INSERT INTO popup_goods (popup_id, name, description, category, price, thumbnail_url)
VALUES (3, '나루토 여름 축제 유카타 키링', '유카타 차림 나루토 아크릴 키링', '키링', 10000, 'g068.jpg');
INSERT INTO popup_goods (popup_id, name, description, category, price, thumbnail_url)
VALUES (3, '스파이 패밀리 아이스바 스탠드', '아이스바를 들고 있는 아냐 일러스트 스탠드', '아크릴스탠드', 11000, 'g069.jpg');
INSERT INTO popup_goods (popup_id, name, description, category, price, thumbnail_url)
VALUES (3, '진격의 거인 바캉스 타월', '해변 패러디 일러스트가 인쇄된 핸드 타월', '기타', 12000, 'g070.jpg');

INSERT INTO popup_goods (popup_id, name, description, category, price, thumbnail_url)
VALUES (4, '대구 한정 베스트 포카 세트', '전국 원정전 인기 캐릭터만 모은 포카 세트', '포카', 8000, 'g071.jpg');
INSERT INTO popup_goods (popup_id, name, description, category, price, thumbnail_url)
VALUES (4, '귀멸의 칼날 탄지로&네즈코 인형', '둘이 함께 있는 커플 세트 봉제 인형', '인형', 9000, 'g072.jpg');
INSERT INTO popup_goods (popup_id, name, description, category, price, thumbnail_url)
VALUES (4, '원피스 루피 기어5 키링', '기어5 폼을 표현한 아크릴 키링', '키링', 10000, 'g073.jpg');
INSERT INTO popup_goods (popup_id, name, description, category, price, thumbnail_url)
VALUES (4, '블루록 이사기&바치라 스탠드', '2인 콤비 일러스트 아크릴 스탠드', '아크릴스탠드', 11000, 'g074.jpg');
INSERT INTO popup_goods (popup_id, name, description, category, price, thumbnail_url)
VALUES (4, '나루토 베스트 일러스트 엽서북', '명장면 일러스트를 모은 엽서북', '기타', 12000, 'g075.jpg');
INSERT INTO popup_goods (popup_id, name, description, category, price, thumbnail_url)
VALUES (4, '하이큐 베스트 매치 포카', '명경기 장면만 모은 포토카드 세트', '포카', 8000, 'g076.jpg');
INSERT INTO popup_goods (popup_id, name, description, category, price, thumbnail_url)
VALUES (4, '주술회전 이누마키 마스코트 인형', '온리 톡 캐릭터를 담은 SD 봉제 인형', '인형', 9000, 'g077.jpg');
INSERT INTO popup_goods (popup_id, name, description, category, price, thumbnail_url)
VALUES (4, '체인소맨 파워 피규어 키링', '파워 SD 피규어 스타일 아크릴 키링', '키링', 10000, 'g078.jpg');
INSERT INTO popup_goods (popup_id, name, description, category, price, thumbnail_url)
VALUES (4, '진격의 거인 최종 시즌 스탠드', '최종 시즌 메인 비주얼 아크릴 스탠드', '아크릴스탠드', 11000, 'g079.jpg');
INSERT INTO popup_goods (popup_id, name, description, category, price, thumbnail_url)
VALUES (4, '스파이 패밀리 베스트 컷 클리어파일', '명장면 컷이 인쇄된 클리어파일 세트', '기타', 12000, 'g080.jpg');

INSERT INTO popup_goods (popup_id, name, description, category, price, thumbnail_url)
VALUES (1, '아트토이 작가 라인업 카드', '참여 크리에이터와 시그니처 캐릭터를 소개하는 카드 세트', '포카', 8000, 'g081.jpg');
INSERT INTO popup_goods (popup_id, name, description, category, price, thumbnail_url)
VALUES (1, '우주 토끼 아트토이 인형', '은하 배경이 어울리는 오리지널 토끼 캐릭터 인형', '인형', 9000, 'g082.jpg');
INSERT INTO popup_goods (popup_id, name, description, category, price, thumbnail_url)
VALUES (1, '네온 슬라임 몬스터 키링', '야광으로 빛나는 슬라임 몬스터 피규어 키링', '키링', 10000, 'g083.jpg');
INSERT INTO popup_goods (popup_id, name, description, category, price, thumbnail_url)
VALUES (1, '메카 아트 로봇 아크릴 스탠드', '로봇 애니메이션에서 영감을 받은 오리지널 메카 스탠드', '아크릴스탠드', 11000, 'g084.jpg');
INSERT INTO popup_goods (popup_id, name, description, category, price, thumbnail_url)
VALUES (1, '인디 아티스트 사인 카드&스티커', '작가 사인 카드와 스티커가 함께 들어 있는 세트', '기타', 12000, 'g085.jpg');
INSERT INTO popup_goods (popup_id, name, description, category, price, thumbnail_url)
VALUES (1, '에반게리온 스타일 아트 카드', '에반게리온 분위기를 오마주한 일러스트 카드 세트', '포카', 8000, 'g086.jpg');
INSERT INTO popup_goods (popup_id, name, description, category, price, thumbnail_url)
VALUES (1, '구름 곰돌이 아트토이 피규어', '몽글몽글한 구름 질감을 표현한 곰돌이 피규어', '인형', 9000, 'g087.jpg');
INSERT INTO popup_goods (popup_id, name, description, category, price, thumbnail_url)
VALUES (1, '해파리 유령 글로우 키링', '어두운 곳에서 빛나는 해파리 유령 캐릭터 키링', '키링', 10000, 'g088.jpg');
INSERT INTO popup_goods (popup_id, name, description, category, price, thumbnail_url)
VALUES (1, '스팀펑크 소녀 일러스트 스탠드', '기어 장식이 가득한 스팀펑크 소녀 아크릴 아트', '아크릴스탠드', 11000, 'g089.jpg');
INSERT INTO popup_goods (popup_id, name, description, category, price, thumbnail_url)
VALUES (1, '한정 아트토이 미니 포스터 세트', '아트토이 주인공들이 그려진 미니 포스터 3종', '기타', 12000, 'g090.jpg');

INSERT INTO popup_goods (popup_id, name, description, category, price, thumbnail_url)
VALUES (2, '할로윈 코스튬 애니 포카 세트', '여러 작품 캐릭터가 분장한 할로윈 포토카드', '포카', 8000, 'g091.jpg');
INSERT INTO popup_goods (popup_id, name, description, category, price, thumbnail_url)
VALUES (2, '귀멸의 칼날 네즈코 박쥐 망토 인형', '박쥐 망토를 두른 네즈코 할로윈 버전 인형', '인형', 9000, 'g092.jpg');
INSERT INTO popup_goods (popup_id, name, description, category, price, thumbnail_url)
VALUES (2, '주술회전 고죠 할로윈 키링', '호박 모자를 쓴 고죠 캐릭터 아크릴 키링', '키링', 10000, 'g093.jpg');
INSERT INTO popup_goods (popup_id, name, description, category, price, thumbnail_url)
VALUES (2, '체인소맨 할로윈 호러 스탠드', '호러 무비 포스터 느낌의 체인소맨 아크릴 스탠드', '아크릴스탠드', 11000, 'g094.jpg');
INSERT INTO popup_goods (popup_id, name, description, category, price, thumbnail_url)
VALUES (2, '원피스 해골 호박 스티커 팩', '조로·루피가 등장하는 해골 호박 스티커 세트', '기타', 12000, 'g095.jpg');
INSERT INTO popup_goods (popup_id, name, description, category, price, thumbnail_url)
VALUES (2, '나루토&사쿠라 할로윈 포카', '할로윈 파티 의상의 나루토와 사쿠라 포토카드', '포카', 8000, 'g096.jpg');
INSERT INTO popup_goods (popup_id, name, description, category, price, thumbnail_url)
VALUES (2, '진격의 거인 유령 거인 인형', '유령 시트를 쓴 거인 콘셉트 봉제 인형', '인형', 9000, 'g097.jpg');
INSERT INTO popup_goods (popup_id, name, description, category, price, thumbnail_url)
VALUES (2, '스파이 패밀리 아냐 마녀 키링', '마녀 모자를 쓴 아냐 SD 캐릭터 키링', '키링', 10000, 'g098.jpg');
INSERT INTO popup_goods (popup_id, name, description, category, price, thumbnail_url)
VALUES (2, '블루록 뱀파이어 유니폼 스탠드', '뱀파이어 콘셉트 유니폼 일러스트 아크릴 스탠드', '아크릴스탠드', 11000, 'g099.jpg');
INSERT INTO popup_goods (popup_id, name, description, category, price, thumbnail_url)
VALUES (2, '하이큐 호러 나이트 포스터 세트', '체육관을 배경으로 한 호러 컨셉 일러스트 포스터', '기타', 12000, 'g100.jpg');
-- 채팅방 20개
INSERT INTO TKK.trade_chat_room ( trade_id, seller_id, buyer_id, created_at, last_message_at,BUYER_LEFT_YN,SELLER_LEFT_YN)
VALUES ( 1, 1, 21, SYSDATE - 20, SYSDATE - 19,'N','N');

INSERT INTO TKK.trade_chat_room ( trade_id, seller_id, buyer_id, created_at, last_message_at,BUYER_LEFT_YN,SELLER_LEFT_YN)
VALUES ( 2, 2, 22, SYSDATE - 19, SYSDATE - 18,'N','N');

INSERT INTO TKK.trade_chat_room ( trade_id, seller_id, buyer_id, created_at, last_message_at,BUYER_LEFT_YN,SELLER_LEFT_YN)
VALUES ( 3, 3, 23, SYSDATE - 18, SYSDATE - 17,'N','N');

INSERT INTO TKK.trade_chat_room ( trade_id, seller_id, buyer_id, created_at, last_message_at,BUYER_LEFT_YN,SELLER_LEFT_YN)
VALUES ( 4, 4, 24, SYSDATE - 17, SYSDATE - 16,'N','N');

INSERT INTO TKK.trade_chat_room ( trade_id, seller_id, buyer_id, created_at, last_message_at,BUYER_LEFT_YN,SELLER_LEFT_YN)
VALUES (5, 5, 25, SYSDATE - 16, SYSDATE - 15,'N','N');

INSERT INTO TKK.trade_chat_room ( trade_id, seller_id, buyer_id, created_at, last_message_at,BUYER_LEFT_YN,SELLER_LEFT_YN)
VALUES (6, 6, 26, SYSDATE - 15, SYSDATE - 14,'N','N');

INSERT INTO TKK.trade_chat_room ( trade_id, seller_id, buyer_id, created_at, last_message_at,BUYER_LEFT_YN,SELLER_LEFT_YN)
VALUES ( 7, 7, 27, SYSDATE - 14, SYSDATE - 13,'N','N');

INSERT INTO TKK.trade_chat_room ( trade_id, seller_id, buyer_id, created_at, last_message_at,BUYER_LEFT_YN,SELLER_LEFT_YN)
VALUES ( 8, 8, 28, SYSDATE - 13, SYSDATE - 12,'N','N');

INSERT INTO TKK.trade_chat_room ( trade_id, seller_id, buyer_id, created_at, last_message_at,BUYER_LEFT_YN,SELLER_LEFT_YN)
VALUES ( 9, 9, 29, SYSDATE - 12, SYSDATE - 11,'N','N');

INSERT INTO TKK.trade_chat_room ( trade_id, seller_id, buyer_id, created_at, last_message_at,BUYER_LEFT_YN,SELLER_LEFT_YN)
VALUES (10, 10, 30, SYSDATE - 11, SYSDATE - 10,'N','N');

INSERT INTO TKK.trade_chat_room ( trade_id, seller_id, buyer_id, created_at, last_message_at,BUYER_LEFT_YN,SELLER_LEFT_YN)
VALUES (11, 11, 31, SYSDATE - 10, SYSDATE - 9,'N','N');

INSERT INTO TKK.trade_chat_room ( trade_id, seller_id, buyer_id, created_at, last_message_at,BUYER_LEFT_YN,SELLER_LEFT_YN)
VALUES (12, 12, 32, SYSDATE - 9, SYSDATE - 8,'N','N');

INSERT INTO TKK.trade_chat_room ( trade_id, seller_id, buyer_id, created_at, last_message_at,BUYER_LEFT_YN,SELLER_LEFT_YN)
VALUES ( 13, 13, 33, SYSDATE - 8, SYSDATE - 7,'N','N');

INSERT INTO TKK.trade_chat_room ( trade_id, seller_id, buyer_id, created_at, last_message_at,BUYER_LEFT_YN,SELLER_LEFT_YN)
VALUES ( 14, 14, 34, SYSDATE - 7, SYSDATE - 6,'N','N');

INSERT INTO TKK.trade_chat_room ( trade_id, seller_id, buyer_id, created_at, last_message_at,BUYER_LEFT_YN,SELLER_LEFT_YN)
VALUES ( 15, 15, 35, SYSDATE - 6, SYSDATE - 5,'N','N');

INSERT INTO TKK.trade_chat_room ( trade_id, seller_id, buyer_id, created_at, last_message_at,BUYER_LEFT_YN,SELLER_LEFT_YN)
VALUES (16, 16, 36, SYSDATE - 5, SYSDATE - 4,'N','N');

INSERT INTO TKK.trade_chat_room ( trade_id, seller_id, buyer_id, created_at, last_message_at,BUYER_LEFT_YN,SELLER_LEFT_YN)
VALUES (17, 17, 37, SYSDATE - 4, SYSDATE - 3,'N','N');

INSERT INTO TKK.trade_chat_room ( trade_id, seller_id, buyer_id, created_at, last_message_at,BUYER_LEFT_YN,SELLER_LEFT_YN)
VALUES (18, 18, 38, SYSDATE - 3, SYSDATE - 2,'N','N');

INSERT INTO TKK.trade_chat_room ( trade_id, seller_id, buyer_id, created_at, last_message_at,BUYER_LEFT_YN,SELLER_LEFT_YN)
VALUES ( 19, 19, 39, SYSDATE - 2, SYSDATE - 1,'N','N');

INSERT INTO TKK.trade_chat_room ( trade_id, seller_id, buyer_id, created_at, last_message_at,BUYER_LEFT_YN,SELLER_LEFT_YN)
VALUES ( 20, 20, 40, SYSDATE - 1, SYSDATE,'N','N');
-- Room 1 (seller 1, buyer 21) - 10 messages
INSERT INTO TKK.trade_chat_message (room_id, sender_id, message, read_yn)
VALUES (1, 21, '안녕하세요, 아직 거래 가능할까요? (room 1-1)', 'Y');
INSERT INTO TKK.trade_chat_message (room_id, sender_id, message, read_yn)
VALUES (1, 1, '네, 아직 가능해요. (room 1-2)', 'Y');
INSERT INTO TKK.trade_chat_message (room_id, sender_id, message, read_yn)
VALUES (1, 21, '직거래 가능한가요? (room 1-3)', 'Y');
INSERT INTO TKK.trade_chat_message (room_id, sender_id, message, read_yn)
VALUES (1, 1, '네, OO역 근처에서 만나면 될 것 같아요. (room 1-4)', 'Y');
INSERT INTO TKK.trade_chat_message (room_id, sender_id, message, read_yn)
VALUES (1, 21, '토요일 오후 괜찮으세요? (room 1-5)', 'Y');
INSERT INTO TKK.trade_chat_message (room_id, sender_id, message, read_yn)
VALUES (1, 1, '토요일 3시 괜찮습니다. (room 1-6)', 'Y');
INSERT INTO TKK.trade_chat_message (room_id, sender_id, message, read_yn)
VALUES (1, 21, '네, 그때 뵙겠습니다! (room 1-7)', 'Y');
INSERT INTO TKK.trade_chat_message (room_id, sender_id, message, read_yn)
VALUES (1, 1, '혹시 현금 결제 맞으실까요? (room 1-8)', 'Y');
INSERT INTO TKK.trade_chat_message (room_id, sender_id, message, read_yn)
VALUES (1, 21, '네, 현금으로 준비하겠습니다. (room 1-9)', 'N');
INSERT INTO TKK.trade_chat_message (room_id, sender_id, message, read_yn)
VALUES (1, 1, '알겠습니다, 감사합니다. (room 1-10)', 'N');


-- Room 2 (seller 2, buyer 22) - 10 messages
INSERT INTO TKK.trade_chat_message (room_id, sender_id, message, read_yn)
VALUES (2, 22, '안녕하세요, 아직 거래 가능할까요? (room 2-1)', 'Y');
INSERT INTO TKK.trade_chat_message (room_id, sender_id, message, read_yn)
VALUES (2, 2, '네, 가능해요. 어떤 방식 선호하시나요? (room 2-2)', 'Y');
INSERT INTO TKK.trade_chat_message (room_id, sender_id, message, read_yn)
VALUES (2, 22, '직거래가 편해서요. (room 2-3)', 'Y');
INSERT INTO TKK.trade_chat_message (room_id, sender_id, message, read_yn)
VALUES (2, 2, '그럼 홍대 입구역에서 만날까요? (room 2-4)', 'Y');
INSERT INTO TKK.trade_chat_message (room_id, sender_id, message, read_yn)
VALUES (2, 22, '네, 홍대 입구역 좋아요. (room 2-5)', 'Y');
INSERT INTO TKK.trade_chat_message (room_id, sender_id, message, read_yn)
VALUES (2, 2, '시간은 오후 2시 어떠세요? (room 2-6)', 'Y');
INSERT INTO TKK.trade_chat_message (room_id, sender_id, message, read_yn)
VALUES (2, 22, '2시 괜찮습니다. (room 2-7)', 'Y');
INSERT INTO TKK.trade_chat_message (room_id, sender_id, message, read_yn)
VALUES (2, 2, '혹시 포장 따로 필요하신가요? (room 2-8)', 'Y');
INSERT INTO TKK.trade_chat_message (room_id, sender_id, message, read_yn)
VALUES (2, 22, '아니요, 그냥 그대로만 가져와 주세요. (room 2-9)', 'N');
INSERT INTO TKK.trade_chat_message (room_id, sender_id, message, read_yn)
VALUES (2, 2, '넵 알겠습니다. (room 2-10)', 'N');


-- Room 3 (seller 3, buyer 23)
INSERT INTO TKK.trade_chat_message (room_id, sender_id, message, read_yn)
VALUES (3, 23, '안녕하세요, 사진이랑 동일한 상태인가요? (room 3-1)', 'Y');
INSERT INTO TKK.trade_chat_message (room_id, sender_id, message, read_yn)
VALUES (3, 3, '네, 사용감 거의 없습니다. (room 3-2)', 'Y');
INSERT INTO TKK.trade_chat_message (room_id, sender_id, message, read_yn)
VALUES (3, 23, '혹시 미개봉인가요? (room 3-3)', 'Y');
INSERT INTO TKK.trade_chat_message (room_id, sender_id, message, read_yn)
VALUES (3, 3, '미개봉은 아니고 전시만 했어요. (room 3-4)', 'Y');
INSERT INTO TKK.trade_chat_message (room_id, sender_id, message, read_yn)
VALUES (3, 23, '알겠습니다. 직거래 원합니다. (room 3-5)', 'Y');
INSERT INTO TKK.trade_chat_message (room_id, sender_id, message, read_yn)
VALUES (3, 3, '강남역 근처 가능하신가요? (room 3-6)', 'Y');
INSERT INTO TKK.trade_chat_message (room_id, sender_id, message, read_yn)
VALUES (3, 23, '네, 강남역으로 갈게요. (room 3-7)', 'Y');
INSERT INTO TKK.trade_chat_message (room_id, sender_id, message, read_yn)
VALUES (3, 3, '좋아요. 자세한 출구는 다시 말씀드릴게요. (room 3-8)', 'Y');
INSERT INTO TKK.trade_chat_message (room_id, sender_id, message, read_yn)
VALUES (3, 23, '네, 감사합니다! (room 3-9)', 'N');
INSERT INTO TKK.trade_chat_message (room_id, sender_id, message, read_yn)
VALUES (3, 3, '그때 뵙겠습니다. (room 3-10)', 'N');


-- Room 4 (seller 4, buyer 24)
INSERT INTO TKK.trade_chat_message (room_id, sender_id, message, read_yn)
VALUES (4, 24, '안녕하세요, 가격 네고 가능할까요? (room 4-1)', 'Y');
INSERT INTO TKK.trade_chat_message (room_id, sender_id, message, read_yn)
VALUES (4, 4, '소폭 네고 가능합니다. 어느 정도 생각하시나요? (room 4-2)', 'Y');
INSERT INTO TKK.trade_chat_message (room_id, sender_id, message, read_yn)
VALUES (4, 24, '1만원 정도 가능할까요? (room 4-3)', 'Y');
INSERT INTO TKK.trade_chat_message (room_id, sender_id, message, read_yn)
VALUES (4, 4, '그 정도면 괜찮습니다. (room 4-4)', 'Y');
INSERT INTO TKK.trade_chat_message (room_id, sender_id, message, read_yn)
VALUES (4, 24, '감사합니다. 택배로 받고 싶어요. (room 4-5)', 'Y');
INSERT INTO TKK.trade_chat_message (room_id, sender_id, message, read_yn)
VALUES (4, 4, '택배비는 포함해서 1만5천원 어떠세요? (room 4-6)', 'Y');
INSERT INTO TKK.trade_chat_message (room_id, sender_id, message, read_yn)
VALUES (4, 24, '네 그렇게 할게요. (room 4-7)', 'Y');
INSERT INTO TKK.trade_chat_message (room_id, sender_id, message, read_yn)
VALUES (4, 4, '입금 후 주소 알려주세요. (room 4-8)', 'Y');
INSERT INTO TKK.trade_chat_message (room_id, sender_id, message, read_yn)
VALUES (4, 24, '계좌 알려주시면 바로 입금할게요. (room 4-9)', 'N');
INSERT INTO TKK.trade_chat_message (room_id, sender_id, message, read_yn)
VALUES (4, 4, '네, 계좌 보내드렸습니다. (room 4-10)', 'N');


-- Room 5 (seller 5, buyer 25)
INSERT INTO TKK.trade_chat_message (room_id, sender_id, message, read_yn)
VALUES (5, 25, '안녕하세요, 상태가 궁금해서 연락드렸어요. (room 5-1)', 'Y');
INSERT INTO TKK.trade_chat_message (room_id, sender_id, message, read_yn)
VALUES (5, 5, '박스까지 보관 중이고 훼손 없습니다. (room 5-2)', 'Y');
INSERT INTO TKK.trade_chat_message (room_id, sender_id, message, read_yn)
VALUES (5, 25, '실물 사진 한 장 더 받을 수 있을까요? (room 5-3)', 'Y');
INSERT INTO TKK.trade_chat_message (room_id, sender_id, message, read_yn)
VALUES (5, 5, '네, 조금 뒤에 찍어서 보내드릴게요. (room 5-4)', 'Y');
INSERT INTO TKK.trade_chat_message (room_id, sender_id, message, read_yn)
VALUES (5, 25, '감사합니다! (room 5-5)', 'Y');
INSERT INTO TKK.trade_chat_message (room_id, sender_id, message, read_yn)
VALUES (5, 5, '사진 첨부드렸습니다. (room 5-6)', 'Y');
INSERT INTO TKK.trade_chat_message (room_id, sender_id, message, read_yn)
VALUES (5, 25, '상태 좋아 보여서 구매 원합니다. (room 5-7)', 'Y');
INSERT INTO TKK.trade_chat_message (room_id, sender_id, message, read_yn)
VALUES (5, 5, '그럼 직거래/택배 중 어떤 게 좋으세요? (room 5-8)', 'Y');
INSERT INTO TKK.trade_chat_message (room_id, sender_id, message, read_yn)
VALUES (5, 25, '직거래로 진행하고 싶어요. (room 5-9)', 'N');
INSERT INTO TKK.trade_chat_message (room_id, sender_id, message, read_yn)
VALUES (5, 5, '네, 장소는 홍대 근처로 할게요. (room 5-10)', 'N');


-- Room 6 (seller 6, buyer 26)
INSERT INTO TKK.trade_chat_message (room_id, sender_id, message, read_yn)
VALUES (6, 26, '안녕하세요, 예약 가능 여부 문의드립니다. (room 6-1)', 'Y');
INSERT INTO TKK.trade_chat_message (room_id, sender_id, message, read_yn)
VALUES (6, 6, '네, 오늘 기준으로 예약 가능해요. (room 6-2)', 'Y');
INSERT INTO TKK.trade_chat_message (room_id, sender_id, message, read_yn)
VALUES (6, 26, '그럼 토요일까지 홀드 부탁드립니다. (room 6-3)', 'Y');
INSERT INTO TKK.trade_chat_message (room_id, sender_id, message, read_yn)
VALUES (6, 6, '토요일까지 홀드해두겠습니다. (room 6-4)', 'Y');
INSERT INTO TKK.trade_chat_message (room_id, sender_id, message, read_yn)
VALUES (6, 26, '감사합니다! (room 6-5)', 'Y');
INSERT INTO TKK.trade_chat_message (room_id, sender_id, message, read_yn)
VALUES (6, 6, '시간 맞춰서 다시 연락 주세요. (room 6-6)', 'Y');
INSERT INTO TKK.trade_chat_message (room_id, sender_id, message, read_yn)
VALUES (6, 26, '네, 그렇게 하겠습니다. (room 6-7)', 'Y');
INSERT INTO TKK.trade_chat_message (room_id, sender_id, message, read_yn)
VALUES (6, 6, '좋은 하루 보내세요. (room 6-8)', 'Y');
INSERT INTO TKK.trade_chat_message (room_id, sender_id, message, read_yn)
VALUES (6, 26, '네, 감사합니다 :) (room 6-9)', 'N');
INSERT INTO TKK.trade_chat_message (room_id, sender_id, message, read_yn)
VALUES (6, 6, '네 :) (room 6-10)', 'N');


-- Room 7 (seller 7, buyer 27)
INSERT INTO TKK.trade_chat_message (room_id, sender_id, message, read_yn)
VALUES (7, 27, '안녕하세요, 혹시 구성품 누락된 거 있나요? (room 7-1)', 'Y');
INSERT INTO TKK.trade_chat_message (room_id, sender_id, message, read_yn)
VALUES (7, 7, '구성품 모두 다 있습니다. (room 7-2)', 'Y');
INSERT INTO TKK.trade_chat_message (room_id, sender_id, message, read_yn)
VALUES (7, 27, '설명서도 포함인가요? (room 7-3)', 'Y');
INSERT INTO TKK.trade_chat_message (room_id, sender_id, message, read_yn)
VALUES (7, 7, '네, 설명서도 같이 드려요. (room 7-4)', 'Y');
INSERT INTO TKK.trade_chat_message (room_id, sender_id, message, read_yn)
VALUES (7, 27, '그럼 구매하겠습니다. (room 7-5)', 'Y');
INSERT INTO TKK.trade_chat_message (room_id, sender_id, message, read_yn)
VALUES (7, 7, '감사합니다. 거래 방식은 어떻게 하실까요? (room 7-6)', 'Y');
INSERT INTO TKK.trade_chat_message (room_id, sender_id, message, read_yn)
VALUES (7, 27, '직거래 원합니다. (room 7-7)', 'Y');
INSERT INTO TKK.trade_chat_message (room_id, sender_id, message, read_yn)
VALUES (7, 7, '그럼 신촌역 근처 어떠세요? (room 7-8)', 'Y');
INSERT INTO TKK.trade_chat_message (room_id, sender_id, message, read_yn)
VALUES (7, 27, '좋습니다. 시간만 조율해요. (room 7-9)', 'N');
INSERT INTO TKK.trade_chat_message (room_id, sender_id, message, read_yn)
VALUES (7, 7, '네, 오후 4시쯤 어떠세요? (room 7-10)', 'N');


-- Room 8 (seller 8, buyer 28)
INSERT INTO TKK.trade_chat_message (room_id, sender_id, message, read_yn)
VALUES (8, 28, '안녕하세요, 상품 아직 보유하고 계신가요? (room 8-1)', 'Y');
INSERT INTO TKK.trade_chat_message (room_id, sender_id, message, read_yn)
VALUES (8, 8, '네, 아직 판매되지 않았습니다. (room 8-2)', 'Y');
INSERT INTO TKK.trade_chat_message (room_id, sender_id, message, read_yn)
VALUES (8, 28, '그럼 구매 예약하고 싶어요. (room 8-3)', 'Y');
INSERT INTO TKK.trade_chat_message (room_id, sender_id, message, read_yn)
VALUES (8, 8, '네, 닉네임 확인했습니다. (room 8-4)', 'Y');
INSERT INTO TKK.trade_chat_message (room_id, sender_id, message, read_yn)
VALUES (8, 28, '계좌 알려주시면 입금할게요. (room 8-5)', 'Y');
INSERT INTO TKK.trade_chat_message (room_id, sender_id, message, read_yn)
VALUES (8, 8, '계좌번호 보내드렸습니다. (room 8-6)', 'Y');
INSERT INTO TKK.trade_chat_message (room_id, sender_id, message, read_yn)
VALUES (8, 28, '방금 입금 완료했습니다. (room 8-7)', 'Y');
INSERT INTO TKK.trade_chat_message (room_id, sender_id, message, read_yn)
VALUES (8, 8, '입금 확인했습니다. 내일 발송할게요. (room 8-8)', 'Y');
INSERT INTO TKK.trade_chat_message (room_id, sender_id, message, read_yn)
VALUES (8, 28, '감사합니다, 기다릴게요. (room 8-9)', 'N');
INSERT INTO TKK.trade_chat_message (room_id, sender_id, message, read_yn)
VALUES (8, 8, '송장 나오면 다시 알려드릴게요. (room 8-10)', 'N');


-- Room 9 (seller 9, buyer 29)
INSERT INTO TKK.trade_chat_message (room_id, sender_id, message, read_yn)
VALUES (9, 29, '안녕하세요, 실사진 추가 부탁드려도 될까요? (room 9-1)', 'Y');
INSERT INTO TKK.trade_chat_message (room_id, sender_id, message, read_yn)
VALUES (9, 9, '네, 지금 바로 찍어서 보내드릴게요. (room 9-2)', 'Y');
INSERT INTO TKK.trade_chat_message (room_id, sender_id, message, read_yn)
VALUES (9, 29, '사진 잘 받았습니다. (room 9-3)', 'Y');
INSERT INTO TKK.trade_chat_message (room_id, sender_id, message, read_yn)
VALUES (9, 9, '괜찮으신가요? (room 9-4)', 'Y');
INSERT INTO TKK.trade_chat_message (room_id, sender_id, message, read_yn)
VALUES (9, 29, '네, 구매 원합니다. (room 9-5)', 'Y');
INSERT INTO TKK.trade_chat_message (room_id, sender_id, message, read_yn)
VALUES (9, 9, '감사합니다. 직거래로 하실까요? (room 9-6)', 'Y');
INSERT INTO TKK.trade_chat_message (room_id, sender_id, message, read_yn)
VALUES (9, 29, '네, 직거래가 좋아요. (room 9-7)', 'Y');
INSERT INTO TKK.trade_chat_message (room_id, sender_id, message, read_yn)
VALUES (9, 9, '역 근처 카페에서 뵈어요. (room 9-8)', 'Y');
INSERT INTO TKK.trade_chat_message (room_id, sender_id, message, read_yn)
VALUES (9, 29, '알겠습니다, 감사합니다. (room 9-9)', 'N');
INSERT INTO TKK.trade_chat_message (room_id, sender_id, message, read_yn)
VALUES (9, 9, '네, 그날 뵙겠습니다. (room 9-10)', 'N');


-- Room 10 (seller 10, buyer 30)
INSERT INTO TKK.trade_chat_message (room_id, sender_id, message, read_yn)
VALUES (10, 30, '안녕하세요, 혹시 오늘 거래 가능하신가요? (room 10-1)', 'Y');
INSERT INTO TKK.trade_chat_message (room_id, sender_id, message, read_yn)
VALUES (10, 10, '오늘 저녁은 가능합니다. (room 10-2)', 'Y');
INSERT INTO TKK.trade_chat_message (room_id, sender_id, message, read_yn)
VALUES (10, 30, '그럼 7시쯤 어떠세요? (room 10-3)', 'Y');
INSERT INTO TKK.trade_chat_message (room_id, sender_id, message, read_yn)
VALUES (10, 10, '7시 좋습니다. (room 10-4)', 'Y');
INSERT INTO TKK.trade_chat_message (room_id, sender_id, message, read_yn)
VALUES (10, 30, '장소는 어디가 편하신가요? (room 10-5)', 'Y');
INSERT INTO TKK.trade_chat_message (room_id, sender_id, message, read_yn)
VALUES (10, 10, '강남역 11번 출구 앞이 편합니다. (room 10-6)', 'Y');
INSERT INTO TKK.trade_chat_message (room_id, sender_id, message, read_yn)
VALUES (10, 30, '그쪽으로 가겠습니다. (room 10-7)', 'Y');
INSERT INTO TKK.trade_chat_message (room_id, sender_id, message, read_yn)
VALUES (10, 10, '도착하시면 채팅 한 번만 주세요. (room 10-8)', 'Y');
INSERT INTO TKK.trade_chat_message (room_id, sender_id, message, read_yn)
VALUES (10, 30, '네, 도착하면 연락드릴게요. (room 10-9)', 'N');
INSERT INTO TKK.trade_chat_message (room_id, sender_id, message, read_yn)
VALUES (10, 10, '네 알겠습니다. (room 10-10)', 'N');
-- Room 11 (seller 11, buyer 31)
INSERT INTO TKK.trade_chat_message (room_id, sender_id, message, read_yn)
VALUES (11, 31, '안녕하세요, 게시글 보고 연락드렸어요. (room 11-1)', 'Y');
INSERT INTO TKK.trade_chat_message (room_id, sender_id, message, read_yn)
VALUES (11, 11, '안녕하세요, 문의 감사합니다. (room 11-2)', 'Y');
INSERT INTO TKK.trade_chat_message (room_id, sender_id, message, read_yn)
VALUES (11, 31, '혹시 박스 모서리 찢어진 부분은 없나요? (room 11-3)', 'Y');
INSERT INTO TKK.trade_chat_message (room_id, sender_id, message, read_yn)
VALUES (11, 11, '네, 박스 상태도 깨끗합니다. (room 11-4)', 'Y');
INSERT INTO TKK.trade_chat_message (room_id, sender_id, message, read_yn)
VALUES (11, 31, '그럼 구매하고 싶습니다. (room 11-5)', 'Y');
INSERT INTO TKK.trade_chat_message (room_id, sender_id, message, read_yn)
VALUES (11, 11, '감사합니다. 직거래 원하시나요, 택배 원하시나요? (room 11-6)', 'Y');
INSERT INTO TKK.trade_chat_message (room_id, sender_id, message, read_yn)
VALUES (11, 31, '직거래가 좋아요. (room 11-7)', 'Y');
INSERT INTO TKK.trade_chat_message (room_id, sender_id, message, read_yn)
VALUES (11, 11, '그럼 홍대입구역 8번 출구 근처 어떠세요? (room 11-8)', 'Y');
INSERT INTO TKK.trade_chat_message (room_id, sender_id, message, read_yn)
VALUES (11, 31, '네, 그쪽으로 가겠습니다. (room 11-9)', 'N');
INSERT INTO TKK.trade_chat_message (room_id, sender_id, message, read_yn)
VALUES (11, 11, '도착하시면 채팅 한번 남겨주세요. (room 11-10)', 'N');


-- Room 12 (seller 12, buyer 32)
INSERT INTO TKK.trade_chat_message (room_id, sender_id, message, read_yn)
VALUES (12, 32, '안녕하세요, 상품 상태 문의드립니다. (room 12-1)', 'Y');
INSERT INTO TKK.trade_chat_message (room_id, sender_id, message, read_yn)
VALUES (12, 12, '사용감 거의 없는 상태입니다. (room 12-2)', 'Y');
INSERT INTO TKK.trade_chat_message (room_id, sender_id, message, read_yn)
VALUES (12, 32, '혹시 하자 있는 부분이 있을까요? (room 12-3)', 'Y');
INSERT INTO TKK.trade_chat_message (room_id, sender_id, message, read_yn)
VALUES (12, 12, '눈에 띄는 스크래치는 없습니다. (room 12-4)', 'Y');
INSERT INTO TKK.trade_chat_message (room_id, sender_id, message, read_yn)
VALUES (12, 32, '그럼 택배 거래 가능할까요? (room 12-5)', 'Y');
INSERT INTO TKK.trade_chat_message (room_id, sender_id, message, read_yn)
VALUES (12, 12, '네, 선불 택배로 보내드립니다. (room 12-6)', 'Y');
INSERT INTO TKK.trade_chat_message (room_id, sender_id, message, read_yn)
VALUES (12, 32, '입금 후 주소 보내드릴게요. (room 12-7)', 'Y');
INSERT INTO TKK.trade_chat_message (room_id, sender_id, message, read_yn)
VALUES (12, 12, '네, 계좌번호 먼저 보내드릴게요. (room 12-8)', 'Y');
INSERT INTO TKK.trade_chat_message (room_id, sender_id, message, read_yn)
VALUES (12, 32, '입금 완료했습니다, 확인 부탁드려요. (room 12-9)', 'N');
INSERT INTO TKK.trade_chat_message (room_id, sender_id, message, read_yn)
VALUES (12, 12, '확인했습니다. 내일 발송 후 송장 보내드릴게요. (room 12-10)', 'N');


-- Room 13 (seller 13, buyer 33)
INSERT INTO TKK.trade_chat_message (room_id, sender_id, message, read_yn)
VALUES (13, 33, '안녕하세요, 오늘 저녁 직거래 가능하신가요? (room 13-1)', 'Y');
INSERT INTO TKK.trade_chat_message (room_id, sender_id, message, read_yn)
VALUES (13, 13, '오늘 7시 이후로는 가능합니다. (room 13-2)', 'Y');
INSERT INTO TKK.trade_chat_message (room_id, sender_id, message, read_yn)
VALUES (13, 33, '그럼 7시 30분은 어떠세요? (room 13-3)', 'Y');
INSERT INTO TKK.trade_chat_message (room_id, sender_id, message, read_yn)
VALUES (13, 13, '네, 7시 30분으로 맞추겠습니다. (room 13-4)', 'Y');
INSERT INTO TKK.trade_chat_message (room_id, sender_id, message, read_yn)
VALUES (13, 33, '장소는 어디로 가면 될까요? (room 13-5)', 'Y');
INSERT INTO TKK.trade_chat_message (room_id, sender_id, message, read_yn)
VALUES (13, 13, '신촌역 2번 출구 근처 카페 앞에서 뵐까요? (room 13-6)', 'Y');
INSERT INTO TKK.trade_chat_message (room_id, sender_id, message, read_yn)
VALUES (13, 33, '좋습니다, 그 시간에 도착하겠습니다. (room 13-7)', 'Y');
INSERT INTO TKK.trade_chat_message (room_id, sender_id, message, read_yn)
VALUES (13, 13, '도착하시면 프로필 닉네임 알려주세요. (room 13-8)', 'Y');
INSERT INTO TKK.trade_chat_message (room_id, sender_id, message, read_yn)
VALUES (13, 33, '네, 도착 후 채팅 드릴게요. (room 13-9)', 'N');
INSERT INTO TKK.trade_chat_message (room_id, sender_id, message, read_yn)
VALUES (13, 13, '넵, 그때 뵙겠습니다. (room 13-10)', 'N');


-- Room 14 (seller 14, buyer 34)
INSERT INTO TKK.trade_chat_message (room_id, sender_id, message, read_yn)
VALUES (14, 34, '안녕하세요, 사진상 박스 미개봉인가요? (room 14-1)', 'Y');
INSERT INTO TKK.trade_chat_message (room_id, sender_id, message, read_yn)
VALUES (14, 14, '네, 완전 미개봉 상태입니다. (room 14-2)', 'Y');
INSERT INTO TKK.trade_chat_message (room_id, sender_id, message, read_yn)
VALUES (14, 34, '그럼 판매가 확정가인가요? (room 14-3)', 'Y');
INSERT INTO TKK.trade_chat_message (room_id, sender_id, message, read_yn)
VALUES (14, 14, '소폭 네고는 가능합니다. (room 14-4)', 'Y');
INSERT INTO TKK.trade_chat_message (room_id, sender_id, message, read_yn)
VALUES (14, 34, '2천원 정도 네고 가능하실까요? (room 14-5)', 'Y');
INSERT INTO TKK.trade_chat_message (room_id, sender_id, message, read_yn)
VALUES (14, 14, '네, 그 정도는 괜찮습니다. (room 14-6)', 'Y');
INSERT INTO TKK.trade_chat_message (room_id, sender_id, message, read_yn)
VALUES (14, 34, '감사합니다. 택배 거래 원합니다. (room 14-7)', 'Y');
INSERT INTO TKK.trade_chat_message (room_id, sender_id, message, read_yn)
VALUES (14, 14, '택배비 포함해서 금액 다시 안내드릴게요. (room 14-8)', 'Y');
INSERT INTO TKK.trade_chat_message (room_id, sender_id, message, read_yn)
VALUES (14, 34, '네, 계좌 알려주시면 입금하겠습니다. (room 14-9)', 'N');
INSERT INTO TKK.trade_chat_message (room_id, sender_id, message, read_yn)
VALUES (14, 14, '계좌번호 보내드렸어요, 확인 부탁드려요. (room 14-10)', 'N');


-- Room 15 (seller 15, buyer 35)
INSERT INTO TKK.trade_chat_message (room_id, sender_id, message, read_yn)
VALUES (15, 35, '안녕하세요, 교환도 가능하신가요? (room 15-1)', 'Y');
INSERT INTO TKK.trade_chat_message (room_id, sender_id, message, read_yn)
VALUES (15, 15, '네, 동일 작품 굿즈라면 교환 가능해요. (room 15-2)', 'Y');
INSERT INTO TKK.trade_chat_message (room_id, sender_id, message, read_yn)
VALUES (15, 35, '저는 다른 캐릭터 포카를 가지고 있습니다. (room 15-3)', 'Y');
INSERT INTO TKK.trade_chat_message (room_id, sender_id, message, read_yn)
VALUES (15, 15, '사진 한 장 보내주실 수 있나요? (room 15-4)', 'Y');
INSERT INTO TKK.trade_chat_message (room_id, sender_id, message, read_yn)
VALUES (15, 35, '네, 사진 올렸습니다. (room 15-5)', 'Y');
INSERT INTO TKK.trade_chat_message (room_id, sender_id, message, read_yn)
VALUES (15, 15, '괜찮네요, 교환 진행해요. (room 15-6)', 'Y');
INSERT INTO TKK.trade_chat_message (room_id, sender_id, message, read_yn)
VALUES (15, 35, '직거래로 교환하면 될까요? (room 15-7)', 'Y');
INSERT INTO TKK.trade_chat_message (room_id, sender_id, message, read_yn)
VALUES (15, 15, '네, 홍대에서 만나서 교환하죠. (room 15-8)', 'Y');
INSERT INTO TKK.trade_chat_message (room_id, sender_id, message, read_yn)
VALUES (15, 35, '시간은 토요일 오후 어떠세요? (room 15-9)', 'N');
INSERT INTO TKK.trade_chat_message (room_id, sender_id, message, read_yn)
VALUES (15, 15, '네, 토요일 오후에 뵐게요. (room 15-10)', 'N');


-- Room 16 (seller 16, buyer 36)
INSERT INTO TKK.trade_chat_message (room_id, sender_id, message, read_yn)
VALUES (16, 36, '안녕하세요, 예약자 많나요? (room 16-1)', 'Y');
INSERT INTO TKK.trade_chat_message (room_id, sender_id, message, read_yn)
VALUES (16, 16, '지금 한 분 정도 더 문의 중입니다. (room 16-2)', 'Y');
INSERT INTO TKK.trade_chat_message (room_id, sender_id, message, read_yn)
VALUES (16, 36, '혹시 선입금 기준으로 우선인가요? (room 16-3)', 'Y');
INSERT INTO TKK.trade_chat_message (room_id, sender_id, message, read_yn)
VALUES (16, 16, '네, 선입금 순으로 진행하고 있습니다. (room 16-4)', 'Y');
INSERT INTO TKK.trade_chat_message (room_id, sender_id, message, read_yn)
VALUES (16, 36, '그럼 제가 먼저 입금하겠습니다. (room 16-5)', 'Y');
INSERT INTO TKK.trade_chat_message (room_id, sender_id, message, read_yn)
VALUES (16, 16, '감사합니다. 계좌번호 보내드릴게요. (room 16-6)', 'Y');
INSERT INTO TKK.trade_chat_message (room_id, sender_id, message, read_yn)
VALUES (16, 36, '방금 입금했습니다, 확인 부탁드려요. (room 16-7)', 'Y');
INSERT INTO TKK.trade_chat_message (room_id, sender_id, message, read_yn)
VALUES (16, 16, '입금 확인됐습니다. 택배 내일 발송할게요. (room 16-8)', 'Y');
INSERT INTO TKK.trade_chat_message (room_id, sender_id, message, read_yn)
VALUES (16, 36, '네, 송장 나오는 대로 알려주세요. (room 16-9)', 'N');
INSERT INTO TKK.trade_chat_message (room_id, sender_id, message, read_yn)
VALUES (16, 16, '네, 송장번호 나오면 바로 공유드릴게요. (room 16-10)', 'N');


-- Room 17 (seller 17, buyer 37)
INSERT INTO TKK.trade_chat_message (room_id, sender_id, message, read_yn)
VALUES (17, 37, '안녕하세요, 혹시 오늘이 아닌 내일 거래도 가능하신가요? (room 17-1)', 'Y');
INSERT INTO TKK.trade_chat_message (room_id, sender_id, message, read_yn)
VALUES (17, 17, '네, 내일 저녁도 가능합니다. (room 17-2)', 'Y');
INSERT INTO TKK.trade_chat_message (room_id, sender_id, message, read_yn)
VALUES (17, 37, '그럼 내일 6시쯤 어떠세요? (room 17-3)', 'Y');
INSERT INTO TKK.trade_chat_message (room_id, sender_id, message, read_yn)
VALUES (17, 17, '6시 괜찮습니다. (room 17-4)', 'Y');
INSERT INTO TKK.trade_chat_message (room_id, sender_id, message, read_yn)
VALUES (17, 37, '장소는 홍대입구역 근처에서 뵐까요? (room 17-5)', 'Y');
INSERT INTO TKK.trade_chat_message (room_id, sender_id, message, read_yn)
VALUES (17, 17, '네, 9번 출구 근처 카페 앞에서 뵈어요. (room 17-6)', 'Y');
INSERT INTO TKK.trade_chat_message (room_id, sender_id, message, read_yn)
VALUES (17, 37, '알겠습니다, 내일 뵙겠습니다. (room 17-7)', 'Y');
INSERT INTO TKK.trade_chat_message (room_id, sender_id, message, read_yn)
VALUES (17, 17, '네, 오실 때 조심해서 오세요. (room 17-8)', 'Y');
INSERT INTO TKK.trade_chat_message (room_id, sender_id, message, read_yn)
VALUES (17, 37, '네 감사합니다! (room 17-9)', 'N');
INSERT INTO TKK.trade_chat_message (room_id, sender_id, message, read_yn)
VALUES (17, 17, '그럼 내일 뵈어요. (room 17-10)', 'N');


-- Room 18 (seller 18, buyer 38)
INSERT INTO TKK.trade_chat_message (room_id, sender_id, message, read_yn)
VALUES (18, 38, '안녕하세요, 구성품 전체 사진 볼 수 있을까요? (room 18-1)', 'Y');
INSERT INTO TKK.trade_chat_message (room_id, sender_id, message, read_yn)
VALUES (18, 18, '네, 지금 바로 여러 장 찍어서 보내드릴게요. (room 18-2)', 'Y');
INSERT INTO TKK.trade_chat_message (room_id, sender_id, message, read_yn)
VALUES (18, 38, '사진 잘 봤습니다, 상태 아주 좋네요. (room 18-3)', 'Y');
INSERT INTO TKK.trade_chat_message (room_id, sender_id, message, read_yn)
VALUES (18, 18, '감사합니다. 전시만 하고 보관했어요. (room 18-4)', 'Y');
INSERT INTO TKK.trade_chat_message (room_id, sender_id, message, read_yn)
VALUES (18, 38, '그럼 택배로 구매하고 싶습니다. (room 18-5)', 'Y');
INSERT INTO TKK.trade_chat_message (room_id, sender_id, message, read_yn)
VALUES (18, 18, '네, 충전재 넣어서 꼼꼼히 포장해서 보내드릴게요. (room 18-6)', 'Y');
INSERT INTO TKK.trade_chat_message (room_id, sender_id, message, read_yn)
VALUES (18, 38, '입금 완료되면 알려드릴게요. (room 18-7)', 'Y');
INSERT INTO TKK.trade_chat_message (room_id, sender_id, message, read_yn)
VALUES (18, 18, '네, 확인 후 답장 드리겠습니다. (room 18-8)', 'Y');
INSERT INTO TKK.trade_chat_message (room_id, sender_id, message, read_yn)
VALUES (18, 38, '방금 입금했습니다, 확인 부탁드립니다. (room 18-9)', 'N');
INSERT INTO TKK.trade_chat_message (room_id, sender_id, message, read_yn)
VALUES (18, 18, '확인했어요! 내일 발송 후 송장 보내드릴게요. (room 18-10)', 'N');


-- Room 19 (seller 19, buyer 39)
INSERT INTO TKK.trade_chat_message (room_id, sender_id, message, read_yn)
VALUES (19, 39, '안녕하세요, 거래 희망자입니다. (room 19-1)', 'Y');
INSERT INTO TKK.trade_chat_message (room_id, sender_id, message, read_yn)
VALUES (19, 19, '안녕하세요, 문의 감사드립니다. (room 19-2)', 'Y');
INSERT INTO TKK.trade_chat_message (room_id, sender_id, message, read_yn)
VALUES (19, 39, '혹시 오늘 저녁에 직거래 가능하신가요? (room 19-3)', 'Y');
INSERT INTO TKK.trade_chat_message (room_id, sender_id, message, read_yn)
VALUES (19, 19, '오늘은 조금 어렵고, 내일 저녁은 가능합니다. (room 19-4)', 'Y');
INSERT INTO TKK.trade_chat_message (room_id, sender_id, message, read_yn)
VALUES (19, 39, '그럼 내일로 진행해요. (room 19-5)', 'Y');
INSERT INTO TKK.trade_chat_message (room_id, sender_id, message, read_yn)
VALUES (19, 19, '네, 시간은 7시쯤 어떠세요? (room 19-6)', 'Y');
INSERT INTO TKK.trade_chat_message (room_id, sender_id, message, read_yn)
VALUES (19, 39, '7시 괜찮습니다. (room 19-7)', 'Y');
INSERT INTO TKK.trade_chat_message (room_id, sender_id, message, read_yn)
VALUES (19, 19, '장소는 강남역 10번 출구 근처로 할게요. (room 19-8)', 'Y');
INSERT INTO TKK.trade_chat_message (room_id, sender_id, message, read_yn)
VALUES (19, 39, '네, 그쪽으로 가겠습니다. (room 19-9)', 'N');
INSERT INTO TKK.trade_chat_message (room_id, sender_id, message, read_yn)
VALUES (19, 19, '도착하시면 채팅 주세요. (room 19-10)', 'N');


-- Room 20 (seller 20, buyer 40)
INSERT INTO TKK.trade_chat_message (room_id, sender_id, message, read_yn)
VALUES (20, 40, '안녕하세요, 상품 구매 희망합니다. (room 20-1)', 'Y');
INSERT INTO TKK.trade_chat_message (room_id, sender_id, message, read_yn)
VALUES (20, 20, '안녕하세요, 아직 판매 중입니다. (room 20-2)', 'Y');
INSERT INTO TKK.trade_chat_message (room_id, sender_id, message, read_yn)
VALUES (20, 40, '상세 설명보다 실사진이 보고 싶어요. (room 20-3)', 'Y');
INSERT INTO TKK.trade_chat_message (room_id, sender_id, message, read_yn)
VALUES (20, 20, '지금 사진 몇 장 찍어서 올렸습니다. (room 20-4)', 'Y');
INSERT INTO TKK.trade_chat_message (room_id, sender_id, message, read_yn)
VALUES (20, 40, '사진 봤는데 상태 좋아 보여요. (room 20-5)', 'Y');
INSERT INTO TKK.trade_chat_message (room_id, sender_id, message, read_yn)
VALUES (20, 20, '감사합니다. 거래는 어떻게 진행해볼까요? (room 20-6)', 'Y');
INSERT INTO TKK.trade_chat_message (room_id, sender_id, message, read_yn)
VALUES (20, 40, '저는 직거래 선호합니다. (room 20-7)', 'Y');
INSERT INTO TKK.trade_chat_message (room_id, sender_id, message, read_yn)
VALUES (20, 20, '그럼 홍대입구역에서 만나죠. (room 20-8)', 'Y');
INSERT INTO TKK.trade_chat_message (room_id, sender_id, message, read_yn)
VALUES (20, 40, '네, 시간만 정하면 될 것 같아요. (room 20-9)', 'N');
INSERT INTO TKK.trade_chat_message (room_id, sender_id, message, read_yn)
VALUES (20, 20, '토요일 오후 3시는 어떠세요? (room 20-10)', 'N');


INSERT INTO trade_post_image(trade_id,image_url,sort_order) VALUES(1,'trade1_img1.jpg',1);
INSERT INTO trade_post_image(trade_id,image_url,sort_order) VALUES(1,'trade1_img2.jpg',2);
INSERT INTO trade_post_image(trade_id,image_url,sort_order) VALUES(1,'trade1_img3.jpg',3);
INSERT INTO trade_post_image(trade_id,image_url,sort_order) VALUES(1,'trade1_img4.jpg',4);

INSERT INTO trade_post_image(trade_id,image_url,sort_order) VALUES(2,'trade2_img1.jpg',1);
INSERT INTO trade_post_image(trade_id,image_url,sort_order) VALUES(2,'trade2_img2.jpg',2);
INSERT INTO trade_post_image(trade_id,image_url,sort_order) VALUES(2,'trade2_img3.jpg',3);
INSERT INTO trade_post_image(trade_id,image_url,sort_order) VALUES(2,'trade2_img4.jpg',4);

INSERT INTO trade_post_image(trade_id,image_url,sort_order) VALUES(3,'trade3_img1.jpg',1);
INSERT INTO trade_post_image(trade_id,image_url,sort_order) VALUES(3,'trade3_img2.jpg',2);
INSERT INTO trade_post_image(trade_id,image_url,sort_order) VALUES(3,'trade3_img3.jpg',3);
INSERT INTO trade_post_image(trade_id,image_url,sort_order) VALUES(3,'trade3_img4.jpg',4);

INSERT INTO trade_post_image(trade_id,image_url,sort_order) VALUES(4,'trade4_img1.jpg',1);
INSERT INTO trade_post_image(trade_id,image_url,sort_order) VALUES(4,'trade4_img2.jpg',2);
INSERT INTO trade_post_image(trade_id,image_url,sort_order) VALUES(4,'trade4_img3.jpg',3);
INSERT INTO trade_post_image(trade_id,image_url,sort_order) VALUES(4,'trade4_img4.jpg',4);

INSERT INTO trade_post_image(trade_id,image_url,sort_order) VALUES(5,'trade5_img1.jpg',1);
INSERT INTO trade_post_image(trade_id,image_url,sort_order) VALUES(5,'trade5_img2.jpg',2);
INSERT INTO trade_post_image(trade_id,image_url,sort_order) VALUES(5,'trade5_img3.jpg',3);
INSERT INTO trade_post_image(trade_id,image_url,sort_order) VALUES(5,'trade5_img4.jpg',4);
INSERT INTO trade_post_image(trade_id,image_url,sort_order) VALUES(6,'trade6_img1.jpg',1);
INSERT INTO trade_post_image(trade_id,image_url,sort_order) VALUES(6,'trade6_img2.jpg',2);
INSERT INTO trade_post_image(trade_id,image_url,sort_order) VALUES(6,'trade6_img3.jpg',3);
INSERT INTO trade_post_image(trade_id,image_url,sort_order) VALUES(6,'trade6_img4.jpg',4);

INSERT INTO trade_post_image(trade_id,image_url,sort_order) VALUES(7,'trade7_img1.jpg',1);
INSERT INTO trade_post_image(trade_id,image_url,sort_order) VALUES(7,'trade7_img2.jpg',2);
INSERT INTO trade_post_image(trade_id,image_url,sort_order) VALUES(7,'trade7_img3.jpg',3);
INSERT INTO trade_post_image(trade_id,image_url,sort_order) VALUES(7,'trade7_img4.jpg',4);

INSERT INTO trade_post_image(trade_id,image_url,sort_order) VALUES(8,'trade8_img1.jpg',1);
INSERT INTO trade_post_image(trade_id,image_url,sort_order) VALUES(8,'trade8_img2.jpg',2);
INSERT INTO trade_post_image(trade_id,image_url,sort_order) VALUES(8,'trade8_img3.jpg',3);
INSERT INTO trade_post_image(trade_id,image_url,sort_order) VALUES(8,'trade8_img4.jpg',4);

INSERT INTO trade_post_image(trade_id,image_url,sort_order) VALUES(9,'trade9_img1.jpg',1);
INSERT INTO trade_post_image(trade_id,image_url,sort_order) VALUES(9,'trade9_img2.jpg',2);
INSERT INTO trade_post_image(trade_id,image_url,sort_order) VALUES(9,'trade9_img3.jpg',3);
INSERT INTO trade_post_image(trade_id,image_url,sort_order) VALUES(9,'trade9_img4.jpg',4);

INSERT INTO trade_post_image(trade_id,image_url,sort_order) VALUES(10,'trade10_img1.jpg',1);
INSERT INTO trade_post_image(trade_id,image_url,sort_order) VALUES(10,'trade10_img2.jpg',2);
INSERT INTO trade_post_image(trade_id,image_url,sort_order) VALUES(10,'trade10_img3.jpg',3);
INSERT INTO trade_post_image(trade_id,image_url,sort_order) VALUES(10,'trade10_img4.jpg',4);

INSERT INTO board_report(post_id,comment_id,reporter_id,reason,status,created_at)
VALUES(1,NULL,5,'스팸/홍보성 게시글입니다.','WAIT',SYSDATE-10);

INSERT INTO board_report(post_id,comment_id,reporter_id,reason,status,created_at)
VALUES(2,NULL,8,'주제와 맞지 않는 내용입니다.','WAIT',SYSDATE-9);

INSERT INTO board_report(post_id,comment_id,reporter_id,reason,status,created_at)
VALUES(3,NULL,12,'욕설 및 비방이 포함되어 있습니다.','WAIT',SYSDATE-9);

INSERT INTO board_report(post_id,comment_id,reporter_id,reason,status,created_at)
VALUES(4,NULL,7,'중복 게시글로 보입니다.','DONE',SYSDATE-8);

INSERT INTO board_report(post_id,comment_id,reporter_id,reason,status,created_at)
VALUES(5,NULL,10,'허위 정보가 포함된 것 같습니다.','WAIT',SYSDATE-8);

INSERT INTO board_report(post_id,comment_id,reporter_id,reason,status,created_at)
VALUES(6,NULL,3,'선정적인 내용이 포함되어 있습니다.','WAIT',SYSDATE-7);

INSERT INTO board_report(post_id,comment_id,reporter_id,reason,status,created_at)
VALUES(7,NULL,4,'저작권을 침해하는 이미지가 포함된 것 같습니다.','DONE',SYSDATE-7);

INSERT INTO board_report(post_id,comment_id,reporter_id,reason,status,created_at)
VALUES(8,NULL,9,'타인 사칭이 의심되는 게시글입니다.','WAIT',SYSDATE-6);

INSERT INTO board_report(post_id,comment_id,reporter_id,reason,status,created_at)
VALUES(9,NULL,2,'광고/홍보 목적의 글로 보입니다.','WAIT',SYSDATE-6);

INSERT INTO board_report(post_id,comment_id,reporter_id,reason,status,created_at)
VALUES(10,NULL,11,'비속어 사용이 심한 게시글입니다.','DONE',SYSDATE-5);

-- 댓글 신고 (comment_id 기준)
INSERT INTO board_report(post_id,comment_id,reporter_id,reason,status,created_at)
VALUES(NULL,1,5,'댓글에 욕설이 포함되어 있습니다.','WAIT',SYSDATE-5);

INSERT INTO board_report(post_id,comment_id,reporter_id,reason,status,created_at)
VALUES(NULL,2,6,'도배성 댓글로 보입니다.','WAIT',SYSDATE-5);

INSERT INTO board_report(post_id,comment_id,reporter_id,reason,status,created_at)
VALUES(NULL,3,7,'타인을 비방하는 내용입니다.','DONE',SYSDATE-4);

INSERT INTO board_report(post_id,comment_id,reporter_id,reason,status,created_at)
VALUES(NULL,4,8,'정치/사회 분쟁을 유도하는 댓글입니다.','WAIT',SYSDATE-4);

INSERT INTO board_report(post_id,comment_id,reporter_id,reason,status,created_at)
VALUES(NULL,5,9,'개인정보 노출이 우려됩니다.','WAIT',SYSDATE-4);

INSERT INTO board_report(post_id,comment_id,reporter_id,reason,status,created_at)
VALUES(NULL,6,10,'성적인 표현이 포함되어 있습니다.','DONE',SYSDATE-3);

INSERT INTO board_report(post_id,comment_id,reporter_id,reason,status,created_at)
VALUES(NULL,7,11,'상대방을 괴롭히는 내용입니다.','WAIT',SYSDATE-3);

INSERT INTO board_report(post_id,comment_id,reporter_id,reason,status,created_at)
VALUES(NULL,8,12,'지나친 비하 표현이 있습니다.','WAIT',SYSDATE-3);

INSERT INTO board_report(post_id,comment_id,reporter_id,reason,status,created_at)
VALUES(NULL,9,13,'광고 링크가 포함된 댓글입니다.','DONE',SYSDATE-2);

INSERT INTO board_report(post_id,comment_id,reporter_id,reason,status,created_at)
VALUES(NULL,10,14,'도배성 이모티콘 댓글입니다.','WAIT',SYSDATE-2);

-- 게시글 신고 추가
INSERT INTO board_report(post_id,comment_id,reporter_id,reason,status,created_at)
VALUES(11,NULL,15,'규칙 위반으로 보이는 게시글입니다.','WAIT',SYSDATE-2);

INSERT INTO board_report(post_id,comment_id,reporter_id,reason,status,created_at)
VALUES(12,NULL,16,'불쾌감을 주는 표현이 있습니다.','DONE',SYSDATE-2);

INSERT INTO board_report(post_id,comment_id,reporter_id,reason,status,created_at)
VALUES(13,NULL,17,'특정 대상을 괴롭히는 내용입니다.','WAIT',SYSDATE-1);

INSERT INTO board_report(post_id,comment_id,reporter_id,reason,status,created_at)
VALUES(14,NULL,18,'거래 사기를 유도하는 것 같습니다.','WAIT',SYSDATE-1);

INSERT INTO board_report(post_id,comment_id,reporter_id,reason,status,created_at)
VALUES(15,NULL,19,'허위 사실을 유포하는 내용 같습니다.','DONE',SYSDATE-1);

INSERT INTO board_report(post_id,comment_id,reporter_id,reason,status,created_at)
VALUES(16,NULL,20,'게시판 규칙에 맞지 않는 홍보글입니다.','WAIT',SYSDATE-1);

INSERT INTO board_report(post_id,comment_id,reporter_id,reason,status,created_at)
VALUES(17,NULL,21,'타인의 명예를 훼손하는 내용입니다.','WAIT',SYSDATE);

INSERT INTO board_report(post_id,comment_id,reporter_id,reason,status,created_at)
VALUES(18,NULL,22,'부적절한 이미지가 포함되어 있습니다.','DONE',SYSDATE);

-- 댓글 신고 추가
INSERT INTO board_report(post_id,comment_id,reporter_id,reason,status,created_at)
VALUES(NULL,11,5,'게시글과 관련 없는 내용의 댓글입니다.','WAIT',SYSDATE-1);

INSERT INTO board_report(post_id,comment_id,reporter_id,reason,status,created_at)
VALUES(NULL,12,6,'타인을 조롱하는 내용입니다.','WAIT',SYSDATE-1);

INSERT INTO board_report(post_id,comment_id,reporter_id,reason,status,created_at)
VALUES(NULL,13,7,'허위 정보를 퍼뜨리는 댓글 같습니다.','DONE',SYSDATE-1);

INSERT INTO board_report(post_id,comment_id,reporter_id,reason,status,created_at)
VALUES(NULL,14,8,'도배성 댓글 신고합니다.','WAIT',SYSDATE-1);

INSERT INTO board_report(post_id,comment_id,reporter_id,reason,status,created_at)
VALUES(NULL,15,9,'욕설이 반복적으로 사용되었습니다.','WAIT',SYSDATE);

INSERT INTO board_report(post_id,comment_id,reporter_id,reason,status,created_at)
VALUES(NULL,16,10,'개인을 공격하는 표현이 있습니다.','DONE',SYSDATE);

INSERT INTO board_report(post_id,comment_id,reporter_id,reason,status,created_at)
VALUES(NULL,17,11,'정치적 분쟁을 유도하는 댓글입니다.','WAIT',SYSDATE);

INSERT INTO board_report(post_id,comment_id,reporter_id,reason,status,created_at)
VALUES(NULL,18,12,'상업적 광고로 보입니다.','WAIT',SYSDATE);

INSERT INTO board_report(post_id,comment_id,reporter_id,reason,status,created_at)
VALUES(NULL,19,13,'불법 거래를 암시하는 내용입니다.','WAIT',SYSDATE);

INSERT INTO board_report(post_id,comment_id,reporter_id,reason,status,created_at)
VALUES(NULL,20,14,'타 커뮤니티로 유도하는 스팸 댓글입니다.','DONE',SYSDATE);

-- 게시글/댓글 혼합
INSERT INTO board_report(post_id,comment_id,reporter_id,reason,status,created_at)
VALUES(19,NULL,15,'게시판 성격과 맞지 않는 홍보성 글입니다.','WAIT',SYSDATE);

INSERT INTO board_report(post_id,comment_id,reporter_id,reason,status,created_at)
VALUES(20,NULL,16,'과도한 비방 표현이 포함된 게시글입니다.','WAIT',SYSDATE);

commit ;


--------------------------------------------------------
-- 5. 기본 역할 데이터 4개(SUPER, MANAGER, CS, CONTENT)
--------------------------------------------------------
INSERT INTO ADMIN_ROLE ( ROLE_CODE, ROLE_NAME, DESCRIPTION)
VALUES ( 'SUPER',   '최고관리자',      '모든 기능 사용 가능');

INSERT INTO ADMIN_ROLE ( ROLE_CODE, ROLE_NAME, DESCRIPTION)
VALUES ( 'MANAGER', '운영자',          '회원/게시판/거래 관리');

INSERT INTO ADMIN_ROLE ( ROLE_CODE, ROLE_NAME, DESCRIPTION)
VALUES ( 'CS',      '고객센터',        '문의/FAQ/공지 관리');

INSERT INTO ADMIN_ROLE ( ROLE_CODE, ROLE_NAME, DESCRIPTION)
VALUES ( 'CONTENT', '콘텐츠관리자',    '메인 배너/추천 검색어 관리');

--------------------------------------------------------
-- 6. 관리자 계정 1개 생성 (ID: admin / PW: admin1234)
--------------------------------------------------------
INSERT INTO ADMIN_USER (
     LOGIN_ID, LOGIN_PW, NAME, EMAIL, PHONE, STATUS
) VALUES (

             'admin',
             'admin1234',           -- 학습/과제용: 평문, 실서비스이면 반드시 암호화
             '관리자',
             'admin@tkk.com',
             '010-0000-0000',
             'Y'
         );

COMMIT;

--------------------------------------------------------
-- 7. admin 계정에 SUPER 권한 매핑
--    (숫자를 직접 안 쓰고, 서브쿼리로 안전하게 매핑)
--------------------------------------------------------
INSERT INTO ADMIN_USER_ROLE (ADMIN_ID, ROLE_ID)
SELECT u.ADMIN_ID, r.ROLE_ID
FROM   ADMIN_USER u
           JOIN ADMIN_ROLE r ON r.ROLE_CODE = 'SUPER'
WHERE  u.LOGIN_ID = 'admin'
  AND  NOT EXISTS (
    SELECT 1
    FROM   ADMIN_USER_ROLE ur
    WHERE  ur.ADMIN_ID = u.ADMIN_ID
      AND    ur.ROLE_ID  = r.ROLE_ID
);

COMMIT;

--------------------------------------------------------
-- 8. 최종 확인용 쿼리 (필요할 때만 실행)
--------------------------------------------------------
-- 현재 스키마 확인
-- SELECT USER FROM DUAL;
--
-- -- 관리자 계정 확인
-- SELECT ADMIN_ID, LOGIN_ID, LOGIN_PW, STATUS
-- FROM ADMIN_USER;
--
-- -- 역할 목록 확인
-- SELECT ROLE_ID, ROLE_CODE, ROLE_NAME
-- FROM ADMIN_ROLE;
--
-- -- 권한 매핑 확인
-- SELECT *
-- FROM ADMIN_USER_ROLE;


commit;