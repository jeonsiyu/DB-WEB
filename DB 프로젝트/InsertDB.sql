--개발사 DB 입력
insert into developer values('D_0001', 'ConcernedApe', 2012, 'https://www.stardewvalley.net/');
insert into developer values('D_0002', 'Tarsier Studios', 2005, 'https://tarsier.se/');
insert into developer values('D_0003', 'Bungie', 1991, 'https://www.bungie.net/7');
insert into developer values('D_0004', 'Digital Extremes', 1993, 'https://www.digitalextremes.com/');
insert into developer values('D_0005', 'Klei Entertainment', 2005, 'https://klei.com/');
insert into developer values('D_0010', ' Recreate Games', NULL, 'https://recreate.games/en/#intro');
insert into developer values('D_0011', 'Ghost Town Games Ltd.', NULL, 'https://ghosttowngames.com/');
insert into developer values('D_0013', 'Moon Studios GmbH', 2010, 'https://www.orithegame.com/moon-studios/');
insert into developer values('D_0014', 'CAPCOM', 1979, 'https://www.capcom.co.jp/');
insert into developer values('D_0015', 'Hazelight Studios', 2014, 'https://www.hazelight.se/');
insert into developer values('D_0016', 'Frontier Developments', 1994, 'https://www.frontier.co.uk/');
insert into developer values('D_0018', 'KRAFTON, Inc.', 2007, 'https://www.krafton.com/');
insert into developer values('D_0019', 'Witch Beam', 2007, 'https://www.unpackinggame.com/');
insert into developer values('D_0020', '손노리', 1992, ' ');
insert into developer values('D_0021', 'MINTROCKET', 2022, 'https://mintrocketgames.com');
insert into developer values('D_0022', 'Rusty Lake', 2011, 'https://www.rustylake.com');
insert into developer values('D_0023', '7th Beat Games', 2011, 'https://7thbe.at/');
insert into developer values('D_0024', 'Freebird Games', 2008, 'https://freebirdgames.com/');
insert into developer values('D_0025', 'WONDER POTION', 2020, 'hed@wonderpotion.games');
insert into developer values('D_0026', 'Pocketpair', 2015, 'https://www.pocketpair.jp/');
insert into developer values('D_0027', 'Uuvana Studios', 2020, 'https://www.uuvana.com/');
insert into developer values('D_0028', 'No Brakes Games', 2013, 'https://nobrakesgames.com/');
insert into developer values('D_0029', 'Re-Logic', 2011, 'https://re-logic.com/');

--게임 DB입력
insert into game values('G_0001', 'Stardew Valley', 'You''ve inherited your grandfather''s old farm plot in Stardew Valley.', 
to_date('2016/02/27', 'yyyy/mm/dd'), 'ConcernedApe', '시뮬레이션', 16000, 'Windows');

insert into game values('G_0002', 'Destiniy Guardians', 'Your journey is just beginning, Guardian! Welcome to the Light and Darkness saga.', 
to_date('2017/09/06', 'yyyy/mm/dd'), 'Bungie', 'MMORPG', 0, 'PS5');

insert into game values('G_0003', 'Destiniy', 'We stared out at the galaxy and knew that it was our destiny to walk in the light of other stars.', 
to_date('2014/09/09', 'yyyy/mm/dd'), 'Bungie', 'FPS', 0, 'PS3');

insert into game values('G_0004', 'Little Nightmares', 'Immerse yourself in the unsettling world of Little Nightmares and help a tough young kid known as Six tiptoe safely through the shadows of the Maw and escape to freedom.', 
to_date('2017/04/28', 'yyyy/mm/dd'), 'Tarsier Studios', '호러', 16000, 'Windows');

insert into game values('G_0005', 'Little Nightmares II', 'With Six, the girl in a yellow raincoat, as his guide, Mono sets out to discover the dark secrets of The Signal Tower and save Six from her terrible fate.', 
to_date('2021/02/10', 'yyyy/mm/dd'), 'Tarsier Studios', '호러', 32800, 'Windows');

insert into game values('G_0006', 'Halo: Reach', 'REMEMBER WHERE IT ALL BEGAN. REMEMBER REACH.', 
to_date('2010/09/14', 'yyyy/mm/dd'), 'Bungie', 'FPS', 13400, 'Xbox');

insert into game values('G_000A3', 'Halo 3: ODST', 'these troopers are the best of the best. And saving New Mombasa could be the most important mission of the war...', 
to_date('2009/09/22', 'yyyy/mm/dd'), 'Bungie', 'FPS', 12000, 'Xbox');

insert into game values('G_0007', 'Pathways into Darkness', ' ', 
to_date('1993/08/12', 'yyyy/mm/dd'), 'Bungie', 'FPS', 500000, 'Mac');

insert into game values('G_0008', 'Warframe', 'Come Tenno, you must join the war.', 
to_date('2013/03/25', 'yyyy/mm/dd'), 'Digital Extremes', 'TPS', 0, 'Windows');

insert into game values('G_0009', 'Bioshock', 'Somewhere, beyond the sea...', 
to_date('2007/08/21', 'yyyy/mm/dd'), 'Digital Extremes', 'FPS', 40000, 'PS3');

insert into game values('G_00A0', 'Don''t Starve', 'Don''t Starve is an uncompromising wilderness survival game full of science and magic.', 
to_date('2013/04/24', 'yyyy/mm/dd'), 'Klei Entertainment', '시뮬레이션', 10500, 'Windows');

insert into game values('G_00A1', 'Don''t Starve Together'', ''Don''t Starve Together is the standalone multiplayer expansion of the uncompromising wilderness survival game, Don''t Starve.', 
to_date('2016/04/22', 'yyyy/mm/dd'), 'Klei Entertainment', '시뮬레이션', 10500, 'Windows');

insert into game values('G_00B1', 'Oxygen Not Included', 'Oxygen Not Included is a space-colony simulation game.', 
to_date('2019/07/31', 'yyyy/mm/dd'), 'Klei Entertainment', '시뮬레이션', 26000, 'Windows');

insert into game values('G_00A2', 'party Aimals', '협동 및 배틀 로얄 요소를 추가한 캐쥬얼 대전 액션 게임.'||CHR(13) || CHR(10)||
	'동물 캐릭터들을 조작해 상대를 장외시키거나 다양한 미션을 수행해야 합니다.', 
to_date('2023/09/20', 'yyyy/mm/dd'), 'Recreate Games', '액션', 25900, 'Windows');

insert into game values('G_0011', 'Overcooked1', '1~4명이 즐길 수 있는협동 요리게임.'||CHR(13) || CHR(10)||
     '팀으로 일하면서 당신과 당신과 동료 셰프는 손님들이 몰려들기 전에 다양하고'||CHR(13) || CHR(10)|| 
     '맛있는 주문을 준비하고 요리하고 서빙해야 합니다.', 
to_date('2016/08/04', 'yyyy/mm/dd'), 'Ghost Town Games Ltd.', '캐쥬얼', 18000, 'Windows');

insert into game values('G_0012', 'Overcooked2','1~4명이 즐길 수 있는협동 요리게임.'||CHR(13) || CHR(10)||
     '팀으로 일하면서 당신과 당신과 동료 셰프는 손님들이 몰려들기 전에 다양하고'||CHR(13) || CHR(10)|| 
     '맛있는 주문을 준비하고 요리하고 서빙해야 합니다.', 
to_date('2018/08/08', 'yyyy/mm/dd'), 'Ghost Town Games Ltd.', '캐쥬얼', 26000, 'Windows');

insert into game values('G_0013', 'Ori and the Will of the Wisps', '작은 정령 ''오리''의 모험', 
to_date('2020/11/12', 'yyyy/mm/dd'), 'Moon Studios GmbH','액션', 29900, 'Windows');

insert into game values('G_0014', 'Monster Hunter: World', '헌터가 되어 다양한 환경에 서식하는 몬스터를 사냥하는 액션 게임'||CHR(13) || CHR(10)||
      '몬스터를 사냥하고 입수한 소재를 이용해 더 강한 무기와 방어구를 만들고,'||CHR(13) || CHR(10)||
      '더욱 강력한 몬스터에 도전해 나갑니다.', 
    to_date('2018/08/09', 'yyyy/mm/dd'), '2018/08/09', 'CAPCOM', '액션', 34900, 'Windows');

insert into game values('G_0015', 'It Takes Two', ' ', 
    to_date('2021/03/26', 'yyyy/mm/dd'), 'Hazelight Studios', '어드벤처', 44000, 'Windows');

insert into game values('G_0016', 'planet coaster', '놀이공원을 만들어 관람객을 유치하고, 이에 대한 수익금으로'||CHR(13) || CHR(10)||
    '놀이기구 설치, 상점과 매점 설치, 공원 장식, 직원 고용 등에 투자하는 경영 시뮬레이션', 
    to_date('2016/11/08', 'yyyy/mm/dd'), 'Frontier Developments', '시뮬레이션', 48750, 'Windows');
    
insert into game values('G_0017', 'planet zoo', '실감나는 서식지를 건설하고, 동물원을 관리하고, 생각하고 느끼고'||CHR(13) || CHR(10)||
    '여러분이 창조한 세계를 탐험하는 경영 시뮬레이션', 
    to_date('2019/11/05', 'yyyy/mm/dd'), 'Frontier Developments', '시뮬레이션', 46000, 'Windows');

insert into game values('G_0018', 'PUBG: BATTLEGROUNDS', '다양한 전장에서 전략적 위치를 선점하고 무기와 장비를 확보해,'||CHR(13) || CHR(10)||
'최후의 1인이 되기 위한 생존의 사투를 펼칩니다.', to_date('2017/12/21', 'yyyy/mm/dd'), 'KRAFTON, Inc.', '배틀로얄', 0, 'Windows');

insert into game values('G_0019', 'Unpacking', '상자에서 짐을 꺼내 새집에 맞게 배치하는 친숙한 체험에 대한 명상적 퍼즐 게임', 
to_date('2021/11/02', 'yyyy/mm/dd'), 'Witch Beam', '캐쥬얼', 20500, 'Windows');

insert into game values('G_0020', '화이트 데이(학교라는 이름의 미궁)', '3월 13일 밤의 고등학교에서 펼쳐지는 무서운 이야기를 다룬 풀 3D 그래픽의 호러 어드벤처 게임'||CHR(13) || CHR(10)||
    '미쳐버린 수위. 각종 귀신들과 초자연적 공포와 위험으로부터 몸을 지키고,'||CHR(13) || CHR(10)||
    '학교의 비밀을 풀어내야 합니다.', 
to_date('2017/08/23', 'yyyy/mm/dd'), '손노리', '호러', 32000, 'Windows');

insert into game values('G_00Q1', '데이브 더 다이버', '신비한 블루홀을 배경으로 한 해양 어드벤처 게임', 
to_date('2023/06/28', 'yyyy/mm/dd'), 'MINTROCKET', '어드벤처', 24000, 'Windows');

insert into game values('G_0022', 'cube escape PARADOX', '색다른 크로스오버 작품에서 평행 세계의 불길한 방을 탈출하는 게임', 
to_date('2018/09/20', 'yyyy/mm/dd'), 'Rusty Lake', '어드벤처', 0, 'Windows');

insert into game values('G_0024', 'Rhythm Doctor', '심장박동에 맞춰 환자들을 제세동하는 리듬 게임', 
to_date('2021/02/26', 'yyyy/mm/dd'), '7th Beat Games', '인디', 17500, 'Windows');

insert into game values('G_0025', 'TO THE MOON', '두명의 박사가 죽어가는 남자의 마지막 소원을 이루어주기위해'||CHR(13) || CHR(10)||'그의 기억속으로 들어가 시간을 거슬러 가는 스토리형 게임', 
to_date('2021/11/01', 'yyyy/mm/dd'), 'Freebird Games', '인디', 10800, 'Windows');

insert into game values('G_0026', '산나비', '사이버펑크 디스토피아를 배경으로 펼쳐지는 역동적이고 스타일리쉬한 어드벤처 게임', 
to_date('2023/11/09', 'yyyy/mm/dd'), 'WONDER POTION', '어드벤처', 15500, 'Windows');

insert into game values('G_0027', 'Palworld/팰월드', '신비한 생물 "팰"을 수집하여 전투, 건축, 농업에 투입하거나'||CHR(13) || CHR(10)||
    '공장에서 일을 시키는 등, 전에 없던 새로운 체험을 선사하는'||CHR(13) || CHR(10)||
    '전에 없던 새로운 체험을 선사하는 멀티 지원 오픈월드 서바이벌 크래프트 게임 ', 
to_date('2024/01/19', 'yyyy/mm/dd'), 'Pocketpair', '액션', 32000, 'Windows');

insert into game values('G_0028', 'Longvinter', '성인판 동물의 숲', 
to_date('2022/02/25', 'yyyy/mm/dd'), 'Uuvana Studios', '액션', 19900, 'Windows');

insert into game values('G_0029', 'Human Fall Flat', '부유하는 초현실적 세계에서 가벼운 마음으로 즐길 수 있는 유쾌한 플랫폼 게임 세트', 
to_date('2016/07/23', 'yyyy/mm/dd'), 'No Brakes Games', '인디', 20500, 'Windows');

insert into game values('G_00B3', 'Terraria', 'Nothing is impossible in this action-packed adventure game', 
to_date('2011/05/17', 'yyyy/mm/dd'), 'Re-Logic', '인디', 11000, 'Windows');