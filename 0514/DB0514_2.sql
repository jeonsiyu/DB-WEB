select * from account_t;
-- ���� ���� ���
select c.cname "����", j.jname "������", a.ano "���¹�ȣ"
    from customer_t e, jijum_t j, account_t a
    where c.cno=eno and j.jname = a.jname;
    
--���� ���� ���
select * from yegeom_t where ydate
    between "24/05/04' and '24/05/10';
    
select c.cname "����", y.inout "��/���", a.ano "���¹�ȣ",
    y.transfer "��/��� ����", y.ydate "�ŷ��ð�", 
    to_char(y.money,'L999,999,999') "�ŷ��ݾ�",
    to_char(y.jango,'L999,999,999')y.jango "�ܾ�"
    from yegeom_t y, customer_t c, account_t a
    where y.cno=c.cno and y.ano=a.ano
    and y.ydate between '24/05/01' and '24/05/10' and e.ename='ȫ�浿';
    
-- ���º��� ���� ���� �ܰ� �ڱ�� ����
    
    