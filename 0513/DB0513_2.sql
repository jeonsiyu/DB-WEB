-- DB 설계 (ERD : Entity Relationship Diagram)
-- <요구사항 명세서>
-- 1. 은행은 예금 서비스를 고객에게 제공
-- 2. 은행은 여러 지점으로 구성되고, 각 지점은 특정 도시에 위치해 있음.
-- 3. 각 지점은 고유의 지점명이 부여되며, 추가로 도시, 자산 영문지점명, 지정 개설일, 
--    전화번호 정보를 가짐.
-- 4. 고객은 고유의 고객번호를 가지며, 이름, 주소, 생년월일 정보를 가짐
-- 5. 예금계좌는 예금번호로 유일하게 식별되고, 잔고, 입/출급 내역이 관리됨.
-- 6. 한 명의 고객은 여러 개의 예금계좌에 예금 할 수 있고, 하나의 예금계좌에는 여러명의 고객이 예금 할 수 있음.
-- 7. 지점은 여러 개의 예금계좌를 관리.

-- 1. 학생은 고유의 학번이 부여되며, 주민등록번호, 이름, 주소 전화번호, 학년 정보를 가짐 
-- 2. 교수는 고유의 교수번호가 부여되며, 주민등록번호, 이름, 주소 , 전화번호, 직위 임영년도 정보를 가짐.
-- 3. 학생과 교수는 하나의 학과에만 소속 될 수 있으나 하나의 학과에는 여러명의 학생과 교수가 소속됨
-- 4. 학과는 고유의 학과번호가 부여되며, 학과명, 사무실, 전화번호 정보를 가짐
-- 5. 강좌는 고유의 강좌번호가 부여되며 강좌명, 학점수, 연도, 학기, 강의시, 수강인원 정보를 가짐
-- 6. 하나의 강좌는 한명의 교수가 강의하고, 한 교수는 여러 강좌를 강의함
-- 7. 한 학생은 하나의 이상의 강좌를 수강 할 수 있음
-- 8. 각각의 학생이 수강한 과목에 대해서 성적이 부여됨.