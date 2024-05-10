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
    where (dno,salary) = (select dno, min(salary) from employee group by dno);
    
-- 5. 4�� �������� �μ���, �ٹ����� �߰��Ͽ� ��� - ���� ���
select ename, salary, dno, dname ,loc 
    from employee natural join department
    where (dno,salary) in (select dno, min(salary) from employee group by dno);
    
-- 6. �������� ANALYST�� ������� �޿��� �����鼭 ������ ANALYST�� �ƴ� ���, �̸�, ��� ����, �޿� ��� - ������� �������� ����
select eno, ename, JOB , salary from employee 
    where salary < all(select salary from employee where job='ANALYST') and job <> 'ANALYST'
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

-- 11. �ٹ����� DALLAS�� �����, �μ���ȣ, ������ ��� - ��������
--      ���� ����, ���� 2���� ���

-- 12. SCOTT�� ������ �μ����� �ٹ��ϴ� �����, �μ���ȣ ���

-- 13. 12�� �������� �μ���, �ٹ����� ��� - ��������+ ���� ��� (��� �ڿ� ���� ���� ���)

-- 14. ������ ���� ������ ANALYST�� ������� �޿��� ����, ������ CLERK�� �ƴ� ����� �߿��� ������, �ְ� �޿� ���



