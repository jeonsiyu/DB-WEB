-- 테이블 강제 삭제(참조키와 연결된 경우)
-- 기본키와 참조키가 연결되어있으면 먼저 참조키 테이블을 삭제 후 
-- 기본키 테이블을 삭제 할 수 있음 
drop table 테이블명 cascade constraints purge;

-- 데이터를 제외한 테이블 구조 복사
create table dept_copy as select * from department where 0=1;
create table emp_copy as select * from department where 0=1;
insert into dept_copy values (10,'회계부','대구');
insert into dept_copy values (20,'개발부','부산');
insert into emp_copy values (1234, '홍길동', 'sw개발', 2222,
    to_date('20-11-2022', 'dd-mm-yyyy'), 300, null, 20);

-- 다른 테이블에서 데이터를 복사해서 추가
insert into dept_copy select * from department;

-- 시퀀스 sequenece
create sequence emp_seq
    start with 1 increment by 1 nomaxvalue  nominvalue;

create table seq_test_t(    
    id number primary key,
    name varchar2(20));
insert into seq_test_t values (emp_seq.nextval,'홍길동');
insert into seq_test_t values (emp_seq.nextval,'전우치');
drop sequence emp_seq;

-- update sub query
update dept_copy set
    loc=(select loc from dept_copy where dno=20)
    where don=10;
    
-- delete sub query
delete emp_copy where
    dno=(select dno from department where dname="SALES");
    
-- round함수 : 반올림 처리 
select round(sysdate - hiredate) as "근무 함수" from employee;
select round((sysdate - hiredate)/365) as "근속 년수" from employee;

-- 입사 한지 6개월 지난 사원
-- add_moonth(date,n) - date에 n개월 더 함
select ename, hireadate, add_months(hiredate,6) from employee;

-- 날짜 표시 : to_char 함수
select ename, hiredate, to_char(hiredate, 'yy-mm'),
    to_char(hiredate, 'yyyy/mm/dd') from employee;

-- 현재 날짜, 시간 표시
-- dual : 간단하게 함수를 이용해서 계산 결과값을 확인할 때 사용
select to char(sysdate, 'yyyy/mm/dd hh24:mi:ss') from dual;

-- 화폐기호 표시
-- L : 지역별 통화 기호
-- 0 : 자리수가 ㅁ자지 않으면 '0'으로 채움
-- 9 : 자리수가 맞지 않으면 빈자리 무시 
Select ename, to_char(salary, '19999,999') from employee;

-- case를 사용하여 이름, 부서명 출력  
select enmae, dno
    case 
        when dno=10 than '회계부'
        when dno=20 than '홍보부'
        when dno=30 than '영업부'
        when dno=40 than '비서실'
    else '알수 없음'
end as "부서명"
from emplyess order by dno;

-- decode() 을 사용하여 case 유사하게 출력
-- 부서명, 지역명, 사원수 , 모든 사원의 평균 급여 출력
select
    decode (dno, 10, '회계부', 20 ,'홍보부', 30,'영업부', 40,'기획실') "부서명",
    decode (dno, 10, '대구', 20 ,'서울', 30,'부산', 40,'광주') "지역",
    count(*) as "사원 수", round(avg(salary)) as "평균급여"
from employes group by dno;

-- view : 가상테이블 (메모리 관리,보안)
-- view 권한 주기 : grant create view to test;
create or replace view join_test_v as
    select e.ename, d. dname, e.salary, s.grade from
        employee e, department d, salgrade s
        where e.dno=d.dno and salary between losal and hisal;
select * from join_test_v;

-- 연습문제 
-- 1. department의 모든 데이터를 dept_copy2 테이블에 복사
create table dept_copy2 as select * from department where 0=1;
insert into dept_copy2 select * from department;

-- 2. employee의 모든 데이터를 emp_cpoy2 테이블에 복사
create table emp_copy2 as select * from employee where 0=1;
insert into  emp_copy2 select * from employee;

-- 3. 10번 부서의 지역명을 20번 부서의 지역명으로 변경하기
update dept_copy2 set 
    loc =(select loc from dept_copy2 where dno=20)
    where don=10;

-- 4. 10번 부서의 부서명을 30번 부서의 부서명과 지역명으로 변경
update dept_copy2 set 
    dname = (select dname from dept_copy2 where dno=30)
    loc =(select loc from dept_copy2 where dno=30)
    where don=10;

-- 5. 영업부 사원 모두 삭제
DELETE FROM dept_copy2 WHERE dno = (select dno from department where dname'SALES');

-- 6. 사원, 부서, 급여등급 테이블을 조인하여 사번, 사원명, 급여, 담당업무,입사일, 부서명, 
--    부서지역, 급여등급을 출력하는 가상테이블 생성
create or replace view_join_v as
select e.eno "사번", e.ename "사원명", e.salary "급여", 
    e.job "담당업무", e.hiredate "입사일",
    d.dname "부서명", d.loc "근무지", s.grade "급여등급"
    from employee e, department d, salgrad s
    where e.dno = d.dno and salary between losal and hisal;
select * from emp_join_v;
select "사번", "사원명", "부서명", "급여등급" from emp_join_v;

-- crud -- 설계





