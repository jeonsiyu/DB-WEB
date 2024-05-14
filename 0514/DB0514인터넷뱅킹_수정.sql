-- 테이블 순서는 관계를 고려하여 한 번에 실행해도 에러가 발생하지 않게 정렬되었습니다.

drop table jijum_t cascade constraints purge;
drop table customer_t cascade constraints purge;
drop table account_t cascade constraints purge;
drop table yegeom_t cascade constraints purge;

-- jijum_t Table Create SQL
-- 테이블 생성 SQL - jijum_t
CREATE TABLE jijum_t
(
    jname     VARCHAR2(20)    NOT NULL, 
    jcity     VARCHAR2(10)    NOT NULL, 
    jjasan    NUMBER          NOT NULL, 
    jename    VARCHAR2(20)    NOT NULL, 
    jopen     DATE    NOT NULL, 
    jtel      VARCHAR2(20)    NOT NULL, 
     PRIMARY KEY (jname)
);

-- 테이블 Comment 설정 SQL - jijum_t
COMMENT ON TABLE jijum_t IS '지점';

-- 컬럼 Comment 설정 SQL - jijum_t.jname
COMMENT ON COLUMN jijum_t.jname IS '지점명';

-- 컬럼 Comment 설정 SQL - jijum_t.jcity
COMMENT ON COLUMN jijum_t.jcity IS '도시';

-- 컬럼 Comment 설정 SQL - jijum_t.jjasan
COMMENT ON COLUMN jijum_t.jjasan IS '자산';

-- 컬럼 Comment 설정 SQL - jijum_t.jename
COMMENT ON COLUMN jijum_t.jename IS '영문지점명';

-- 컬럼 Comment 설정 SQL - jijum_t.jopen
COMMENT ON COLUMN jijum_t.jopen IS '지점개설일';

-- 컬럼 Comment 설정 SQL - jijum_t.jtel
COMMENT ON COLUMN jijum_t.jtel IS '전화번호';

insert into jijum_t values ('신천점', '대구', 200000000000, 
    'SINCHON', to_date('1983/11/13', 'yyyy/mm/dd'), '053-123-1234');
insert into jijum_t values ('구미점', '구미', 300000000000, 
    'KUMI', to_date('1986/10/23', 'yyyy/mm/dd'), '054-123-1235');
insert into jijum_t values ('구룡포점', '포항', 250000000000, 
    'KURYONGPO', to_date('1987/07/03', 'yyyy/mm/dd'), '054-123-1236');

-- customer_t Table Create SQL
-- 테이블 생성 SQL - customer_t
CREATE TABLE customer_t
(
    cno       VARCHAR2(10)    NOT NULL, 
    cname     VARCHAR2(20)    NOT NULL, 
    caddr     VARCHAR2(50)    NOT NULL, 
    cbirth    DATE    NOT NULL, 
     PRIMARY KEY (cno)
);

-- 테이블 Comment 설정 SQL - customer_t
COMMENT ON TABLE customer_t IS '고객';

-- 컬럼 Comment 설정 SQL - customer_t.cno
COMMENT ON COLUMN customer_t.cno IS '고객번호';

-- 컬럼 Comment 설정 SQL - customer_t.cname
COMMENT ON COLUMN customer_t.cname IS '이름';

-- 컬럼 Comment 설정 SQL - customer_t.caddr
COMMENT ON COLUMN customer_t.caddr IS '주소';

-- 컬럼 Comment 설정 SQL - customer_t.cbirth
COMMENT ON COLUMN customer_t.cbirth IS '생년월일';

insert into customer_t values ('C000-1', '홍길동', 
    '대구 동구 신천1동', to_date('1990/12/25', 'yyyy/mm/dd'));
insert into customer_t values ('C000-2', '전우치', 
    '경북 포항 신천1동', to_date('1992/12/25', 'yyyy/mm/dd'));
insert into customer_t values ('C000-3', '유관순', 
    '경북 구미 신천1동', to_date('1994/12/25', 'yyyy/mm/dd'));

-- account_t Table Create SQL
-- 테이블 생성 SQL - account_t
CREATE TABLE account_t
(
    ano        VARCHAR2(10)    NOT NULL,    
    cno        VARCHAR2(10) NOT NULL,
    jname      VARCHAR2(20)    NOT NULL, -- 지점명
     PRIMARY KEY (ano)
);

-- 테이블 Comment 설정 SQL - account_t
COMMENT ON TABLE account_t IS '예금계좌';

-- 컬럼 Comment 설정 SQL - account_t.ano
COMMENT ON COLUMN account_t.ano IS '계좌번호';

-- 컬럼 Comment 설정 SQL - account_t.ajango
--COMMENT ON COLUMN account_t.ajango IS '잔고';

-- 컬럼 Comment 설정 SQL - account_t.aipchul
--COMMENT ON COLUMN account_t.aipchul IS '입/출금';

-- 컬럼 Comment 설정 SQL - account_t.jname
COMMENT ON COLUMN account_t.jname IS '지점명';

-- Foreign Key 설정 SQL - account_t(jname) -> jijum_t(jname)
ALTER TABLE account_t
    ADD CONSTRAINT FK_account_t_jname_jijum_t_jname FOREIGN KEY (jname)
        REFERENCES jijum_t (jname) ;

-- Foreign Key 삭제 SQL - account_t(jname)
-- ALTER TABLE account_t
-- DROP CONSTRAINT FK_account_t_jname_jijum_t_jname;

-- 새롭게 추가
-- Foreign Key 설정 SQL - account_t(cno) -> customer_t(cno)
ALTER TABLE account_t
    ADD CONSTRAINT FK_account_t_cno_customer_t_cno FOREIGN KEY (cno)
        REFERENCES customer_t (cno) ;
        
insert into account_t values ('BO-000-1', 'C000-1', '신천점');
insert into account_t values ('BO-000-2', 'C000-2', '구룡포점');
insert into account_t values ('BO-000-3', 'C000-3', '구미점');

-- yegeom_t Table Create SQL
-- 테이블 생성 SQL - yegeom_t
CREATE TABLE yegeom_t
(
    yno    VARCHAR2(10)    NOT NULL, 
    cno    VARCHAR2(10)    NOT NULL, 
    ano    VARCHAR2(10)    NOT NULL,
    ydate  varchar2(20)    NOT NULL,
    money  number not null,
    inout  varchar2(10) not null,
    jango  number not null,
    transfer varchar2(20) not null,    
    PRIMARY KEY (yno)
);

-- 테이블 Comment 설정 SQL - yegeom_t
COMMENT ON TABLE yegeom_t IS '예금';

-- 컬럼 Comment 설정 SQL - yegeom_t.yno
COMMENT ON COLUMN yegeom_t.yno IS '예금번호';

-- 컬럼 Comment 설정 SQL - yegeom_t.cno
COMMENT ON COLUMN yegeom_t.cno IS '고객번호';

-- 컬럼 Comment 설정 SQL - yegeom_t.ano
COMMENT ON COLUMN yegeom_t.ano IS '계좌번호';

-- Foreign Key 설정 SQL - yegeom_t(cno) -> customer_t(cno)
ALTER TABLE yegeom_t
    ADD CONSTRAINT FK_yegeom_t_cno_customer_t_cno FOREIGN KEY (cno)
        REFERENCES customer_t (cno) ;

-- Foreign Key 삭제 SQL - yegeom_t(cno)
-- ALTER TABLE yegeom_t
-- DROP CONSTRAINT FK_yegeom_t_cno_customer_t_cno;

-- Foreign Key 설정 SQL - yegeom_t(ano) -> account_t(ano)
ALTER TABLE yegeom_t
    ADD CONSTRAINT FK_yegeom_t_ano_account_t_ano FOREIGN KEY (ano)
        REFERENCES account_t (ano) ;

-- Foreign Key 삭제 SQL - yegeom_t(ano)
-- ALTER TABLE yegeom_t
-- DROP CONSTRAINT FK_yegeom_t_ano_account_t_ano;
 
insert into yegeom_t values ('Y000-1', 'C000-1', 'BO-000-1',
    to_char(sysdate, 'yy/mm/dd hh24:mi:ss'), 10000, '입금',
    1100000, 'BO-000-1');
insert into yegeom_t values ('Y000-2', 'C000-2', 'BO-000-2',
    to_char(sysdate, 'yy/mm/dd hh24:mi:ss'), 50000, '입금',
    500000, 'BO-000-2');
insert into yegeom_t values ('Y000-3', 'C000-3', 'BO-000-3',
    to_char(sysdate, 'yy/mm/dd hh24:mi:ss'), 1000, '입금',
    100000, 'BO-000-3');
insert into yegeom_t values ('Y000-4', 'C000-1', 'BO-000-1',
    to_char(sysdate, 'yy/mm/dd hh24:mi:ss'), 100000, '출금',
    1000000, 'BO-000-1');
insert into yegeom_t values ('Y000-5', 'C000-2', 'BO-000-2',
    to_char(sysdate, 'yy/mm/dd hh24:mi:ss'), 400000, '출금',
    100000, 'BO-000-2');
insert into yegeom_t values ('Y000-6', 'C000-3', 'BO-000-3',
    to_char(sysdate, 'yy/mm/dd hh24:mi:ss'), 50000, '출금',
    50000, 'BO-000-3');
    
-- C000-1 -> C000-3 송금
insert into yegeom_t values ('Y000-7', 'C000-1', 'BO-000-1',
    to_char(sysdate, 'yy/mm/dd hh24:mi:ss'), 100000, '출금',
    900000, 'BO-000-3');

-- C000-1 -> C000-3 입금
insert into yegeom_t values ('Y000-8', 'C000-3', 'BO-000-3',
    to_char(sysdate, 'yy/mm/dd hh24:mi:ss'), 100000, '입금',
    200000, 'BO-000-1');
commit;
