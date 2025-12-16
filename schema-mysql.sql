-- ============================================
-- 0. tkk 데이터베이스 전체 리셋
-- ============================================
DROP DATABASE IF EXISTS tkk;

CREATE DATABASE IF NOT EXISTS tkk
    DEFAULT CHARACTER SET utf8mb4
    DEFAULT COLLATE utf8mb4_general_ci;

USE tkk;

-- ============================================
-- 1. 테이블 생성 (MySQL 버전)
-- ============================================

CREATE TABLE member (
                        member_id         BIGINT AUTO_INCREMENT PRIMARY KEY,
                        login_id          VARCHAR(50)   NOT NULL UNIQUE,
                        login_pw          VARCHAR(255)  NOT NULL,
                        nickname          VARCHAR(50)   NOT NULL UNIQUE,
                        profile_image_url VARCHAR(511),
                        intro             VARCHAR(255),
                        user_level        INT           DEFAULT 1,
                        email             VARCHAR(100),
                        gender            ENUM('남자','여자') NOT NULL,
                        nationality       ENUM('내국인','외국인') NOT NULL,
                        verify_code       VARCHAR(10),
                        created_at        DATETIME      DEFAULT CURRENT_TIMESTAMP,
                        updated_at        DATETIME      DEFAULT NULL,
                        deleted_yn        CHAR(1)       DEFAULT 'N'
);

CREATE TABLE member_notification_setting (
                                             member_id   BIGINT     PRIMARY KEY,
                                             comment_yn  CHAR(1)   DEFAULT 'Y',
                                             like_yn     CHAR(1)   DEFAULT 'Y',
                                             trade_yn    CHAR(1)   DEFAULT 'Y',
                                             event_yn    CHAR(1)   DEFAULT 'Y',
                                             created_at  DATETIME  DEFAULT CURRENT_TIMESTAMP,
                                             updated_at  DATETIME  DEFAULT NULL,
                                             CONSTRAINT fk_mns_member FOREIGN KEY (member_id)
                                                 REFERENCES member(member_id) ON DELETE CASCADE
);

CREATE TABLE store (
                       store_id        BIGINT AUTO_INCREMENT PRIMARY KEY,
                       name            VARCHAR(100)  NOT NULL,
                       one_line_desc   VARCHAR(200),
                       address         VARCHAR(255),
                       region_name     VARCHAR(100),
                       latitude        DECIMAL(11,8),
                       longitude       DECIMAL(11,8),
                       avg_rating      DECIMAL(3,2) DEFAULT 0,
                       bookmark_count  INT          DEFAULT 0,
                       phone           VARCHAR(30),
                       image_url   VARCHAR(511),
                       created_at      DATETIME     DEFAULT CURRENT_TIMESTAMP,
                       deleted_yn      CHAR(1)      DEFAULT 'N' NOT NULL
);

CREATE TABLE store_bookmark (
                                store_bookmark_id BIGINT AUTO_INCREMENT PRIMARY KEY,
                                member_id         BIGINT NOT NULL,
                                store_id          BIGINT NOT NULL,
                                created_at        DATETIME DEFAULT CURRENT_TIMESTAMP,
                                CONSTRAINT uk_store_bookmark UNIQUE (member_id, store_id),
                                CONSTRAINT fk_sb_member FOREIGN KEY (member_id)
                                    REFERENCES member(member_id) ON DELETE CASCADE,
                                CONSTRAINT fk_sb_store FOREIGN KEY (store_id)
                                    REFERENCES store(store_id) ON DELETE CASCADE
);

CREATE TABLE store_goods (
                             goods_id        BIGINT AUTO_INCREMENT PRIMARY KEY,
                             store_id        BIGINT       NOT NULL,
                             name            VARCHAR(150) NOT NULL,
                             work_name       VARCHAR(100),
                             character_name  VARCHAR(100),
                             category        VARCHAR(30),
                             price           INT,
                             stock_qty       INT,
                             thumbnail_url   VARCHAR(511),
                             created_at      DATETIME DEFAULT CURRENT_TIMESTAMP,
                             updated_at      DATETIME DEFAULT NULL,
                             CONSTRAINT fk_sg_store FOREIGN KEY (store_id)
                                 REFERENCES store(store_id) ON DELETE CASCADE
);

CREATE TABLE search_log (
                            search_id   BIGINT AUTO_INCREMENT PRIMARY KEY,
                            member_id   BIGINT,
                            keyword     VARCHAR(100) NOT NULL,
                            target_type VARCHAR(20),
                            target_id   BIGINT,
                            created_at  DATETIME DEFAULT CURRENT_TIMESTAMP,
                            CONSTRAINT fk_sl_member FOREIGN KEY (member_id)
                                REFERENCES member(member_id) ON DELETE CASCADE
);

CREATE TABLE recommended_search (
                                    rec_id      BIGINT AUTO_INCREMENT PRIMARY KEY,
                                    keyword     VARCHAR(100) NOT NULL,
                                    target_type VARCHAR(20),
                                    sort_order  INT          DEFAULT 1,
                                    active_yn   CHAR(1)      DEFAULT 'Y'
);

CREATE TABLE popup_store (
                             popup_id         BIGINT AUTO_INCREMENT PRIMARY KEY,
                             title            VARCHAR(150) NOT NULL,
                             place_name       VARCHAR(150),
                             address          VARCHAR(255),
                             region_name      VARCHAR(100),
                             latitude         DECIMAL(11,8),
                             longitude        DECIMAL(11,8),
                             start_date       DATE        NOT NULL,
                             end_date         DATE        NOT NULL,
                             banner_image_url VARCHAR(511),
                             description      TEXT,
                             created_at       DATETIME    DEFAULT CURRENT_TIMESTAMP,
                             deleted_yn       CHAR(1)     DEFAULT 'N' NOT NULL
);

CREATE TABLE popup_bookmark (
                                popup_bookmark_id BIGINT AUTO_INCREMENT PRIMARY KEY,
                                member_id         BIGINT NOT NULL,
                                popup_id          BIGINT NOT NULL,
                                created_at        DATETIME DEFAULT CURRENT_TIMESTAMP,
                                CONSTRAINT uk_popup_bookmark UNIQUE (member_id, popup_id),
                                CONSTRAINT fk_pb_member FOREIGN KEY (member_id)
                                    REFERENCES member(member_id) ON DELETE CASCADE,
                                CONSTRAINT fk_pb_popup FOREIGN KEY (popup_id)
                                    REFERENCES popup_store(popup_id) ON DELETE CASCADE
);

CREATE TABLE popup_goods (
                             popup_goods_id  BIGINT AUTO_INCREMENT PRIMARY KEY,
                             popup_id        BIGINT NOT NULL,
                             name            VARCHAR(150) NOT NULL,
                             description     VARCHAR(255),
                             category        VARCHAR(30),
                             price           INT,
                             thumbnail_url   VARCHAR(511),
                             CONSTRAINT fk_pg_popup FOREIGN KEY (popup_id)
                                 REFERENCES popup_store(popup_id) ON DELETE CASCADE
);

CREATE TABLE main_banner (
                             banner_id       BIGINT AUTO_INCREMENT PRIMARY KEY,
                             title           VARCHAR(150) NOT NULL,
                             image_url       VARCHAR(511) NOT NULL,
                             link_type       VARCHAR(20),
                             link_target_id  BIGINT,
                             link_url        VARCHAR(511),
                             start_date      DATE,
                             end_date        DATE,
                             sort_order      INT        DEFAULT 1,
                             active_yn       CHAR(1)    DEFAULT 'Y'
);

CREATE TABLE board_category (
                                category_id BIGINT AUTO_INCREMENT PRIMARY KEY,
                                code        VARCHAR(30)  NOT NULL UNIQUE,
                                name        VARCHAR(50)  NOT NULL
);

CREATE TABLE board_post (
                            post_id         BIGINT AUTO_INCREMENT PRIMARY KEY,
                            category_id     BIGINT       NOT NULL,
                            member_id       BIGINT       NOT NULL,
                            title           VARCHAR(200) NOT NULL,
                            content         TEXT         NOT NULL,
                            thumbnail_url   VARCHAR(511),
                            view_count      INT          DEFAULT 0,
                            like_count      INT          DEFAULT 0,
                            comment_count   INT          DEFAULT 0,
                            created_at      DATETIME     DEFAULT CURRENT_TIMESTAMP,
                            updated_at      DATETIME     DEFAULT NULL,
                            deleted_yn      CHAR(1)      DEFAULT 'N',
                            CONSTRAINT fk_bp_category FOREIGN KEY (category_id)
                                REFERENCES board_category(category_id) ON DELETE CASCADE,
                            CONSTRAINT fk_bp_member FOREIGN KEY (member_id)
                                REFERENCES member(member_id) ON DELETE CASCADE
);

CREATE TABLE board_tag (
                           tag_id      BIGINT AUTO_INCREMENT PRIMARY KEY,
                           tag_name    VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE board_post_tag (
                                board_post_tag_id BIGINT AUTO_INCREMENT PRIMARY KEY,
                                post_id     BIGINT NOT NULL,
                                tag_id      BIGINT NOT NULL,
                                CONSTRAINT uk_board_post_tag UNIQUE (post_id, tag_id),
                                CONSTRAINT fk_bpt_post FOREIGN KEY (post_id)
                                    REFERENCES board_post(post_id) ON DELETE CASCADE,
                                CONSTRAINT fk_bpt_tag FOREIGN KEY (tag_id)
                                    REFERENCES board_tag(tag_id) ON DELETE CASCADE
);

CREATE TABLE board_post_image (
                                  image_id    BIGINT AUTO_INCREMENT PRIMARY KEY,
                                  post_id     BIGINT NOT NULL,
                                  image_url   VARCHAR(511) NOT NULL,
                                  sort_order  INT DEFAULT 1,
                                  CONSTRAINT fk_bpi_post FOREIGN KEY (post_id)
                                      REFERENCES board_post(post_id) ON DELETE CASCADE
);

CREATE TABLE board_comment (
                               comment_id        BIGINT AUTO_INCREMENT PRIMARY KEY,
                               post_id           BIGINT NOT NULL,
                               member_id         BIGINT NOT NULL,
                               parent_comment_id BIGINT,
                               content           VARCHAR(1000) NOT NULL,
                               like_count        INT DEFAULT 0,
                               created_at        DATETIME DEFAULT CURRENT_TIMESTAMP,
                               updated_at        DATETIME DEFAULT NULL,
                               deleted_yn        CHAR(1) DEFAULT 'N',
                               CONSTRAINT fk_bc_post FOREIGN KEY (post_id)
                                   REFERENCES board_post(post_id) ON DELETE CASCADE,
                               CONSTRAINT fk_bc_member FOREIGN KEY (member_id)
                                   REFERENCES member(member_id) ON DELETE CASCADE,
                               CONSTRAINT fk_bc_parent FOREIGN KEY (parent_comment_id)
                                   REFERENCES board_comment(comment_id) ON DELETE CASCADE
);

CREATE TABLE board_like (
                            board_like_id BIGINT AUTO_INCREMENT PRIMARY KEY,
                            member_id     BIGINT NOT NULL,
                            post_id       BIGINT NOT NULL,
                            created_at    DATETIME DEFAULT CURRENT_TIMESTAMP,
                            CONSTRAINT uk_board_like UNIQUE(member_id, post_id),
                            CONSTRAINT fk_bl_member FOREIGN KEY (member_id)
                                REFERENCES member(member_id) ON DELETE CASCADE,
                            CONSTRAINT fk_bl_post FOREIGN KEY (post_id)
                                REFERENCES board_post(post_id) ON DELETE CASCADE
);

CREATE TABLE board_bookmark (
                                board_bookmark_id BIGINT AUTO_INCREMENT PRIMARY KEY,
                                member_id         BIGINT NOT NULL,
                                post_id           BIGINT NOT NULL,
                                created_at        DATETIME DEFAULT CURRENT_TIMESTAMP,
                                CONSTRAINT uk_board_bookmark UNIQUE(member_id, post_id),
                                CONSTRAINT fk_bb_member FOREIGN KEY (member_id)
                                    REFERENCES member(member_id) ON DELETE CASCADE,
                                CONSTRAINT fk_bb_post FOREIGN KEY (post_id)
                                    REFERENCES board_post(post_id) ON DELETE CASCADE
);

CREATE TABLE board_report (
                              report_id   BIGINT AUTO_INCREMENT PRIMARY KEY,
                              post_id     BIGINT,
                              comment_id  BIGINT,
                              reporter_id BIGINT NOT NULL,
                              reason      VARCHAR(255),
                              status      VARCHAR(20) DEFAULT 'WAIT',
                              created_at  DATETIME DEFAULT CURRENT_TIMESTAMP,
                              CONSTRAINT fk_br_post FOREIGN KEY (post_id)
                                  REFERENCES board_post(post_id) ON DELETE CASCADE,
                              CONSTRAINT fk_br_comment FOREIGN KEY (comment_id)
                                  REFERENCES board_comment(comment_id) ON DELETE CASCADE,
                              CONSTRAINT fk_br_member FOREIGN KEY (reporter_id)
                                  REFERENCES member(member_id) ON DELETE CASCADE
);

CREATE TABLE trade_post (
                            trade_id        BIGINT AUTO_INCREMENT PRIMARY KEY,
                            seller_id       BIGINT       NOT NULL,
                            title           VARCHAR(200) NOT NULL,
                            content         TEXT         NOT NULL,
                            goods_name      VARCHAR(150) NOT NULL,
                            work_name       VARCHAR(100),
                            character_name  VARCHAR(100),
                            category        VARCHAR(30),
                            price           INT,
                            trade_type      VARCHAR(20) NOT NULL,
                            trade_method    VARCHAR(20) NOT NULL,
                            region          VARCHAR(100),
                            status          VARCHAR(20) DEFAULT 'ON_SALE',
                            view_count      INT          DEFAULT 0,
                            like_count      INT          DEFAULT 0,
                            created_at      DATETIME     DEFAULT CURRENT_TIMESTAMP,
                            updated_at      DATETIME     DEFAULT NULL,
                            deleted_yn      CHAR(1)      DEFAULT 'N',
                            CONSTRAINT fk_tp_member FOREIGN KEY (seller_id)
                                REFERENCES member(member_id) ON DELETE CASCADE
);

CREATE TABLE trade_post_image (
                                  image_id    BIGINT AUTO_INCREMENT PRIMARY KEY,
                                  trade_id    BIGINT NOT NULL,
                                  image_url   VARCHAR(511) NOT NULL,
                                  sort_order  INT DEFAULT 1,
                                  CONSTRAINT fk_tpi_trade FOREIGN KEY (trade_id)
                                      REFERENCES trade_post(trade_id) ON DELETE CASCADE
);

CREATE TABLE trade_bookmark (
                                trade_bookmark_id BIGINT AUTO_INCREMENT PRIMARY KEY,
                                member_id         BIGINT NOT NULL,
                                trade_id          BIGINT NOT NULL,
                                created_at        DATETIME DEFAULT CURRENT_TIMESTAMP,
                                CONSTRAINT uk_trade_bookmark UNIQUE(member_id, trade_id),
                                CONSTRAINT fk_tb_member FOREIGN KEY (member_id)
                                    REFERENCES member(member_id) ON DELETE CASCADE,
                                CONSTRAINT fk_tb_trade FOREIGN KEY (trade_id)
                                    REFERENCES trade_post(trade_id) ON DELETE CASCADE
);

CREATE TABLE trade_chat_room (
                                 room_id         BIGINT AUTO_INCREMENT PRIMARY KEY,
                                 trade_id        BIGINT NOT NULL,
                                 seller_id       BIGINT NOT NULL,
                                 buyer_id        BIGINT NOT NULL,
                                 created_at      DATETIME DEFAULT CURRENT_TIMESTAMP,
                                 last_message_at DATETIME DEFAULT NULL,
                                 buyer_left_yn   CHAR(1)  DEFAULT 'N' NOT NULL,
                                 seller_left_yn  CHAR(1)  DEFAULT 'N' NOT NULL,
                                 CONSTRAINT fk_tcr_trade  FOREIGN KEY (trade_id)
                                     REFERENCES trade_post(trade_id) ON DELETE CASCADE,
                                 CONSTRAINT fk_tcr_buyer  FOREIGN KEY (buyer_id)
                                     REFERENCES member(member_id) ON DELETE CASCADE,
                                 CONSTRAINT fk_tcr_seller FOREIGN KEY (seller_id)
                                     REFERENCES member(member_id) ON DELETE CASCADE
);

CREATE TABLE trade_chat_message (
                                    message_id  BIGINT AUTO_INCREMENT PRIMARY KEY,
                                    room_id     BIGINT NOT NULL,
                                    sender_id   BIGINT NOT NULL,
                                    message     VARCHAR(1000) NOT NULL,
                                    created_at  DATETIME DEFAULT CURRENT_TIMESTAMP,
                                    read_yn     CHAR(1) DEFAULT 'N',
                                    CONSTRAINT fk_tcm_room FOREIGN KEY (room_id)
                                        REFERENCES trade_chat_room(room_id) ON DELETE CASCADE,
                                    CONSTRAINT fk_tcm_sender FOREIGN KEY (sender_id)
                                        REFERENCES member(member_id) ON DELETE CASCADE
);

CREATE TABLE notification (
                              notification_id BIGINT AUTO_INCREMENT PRIMARY KEY,
                              member_id       BIGINT      NOT NULL,
                              notif_type      VARCHAR(30),
                              message         VARCHAR(255) NOT NULL,
                              link_type       VARCHAR(20),
                              link_target_id  BIGINT,
                              read_yn         CHAR(1)  DEFAULT 'N',
                              created_at      DATETIME DEFAULT CURRENT_TIMESTAMP,
                              CONSTRAINT fk_notif_member FOREIGN KEY (member_id)
                                  REFERENCES member(member_id) ON DELETE CASCADE
);

CREATE TABLE faq_category (
                              faq_category_id BIGINT AUTO_INCREMENT PRIMARY KEY,
                              name            VARCHAR(50) NOT NULL
);

CREATE TABLE faq (
                     faq_id          BIGINT AUTO_INCREMENT PRIMARY KEY,
                     faq_category_id BIGINT NOT NULL,
                     question        VARCHAR(255) NOT NULL,
                     answer          TEXT         NOT NULL,
                     sort_order      INT          DEFAULT 1,
                     CONSTRAINT fk_faq_category FOREIGN KEY (faq_category_id)
                         REFERENCES faq_category(faq_category_id) ON DELETE CASCADE
);

CREATE TABLE inquiry (
                         inquiry_id      BIGINT AUTO_INCREMENT PRIMARY KEY,
                         member_id       BIGINT,
                         category        VARCHAR(30),
                         title           VARCHAR(200) NOT NULL,
                         content         TEXT         NOT NULL,
                         status          VARCHAR(20)  DEFAULT 'WAIT',
                         answer_content  TEXT,
                         created_at      DATETIME     DEFAULT CURRENT_TIMESTAMP,
                         answered_at     DATETIME     DEFAULT NULL,
                         CONSTRAINT fk_inquiry_member FOREIGN KEY (member_id)
                             REFERENCES member(member_id) ON DELETE CASCADE
);

CREATE TABLE service_notice (
                                notice_id       BIGINT AUTO_INCREMENT PRIMARY KEY,
                                title           VARCHAR(200) NOT NULL,
                                content         TEXT         NOT NULL,
                                notice_type     VARCHAR(20)  DEFAULT 'NOTICE',
                                start_date      DATE,
                                end_date        DATE,
                                created_at      DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE admin_user (
                            admin_id       BIGINT AUTO_INCREMENT PRIMARY KEY,
                            login_id       VARCHAR(50)      NOT NULL UNIQUE,
                            login_pw       VARCHAR(200)     NOT NULL,
                            name           VARCHAR(50)      NOT NULL,
                            email          VARCHAR(100),
                            phone          VARCHAR(20),
                            status         ENUM('Y','N')    DEFAULT 'Y' NOT NULL,
                            last_login_at  DATETIME DEFAULT NULL,
                            created_at     DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL,
                            updated_at     DATETIME DEFAULT NULL
);

CREATE TABLE admin_role (
                            role_id     BIGINT AUTO_INCREMENT PRIMARY KEY,
                            role_code   VARCHAR(30) NOT NULL UNIQUE,
                            role_name   VARCHAR(50) NOT NULL,
                            description VARCHAR(200),
                            created_at  DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL
);

CREATE TABLE admin_user_role (
                                 admin_id    BIGINT NOT NULL,
                                 role_id     BIGINT NOT NULL,
                                 created_at  DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL,
                                 PRIMARY KEY (admin_id, role_id),
                                 CONSTRAINT fk_aur_admin FOREIGN KEY (admin_id)
                                     REFERENCES admin_user(admin_id) ON DELETE CASCADE,
                                 CONSTRAINT fk_aur_role FOREIGN KEY (role_id)
                                     REFERENCES admin_role(role_id) ON DELETE CASCADE
);

CREATE TABLE admin_log (
                           log_id       BIGINT AUTO_INCREMENT PRIMARY KEY,
                           admin_id     BIGINT       NOT NULL,
                           action_type  VARCHAR(50)  NOT NULL,
                           target_table VARCHAR(50),
                           target_id    BIGINT,
                           description  VARCHAR(400),
                           ip_address   VARCHAR(45),
                           created_at   DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL,
                           CONSTRAINT fk_admin_log_admin FOREIGN KEY (admin_id)
                               REFERENCES admin_user(admin_id) ON DELETE CASCADE
);