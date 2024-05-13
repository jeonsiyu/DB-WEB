-- ���̺� ���� ����(����Ű�� ����� ���)
-- �⺻Ű�� ����Ű�� ����Ǿ������� ���� ����Ű ���̺��� ���� �� 
-- �⺻Ű ���̺��� ���� �� �� ���� 
drop table ���̺�� cascade constraints purge;

-- �����͸� ������ ���̺� ���� ����
create table dept_copy as select * from department where 0=1;
create table emp_copy as select * from department where 0=1;
insert into dept_copy values (10,'ȸ���','�뱸');
insert into dept_copy values (20,'���ߺ�','�λ�');
insert into emp_copy values (1234, 'ȫ�浿', 'sw����', 2222,
    to_date('20-11-2022', 'dd-mm-yyyy'), 300, null, 20);

-- �ٸ� ���̺��� �����͸� �����ؼ� �߰�
insert into dept_copy select * from department;

-- ������ sequenece
create sequence emp_seq
    start with 1 increment by 1 nomaxvalue  nominvalue;

create table seq_test_t(    
    id number primary key,
    name varchar2(20));
insert into seq_test_t values (emp_seq.nextval,'ȫ�浿');
insert into seq_test_t values (emp_seq.nextval,'����ġ');
drop sequence emp_seq;

-- update sub query
update dept_copy set
    loc=(select loc from dept_copy where dno=20)
    where don=10;
    
-- delete sub query
delete emp_copy where
    dno=(select dno from department where dname="SALES");
    
-- round�Լ� : �ݿø� ó�� 
select round(sysdate - hiredate) as "�ٹ� �Լ�" from employee;
select round((sysdate - hiredate)/365) as "�ټ� ���" from employee;

-- �Ի� ���� 6���� ���� ���
-- add_moonth(date,n) - date�� n���� �� ��
select ename, hireadate, add_months(hiredate,6) from employee;

-- ��¥ ǥ�� : to_char �Լ�
select ename, hiredate, to_char(hiredate, 'yy-mm'),
    to_char(hiredate, 'yyyy/mm/dd') from employee;

-- ���� ��¥, �ð� ǥ��
-- dual : �����ϰ� �Լ��� �̿��ؼ� ��� ������� Ȯ���� �� ���
select to char(sysdate, 'yyyy/mm/dd hh24:mi:ss') from dual;

-- ȭ���ȣ ǥ��
-- L : ������ ��ȭ ��ȣ
-- 0 : �ڸ����� ������ ������ '0'���� ä��
-- 9 : �ڸ����� ���� ������ ���ڸ� ���� 
Select ename, to_char(salary, '19999,999') from employee;

-- case�� ����Ͽ� �̸�, �μ��� ���  
select enmae, dno
    case 
        when dno=10 than 'ȸ���'
        when dno=20 than 'ȫ����'
        when dno=30 than '������'
        when dno=40 than '�񼭽�'
    else '�˼� ����'
end as "�μ���"
from emplyess order by dno;

-- decode() �� ����Ͽ� case �����ϰ� ���
-- �μ���, ������, ����� , ��� ����� ��� �޿� ���
select
    decode (dno, 10, 'ȸ���', 20 ,'ȫ����', 30,'������', 40,'��ȹ��') "�μ���",
    decode (dno, 10, '�뱸', 20 ,'����', 30,'�λ�', 40,'����') "����",
    count(*) as "��� ��", round(avg(salary)) as "��ձ޿�"
from employes group by dno;

-- view : �������̺� (�޸� ����,����)
-- view ���� �ֱ� : grant create view to test;
create or replace view join_test_v as
    select e.ename, d. dname, e.salary, s.grade from
        employee e, department d, salgrade s
        where e.dno=d.dno and salary between losal and hisal;
select * from join_test_v;

-- �������� 
-- 1. department�� ��� �����͸� dept_copy2 ���̺� ����
create table dept_copy2 as select * from department where 0=1;
insert into dept_copy2 select * from department;

-- 2. employee�� ��� �����͸� emp_cpoy2 ���̺� ����
create table emp_copy2 as select * from employee where 0=1;
insert into  emp_copy2 select * from employee;

-- 3. 10�� �μ��� �������� 20�� �μ��� ���������� �����ϱ�
update dept_copy2 set 
    loc =(select loc from dept_copy2 where dno=20)
    where don=10;

-- 4. 10�� �μ��� �μ����� 30�� �μ��� �μ���� ���������� ����
update dept_copy2 set 
    dname = (select dname from dept_copy2 where dno=30)
    loc =(select loc from dept_copy2 where dno=30)
    where don=10;

-- 5. ������ ��� ��� ����
DELETE FROM dept_copy2 WHERE dno = (select dno from department where dname'SALES');

-- 6. ���, �μ�, �޿���� ���̺��� �����Ͽ� ���, �����, �޿�, ������,�Ի���, �μ���, 
--    �μ�����, �޿������ ����ϴ� �������̺� ����
create or replace view_join_v as
select e.eno "���", e.ename "�����", e.salary "�޿�", 
    e.job "������", e.hiredate "�Ի���",
    d.dname "�μ���", d.loc "�ٹ���", s.grade "�޿����"
    from employee e, department d, salgrad s
    where e.dno = d.dno and salary between losal and hisal;
select * from emp_join_v;
select "���", "�����", "�μ���", "�޿����" from emp_join_v;

-- crud -- ����





