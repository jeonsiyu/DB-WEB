-- ���̺�( �����͸� �����ϴ� ����) ����
create table customer (
    name varchar2(20),
    age number(5),
    gender char(1),
    reg_date date default sysdate);
 
-- ���̺� ���� 
drop table customer;
    
-- ������ �Է�
-- �ݵ�� ���� : �����͸� ǥ���Ҷ� '' �ʿ�!!!!
-- DB������ ����, ���ڿ� ������ ����
-- sysdate : �ý��� ��¥�� �������� �Լ�
insert into customer(name, age, gender, reg_date)
     values('ȫ�浿', 100, 'M', sysdate);
     
-- ������ ����
-- * : ���̺� �����ϴ� ��� �÷��� �ǹ�
select * from customer;
select name, age, gender,reg_date from customer;
select name, age from customer;







