# USE tkk;
#
# -- 순서 중요해서 FK 안 꼬이게 위에서부터 차례대로 만들게.
# -- 전부 utf8mb4 기준
#
# SET NAMES utf8mb4;
# SET FOREIGN_KEY_CHECKS = 0;
#
# -- 기존 테이블 있으면 지우고 새로 만드는게 깔끔함
# DROP TABLE IF EXISTS admin_log;
# DROP TABLE IF EXISTS admin_user_role;
# DROP TABLE IF EXISTS admin_role;
# DROP TABLE IF EXISTS admin_user;
# DROP TABLE IF EXISTS service_notice;
# DROP TABLE IF EXISTS inquiry;
# DROP TABLE IF EXISTS faq;
# DROP TABLE IF EXISTS faq_category;
# DROP TABLE IF EXISTS notification;
# DROP TABLE IF EXISTS trade_chat_message;
# DROP TABLE IF EXISTS trade_chat_room;
# DROP TABLE IF EXISTS trade_bookmark;
# DROP TABLE IF EXISTS trade_post_image;
# DROP TABLE IF EXISTS trade_post;
# DROP TABLE IF EXISTS board_report;
# DROP TABLE IF EXISTS board_bookmark;
# DROP TABLE IF EXISTS board_like;
# DROP TABLE IF EXISTS board_comment;
# DROP TABLE IF EXISTS board_post_image;
# DROP TABLE IF EXISTS board_post_tag;
# DROP TABLE IF EXISTS board_tag;
# DROP TABLE IF EXISTS board_post;
# DROP TABLE IF EXISTS board_category;
# DROP TABLE IF EXISTS main_banner;
# DROP TABLE IF EXISTS popup_goods;
# DROP TABLE IF EXISTS popup_bookmark;
# DROP TABLE IF EXISTS popup_store;
# DROP TABLE IF EXISTS recommended_search;
# DROP TABLE IF EXISTS search_log;
# DROP TABLE IF EXISTS store_goods;
# DROP TABLE IF EXISTS store_bookmark;
# DROP TABLE IF EXISTS store;
# DROP TABLE IF EXISTS member_notification_setting;
# DROP TABLE IF EXISTS member;

# SET FOREIGN_KEY_CHECKS = 1;
CREATE DATABASE IF NOT EXISTS tkk DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE tkk;

-- 0. 회원
CREATE TABLE member (
                        member_id           BIGINT NOT NULL AUTO_INCREMENT,
                        login_id            VARCHAR(50)   NOT NULL,
                        login_pw            VARCHAR(255)  NOT NULL,
                        nickname            VARCHAR(50)   NOT NULL,
                        profile_image_url   VARCHAR(255),
                        intro               VARCHAR(255),
                        user_level          INT           DEFAULT 1,
                        email               VARCHAR(100),
                        gender              VARCHAR(10)   NOT NULL,
                        nationality         VARCHAR(10)   NOT NULL,
                        created_at          DATETIME      DEFAULT CURRENT_TIMESTAMP,
                        updated_at          DATETIME      NULL,
                        deleted_yn          CHAR(1)       DEFAULT 'N',
                        CONSTRAINT pk_member PRIMARY KEY (member_id),
                        CONSTRAINT uq_member_login_id UNIQUE (login_id),
                        CONSTRAINT uq_member_nickname UNIQUE (nickname),
                        CONSTRAINT chk_member_gender CHECK (gender IN ('남자','여자')),
                        CONSTRAINT chk_member_nationality CHECK (nationality IN ('내국인','외국인'))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 0-1. 회원 알림 설정
CREATE TABLE member_notification_setting (
                                             member_id   BIGINT      NOT NULL,
                                             comment_yn  CHAR(1)     DEFAULT 'Y',
                                             like_yn     CHAR(1)     DEFAULT 'Y',
                                             trade_yn    CHAR(1)     DEFAULT 'Y',
                                             event_yn    CHAR(1)     DEFAULT 'Y',
                                             created_at  DATETIME    DEFAULT CURRENT_TIMESTAMP,
                                             updated_at  DATETIME    NULL,
                                             CONSTRAINT pk_member_notification_setting PRIMARY KEY (member_id),
                                             CONSTRAINT fk_mns_member FOREIGN KEY (member_id)
                                                 REFERENCES member(member_id)
                                                 ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 1. 매장
CREATE TABLE store (
                       store_id        BIGINT NOT NULL AUTO_INCREMENT,
                       name            VARCHAR(100)  NOT NULL,
                       one_line_desc   VARCHAR(200),
                       address         VARCHAR(255),
                       region_name     VARCHAR(100),
                       latitude        DECIMAL(11,8),
                       longitude       DECIMAL(11,8),
                       avg_rating      DECIMAL(3,2)  DEFAULT 0,
                       bookmark_count  INT           DEFAULT 0,
                       phone           VARCHAR(30),
                       created_at      DATETIME      DEFAULT CURRENT_TIMESTAMP,
                       CONSTRAINT pk_store PRIMARY KEY (store_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 매장 즐겨찾기
CREATE TABLE store_bookmark (
                                store_bookmark_id BIGINT NOT NULL AUTO_INCREMENT,
                                member_id         BIGINT NOT NULL,
                                store_id          BIGINT NOT NULL,
                                created_at        DATETIME DEFAULT CURRENT_TIMESTAMP,
                                CONSTRAINT pk_store_bookmark PRIMARY KEY (store_bookmark_id),
                                CONSTRAINT uk_store_bookmark UNIQUE (member_id, store_id),
                                CONSTRAINT fk_sb_member FOREIGN KEY (member_id)
                                    REFERENCES member(member_id),
                                CONSTRAINT fk_sb_store FOREIGN KEY (store_id)
                                    REFERENCES store(store_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 매장별 굿즈
CREATE TABLE store_goods (
                             goods_id        BIGINT NOT NULL AUTO_INCREMENT,
                             store_id        BIGINT       NOT NULL,
                             name            VARCHAR(150) NOT NULL,
                             work_name       VARCHAR(100),
                             character_name  VARCHAR(100),
                             category        VARCHAR(30),
                             price           INT,
                             stock_qty       INT,
                             thumbnail_url   VARCHAR(255),
                             created_at      DATETIME DEFAULT CURRENT_TIMESTAMP,
                             updated_at      DATETIME,
                             CONSTRAINT pk_store_goods PRIMARY KEY (goods_id),
                             CONSTRAINT fk_sg_store FOREIGN KEY (store_id)
                                 REFERENCES store(store_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 검색 로그
CREATE TABLE search_log (
                            search_id   BIGINT NOT NULL AUTO_INCREMENT,
                            member_id   BIGINT,
                            keyword     VARCHAR(100) NOT NULL,
                            target_type VARCHAR(20),
                            target_id   BIGINT,
                            created_at  DATETIME DEFAULT CURRENT_TIMESTAMP,
                            CONSTRAINT pk_search_log PRIMARY KEY (search_id),
                            CONSTRAINT fk_sl_member FOREIGN KEY (member_id)
                                REFERENCES member(member_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 추천 검색어
CREATE TABLE recommended_search (
                                    rec_id      BIGINT NOT NULL AUTO_INCREMENT,
                                    keyword     VARCHAR(100) NOT NULL,
                                    target_type VARCHAR(20),
                                    sort_order  INT DEFAULT 1,
                                    active_yn   CHAR(1) DEFAULT 'Y',
                                    CONSTRAINT pk_recommended_search PRIMARY KEY (rec_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 2. 팝업스토어
CREATE TABLE popup_store (
                             popup_id         BIGINT NOT NULL AUTO_INCREMENT,
                             title            VARCHAR(150) NOT NULL,
                             place_name       VARCHAR(150),
                             address          VARCHAR(255),
                             region_name      VARCHAR(100),
                             latitude         DECIMAL(11,8),
                             longitude        DECIMAL(11,8),
                             start_date       DATE NOT NULL,
                             end_date         DATE NOT NULL,
                             banner_image_url VARCHAR(255),
                             description      TEXT,
                             created_at       DATETIME DEFAULT CURRENT_TIMESTAMP,
                             CONSTRAINT pk_popup_store PRIMARY KEY (popup_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 팝업 찜
CREATE TABLE popup_bookmark (
                                popup_bookmark_id BIGINT NOT NULL AUTO_INCREMENT,
                                member_id         BIGINT NOT NULL,
                                popup_id          BIGINT NOT NULL,
                                created_at        DATETIME DEFAULT CURRENT_TIMESTAMP,
                                CONSTRAINT pk_popup_bookmark PRIMARY KEY (popup_bookmark_id),
                                CONSTRAINT uk_popup_bookmark UNIQUE (member_id, popup_id),
                                CONSTRAINT fk_pb_member FOREIGN KEY (member_id)
                                    REFERENCES member(member_id),
                                CONSTRAINT fk_pb_popup FOREIGN KEY (popup_id)
                                    REFERENCES popup_store(popup_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 팝업 굿즈
CREATE TABLE popup_goods (
                             popup_goods_id BIGINT NOT NULL AUTO_INCREMENT,
                             popup_id       BIGINT NOT NULL,
                             name           VARCHAR(150) NOT NULL,
                             description    VARCHAR(255),
                             category       VARCHAR(30),
                             price          INT,
                             thumbnail_url  VARCHAR(255),
                             CONSTRAINT pk_popup_goods PRIMARY KEY (popup_goods_id),
                             CONSTRAINT fk_pg_popup FOREIGN KEY (popup_id)
                                 REFERENCES popup_store(popup_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 메인 배너
CREATE TABLE main_banner (
                             banner_id      BIGINT NOT NULL AUTO_INCREMENT,
                             title          VARCHAR(150) NOT NULL,
                             image_url      VARCHAR(255) NOT NULL,
                             link_type      VARCHAR(20),
                             link_target_id BIGINT,
                             link_url       VARCHAR(255),
                             start_date     DATE,
                             end_date       DATE,
                             sort_order     INT        DEFAULT 1,
                             active_yn      CHAR(1)    DEFAULT 'Y',
                             CONSTRAINT pk_main_banner PRIMARY KEY (banner_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 3. 게시판 카테고리
CREATE TABLE board_category (
                                category_id BIGINT NOT NULL AUTO_INCREMENT,
                                code        VARCHAR(30) NOT NULL,
                                name        VARCHAR(50) NOT NULL,
                                CONSTRAINT pk_board_category PRIMARY KEY (category_id),
                                CONSTRAINT uq_board_category_code UNIQUE (code)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 게시글
CREATE TABLE board_post (
                            post_id       BIGINT NOT NULL AUTO_INCREMENT,
                            category_id   BIGINT      NOT NULL,
                            member_id     BIGINT      NOT NULL,
                            title         VARCHAR(200) NOT NULL,
                            content       TEXT        NOT NULL,
                            thumbnail_url VARCHAR(255),
                            view_count    INT         DEFAULT 0,
                            like_count    INT         DEFAULT 0,
                            comment_count INT         DEFAULT 0,
                            created_at    DATETIME    DEFAULT CURRENT_TIMESTAMP,
                            updated_at    DATETIME    NULL,
                            deleted_yn    CHAR(1)     DEFAULT 'N',
                            CONSTRAINT pk_board_post PRIMARY KEY (post_id),
                            CONSTRAINT fk_bp_category FOREIGN KEY (category_id)
                                REFERENCES board_category(category_id),
                            CONSTRAINT fk_bp_member FOREIGN KEY (member_id)
                                REFERENCES member(member_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 태그
CREATE TABLE board_tag (
                           tag_id    BIGINT NOT NULL AUTO_INCREMENT,
                           tag_name  VARCHAR(50) NOT NULL,
                           CONSTRAINT pk_board_tag PRIMARY KEY (tag_id),
                           CONSTRAINT uq_board_tag_name UNIQUE (tag_name)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 게시글-태그 매핑
CREATE TABLE board_post_tag (
                                board_post_tag_id BIGINT NOT NULL AUTO_INCREMENT,
                                post_id           BIGINT NOT NULL,
                                tag_id            BIGINT NOT NULL,
                                CONSTRAINT pk_board_post_tag PRIMARY KEY (board_post_tag_id),
                                CONSTRAINT uk_board_post_tag UNIQUE (post_id, tag_id),
                                CONSTRAINT fk_bpt_post FOREIGN KEY (post_id)
                                    REFERENCES board_post(post_id),
                                CONSTRAINT fk_bpt_tag FOREIGN KEY (tag_id)
                                    REFERENCES board_tag(tag_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 게시글 이미지
CREATE TABLE board_post_image (
                                  image_id   BIGINT NOT NULL AUTO_INCREMENT,
                                  post_id    BIGINT NOT NULL,
                                  image_url  VARCHAR(255) NOT NULL,
                                  sort_order INT DEFAULT 1,
                                  CONSTRAINT pk_board_post_image PRIMARY KEY (image_id),
                                  CONSTRAINT fk_bpi_post FOREIGN KEY (post_id)
                                      REFERENCES board_post(post_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 댓글
CREATE TABLE board_comment (
                               comment_id        BIGINT NOT NULL AUTO_INCREMENT,
                               post_id           BIGINT NOT NULL,
                               member_id         BIGINT NOT NULL,
                               parent_comment_id BIGINT NULL,
                               content           VARCHAR(1000) NOT NULL,
                               like_count        INT DEFAULT 0,
                               created_at        DATETIME DEFAULT CURRENT_TIMESTAMP,
                               updated_at        DATETIME,
                               deleted_yn        CHAR(1) DEFAULT 'N',
                               CONSTRAINT pk_board_comment PRIMARY KEY (comment_id),
                               CONSTRAINT fk_bc_post FOREIGN KEY (post_id)
                                   REFERENCES board_post(post_id),
                               CONSTRAINT fk_bc_member FOREIGN KEY (member_id)
                                   REFERENCES member(member_id),
                               CONSTRAINT fk_bc_parent FOREIGN KEY (parent_comment_id)
                                   REFERENCES board_comment(comment_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 게시글 좋아요
CREATE TABLE board_like (
                            board_like_id BIGINT NOT NULL AUTO_INCREMENT,
                            member_id     BIGINT NOT NULL,
                            post_id       BIGINT NOT NULL,
                            created_at    DATETIME DEFAULT CURRENT_TIMESTAMP,
                            CONSTRAINT pk_board_like PRIMARY KEY (board_like_id),
                            CONSTRAINT uk_board_like UNIQUE (member_id, post_id),
                            CONSTRAINT fk_bl_member FOREIGN KEY (member_id)
                                REFERENCES member(member_id),
                            CONSTRAINT fk_bl_post FOREIGN KEY (post_id)
                                REFERENCES board_post(post_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 게시글 북마크
CREATE TABLE board_bookmark (
                                board_bookmark_id BIGINT NOT NULL AUTO_INCREMENT,
                                member_id         BIGINT NOT NULL,
                                post_id           BIGINT NOT NULL,
                                created_at        DATETIME DEFAULT CURRENT_TIMESTAMP,
                                CONSTRAINT pk_board_bookmark PRIMARY KEY (board_bookmark_id),
                                CONSTRAINT uk_board_bookmark UNIQUE (member_id, post_id),
                                CONSTRAINT fk_bb_member FOREIGN KEY (member_id)
                                    REFERENCES member(member_id),
                                CONSTRAINT fk_bb_post FOREIGN KEY (post_id)
                                    REFERENCES board_post(post_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 게시글/댓글 신고
CREATE TABLE board_report (
                              report_id   BIGINT NOT NULL AUTO_INCREMENT,
                              post_id     BIGINT,
                              comment_id  BIGINT,
                              reporter_id BIGINT NOT NULL,
                              reason      VARCHAR(255),
                              status      VARCHAR(20) DEFAULT 'WAIT',
                              created_at  DATETIME DEFAULT CURRENT_TIMESTAMP,
                              CONSTRAINT pk_board_report PRIMARY KEY (report_id),
                              CONSTRAINT fk_br_post FOREIGN KEY (post_id)
                                  REFERENCES board_post(post_id),
                              CONSTRAINT fk_br_comment FOREIGN KEY (comment_id)
                                  REFERENCES board_comment(comment_id),
                              CONSTRAINT fk_br_member FOREIGN KEY (reporter_id)
                                  REFERENCES member(member_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 4. 굿즈거래
CREATE TABLE trade_post (
                            trade_id       BIGINT NOT NULL AUTO_INCREMENT,
                            seller_id      BIGINT       NOT NULL,
                            title          VARCHAR(200) NOT NULL,
                            content        TEXT         NOT NULL,
                            goods_name     VARCHAR(150) NOT NULL,
                            work_name      VARCHAR(100),
                            character_name VARCHAR(100),
                            category       VARCHAR(30),
                            price          INT,
                            trade_type     VARCHAR(20) NOT NULL,
                            trade_method   VARCHAR(20) NOT NULL,
                            region         VARCHAR(100),
                            status         VARCHAR(20) DEFAULT 'ON_SALE',
                            view_count     INT         DEFAULT 0,
                            like_count     INT         DEFAULT 0,
                            created_at     DATETIME    DEFAULT CURRENT_TIMESTAMP,
                            updated_at     DATETIME,
                            deleted_yn     CHAR(1)     DEFAULT 'N',
                            CONSTRAINT pk_trade_post PRIMARY KEY (trade_id),
                            CONSTRAINT fk_tp_member FOREIGN KEY (seller_id)
                                REFERENCES member(member_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 거래글 이미지
CREATE TABLE trade_post_image (
                                  image_id   BIGINT NOT NULL AUTO_INCREMENT,
                                  trade_id   BIGINT NOT NULL,
                                  image_url  VARCHAR(255) NOT NULL,
                                  sort_order INT DEFAULT 1,
                                  CONSTRAINT pk_trade_post_image PRIMARY KEY (image_id),
                                  CONSTRAINT fk_tpi_trade FOREIGN KEY (trade_id)
                                      REFERENCES trade_post(trade_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 거래글 찜
CREATE TABLE trade_bookmark (
                                trade_bookmark_id BIGINT NOT NULL AUTO_INCREMENT,
                                member_id         BIGINT NOT NULL,
                                trade_id          BIGINT NOT NULL,
                                created_at        DATETIME DEFAULT CURRENT_TIMESTAMP,
                                CONSTRAINT pk_trade_bookmark PRIMARY KEY (trade_bookmark_id),
                                CONSTRAINT uk_trade_bookmark UNIQUE (member_id, trade_id),
                                CONSTRAINT fk_tb_member FOREIGN KEY (member_id)
                                    REFERENCES member(member_id),
                                CONSTRAINT fk_tb_trade FOREIGN KEY (trade_id)
                                    REFERENCES trade_post(trade_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 거래 채팅방
CREATE TABLE trade_chat_room (
                                 room_id         BIGINT NOT NULL AUTO_INCREMENT,
                                 trade_id        BIGINT NOT NULL,
                                 seller_id       BIGINT NOT NULL,
                                 buyer_id        BIGINT NOT NULL,
                                 created_at      DATETIME DEFAULT CURRENT_TIMESTAMP,
                                 last_message_at DATETIME,
                                 buyer_left_yn   CHAR(1)  DEFAULT 'N' NOT NULL,
                                 seller_left_yn  CHAR(1)  DEFAULT 'N' NOT NULL,
                                 CONSTRAINT pk_trade_chat_room PRIMARY KEY (room_id),
                                 CONSTRAINT fk_tcr_trade FOREIGN KEY (trade_id)
                                     REFERENCES trade_post(trade_id),
                                 CONSTRAINT fk_tcr_buyer FOREIGN KEY (buyer_id)
                                     REFERENCES member(member_id),
                                 CONSTRAINT fk_tcr_seller FOREIGN KEY (seller_id)
                                     REFERENCES member(member_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 거래 채팅 메시지
CREATE TABLE trade_chat_message (
                                    message_id BIGINT NOT NULL AUTO_INCREMENT,
                                    room_id    BIGINT NOT NULL,
                                    sender_id  BIGINT NOT NULL,
                                    message    VARCHAR(1000) NOT NULL,
                                    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
                                    read_yn    CHAR(1) DEFAULT 'N',
                                    CONSTRAINT pk_trade_chat_message PRIMARY KEY (message_id),
                                    CONSTRAINT fk_tcm_room FOREIGN KEY (room_id)
                                        REFERENCES trade_chat_room(room_id),
                                    CONSTRAINT fk_tcm_sender FOREIGN KEY (sender_id)
                                        REFERENCES member(member_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 5. 알림
CREATE TABLE notification (
                              notification_id BIGINT NOT NULL AUTO_INCREMENT,
                              member_id       BIGINT      NOT NULL,
                              notif_type      VARCHAR(30),
                              message         VARCHAR(255) NOT NULL,
                              link_type       VARCHAR(20),
                              link_target_id  BIGINT,
                              read_yn         CHAR(1)     DEFAULT 'N',
                              created_at      DATETIME    DEFAULT CURRENT_TIMESTAMP,
                              CONSTRAINT pk_notification PRIMARY KEY (notification_id),
                              CONSTRAINT fk_notif_member FOREIGN KEY (member_id)
                                  REFERENCES member(member_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- FAQ 카테고리
CREATE TABLE faq_category (
                              faq_category_id BIGINT NOT NULL AUTO_INCREMENT,
                              name            VARCHAR(50) NOT NULL,
                              CONSTRAINT pk_faq_category PRIMARY KEY (faq_category_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- FAQ
CREATE TABLE faq (
                     faq_id          BIGINT NOT NULL AUTO_INCREMENT,
                     faq_category_id BIGINT NOT NULL,
                     question        VARCHAR(255) NOT NULL,
                     answer          TEXT         NOT NULL,
                     sort_order      INT          DEFAULT 1,
                     CONSTRAINT pk_faq PRIMARY KEY (faq_id),
                     CONSTRAINT fk_faq_category FOREIGN KEY (faq_category_id)
                         REFERENCES faq_category(faq_category_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 1:1 문의
CREATE TABLE inquiry (
                         inquiry_id     BIGINT NOT NULL AUTO_INCREMENT,
                         member_id      BIGINT,
                         category       VARCHAR(30),
                         title          VARCHAR(200) NOT NULL,
                         content        TEXT         NOT NULL,
                         status         VARCHAR(20)  DEFAULT 'WAIT',
                         answer_content TEXT,
                         created_at     DATETIME     DEFAULT CURRENT_TIMESTAMP,
                         answered_at    DATETIME,
                         CONSTRAINT pk_inquiry PRIMARY KEY (inquiry_id),
                         CONSTRAINT fk_inquiry_member FOREIGN KEY (member_id)
                             REFERENCES member(member_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 공지/이벤트
CREATE TABLE service_notice (
                                notice_id   BIGINT NOT NULL AUTO_INCREMENT,
                                title       VARCHAR(200) NOT NULL,
                                content     TEXT         NOT NULL,
                                notice_type VARCHAR(20)  DEFAULT 'NOTICE',
                                start_date  DATE,
                                end_date    DATE,
                                created_at  DATETIME     DEFAULT CURRENT_TIMESTAMP,
                                CONSTRAINT pk_service_notice PRIMARY KEY (notice_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 관리자 계정
CREATE TABLE admin_user (
                            admin_id      BIGINT NOT NULL AUTO_INCREMENT,
                            login_id      VARCHAR(50)  NOT NULL,
                            login_pw      VARCHAR(200) NOT NULL,
                            name          VARCHAR(50)  NOT NULL,
                            email         VARCHAR(100),
                            phone         VARCHAR(20),
                            status        CHAR(1)      DEFAULT 'Y' NOT NULL,
                            last_login_at DATETIME,
                            created_at    DATETIME     DEFAULT CURRENT_TIMESTAMP NOT NULL,
                            updated_at    DATETIME,
                            CONSTRAINT pk_admin_user PRIMARY KEY (admin_id),
                            CONSTRAINT uq_admin_user_login UNIQUE (login_id),
                            CONSTRAINT chk_admin_user_status CHECK (status IN ('Y','N'))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 관리자 역할
CREATE TABLE admin_role (
                            role_id     BIGINT NOT NULL AUTO_INCREMENT,
                            role_code   VARCHAR(30) NOT NULL,
                            role_name   VARCHAR(50) NOT NULL,
                            description VARCHAR(200),
                            created_at  DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL,
                            CONSTRAINT pk_admin_role PRIMARY KEY (role_id),
                            CONSTRAINT uq_admin_role_code UNIQUE (role_code)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 관리자-역할 매핑
CREATE TABLE admin_user_role (
                                 admin_id   BIGINT NOT NULL,
                                 role_id    BIGINT NOT NULL,
                                 created_at DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL,
                                 CONSTRAINT pk_admin_user_role PRIMARY KEY (admin_id, role_id),
                                 CONSTRAINT fk_aur_admin FOREIGN KEY (admin_id)
                                     REFERENCES admin_user(admin_id),
                                 CONSTRAINT fk_aur_role FOREIGN KEY (role_id)
                                     REFERENCES admin_role(role_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 관리자 로그
CREATE TABLE admin_log (
                           log_id       BIGINT NOT NULL AUTO_INCREMENT,
                           admin_id     BIGINT       NOT NULL,
                           action_type  VARCHAR(50)  NOT NULL,
                           target_table VARCHAR(50),
                           target_id    BIGINT,
                           description  VARCHAR(400),
                           ip_address   VARCHAR(45),
                           created_at   DATETIME     DEFAULT CURRENT_TIMESTAMP NOT NULL,
                           CONSTRAINT pk_admin_log PRIMARY KEY (log_id),
                           CONSTRAINT fk_admin_log_admin FOREIGN KEY (admin_id)
                               REFERENCES admin_user(admin_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
