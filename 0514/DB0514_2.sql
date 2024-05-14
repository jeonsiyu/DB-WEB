select * from account_t;
-- °èÁÂ Á¤º¸ Ãâ·Â
select c.cname "°í°´¸í", j.jname "ÁöÁ¡¸í", a.ano "°èÁÂ¹øÈ£"
    from customer_t e, jijum_t j, account_t a
    where c.cno=eno and j.jname = a.jname;
    
--°èÁÂ ³»¿ª Ãâ·Â
select * from yegeom_t where ydate
    between "24/05/04' and '24/05/10';
    
select c.cname "°í°´¸í", y.inout "ÀÔ/Ãâ±Ý", a.ano "°èÁÂ¹øÈ£",
    y.transfer "ÀÔ/Ãâ±Ý °èÁÂ", y.ydate "°Å·¡½Ã°£", 
    to_char(y.money,'L999,999,999') "°Å·¡±Ý¾×",
    to_char(y.jango,'L999,999,999')y.jango "ÀÜ¾×"
    from yegeom_t y, customer_t c, account_t a
    where y.cno=c.cno and y.ano=a.ano
    and y.ydate between '24/05/01' and '24/05/10' and e.ename='È«±æµ¿';
    
-- °èÁÂº°·Î °¡Àå ¸¹Àº ÀÜ°í¸¦ ÀÚ±â´Â °èÁÂ
    
    