-- 한줄 주석
/* 
여러줄 주석
*/ 

-- system 계정에서 사용해야함(?)

-- DB 연습을 위한 일반 사용자 계정 생성 test / 1234
-- 11g 호환 : c## 제거
alter session set "_oracle_script" = true;

-- 계정 / 비번 생성 test / 1234
create user test identified by 1234;

-- 접속 및 사용 권한 부여 
grant connect, resource to test;

-- DB 공간 할당
alter user test quota unlimited on users;


