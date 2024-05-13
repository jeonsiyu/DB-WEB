-- sub query(���� ����)
/* 
Select
   ����� �÷� FROM table
   WHERE �÷� ������
    (SELECT select_list
     FROM table
     WHERE ......); */
-- 1. ���� ��������
-- ���� ���� ���� ����� ������� ���� 1��
-- ������ �� ������ >, >=, <, <=, <>, !=

-- 2. ������ ��������
-- ���� ���� ���� ����� ������� ���� 2�� �̻�
-- ������ �� ������ in, any, som, all, exists

-- SCOTT �� ������ �μ����� �ٹ��ϴ� �����, �μ���ȣ ���
select ename , dno from employee
    where dno=(select dno from employee where ename='scott');
    
-- �μ��� ���� �޿��� �޴� ����� �����ȣ�� �̸� ���
select eno,ename from employee
 where salart in(select min(salary) from employee group by dno);
 
-- ������ ��������� �ƴϸ鼭 �޿��� ������ ������� ���� ���� ��� ���
select eno, ename, job, salary from employee
    where salary < any(select salary from employee where job='SALESMAN')and job <>'SALESMAN';
    
select eno, ename, job, salary from employee -- ���, ����̸�, ����. �޿�
    where salary < all(select salary from employee where job='SALESMAN')and job <>'SALESMAN';
    
-- ���� ���� (����)
-- 1. �����ȣ�� 7788�� ����� �������� ���� ��� ���
Select eno, ename, job from employee
    where job = (select job from employee where eno ='7788');

-- 2. �����ȣ�� 7499���� �޿��� ���� �����, ������, �޿� ���
select eno, ename, job, salary from employee 
    where salary > (select salary from employee where eno = '7499');

-- 3. �ּ�, �ִ� �޿��� �޴� �����, ������ , �޿� ���
select ename, job, salary from employee
    where salary =(select min(salary) from employee)
    or salary =(select max(salary) from employee);
    
-- 4. �μ��� �ּ� �޿��� �޴� �����, �޿�, �μ���ȣ ���
select ename, salary, dno from employee
    where salary in (select min(salary) from employee group by dno);
    
-- 5. 4�� �������� �μ���, �ٹ����� �߰��Ͽ� ��� - ���� ���
select e.ename, e.esalary, e.dno, d.dname ,d.loc from employee e,department d  
    where e.dno=d.dno and salary
    in (select min(min(salary) from employee group by dno);

select ename, salary, dno, dname ,loc 
    from employee natural join department
    where (dno,salary) in (select dno, min(salary) from employee group by dno);
    
-- 6. �������� ANALYST�� ������� �޿��� �����鼭 ������ SALESMAN�� �ƴ� ���, �̸�, ��� ����, �޿� ��� - ������� �������� ����
select eno, ename, JOB , salary from employee 
    where salary < all(select salary from employee where job='ANALYST') and job <> 'SALESMAN'
    order by eno asc;    

-- 7. ���� ����� ���� ���� ��� 
select ename from employee
    where eno
    in (select eno from employee where manager is null);

-- 8. 7�� �������� �μ���, �ٹ��� �߰� - ��������, ����+�������� 2���� ���

--{��������}

--{����}
select e.ename, d.dname, d.loc from employee e, department d
    where e.dno = d.dno and eno
    in (select eno from employee where manager is null);
    
-- 9. ���������� ���� ������ ���, �����, �޿� ���
select eno, ename, salary from employee
    where eno <> all(select manager from employee where manager is not null);

-- 10. blake ������ �μ��� ���� �����, �Ի��� ���, blake�� ��� ����
select ename, hiredate from employee  
    where dno = (select dno employee where ename='BLAKE') and ename <> 'BLAKE';

-- 11. �ٹ����� DALLAS�� �����, �μ���ȣ, ������ ��� - ��������
--      ���� ����, ���� 2���� ���
-- [��������]
select ename, dno, job from employee where dno=
    (select dno from department where loc='DALLAS')
    order by ename asc;
    
select e.ename, e.dno, e job from employee e, depatment d
    where e.dno = d.dno and d. loc= 'DALLAS' order by ename asc;

-- 12. SCOTT�� ������ �μ����� �ٹ��ϴ� �����, �μ���ȣ ���
select ename, dno, from employee where dno=
    (select dno from employee where ename='SCOTT');
    
-- 13. 12�� �������� �μ���, �ٹ����� ��� - ��������+ ���� ��� (��� �ڿ� ���� ���� ���)
select e.ename, e.dno from employee e, departement d
    where e.dno=d.dno and e.dno = (select dno from employee where nemae= 'SCOTT'

select ename, dno, dname, loc from employes natural join department
    where dno=(select dno from employee where ename= 'SCOTT');
    
-- 14. ������ ���� ������ ANALYST�� ������� �޿��� ����, ������ CLERK�� �ƴ� ����� �߿��� ������, �ְ� �޿� ���
select job max(salary) from employee where salary < 
    all (select salary from employee where job='ANALYST')
    and job <> 'CLERK' group by job;



