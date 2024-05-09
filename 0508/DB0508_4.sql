-- ��� ��ȣ�� 7788�� �����, �μ���ȣ �˻�
select ename, don from employee where eno=7788;

-- �޿��� 2000�� �Ѵ� ����� �̸�, �޿��� ���
select  ename, salary from employee where salary > 2000;

-- �޿��� 2000�� �Ѵ� ����� �̸�, �޿��� �޿��� ���� ������ ���
select  ename, salary from employee where salary > 2000
    order by salary asc;
-- order by salary desc : �޿������� �������� 
-- order by salary asc : �޿������� ��������(asc ��������)

-- �÷��� ���� ���
select ename as "�����", salary as "�޿�" from employee
    where salary > 2000 order by salary desc;

-- ��� ����� ���ؼ� $300�� �޿� �λ��� ������ ��,
-- �����, �λ��� �޿�, �λ��� �޿� ��� (��Ī ���)

select ename as "�����", salary as "�λ� �� �޿�", salary+300 as " �λ� �� �޿�" from employee;

select ename, salary, salary+300 from employee;

-- �����, �޿�, ���� �Ѽ��� + �󿩱� $100�� �����Ͽ� ������ ���� ������ ����(��Ī ���)
select ename as "�����" , salary as "�λ��� �޿�", (salary*12)+100 as "���� �� ����" from employee
     where salary > 2000 order by salary desc;
-- ���� �Ѽ��� : �޿�*12 + 100(�󿩱�)


-- �ڵ� �鿩���� CTRL+ F7
-- �޿��� 200~3000 ���̿� ���ԵǴ� �����, �޿� ���
select ename, salary from employee
    where salary between 2000 and 3000;
select ename, salary from employee
    where salary >= 2000 and saalary <=3000;
-- �Ѵ� ���� ǥ�� �����Ͱ� ���� / ���� ǥ�� ���

-- 1981�� 2�� 20�� - 1981�� 5�� 1�� ���̿� �Ի��� �����, ������, �Ի���
-- ���� �Ի��� ������� ���
select  ename, JOB, hiredate from employee
    where hiredate between '81/02/20' and '81/05/01'
    order by hiredate desc;

-- �μ� ��ȣ�� 20 �Ǵ� 30�� ���ϴ� �����, �μ���ȣ ��� - �̸����� �������� û��
select  ename, deo from employee
    where deo=20 or deo=30  order by ename desc;
select  ename, deo from employee
    where deo in(20,30) order by ename desc;
    
-- where ename like '%A%' => �̸� �߿��� ����� A�� ����ִ� ��� �˻�
-- where ename like '_A%' => �̸� �߿��� ù�ڴ� �ƹ� ����, 2��° ���ڴ� ������ 'A'

-- ���� ���� (����)

-- 1. ����� �޿��� 2000~3000 ���̿� ���Եǰ�, �μ���ȣ�� 20�Ǵ� 30�� �����, �޿�, �μ���ȣ ��� - �̸����� �������� ����
select ename, salary, dno from employee 
    where salary between 2000 and 3000 and dno in(20,30)
    order by ename asc;

-- 2. 1981�⵵ �Ի��� �����, �Ի��� ��� - �Ի��� �������� �������� ����
select ename, hiredate from employee
    where hiredate in '81'
    order by hiredate asc; 
-- select ename, hiredate from employee
--    where hiredate like '81%'
--    order by hiredate asc; 

-- 3. �����ڰ� ���� �����, ������ ���
select ename,job from employee
    where manager is null;

-- 4. �󿩱��� ���� �� �ִ� �����, �޿� , �󿩱� ��� - �޿� �������� ��������  ����
select ename, salary, commission from employee 
    where commission is not null
    order by salary desc; 
--select ename, salary, commission from employee 
-- where commission is not null
-- order by salary desc; 


-- 5. �̸��� 3��° ���ڰ� 'B'�� ��� ����� ���
select ename from employee
    where ename like '__B%';  

-- 6. �̸��� A�� E�� ��� �����ϴ� �����, �޿�, ������ ���
select ename, salary, job from employee
    where ename like '%A%' and ename like '%E%';

-- 7. �������� �繫�� �Ǵ� ��������̸鼭 �޿��� 950. 1300. 1600�� �ƴ� �����, ������, �޿� ����ϱ� - ��������� �������� ����
Select ename, job, salary from employee
    where job = salesman or job = clerk and salary not in (950,1300,1600) 
    order by ename desc; 
