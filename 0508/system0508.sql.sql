-- ���� �ּ�
/* 
������ �ּ�
*/ 

-- system �������� ����ؾ���(?)

-- DB ������ ���� �Ϲ� ����� ���� ���� test / 1234
-- 11g ȣȯ : c## ����
alter session set "_oracle_script" = true;

-- ���� / ��� ���� test / 1234
create user test identified by 1234;

-- ���� �� ��� ���� �ο� 
grant connect, resource to test;

-- DB ���� �Ҵ�
alter user test quota unlimited on users;


