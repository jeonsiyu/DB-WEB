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