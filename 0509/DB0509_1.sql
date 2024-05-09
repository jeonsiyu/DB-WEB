-- 그룹 함수
Select sum(salary) as "급여총액", round (avg(salary)) as "급여 평균",
    max(salary) as "최대 급여", min (salary) as "최소급여" 
    from employee;
    
-- 그룹 합수는 null 값은 무시한다
Select sum(commission) as "커미션 총액" from employee;

-- 데이터 개수
Select count(*) as "사원의 수" from employee;

-- 중복 제거
Select count(distinct job) as "작업종류의 개수" from employee;

-- group by : 특정 컬럼을 기준으로 그룹별로 나눌 때 사용
-- select 컬럼명, 그룹 함수 from 테이블명 where 조건 group by 컬럼명;

-- 부서별로 부서번호, 급여평균 출력
select dno as "부서 번호", round(avg(salary)) as "급여 평균"
 from employee group by dno;
 
select dno, round(avg(salary)) from employee group by dno;
 
-- 부서별, 담당업무별로 직원수, 급여 합계 출력 
select dno, job , count(*), sum(salary) 
    from employee group by dno, job 
    order by dno, job;  -- 앞에꺼를 기준으로 정렬

-- 그룹 조건 : havnig 
-- 부서별로 최대 급여가 3000 이상인 부서 출력
select dno, max(salary) from employee
    group by dno having max(salary) >= 3000;

-- 연습문제
-- 1. 모든 사원의 급여 최고액, 최저액, 총 급여, 평균 급여 출력 - 평균 반올림, 별칭 사용
select MAX(salary) as "최고 액", min(salary) as "최저 액", 
    sum(salary) as "총 급여", round (avg(salary)) as "평균 급여" 
    from employee;
    
-- 2. 부서별 인원이 4명보다 많은 부서의 부서번호, 인원수, 총급여 출력
select dno, count(*), sum(salary) from employee
    group by dno having count(*) > 4;

-- 3. 부서별로 담당업무가 동일한 사원의 수 출력 부서기준으로 내림차순 정렬
select dno, job, count(*) from employee  
    group by dno, job 
    order by dno desc;

-- 4. 업무별 사원의 최저 급여 출력하되 관리자를 알수 없는 사원과 최저 급여가 $2000 미만인 그룹은 제외하여 출력 급여기준으로 내림차순으로 정렬
select job, min(salary) from employee
    where manager is not null 
    group by job having not min(salary) < 2000 order by min(salary) desc;
    

-- 5. 각 부서에 대해 부서번호, 사원수, 부서 내의 모든 사원의 평균 급여 출력, 부서기준으로 내림차순 정렬
select dno as 부서번호, count(*) as 사원수, round(avg(salary)) as 평균급여 from employee
    group by dno
    order by dno desc;
    
    
