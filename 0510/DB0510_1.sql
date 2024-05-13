-- sub query(서브 쿼리)
/* 
Select
   출력한 컬럼 FROM table
   WHERE 컬럼 연산자
    (SELECT select_list
     FROM table
     WHERE ......); */
-- 1. 단일 서브쿼리
-- 내부 쿼리 문의 결과로 얻어지는 행이 1개
-- 단일행 비교 연산자 >, >=, <, <=, <>, !=

-- 2. 다중행 서브쿼리
-- 내부 쿼리 문의 결과로 얻어지는 행이 2개 이상
-- 다중행 비교 연산자 in, any, som, all, exists

-- SCOTT 과 동일한 부서에서 근무하는 사원명, 부서번호 출력
select ename , dno from employee
    where dno=(select dno from employee where ename='scott');
    
-- 부서별 최초 급여를 받는 사원의 사원번호와 이름 출력
select eno,ename from employee
 where salart in(select min(salary) from employee group by dno);
 
-- 직급이 세일즈맨이 아니면서 급여가 임의의 세인즈맨 보다 낮은 사원 출력
select eno, ename, job, salary from employee
    where salary < any(select salary from employee where job='SALESMAN')and job <>'SALESMAN';
    
select eno, ename, job, salary from employee -- 사번, 사원이름, 업무. 급여
    where salary < all(select salary from employee where job='SALESMAN')and job <>'SALESMAN';
    
-- 연습 문제 (숙제)
-- 1. 사원번호가 7788인 사원과 담담업무가 같은 사원 출력
Select eno, ename, job from employee
    where job = (select job from employee where eno ='7788');

-- 2. 사원번호가 7499보다 급여가 많은 사원명, 담당업무, 급여 출력
select eno, ename, job, salary from employee 
    where salary > (select salary from employee where eno = '7499');

-- 3. 최소, 최대 급여를 받는 사원명, 담담업무 , 급여 출력
select ename, job, salary from employee
    where salary =(select min(salary) from employee)
    or salary =(select max(salary) from employee);
    
-- 4. 부서별 최소 급여를 받는 사원명, 급여, 부서번호 출력
select ename, salary, dno from employee
    where salary in (select min(salary) from employee group by dno);
    
-- 5. 4번 문제에서 부서명, 근무지를 추가하여 출력 - 조인 사용
select e.ename, e.esalary, e.dno, d.dname ,d.loc from employee e,department d  
    where e.dno=d.dno and salary
    in (select min(min(salary) from employee group by dno);

select ename, salary, dno, dname ,loc 
    from employee natural join department
    where (dno,salary) in (select dno, min(salary) from employee group by dno);
    
-- 6. 담당업무가 ANALYST인 사원보다 급여가 적으면서 업무가 SALESMAN이 아닌 사번, 이름, 담당 업무, 급여 출력 - 사번으로 오름차순 정렬
select eno, ename, JOB , salary from employee 
    where salary < all(select salary from employee where job='ANALYST') and job <> 'SALESMAN'
    order by eno asc;    

-- 7. 직속 상관이 없는 직원 출력 
select ename from employee
    where eno
    in (select eno from employee where manager is null);

-- 8. 7번 문제에서 부서명, 근무자 추가 - 서브쿼리, 조인+서브쿼리 2가지 방법

--{서브쿼리}

--{조인}
select e.ename, d.dname, d.loc from employee e, department d
    where e.dno = d.dno and eno
    in (select eno from employee where manager is null);
    
-- 9. 부하직원이 없는 직원의 사번, 사원명, 급여 출력
select eno, ename, salary from employee
    where eno <> all(select manager from employee where manager is not null);

-- 10. blake 동일한 부서에 속한 사원명, 입사일 출력, blake는 출력 제외
select ename, hiredate from employee  
    where dno = (select dno employee where ename='BLAKE') and ename <> 'BLAKE';

-- 11. 근무지가 DALLAS인 사원명, 부서번호, 담당업무 출력 - 오름차순
--      서브 쿼리, 조인 2가지 방법
-- [서브쿼리]
select ename, dno, job from employee where dno=
    (select dno from department where loc='DALLAS')
    order by ename asc;
    
select e.ename, e.dno, e job from employee e, depatment d
    where e.dno = d.dno and d. loc= 'DALLAS' order by ename asc;

-- 12. SCOTT과 동일한 부서에서 근무하는 사원명, 부서번호 출력
select ename, dno, from employee where dno=
    (select dno from employee where ename='SCOTT');
    
-- 13. 12번 문제에서 부서명, 근무지역 출력 - 서브쿼리+ 조인 사용 (등등 자연 조인 각각 사용)
select e.ename, e.dno from employee e, departement d
    where e.dno=d.dno and e.dno = (select dno from employee where nemae= 'SCOTT'

select ename, dno, dname, loc from employes natural join department
    where dno=(select dno from employee where ename= 'SCOTT');
    
-- 14. 담당업무 별로 업무가 ANALYST인 사원보다 급여가 적고, 업무가 CLERK가 아닌 사원들 중에서 담당업무, 최고 급여 출력
select job max(salary) from employee where salary < 
    all (select salary from employee where job='ANALYST')
    and job <> 'CLERK' group by job;



