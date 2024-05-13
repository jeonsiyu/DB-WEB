-- join : 분리된 테이블을 합쳐서 검색
-- 사원이 7788인 사원명과 부서명을 출력
-- 조인을 사용하지 않으면 각자 정보를 검색
Select ename, dno from employee where eno=7788;
select dname from department where dno = 20;

-- 조인 종류: 내부 조인(inner join), 외부조인(outer join)
-- 조인을 사용하여 한꺼번에 출력 (equl ={동등}조인)-> 내부 조인
select * from employee, department
    where employee.dno = department.dno;
            -- F.K와의      P.K 관계가 있어야함 
            
select employee.ename, department.dname, employee.dno 
        from employee, department
        where employee.dno = department.dno;
        
--테이블명이 길 경우 별칭 사용
select e.ename, d.dname, e.dno, d.loc
        from employee e, department d
        where e.dno = d.dno and e.eno=7788;

-- 연습 문제 숙제
-- 1. scott 사원의 이름, 부서 번호, 부서명 출력
select e.ename, e.dno, d.dname
    from employee e, department d
    where e. dno = d.dno and e.ename='SCOTT';

-- 2. 사원명, 부서명, 지역 출력
select e.ename, d.dname, d.loc
    from employee e,department d 
    where e.dno = d.dno ;
    
-- 3. 이름에 'A'가 포함된 모든 사원의 이름, 부서명 부서지역 출력
select e.ename,  d.dname, d.loc
from employee e,department d
where e.dno = d.dno and e.ename like '%A%';

-- natural 조인(자연 조인) : 자동으로 중복된 컬럼 제거
-- select tablel.column, table2.column
--  FROM tablel NATURAL JOIN table2;
Select eno, ename, dname, dno
    from employee e natural join department d
    where e.eno = 7788;
    
-- join using(컬럼)
Select eno, ename, dname, dno
    from employee e join department d
    using(dno) where e.eno = 7788;
    
-- join ~ on
select e.eno, e.ename, d.dname, e.dno
    from employee e join department d
    on e.dno = d.dno where e.eno=7788;

-- 내부 조인 :non-equi join
-- <, >, <=, >=, between a and b : '=' 조건을 사용 x
select ename, salary, grade
    from employee, salgrade
    where salary between losal and hisal;

-- 3개 이상 테이블 조인하기
select e.ename, d.dname, e.salary, s.grade
    from employee e, department d, salgrade s
    where e.dno = d.dno 
    and salary between losal and hisal;
    
-- 외부조인 : null 정보를 조인하면서 표시됨 
-- left outer join, right outer join, full outer join
select e.ename as "사원", m.ename as "관리자"
    from employee e left outer join employee m
    on e.manager=m.eno;
    -- 셀프조인..? 테이블이 같은거라서 그럼..?
    
select e.ename as "사원", m.ename as "관리자"
    from employes e, employee m
    where e.manager= m.eno(+);
    
-- 연습 문제
-- 4. 커미션을 받을 수 있는 사원명, 부서명, 근무지 출력 -사원명 오름차순 정렬
select e.ename, d.dname, d.loc
    from employee e, department d
    where e.dno = d.dno and commission > 0 
    order by e.ename asc;

select ename, dname, loc
    from employee e NATURAL join department d
    where commission >= 0
    order by e.ename asc;

-- 5. 뉴욕에 근무하는 모든 사원의 이름, 업무, 부서명 출력 -- 부서번호 오름차순 정렬 이름 내림차순 정렬 
select e.ename, e.job, d.dno 
    from employee e, department d
    where e.dno = d.dno and loc = 'NEW YORK'
    order by d.dno asc, e.ename desc;

select ename, job, dno
    from employee e NATURAL join department d
    where loc = 'NEW YORK'
    order by d.dno asc, e.ename desc;

-- 6. 사원, 사원명, 담당업무, 관리자 번호, 부서번호, 부서명 출력 - left outer join
select e.ename as "사원", e.job as "담당업무", 
    e.manager as "관리자 번호", d.dno as "부서번호", d.dname as "부서명"
    from employee e left outer join department d
    on e.dno=d.dno;
