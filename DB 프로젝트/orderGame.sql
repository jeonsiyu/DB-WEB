-- 1. 주문 생성
insert into orders (o_ID, u_ID, o_orderdate, o_total)
values ('o_0001', 'u_0001', SYSDATE, 0);

--2. 게임 주문
insert into OrderItem (i_id, o_id, g_id) values('i_0001', 'o_0001', 'G_0001');
insert into OrderItem (i_id, o_id, g_id) values('i_0002', 'o_0001', 'G_0002');

--3. 게임 주문 항목 가져오기
select * from orderitem_game_info where o_ID = 'o_0001';

 -- 4. 총 주문 금액 업데이트
UPDATE orders 
SET o_total = o_total + (
    SELECT SUM(game_price) 
    FROM orderitem_game_info 
    WHERE o_ID = 'o_0001'
)
WHERE o_ID = 'o_0001';

--5. 주문 가져오기
select * from orders where o_ID = 'o_0001';