--primary key : �ߺ� �Ұ�
Create table student_t (
    id varchar2(10) primary key, -- �й� �ߺ� x
    name varchar2(20) not null,
    age number not null,
    tel varchar2(30) not null
);

-- drop : ���̺��� �����϶�
drop table student_t;

insert into student_t (id, name, age, tel)
    values('stoool','ȫ�浿', 20, '010-1111-1234');
insert into student_t (id, name, age, tel)
    values('stooo2','����ġ', 20, '010-1111-1234');
insert into student_t (id, name, age, tel)
    values('stooo3','�̼���', 20, '010-1111-1234');
insert into student_t(id, name) values('st0004', '������');

-- ��� ������ ����
select * from student_t;
