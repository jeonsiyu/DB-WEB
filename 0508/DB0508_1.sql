-- 테이블( 데이터를 저장하는 공간) 생성
create table customer (
    name varchar2(20),
    age number(5),
    gender char(1),
    reg_date date default sysdate);
 
-- 테이블 삭제 
drop table customer;
    
-- 데이터 입력
-- 반드시 주의 : 데이터를 표시할때 '' 필요!!!!
-- DB에서는 문자, 문자열 구분이 없음
-- sysdate : 시스템 날짜를 가져오는 함수
insert into customer(name, age, gender, reg_date)
     values('홍길동', 100, 'M', sysdate);
     
-- 데이터 보기
-- * : 테이블에 존재하는 모든 컬럼을 의미
select * from customer;
select name, age, gender,reg_date from customer;
select name, age from customer;







