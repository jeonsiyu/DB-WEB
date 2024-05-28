-- 11. 개발사 설립연도가 1990년 이상인 게임의 게임번호, 이름, 설명을 오름차순으로 정렬 출력
select G.G_ID "게임번호", G.G_TITLE "이름", G.G_INFO "설명" from GAME G 
JOIN DEVELOPER D ON G.D_NAME = D.D_NAME
where D.D_YEAR >= 2000
ORDER BY G.G_ID ASC;

-- 12. 개발사의 설립일이 1990년도부터 2000인 개발사의 이름과 사이트 출력을 오름차순으로 정렬
select D_NAME, D_SITE from DEVELOPER where D_YEAR BETWEEN 1990 AND 2000
ORDER BY D_YEAR ASC; 

-- 13. 개발사의 이름에 's' 가 포함되지 않는 개발사를 내림차순으로 정렬
select * from DEVELOPER where D_NAME not like '%s%' 
ORDER BY D_NAME DESC;

-- 14. 장르가 시뮬레이션게임 중에서 게임 가격이 가장 비싼 게임과 싼 게임의 장르, 가격, 이름, 설명 출력 
Select G_GENRE "장르", G_PRICE "가격", G_TITLE "이름", G_INFO "설명" from GAME
WHERE G_PRICE = (Select min(G_PRICE) from GAME where G_GENRE = '시뮬레이션') OR
G_PRICE = (Select MAX(G_PRICE) from GAME where G_GENRE='시뮬레이션');

-- 15. 사용자가 사용하는 이메일이 'Gmail.com' 아닌 사람 중에 가입일이 2020년도인 사용자의 사용자 번호, 이름, 닉네임,이메일,가입일 출력
select U_ID "사용자 번호", U_NAME "이름", U_NICK "닉네임",U_EMAIL "이메일" , U_SIGNDATE "가입일" FROM PLAYER
WHERE U_EMAIL NOT like '%@gmail.com' 
AND U_SIGNDATE >= TO_DATE('2020-01-01', 'YYYY-MM-DD') 
AND U_SIGNDATE < TO_DATE('2021-01-01', 'YYYY-MM-DD');






