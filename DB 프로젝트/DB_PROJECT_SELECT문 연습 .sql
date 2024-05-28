-- 11. ���߻� ���������� 1990�� �̻��� ������ ���ӹ�ȣ, �̸�, ������ ������������ ���� ���
select G.G_ID "���ӹ�ȣ", G.G_TITLE "�̸�", G.G_INFO "����" from GAME G 
JOIN DEVELOPER D ON G.D_NAME = D.D_NAME
where D.D_YEAR >= 2000
ORDER BY G.G_ID ASC;

-- 12. ���߻��� �������� 1990�⵵���� 2000�� ���߻��� �̸��� ����Ʈ ����� ������������ ����
select D_NAME, D_SITE from DEVELOPER where D_YEAR BETWEEN 1990 AND 2000
ORDER BY D_YEAR ASC; 

-- 13. ���߻��� �̸��� 's' �� ���Ե��� �ʴ� ���߻縦 ������������ ����
select * from DEVELOPER where D_NAME not like '%s%' 
ORDER BY D_NAME DESC;

-- 14. �帣�� �ùķ��̼ǰ��� �߿��� ���� ������ ���� ��� ���Ӱ� �� ������ �帣, ����, �̸�, ���� ��� 
Select G_GENRE "�帣", G_PRICE "����", G_TITLE "�̸�", G_INFO "����" from GAME
WHERE G_PRICE = (Select min(G_PRICE) from GAME where G_GENRE = '�ùķ��̼�') OR
G_PRICE = (Select MAX(G_PRICE) from GAME where G_GENRE='�ùķ��̼�');

-- 15. ����ڰ� ����ϴ� �̸����� 'Gmail.com' �ƴ� ��� �߿� �������� 2020�⵵�� ������� ����� ��ȣ, �̸�, �г���,�̸���,������ ���
select U_ID "����� ��ȣ", U_NAME "�̸�", U_NICK "�г���",U_EMAIL "�̸���" , U_SIGNDATE "������" FROM PLAYER
WHERE U_EMAIL NOT like '%@gmail.com' 
AND U_SIGNDATE >= TO_DATE('2020-01-01', 'YYYY-MM-DD') 
AND U_SIGNDATE < TO_DATE('2021-01-01', 'YYYY-MM-DD');






