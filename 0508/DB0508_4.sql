-- 사원 번호가 7788인 사원명, 부서번호 검색
select ename, don from employee where eno=7788;

-- 급여가 2000을 넘는 사원의 이름, 급여를 출력
select  ename, salary from employee where salary > 2000;

-- 급여가 2000을 넘는 사원의 이름, 급여를 급여가 많은 순서로 출력
select  ename, salary from employee where salary > 2000
    order by salary asc;
-- order by salary desc : 급여순으로 내림차순 
-- order by salary asc : 급여순으로 오름차순(asc 생략가능)

-- 컬럼에 별점 사용
select ename as "사원명", salary as "급여" from employee
    where salary > 2000 order by salary desc;

-- 모든 사람에 대해서 $300의 급여 인상을 적용한 후,
-- 사원명, 인상전 급여, 인산후 급여 출력 (별칭 사용)

select ename as "사원명", salary as "인상 전 급여", salary+300 as " 인상 후 급여" from employee;

select ename, salary, salary+300 from employee;

-- 사원명, 급여, 연간 총수입 + 상여금 $100을 적용하여 수입이 많은 순서로 정렬(별칭 사용)
select ename as "사원명" , salary as "인상전 급여", (salary*12)+100 as "연간 총 수입" from employee
     where salary > 2000 order by salary desc;
-- 연간 총수입 : 급여*12 + 100(상여금)


-- 자동 들여쓰기 CTRL+ F7
-- 급여가 200~3000 사이에 포함되는 사원명, 급여 출력
select ename, salary from employee
    where salary between 2000 and 3000;
select ename, salary from employee
    where salary >= 2000 and saalary <=3000;
-- 둘다 같은 표기 데이터가 나옴 / 같은 표기 방법

-- 1981년 2월 20일 - 1981년 5월 1일 사이에 입사한 사원명, 담당업무, 입사일
-- 먼저 입사한 순서대로 출력
select  ename, JOB, hiredate from employee
    where hiredate between '81/02/20' and '81/05/01'
    order by hiredate desc;

-- 부서 번호가 20 또는 30에 속하는 사원명, 부서번호 출력 - 이름으로 오름차순 청렬
select  ename, deo from employee
    where deo=20 or deo=30  order by ename desc;
select  ename, deo from employee
    where deo in(20,30) order by ename desc;
    
-- where ename like '%A%' => 이름 중에서 가운데가 A가 들어있는 경우 검색
-- where ename like '_A%' => 이름 중에서 첫자는 아무 글자, 2번째 글자는 무조건 'A'

-- 연습 문제 (숙제)

-- 1. 사원의 급여가 2000~3000 사이에 포함되고, 부서번호가 20또는 30인 사원명, 급여, 부서번호 출력 - 이름으로 오름차순 정렬
select ename, salary, dno from employee 
    where salary between 2000 and 3000 and dno in(20,30)
    order by ename asc;

-- 2. 1981년도 입사한 사원명, 입사일 출력 - 입사일 기준으로 오름차순 정렬
select ename, hiredate from employee
    where hiredate in '81'
    order by hiredate asc; 
-- select ename, hiredate from employee
--    where hiredate like '81%'
--    order by hiredate asc; 

-- 3. 관리자가 없는 사원명, 담당업무 출력
select ename,job from employee
    where manager is null;

-- 4. 상여금을 받을 수 있는 사원명, 급여 , 상여금 출력 - 급여 기준으로 내림차순  정렬
select ename, salary, commission from employee 
    where commission is not null
    order by salary desc; 
--select ename, salary, commission from employee 
-- where commission is not null
-- order by salary desc; 


-- 5. 이름의 3번째 문자가 'B'인 모든 사원명 출력
select ename from employee
    where ename like '__B%';  

-- 6. 이름에 A와 E를 모두 포함하는 사원명, 급여, 담당업무 출력
select ename, salary, job from employee
    where ename like '%A%' and ename like '%E%';

-- 7. 담당업무가 사무원 또는 영업사원이면서 급여가 950. 1300. 1600이 아닌 사원명, 담당업무, 급여 출력하기 - 사원명으로 내림차순 정렬
Select ename, job, salary from employee
    where job = salesman or job = clerk and salary not in (950,1300,1600) 
    order by ename desc; 
