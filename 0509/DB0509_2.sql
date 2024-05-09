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