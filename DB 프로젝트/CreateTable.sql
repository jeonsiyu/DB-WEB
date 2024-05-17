-- 테이블 순서는 관계를 고려하여 한 번에 실행해도 에러가 발생하지 않게 정렬되었습니다.
drop table Developer;
drop table Player;
drop table Orders;
drop table Game;
drop table OrderItem;
-- Developer Table Create SQL
-- 테이블 생성 SQL - Developer
-- Developer Table
CREATE TABLE Developer (
    d_ID      VARCHAR2(20)    NOT NULL, 
    d_name    VARCHAR(50)     NOT NULL, 
    d_year    NUMBER          NULL, 
    d_site    VARCHAR(50)     NULL, 
    PRIMARY KEY (d_name)
);

-- 테이블 Comment 설정 SQL - Developer
COMMENT ON TABLE Developer IS '개발사';

-- 컬럼 Comment 설정 SQL - Developer.d_ID
COMMENT ON COLUMN Developer.d_ID IS '개발사ID';

-- 컬럼 Comment 설정 SQL - Developer.d_name
COMMENT ON COLUMN Developer.d_name IS '개발사이름';

-- 컬럼 Comment 설정 SQL - Developer.d_year
COMMENT ON COLUMN Developer.d_year IS '설립년도';

-- 컬럼 Comment 설정 SQL - Developer.d_site
COMMENT ON COLUMN Developer.d_site IS '개발사웹사이트';

-- Unique Index 설정
CREATE UNIQUE INDEX UQ_Developer_1
    ON Developer(d_ID);

-- Player Table
CREATE TABLE Player (
    u_ID          VARCHAR2(20)    NOT NULL, 
    u_PW          VARCHAR2(20)    NOT NULL, 
    u_nick        VARCHAR2(20)    NOT NULL, 
    u_name        VARCHAR2(20)    NOT NULL, 
    u_email       VARCHAR2(50)    NOT NULL, 
    u_signdate    DATE            NOT NULL, 
    PRIMARY KEY (u_ID)
);
-- 테이블 Comment 설정 SQL - Player
COMMENT ON TABLE Player IS '사용자';

-- 컬럼 Comment 설정 SQL - Player.u_ID
COMMENT ON COLUMN Player.u_ID IS '사용자ID';

-- 컬럼 Comment 설정 SQL - Player.u_PW
COMMENT ON COLUMN Player.u_PW IS '비밀번호';

-- 컬럼 Comment 설정 SQL - Player.u_nick
COMMENT ON COLUMN Player.u_nick IS '닉네임';

-- 컬럼 Comment 설정 SQL - Player.u_name
COMMENT ON COLUMN Player.u_name IS '사용자이름';

-- 컬럼 Comment 설정 SQL - Player.u_email
COMMENT ON COLUMN Player.u_email IS '이메일 주소';

-- 컬럼 Comment 설정 SQL - Player.u_signdate
COMMENT ON COLUMN Player.u_signdate IS '가입일';

-- Unique Index 설정 SQL - Player(u_nick)
CREATE UNIQUE INDEX UQ_Player_1
    ON Player(u_nick);
    
-- Orders Table
CREATE TABLE Orders (
    o_ID           VARCHAR2(20)    NOT NULL, 
    u_ID           VARCHAR2(20)    NOT NULL, 
    o_orderdate    DATE            NOT NULL, 
    o_total        NUMBER          NOT NULL, 
    PRIMARY KEY (o_ID),
    FOREIGN KEY (u_ID) REFERENCES Player (u_ID)
);

-- 테이블 Comment 설정 SQL - Orders
COMMENT ON TABLE Orders IS '주문';

-- 컬럼 Comment 설정 SQL - Orders.o_ID
COMMENT ON COLUMN Orders.o_ID IS '주문ID';

-- 컬럼 Comment 설정 SQL - Orders.u_ID
COMMENT ON COLUMN Orders.u_ID IS '사용자ID';

-- 컬럼 Comment 설정 SQL - Orders.o_orderdate
COMMENT ON COLUMN Orders.o_orderdate IS '주문일';

-- 컬럼 Comment 설정 SQL - Orders.o_total
COMMENT ON COLUMN Orders.o_total IS '총주문금액';

-- Game Table
CREATE TABLE Game (
    g_ID           VARCHAR2(20)    NOT NULL, 
    g_title        VARCHAR(50)     NOT NULL, 
    g_info         CLOB            NULL, 
    g_startdate    DATE            NOT NULL, 
    d_name         VARCHAR(50)     NOT NULL, 
    g_genre        VARCHAR2(20)    NOT NULL, 
    g_price        NUMBER          NOT NULL, 
    g_platform     VARCHAR2(20)    NOT NULL, 
    PRIMARY KEY (g_ID),
    FOREIGN KEY (d_name) REFERENCES Developer (d_name)
);
-- 테이블 Comment 설정 SQL - Game
COMMENT ON TABLE Game IS '게임';

-- 컬럼 Comment 설정 SQL - Game.g_ID
COMMENT ON COLUMN Game.g_ID IS '게임ID';

-- 컬럼 Comment 설정 SQL - Game.g_title
COMMENT ON COLUMN Game.g_title IS '게임제목';

-- 컬럼 Comment 설정 SQL - Game.g_info
COMMENT ON COLUMN Game.g_info IS '설명';

-- 컬럼 Comment 설정 SQL - Game.g_startdate
COMMENT ON COLUMN Game.g_startdate IS '출시일';

-- 컬럼 Comment 설정 SQL - Game.d_name
COMMENT ON COLUMN Game.d_name IS '개발사이름';

-- 컬럼 Comment 설정 SQL - Game.g_genre
COMMENT ON COLUMN Game.g_genre IS '장르';

-- 컬럼 Comment 설정 SQL - Game.g_price
COMMENT ON COLUMN Game.g_price IS '게임가격';

-- 컬럼 Comment 설정 SQL - Game.g_platform
COMMENT ON COLUMN Game.g_platform IS '지원플랫폼';

-- OrderItem Table
CREATE TABLE OrderItem (
    i_ID       VARCHAR2(20)    NOT NULL, 
    o_ID       VARCHAR2(20)    NOT NULL, 
    g_ID       VARCHAR2(20)    NOT NULL, 
    PRIMARY KEY (i_ID),
    FOREIGN KEY (o_ID) REFERENCES Orders (o_ID),
    FOREIGN KEY (g_ID) REFERENCES Game (g_ID)
);

-- 테이블 Comment 설정 SQL - OrderItem
COMMENT ON TABLE OrderItem IS '주문항목';

-- 컬럼 Comment 설정 SQL - OrderItem.i_ID
COMMENT ON COLUMN OrderItem.i_ID IS '주문항목ID';

-- 컬럼 Comment 설정 SQL - OrderItem.o_ID
COMMENT ON COLUMN OrderItem.o_ID IS '주문ID';

-- 컬럼 Comment 설정 SQL - OrderItem.g_ID
COMMENT ON COLUMN OrderItem.g_ID IS '게임ID';

-- 컬럼 Comment 설정 SQL - OrderItem.g_title
COMMENT ON COLUMN OrderItem.g_title IS '게임제목';

-- 컬럼 Comment 설정 SQL - OrderItem.g_price
COMMENT ON COLUMN OrderItem.g_price IS '게임가격';

CREATE VIEW OrderItem_Game_Info AS
SELECT oi.i_ID,
       oi.o_ID,
       oi.g_ID,
       g.g_title AS game_title,
       g.g_price AS game_price
FROM OrderItem oi
JOIN Game g ON oi.g_ID = g.g_ID;
