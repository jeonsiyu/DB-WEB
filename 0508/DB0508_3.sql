create table person_t (
     id varchar2(14) primary key, --각각의 컬럼들
     name varchar2(20) not null, -- 각각의 컬럼들
     age number(5) not null,    --
     tel varchar2(20) not null, --
     addr varchar2(50) not null --
);

insert into person_t (id, name, age, tel, addr)
    values('901211-1234567','홍길동', 30,'010-1234-1234','대구시 동구 신천3동');
insert into person_t (id, name, age, tel, addr)
    values('900111-2785621','전우치', 30,'010-7891-7891','대구시 동구 신천3동');
insert into person_t (id, name, age, tel, addr)  
    values('900211-1234541','이순신', 30,'010-7891-7891','대구시 동구 신천3동');


select * from person_t;

-- 데이터 삭제
delete from person_t; -- 모든 데이터 삭제

-- 데이터 수정 
update person_t set name='이순신';
update person_t set name='강감찬', age=200;

-- 조건을 사용하여 검색, 수정, 삭제
select * from person_t where age= 20;
select * from person_t where name='홍길동';
select * from person_t where name='홍길동' and age=20;
select * from person_t where name='홍길동' or age=20;
select * from person_t where name is null; -- null 값을 검색 
select * from person_t where name is not null; -- null 값을 검색 
select * from person_t where name like '&길&'; -- 이름 가운데 '길'이 포함된 정보 

delete from ptrsoon_t where name= '홍길동';
update person_t set name= '김우치' where name= '김길동';




