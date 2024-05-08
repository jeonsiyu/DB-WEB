Create table student_t (
    id varchar2(10) primary key, -- 학번 중복 x
    name varchar2(20) not null,
    age number not null,
    tel varchar2(30) not null
);

drop table student_t;

insert into student_t (id, name, age, tel)
    values('stoool','홍길동', 20, '010-1111-1234');
insert into student_t (id, name, age, tel)
    values('stooo2','전우치', 20, '010-1111-1234');
insert into student_t (id, name, age, tel)
    values('stooo3','이순신', 20, '010-1111-1234');
insert into student_t(id, name) values('st0004', '유관순');

-- 모든 데이터 보기
select * from student_t;
