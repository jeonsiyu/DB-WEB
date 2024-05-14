-- ���̺� ������ ���踦 ����Ͽ� �� ���� �����ص� ������ �߻����� �ʰ� ���ĵǾ����ϴ�.

drop table dpartment  cascade constraints purge;
drop table professor cascade constraints purge;
drop table student cascade constraints purge;
drop table course cascade constraints purge;
drop table eno cascade constraints purge;

-- dpartment Table Create SQL
-- ���̺� ���� SQL - dpartment
CREATE TABLE dpartment
(
    d_departmentID    VARCHAR2(20)    NOT NULL, 
    d_name            VARCHAR(20)     NOT NULL, 
    d_office          VARCHAR(20)     NOT NULL, 
    d_tel             VARCHAR(20)     NOT NULL, 
     PRIMARY KEY (d_departmentID)
);

-- ���̺� Comment ���� SQL - dpartment
COMMENT ON TABLE dpartment IS '�а�';

-- �÷� Comment ���� SQL - dpartment.d_departmentID
COMMENT ON COLUMN dpartment.d_departmentID IS '�а���ȣ';

-- �÷� Comment ���� SQL - dpartment.d_name
COMMENT ON COLUMN dpartment.d_name IS '�а���';

-- �÷� Comment ���� SQL - dpartment.d_office
COMMENT ON COLUMN dpartment.d_office IS '�繫��';

-- �÷� Comment ���� SQL - dpartment.d_tel
COMMENT ON COLUMN dpartment.d_tel IS '��ȭ��ȣ';


-- professor Table Create SQL
-- ���̺� ���� SQL - professor
CREATE TABLE professor
(
    p_professorID      VARCHAR2(10)    NOT NULL, 
    p_identID          VARCHAR2(20)    NOT NULL, 
    p_Name             VARCHAR(20)     NOT NULL, 
    p_add              VARCHAR(50)     NOT NULL, 
    p_tel              VARCHAR2(20)    NOT NULL, 
    p_position         VARCHAR2(20)    NOT NULL, 
    p_yearappointed    VARCHAR2(10)    NOT NULL, 
    d_departmentID     VARCHAR2(20)    NOT NULL, 
     PRIMARY KEY (p_professorID)
);

-- ���̺� Comment ���� SQL - professor
COMMENT ON TABLE professor IS '����';

-- �÷� Comment ���� SQL - professor.p_professorID
COMMENT ON COLUMN professor.p_professorID IS '������ȣ';

-- �÷� Comment ���� SQL - professor.p_identID
COMMENT ON COLUMN professor.p_identID IS '�ֹε�Ϲ�ȣ';

-- �÷� Comment ���� SQL - professor.p_Name
COMMENT ON COLUMN professor.p_Name IS '�̸�';

-- �÷� Comment ���� SQL - professor.p_add
COMMENT ON COLUMN professor.p_add IS '�ּ�';

-- �÷� Comment ���� SQL - professor.p_tel
COMMENT ON COLUMN professor.p_tel IS '��ȭ��ȣ';

-- �÷� Comment ���� SQL - professor.p_position
COMMENT ON COLUMN professor.p_position IS '����';

-- �÷� Comment ���� SQL - professor.p_yearappointed
COMMENT ON COLUMN professor.p_yearappointed IS '�ӿ�⵵';

-- �÷� Comment ���� SQL - professor.d_departmentID
COMMENT ON COLUMN professor.d_departmentID IS '�а���ȣ';

-- Foreign Key ���� SQL - professor(d_departmentID) -> dpartment(d_departmentID)
ALTER TABLE professor
    ADD CONSTRAINT FK_professor_d_departmentID_dpartment_d_departmentID FOREIGN KEY (d_departmentID)
        REFERENCES dpartment (d_departmentID) ;

-- Foreign Key ���� SQL - professor(d_departmentID)
-- ALTER TABLE professor
-- DROP CONSTRAINT FK_professor_d_departmentID_dpartment_d_departmentID;


-- student Table Create SQL
-- ���̺� ���� SQL - student
CREATE TABLE student
(
    s_studentID       VARCHAR2(20)    NOT NULL, 
    s_identID         VARCHAR2(20)    NOT NULL, 
    s_Name            VARCHAR2(20)    NOT NULL, 
    s_add             VARCHAR2(50)    NOT NULL, 
    s_tel             VARCHAR2(20)    NOT NULL, 
    s_grade           VARCHAR2(10)    NOT NULL, 
    d_departmentID    VARCHAR2(20)    NOT NULL, 
     PRIMARY KEY (s_studentID)
);

-- ���̺� Comment ���� SQL - student
COMMENT ON TABLE student IS '�л�';

-- �÷� Comment ���� SQL - student.s_studentID
COMMENT ON COLUMN student.s_studentID IS '�й�';

-- �÷� Comment ���� SQL - student.s_identID
COMMENT ON COLUMN student.s_identID IS '�ֹε�Ϲ�ȣ';

-- �÷� Comment ���� SQL - student.s_Name
COMMENT ON COLUMN student.s_Name IS '�̸�';

-- �÷� Comment ���� SQL - student.s_add
COMMENT ON COLUMN student.s_add IS '�ּ�';

-- �÷� Comment ���� SQL - student.s_tel
COMMENT ON COLUMN student.s_tel IS '��ȭ��ȣ';

-- �÷� Comment ���� SQL - student.s_grade
COMMENT ON COLUMN student.s_grade IS '�г�';

-- �÷� Comment ���� SQL - student.d_departmentID
COMMENT ON COLUMN student.d_departmentID IS '�а���ȣ';

-- Foreign Key ���� SQL - student(d_departmentID) -> dpartment(d_departmentID)
ALTER TABLE student
    ADD CONSTRAINT FK_student_d_departmentID_dpartment_d_departmentID FOREIGN KEY (d_departmentID)
        REFERENCES dpartment (d_departmentID) ;

-- Foreign Key ���� SQL - student(d_departmentID)
-- ALTER TABLE student
-- DROP CONSTRAINT FK_student_d_departmentID_dpartment_d_departmentID;


-- course Table Create SQL
-- ���̺� ���� SQL - course
CREATE TABLE course
(
    c_cousreID       VARCHAR2(50)    NOT NULL, 
    c_name           VARCHAR(20)     NOT NULL, 
    c_credit         NUMBER          NOT NULL, 
    c_year           VARCHAR(20)     NOT NULL, 
    c_semester       VARCHAR(20)     NOT NULL, 
    c_time           VARCHAR(20)     NOT NULL, 
    c_capacity       NUMBER          NOT NULL, 
    p_professorID    VARCHAR2(10)    NOT NULL, 
     PRIMARY KEY (c_cousreID)
);

-- ���̺� Comment ���� SQL - course
COMMENT ON TABLE course IS '����';

-- �÷� Comment ���� SQL - course.c_cousreID
COMMENT ON COLUMN course.c_cousreID IS '���¹�ȣ';

-- �÷� Comment ���� SQL - course.c_name
COMMENT ON COLUMN course.c_name IS '���¸�';

-- �÷� Comment ���� SQL - course.c_credit
COMMENT ON COLUMN course.c_credit IS '����';

-- �÷� Comment ���� SQL - course.c_year
COMMENT ON COLUMN course.c_year IS '����';

-- �÷� Comment ���� SQL - course.c_semester
COMMENT ON COLUMN course.c_semester IS '�б�';

-- �÷� Comment ���� SQL - course.c_time
COMMENT ON COLUMN course.c_time IS '���ǽð�';

-- �÷� Comment ���� SQL - course.c_capacity
COMMENT ON COLUMN course.c_capacity IS '�����ο�';

-- �÷� Comment ���� SQL - course.p_professorID
COMMENT ON COLUMN course.p_professorID IS '������ȣ';

-- Foreign Key ���� SQL - course(p_professorID) -> professor(p_professorID)
ALTER TABLE course
    ADD CONSTRAINT FK_course_p_professorID_professor_p_professorID FOREIGN KEY (p_professorID)
        REFERENCES professor (p_professorID) ;

-- Foreign Key ���� SQL - course(p_professorID)
-- ALTER TABLE course
-- DROP CONSTRAINT FK_course_p_professorID_professor_p_professorID;


-- eno Table Create SQL
-- ���̺� ���� SQL - eno
CREATE TABLE eno
(
    eno            VARCHAR2(20)    NOT NULL, 
    s_studentID    VARCHAR2(20)    NOT NULL, 
    c_cousreID     VARCHAR2(50)    NOT NULL, 
    g_score        NUMBER          NULL   
);

-- ���̺� Comment ���� SQL - eno
COMMENT ON TABLE eno IS '����';

-- �÷� Comment ���� SQL - eno.eno
COMMENT ON COLUMN eno.eno IS '��������';

-- �÷� Comment ���� SQL - eno.s_studentID
COMMENT ON COLUMN eno.s_studentID IS '�й�';

-- �÷� Comment ���� SQL - eno.c_cousreID
COMMENT ON COLUMN eno.c_cousreID IS '���¹�ȣ';

-- �÷� Comment ���� SQL - eno.g_score
COMMENT ON COLUMN eno.g_score IS '����';

-- Foreign Key ���� SQL - eno(c_cousreID) -> course(c_cousreID)
ALTER TABLE eno
    ADD CONSTRAINT FK_eno_c_cousreID_course_c_cousreID FOREIGN KEY (c_cousreID)
        REFERENCES course (c_cousreID) ;

-- Foreign Key ���� SQL - eno(c_cousreID)
-- ALTER TABLE eno
-- DROP CONSTRAINT FK_eno_c_cousreID_course_c_cousreID;

-- Foreign Key ���� SQL - eno(s_studentID) -> student(s_studentID)
ALTER TABLE eno
    ADD CONSTRAINT FK_eno_s_studentID_student_s_studentID FOREIGN KEY (s_studentID)
        REFERENCES student (s_studentID) ;

-- Foreign Key ���� SQL - eno(s_studentID)
-- ALTER TABLE eno
-- DROP CONSTRAINT FK_eno_s_studentID_student_s_studentID;

commit;