-- join : �и��� ���̺��� ���ļ� �˻�
-- ����� 7788�� ������ �μ����� ���
-- ������ ������� ������ ���� ������ �˻�
Select ename, dno from employee where eno=7788;
select dname from department where dno = 20;

-- ���� ����: ���� ����(inner join), �ܺ�����(outer join)
-- ������ ����Ͽ� �Ѳ����� ��� (equl ={����}����)-> ���� ����
select * from employee, department
    where employee.dno = department.dno;
            -- F.K����      P.K ���谡 �־���� 
            
select employee.ename, department.dname, employee.dno 
        from employee, department
        where employee.dno = department.dno;
        
--���̺���� �� ��� ��Ī ���
select e.ename, d.dname, e.dno, d.loc
        from employee e, department d
        where e.dno = d.dno and e.eno=7788;

-- ���� ���� ����
-- 1. scott ����� �̸�, �μ� ��ȣ, �μ��� ���
select e.ename, e.dno, d.dname
    from employee e, department d
    where e. dno = d.dno and e.ename='SCOTT';

-- 2. �����, �μ���, ���� ���
select e.ename, d.dname, d.loc
    from employee e,department d 
    where e.dno = d.dno ;
    
-- 3. �̸��� 'A'�� ���Ե� ��� ����� �̸�, �μ��� �μ����� ���
select e.ename,  d.dname, d.loc
from employee e,department d
where e.dno = d.dno and e.ename like '%A%';

-- natural ����(�ڿ� ����) : �ڵ����� �ߺ��� �÷� ����
-- select tablel.column, table2.column
--  FROM tablel NATURAL JOIN table2;
Select eno, ename, dname, dno
    from employee e natural join department d
    where e.eno = 7788;
    
-- join using(�÷�)
Select eno, ename, dname, dno
    from employee e join department d
    using(dno) where e.eno = 7788;
    
-- join ~ on
select e.eno, e.ename, d.dname, e.dno
    from employee e join department d
    on e.dno = d.dno where e.eno=7788;

-- ���� ���� :non-equi join
-- <, >, <=, >=, between a and b : '=' ������ ��� x
select ename, salary, grade
    from employee, salgrade
    where salary between losal and hisal;

-- 3�� �̻� ���̺� �����ϱ�
select e.ename, d.dname, e.salary, s.grade
    from employee e, department d, salgrade s
    where e.dno = d.dno 
    and salary between losal and hisal;
    
-- �ܺ����� : null ������ �����ϸ鼭 ǥ�õ� 
-- left outer join, right outer join, full outer join
select e.ename as "���", m.ename as "������"
    from employee e left outer join employee m
    on e.manager=m.eno;
    -- ��������..? ���̺��� �����Ŷ� �׷�..?
    
select e.ename as "���", m.ename as "������"
    from employes e, employee m
    where e.manager= m.eno(+);
    
-- ���� ����
-- 4. Ŀ�̼��� ���� �� �ִ� �����, �μ���, �ٹ��� ��� -����� �������� ����
select e.ename, d.dname, d.loc
    from employee e, department d
    where e.dno = d.dno and commission > 0 
    order by e.ename asc;

select ename, dname, loc
    from employee e NATURAL join department d
    where commission >= 0
    order by e.ename asc;

-- 5. ���忡 �ٹ��ϴ� ��� ����� �̸�, ����, �μ��� ��� -- �μ���ȣ �������� ���� �̸� �������� ���� 
select e.ename, e.job, d.dno 
    from employee e, department d
    where e.dno = d.dno and loc = 'NEW YORK'
    order by d.dno asc, e.ename desc;

select ename, job, dno
    from employee e NATURAL join department d
    where loc = 'NEW YORK'
    order by d.dno asc, e.ename desc;

-- 6. ���, �����, ������, ������ ��ȣ, �μ���ȣ, �μ��� ��� - left outer join
select e.ename as "���", e.job as "������", 
    e.manager as "������ ��ȣ", d.dno as "�μ���ȣ", d.dname as "�μ���"
    from employee e left outer join department d
    on e.dno=d.dno;
