-- �׷� �Լ�
Select sum(salary) as "�޿��Ѿ�", round (avg(salary)) as "�޿� ���",
    max(salary) as "�ִ� �޿�", min (salary) as "�ּұ޿�" 
    from employee;
    
-- �׷� �ռ��� null ���� �����Ѵ�
Select sum(commission) as "Ŀ�̼� �Ѿ�" from employee;

-- ������ ����
Select count(*) as "����� ��" from employee;

-- �ߺ� ����
Select count(distinct job) as "�۾������� ����" from employee;

-- group by : Ư�� �÷��� �������� �׷캰�� ���� �� ���
-- select �÷���, �׷� �Լ� from ���̺�� where ���� group by �÷���;

-- �μ����� �μ���ȣ, �޿���� ���
select dno as "�μ� ��ȣ", round(avg(salary)) as "�޿� ���"
 from employee group by dno;
 
select dno, round(avg(salary)) from employee group by dno;
 
-- �μ���, ���������� ������, �޿� �հ� ��� 
select dno, job , count(*), sum(salary) 
    from employee group by dno, job 
    order by dno, job;  -- �տ����� �������� ����

-- �׷� ���� : havnig 
-- �μ����� �ִ� �޿��� 3000 �̻��� �μ� ���
select dno, max(salary) from employee
    group by dno having max(salary) >= 3000;

-- ��������
-- 1. ��� ����� �޿� �ְ��, ������, �� �޿�, ��� �޿� ��� - ��� �ݿø�, ��Ī ���
select MAX(salary) as "�ְ� ��", min(salary) as "���� ��", 
    sum(salary) as "�� �޿�", round (avg(salary)) as "��� �޿�" 
    from employee;
    
-- 2. �μ��� �ο��� 4���� ���� �μ��� �μ���ȣ, �ο���, �ѱ޿� ���
select dno, count(*), sum(salary) from employee
    group by dno having count(*) > 4;

-- 3. �μ����� �������� ������ ����� �� ��� �μ��������� �������� ����
select dno, job, count(*) from employee  
    group by dno, job 
    order by dno desc;

-- 4. ������ ����� ���� �޿� ����ϵ� �����ڸ� �˼� ���� ����� ���� �޿��� $2000 �̸��� �׷��� �����Ͽ� ��� �޿��������� ������������ ����
select job, min(salary) from employee
    where manager is not null 
    group by job having not min(salary) < 2000 order by min(salary) desc;
    

-- 5. �� �μ��� ���� �μ���ȣ, �����, �μ� ���� ��� ����� ��� �޿� ���, �μ��������� �������� ����
select dno as �μ���ȣ, count(*) as �����, round(avg(salary)) as ��ձ޿� from employee
    group by dno
    order by dno desc;
    
    
