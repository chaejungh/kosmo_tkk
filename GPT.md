# ✅ **TKK 통합 개발 문서 (API + Controller 구조 + Service/Repo 매핑 + DB 테이블 매핑 + 화면 흐름)**

**Version: 1.0 / Developer Specification**

---

# 📌 1. 전체 아키텍처 개요

```
Client (Web/App)
      ↓
Controller Layer
      ↓
Service Layer
      ↓
Repository Layer (JPA)
      ↓
Oracle DB (TKK Schema)
```

---

# 📌 2. Controller 구조 (패키지 기준)

```
/controller
 ├── HomeController
 ├── SearchController
 ├── MapController
 ├── StoreController
 ├── PopupController
 ├── BoardController
 ├── CommentController
 ├── MemberController
 ├── NotificationController
 ├── TradeController
 ├── TradeChatController
 ├── MyPageController
 ├── SupportController
```

---

# 📌 3. API 명세 + Service/Repository + Table 매핑

**(전체 기능 흐름을 중심으로 정리)**

---

# 0) 홈(메인)

/ , /index.html
**Controller**: HomeController
**Service**: SearchService
**Table**: RECOMMENDED_SEARCH

---

## 1) 홈 & 통합 검색 & 지도

---

## 1-1. **통합 검색**

###

통합 검색 (매장 / 팝업 / 굿즈 / 거래글)

**Controller**: SearchController
**Service**: SearchService
**Repository**:

* StoreRepository
* PopupRepository
* GoodsRepository
* TradePostRepository

**Table**:

* SEARCH_LOG
* RECOMMENDED_SEARCH
* STORE, POPUP_STORE
* STORE_GOODS, POPUP_GOODS
* TRADE_POST

---

###

추천 검색어 조회

**Service**: SearchService
**Table**: RECOMMENDED_SEARCH

---

## 1-2. 전체 지도 화면

###

지도 전체 페이지

**Controller**: MapController
**Service**: StoreService, PopupService

---

###

지도 내 매장 조회

**Repository**: StoreRepository
**Tables**: STORE, STORE_GOODS

---

###

지도 내 팝업 조회

**Repository**: PopupRepository
**Tables**: POPUP_STORE, POPUP_GOODS

---

###

네이버 길찾기 딥링크

---

---

# 2) 매장 / 팝업

---

## 2-1. 검색 리스트

###

일반 매장 검색

**Controller**: StoreController
**Service**: StoreService
**Repository**: StoreRepository
**Table**: STORE, STORE_GOODS, STORE_BOOKMARK

---

###

팝업 매장 검색

**Controller**: PopupController
**Service**: PopupService
**Repository**: PopupRepository
**Table**: POPUP_STORE, POPUP_GOODS, POPUP_BOOKMARK

---

## 2-2. 상세 정보

###

매장 상세

**Tables**: STORE, STORE_BOOKMARK

### 브라우저 액션

**북마크 추가** `/store/{id}/bookmark` (POST)
**북마크 해제** `/store/{id}/bookmark` (REMOVE)

**Repository**: StoreBookmarkRepository

---

###

팝업 상세

**Tables**: POPUP_STORE, POPUP_BOOKMARK

---

## 2-3. 매장/팝업 굿즈 목록

###

**Table**: STORE_GOODS

###

**Table**: POPUP_GOODS

---

# 3) 로그인 / 회원가입 / 알림 / 계정

---

## 3-1. 로그인

### (GET, POST)

###

**Controller**: MemberController
**Service**: MemberService
**Table**: MEMBER

---

## 3-2. 회원가입

###

###

아이디/닉네임 중복확인

---

## 3-3. 내 계정 정보

### (GET/POST)

**Table**: MEMBER

---

###

회원 탈퇴

참조 삭제:

* STORE_BOOKMARK
* POPUP_BOOKMARK
* BOARD_POST, BOARD_COMMENT
* TRADE_POST 등

---

## 3-4. 알림 설정

###

**Table**: MEMBER_NOTIFICATION_SETTING

---

# 4) 게시판 (커뮤니티)

---

## 4-1. 게시판 리스트

###

**Controller**: BoardController
**Service**: BoardService
**Repository**: BoardPostRepository
**Tables**:

* BOARD_POST
* BOARD_POST_IMAGE
* BOARD_TAG
* BOARD_POST_TAG

---

## 4-2. 게시글 상세

###

**Tables**:

* BOARD_POST
* BOARD_COMMENT
* BOARD_LIKE
* BOARD_BOOKMARK

---

### 좋아요

 (POST / REMOVE)
**Table**: BOARD_LIKE

### 북마크


**Table**: BOARD_BOOKMARK

### 신고

**Table**: BOARD_REPORT

---

## 4-3. 글 작성/수정/삭제

**Table**: BOARD_POST, BOARD_POST_IMAGE, BOARD_POST_TAG**

---

## 4-4. 댓글

###
**Table**: BOARD_COMMENT

---

# 5) 마이페이지

---

## 5-1. 게시판 관련

**Tables**:
BOARD_POST, BOARD_LIKE, BOARD_BOOKMARK

---

## 5-2. 매장 / 팝업 관련

**Tables**
STORE, STORE_BOOKMARK
POPUP_STORE, POPUP_BOOKMARK

---

## 5-3. 거래글 관련
**Tables**: TRADE_POST, TRADE_BOOKMARK

---

# 6) 굿즈 거래

---

## 6-1. 거래 홈

**Tables**: TRADE_POST, TRADE_POST_IMAGE

---

## 6-2. 거래글 작성, 수정, 삭제

**Tables**: TRADE_POST, TRADE_POST_IMAGE

---

## 6-3. 거래글 상세

###
북마크:
**Tables**: TRADE_POST, TRADE_BOOKMARK

---

## 6-4. 채팅방 리스트

###

**Tables**:
TRADE_CHAT_ROOM, TRADE_POST, MEMBER

---

## 6-5. 채팅방 상세

###

* 메시지: TRADE_CHAT_MESSAGE
* 유저 정보: MEMBER
* 거래글 정보: TRADE_POST

---

# 7) 고객센터

---

### 공지사항

/support/notice/list.do
**Table**: NOTICE

### FAQ

/support/faq/list.do
**Table**: FAQ, FAQ_CATEGORY

### 문의

/support/inquiry/write.do
**Table**: INQUIRY

---

# 📌 4. 전체 테이블 관계도(요약)

```
MEMBER
 ├─ STORE_BOOKMARK ─ STORE
 ├─ POPUP_BOOKMARK ─ POPUP_STORE
 ├─ BOARD_POST
 │     ├─ BOARD_POST_IMAGE
 │     ├─ BOARD_COMMENT
 │     ├─ BOARD_LIKE
 │     └─ BOARD_BOOKMARK
 ├─ TRADE_POST
 │      ├─ TRADE_POST_IMAGE
 │      ├─ TRADE_BOOKMARK
 │      └─ TRADE_CHAT_ROOM ─ TRADE_CHAT_MESSAGE
 └─ SEARCH_LOG
```

---

# 📌 5. 화면(UI) 흐름도 (요약)

```
홈
 ├─ 통합 검색 → 검색 리스트
 ├─ 전체 지도 → 지도 검색
 ├─ 인기 게시글 → 게시글 상세
 ├─ 로그인 → 회원가입

매장 상세 → 굿즈 → 북마크 → 마이페이지
팝업 상세 → 굿즈 → 북마크 → 마이페이지

게시판
 ├─ 리스트
 ├─ 글쓰기
 ├─ 상세
 │     ├─ 댓글
 │     ├─ 좋아요
 │     └─ 북마크
 └─ 마이페이지 (내 글/내 북마크)

거래글
 ├─ 목록
 ├─ 작성
 ├─ 상세
 │     ├─ 북마크
 │     └─ 채팅방
 └─ 채팅
```
