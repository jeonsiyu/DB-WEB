create table person_t (
     id varchar2(14) primary key, --������ �÷���
     name varchar2(20) not null, -- ������ �÷���
     age number(5) not null,    --
     tel varchar2(20) not null, --
     addr varchar2(50) not null --
);

insert into person_t (id, name, age, tel, addr)
    values('901211-1234567','ȫ�浿', 30,'010-1234-1234','�뱸�� ���� ��õ3��');
insert into person_t (id, name, age, tel, addr)
    values('900111-2785621','����ġ', 30,'010-7891-7891','�뱸�� ���� ��õ3��');
insert into person_t (id, name, age, tel, addr)  
    values('900211-1234541','�̼���', 30,'010-7891-7891','�뱸�� ���� ��õ3��');


select * from person_t;

-- ������ ����
delete from person_t; -- ��� ������ ����

-- ������ ���� 
update person_t set name='�̼���';
update person_t set name='������', age=200;

-- ������ ����Ͽ� �˻�, ����, ����
select * from person_t where age= 20;
select * from person_t where name='ȫ�浿';
select * from person_t where name='ȫ�浿' and age=20;
select * from person_t where name='ȫ�浿' or age=20;
select * from person_t where name is null; -- null ���� �˻� 
select * from person_t where name is not null; -- null ���� �˻� 
select * from person_t where name like '&��&'; -- �̸� ��� '��'�� ���Ե� ���� 

delete from ptrsoon_t where name= 'ȫ�浿';
update person_t set name= '���ġ' where name= '��浿';




