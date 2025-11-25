# ✅ STORE (상점)

* `/search/{query}?c={lat,lng}`
  GET — 메인 화면 통합 검색(매장 포함).
  Controller: SearchController · Service: SearchService · Tables: SEARCH_LOG, STORE, STORE_GOODS

* `/store/list.do?page=1&pageLimit=20&sort=createAt`
  GET — 매장 리스트 조회(페이징/정렬).
  Controller: StoreController · Service: StoreService · Tables: STORE, STORE_GOODS

* `/store/{storeId}/detail.do`
  GET — 매장 상세(정보, 영업시간, 평점, 굿즈 요약, 북마크 여부).
  Controller: StoreController · Service: StoreService · Tables: STORE, STORE_BOOKMARK, STORE_GOODS

* 매장 북마크 추가 / 삭제 (사용자가 제공한 형태 유지)

    * `/store/{Memberid}/BookMark`
      POST — 매장 북마크 추가 (memberId는 세션/경로)
      Controller: StoreController · Service: StoreBookmarkService · Tables: STORE_BOOKMARK
    * `/store/{BookMarkid}/BookMarkDelete`
      POST — 매장 북마크 삭제 (bookmark id 기준)
      Controller: StoreController · Service: StoreBookmarkService · Tables: STORE_BOOKMARK
      **노트:** 권장: RESTful 대체(예: `POST /store/{storeId}/bookmark`, `DELETE /store/{storeId}/bookmark`) 가능

* 굿즈 관련

    * `/store/list.do?page=1&pageLimit=20&sort=createAt`
      (위와 동일한 엔드포인트를 굿즈 리스트 조회에 재사용한 것으로 보임)
      GET — 매장 굿즈 리스트(필터: 작품/종류 등) · Tables: STORE_GOODS
    * `/store/{Storegoodsid}/detail.do`
      GET — 특정 굿즈 상세(이미지, 가격, 설명) · Tables: STORE_GOODS
    * 굿즈 검색 리스트(경로 형태 제안)
      `/p/search/{검색어}/store/{storeid}?c={좌표}`  = `/search/{검색어}/storegoods/list.do?c=...`
      GET — 특정 매장 내 굿즈 검색(좌표 기반 정렬/거리 고려) · Tables: STORE_GOODS, STORE

# ✅ POPUP (팝업 매장)

* `/search/{query}?c={lat,lng}`
  GET — 메인 통합 검색(팝업 포함).
  Controller: SearchController · Service: SearchService · Tables: POPUP_STORE, POPUP_GOODS

* `/popupstore/list.do?page=1&pageLimit=20&sort=createAt`
  GET — 팝업 매장 리스트 조회(페이징/정렬).
  Controller: PopupController · Service: PopupService · Tables: POPUP_STORE, POPUP_GOODS

* `/popupstore/{popupStoreId}/detail.do`
  GET — 팝업 상세(진행기간, 위치, 설명, 북마크 여부).
  Controller: PopupController · Service: PopupService · Tables: POPUP_STORE, POPUP_BOOKMARK

* 팝업 북마크 추가/삭제

    * `/popupstore/{Memberid}/BookMark`
      POST — 북마크 추가 · Tables: POPUP_BOOKMARK
    * `/popupstore/{BookMarkid}/BookMarkDelete`
      POST — 북마크 삭제 · Tables: POPUP_BOOKMARK

* 팝업 굿즈 관련

    * `/popupstore/list.do?page=1&pageLimit=20&sort=createAt`
      GET — 팝업 굿즈 리스트(필터 포함) · Tables: POPUP_GOODS
    * `/popupstore/{popupStoregoodsid}/detail.do`
      GET — 팝업 굿즈 상세 · Tables: POPUP_GOODS
    * 굿즈 검색 리스트
      `/p/search/{검색어}/popupstore/{popupstoreid}?c={좌표}` = `/search/{검색어}/popupstoregoods/list.do?c=...`
      GET — 특정 팝업 내 굿즈 검색 · Tables: POPUP_GOODS, POPUP_STORE

# ✅ MYPAGE (내 정보)

* `/mypage/{Memberid}/`
  GET — 마이페이지 대시보드(내 활동 요약).
  Controller: MyPageController · Service: MemberService, BoardService, TradeService

* 프로필 수정

    * `/mypage/{Memberid}/profile=viewModifyProfile`
      POST — 프로필 수정(닉네임, 프로필 이미지 등) · Tables: MEMBER

* 게시글 / 좋아요 / 북마크 / 거래 관련

    * `/mypage/{Memberid}/posts` GET — 내가 쓴 글(BOARD_POST 등)
    * `/mypage/{Memberid}/likes` GET — 내가 좋아요한 게시글(BOARD_LIKE → BOARD_POST)
    * `/mypage/{Memberid}/bookmarks` GET — 내가 북마크한 게시글(BOARD_BOOKMARK → BOARD_POST)
    * `/mypage/{Memberid}/trade/mine` GET — 내 거래글(TRADE_POST)
    * `/mypage/{Memberid}/trade/wishlist` GET — 내 거래 위시리스트(TRADE_BOOKMARK)

* 북마크한 매장/팝업

    * `/mypage/{Memberid}/stores` GET — 찜한 일반 매장(STORE_BOOKMARK → STORE)
    * `/mypage/{Memberid}/popups` GET — 찜한 팝업(POPUP_BOOKMARK → POPUP_STORE)

* 설정 / 계정 / 알림 / 탈퇴

    * `/mypage/{Memberid}/settings` GET — 설정 메인
    * `/mypage/{Memberid}/settings=viewChangePasswd` POST — 비밀번호 변경
    * `/mypage/{Memberid}/settings=viewChangeEmail` POST — 이메일 변경
    * `/mypage/{Memberid}/settings/detail/checkout` POST — 알림 설정 변경 (MEMBER_NOTIFICATION_SETTING)
    * `/mypage/{Memberid}/settings/policy.html` GET — 약관 조회(정적 페이지)
    * `/mypage/{Memberid}/settings/privacy.html` GET — 개인정보처리방침
    * `/mypage/{Memberid}/settings/leaveId` POST — 회원탈퇴(연동테이블 정리 필요)

* 고객센터

    * `/mypage/{Memberid}/notice` — 공지사항 리스트 (NOTICE)
    * `/mypage/{Memberid}/faq` — FAQ 리스트 (FAQ, FAQ_CATEGORY)
    * `/mypage/{Memberid}/inquiry` — 1:1 문의 목록/폼

        * `/mypage/{Memberid}/inquiry/form` POST — 문의 등록 (INQUIRY)
        * `/mypage/{Memberid}/inquiry/history` GET — 내 문의 이력

# ✅ BOARD (커뮤니티 — mcborad 기준)

* `/mcborad/{memberId}/list.do`
  GET — 내게시글 전체 조회(BOARD_POST, BOARD_POST_IMAGE)

* `/mcborad/{memberId}/write`
  GET/POST — 글쓰기 화면 / 작성 액션(첨부 이미지 포함)

* `/mcborad/{memberId}/articles/{boardPostId}/detail.do`
  GET — 게시글 상세 조회

  게시글 액션(경로 표준 유지)

    * `/mcborad/{memberId}/articles/{boardPostId}/BookMark` POST — 북마크 추가 (BOARD_BOOKMARK)
    * `/mcborad/{memberId}/articles/{boardPostId}/BookMarkdelete` POST — 북마크 삭제
    * `/mcborad/{memberId}/articles/{boardPostId}/Like` POST — 좋아요 추가 (BOARD_LIKE)
    * `/mcborad/{memberId}/articles/{boardPostId}/LikeDelete` POST — 좋아요 삭제

**노트:** BoardController · BoardService · Tables: BOARD_POST, BOARD_POST_IMAGE, BOARD_COMMENT, BOARD_LIKE, BOARD_BOOKMARK, BOARD_TAG, BOARD_POST_TAG

# ✅ TRADE (중고거래)

* `/trade/list.do?page=1&pageLimit=20&sort=createAt`
  GET — 거래 글 리스트 조회(필터: status, region, keyword) · Tables: TRADE_POST, TRADE_POST_IMAGE

* `/trade/{tradeGoodsId}/detail.do`
  GET — 중고 굿즈(품목) 검색 상세(혹은 상품 상세) · Tables: TRADE_POST

* `/trade/{tradePostid}/article/detail.do`
  GET — 거래 글 상세 조회(본문, 가격, 상태, 이미지, 북마크 여부) · Tables: TRADE_POST, TRADE_POST_IMAGE, TRADE_BOOKMARK

* 거래 이미지 상세

    * `/trade/{tradePostid}/article/{PostImageid}` GET — 거래글 이미지(개별) 제공

* 거래 북마크 추가/삭제

    * `/trade/{Memberkid}/BookMark` POST — 북마크 추가 (TRADE_BOOKMARK)
    * `/trade/{BookMarkid}/BookMark` POST — 북마크 삭제 (제공된 naming 유지)

* 거래 작성 / 채팅

    * `/trade/{tradeWrite}` — 거래 글쓰기 창 (GET/POST)
    * `/trade/{tradeid}/chat` GET — 내가 참여한 채팅방 목록(TRADE_CHAT_ROOM)
    * `/trade/chat/room/{roomid}` GET — 특정 채팅방 입장(메시지 로드) · Tables: TRADE_CHAT_MESSAGE