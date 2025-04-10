﻿  ﻿/*              SampleDB.SQL - Creates the SampleDB database              */ 
/*                                                                        */
/*                                                                        */

SET NOCOUNT ON
GO

set nocount    on

USE master

declare @dttm VARCHAR(55)
select  @dttm=convert(VARCHAR,getdate(),102)
raiserror('SampleDB.SQL시작 :  %s ',1,1,@dttm) with nowait

GO

if exists (select * from sysdatabases where name='SampleDB')
begin
  raiserror('기존에 존재하는 SampleDB를 삭제하는 중 ....',0,1)
  DROP database SampleDB
end
GO

CHECKPOINT
go

raiserror('SampleDB database를 생성하는 중....',0,1)
go

CREATE DATABASE SampleDB
GO

USE SampleDB
GO

if db_name() <> 'SampleDB'
   raiserror('SampleDB사용오류..',0,1)

GO

-- 성적테이블 생성
CREATE TABLE 성적
(학번 CHAR(9) PRIMARY KEY,
 이름 VARCHAR(20),
 성별 CHAR(2),
 반   CHAR(10),
 점수 INT)    

INSERT INTO 성적 VALUES('201501001','김수현','남','A',90)
INSERT INTO 성적 VALUES('201501002','송혜교','여','A',75)
INSERT INTO 성적 VALUES('201501003','하지원','여','A',77)
INSERT INTO 성적 VALUES('201501004','장근석','남','A',85)
INSERT INTO 성적 VALUES('201501005','이종석','남','A',95)
INSERT INTO 성적 VALUES('201501006','주원','남','A',80)
INSERT INTO 성적 VALUES('201501007','박보영','여','A',95)
INSERT INTO 성적 VALUES('201501008','한효주','여','A',90)
INSERT INTO 성적 VALUES('201501009','송중기','남','A',83)
INSERT INTO 성적 VALUES('201501010','김우빈','남','A',88)
INSERT INTO 성적 VALUES('201501011','이연희','여','B',75)
INSERT INTO 성적 VALUES('201501012','유승호','남','B',84)
INSERT INTO 성적 VALUES('201501013','박신혜','여','B',80)
INSERT INTO 성적 VALUES('201501014','한지민','여','B',94)
INSERT INTO 성적 VALUES('201501015','이승기','남','B',78)
INSERT INTO 성적 VALUES('201501016','박민영','여','B',71)
INSERT INTO 성적 VALUES('201501017','유아인','남','B',87)
INSERT INTO 성적 VALUES('201501018','강소라','여','B',90)
INSERT INTO 성적 VALUES('201501019','이민호','남','B',94)
INSERT INTO 성적 VALUES('201501020','김태희','여','B',78)

-- 제품 테이블 생성

CREATE TABLE 제품
 (
 제품번호 INT PRIMARY KEY,
 제품명 CHAR(20),
 종류 CHAR(20),
 색상 CHAR(10),
 가격 INT
 )

 INSERT INTO 제품 VALUES(1,'롱코트','코트','BLACK',150000)
 INSERT INTO 제품 VALUES(2,'하프코트','코트','RED',130000)
 INSERT INTO 제품 VALUES(3,'짚업점퍼','점퍼','BROWN',55000)
 INSERT INTO 제품 VALUES(4,'후드점퍼','점퍼','YELLOW',63000)
 INSERT INTO 제품 VALUES(5,'가죽자켓','자켓','BLACK',82000)
 INSERT INTO 제품 VALUES(6,'주름스커트','스커트','WHITE',65000)
 INSERT INTO 제품 VALUES(7,'옥스포드셔츠','셔츠','WHITE',15000)
 INSERT INTO 제품 VALUES(8,'블라우스','셔츠','PINK',35000)
 INSERT INTO 제품 VALUES(9,'원피스','원피스','BLUE',95000)
 INSERT INTO 제품 VALUES(10,'반바지','바지','WHITE',35000)
 INSERT INTO 제품 VALUES(11,'장갑','패션잡화','RED',NULL)
 INSERT INTO 제품 VALUES(12,'목도리','패션잡화','BEIGE',NULL)

 -- 판매이블 생성
 CREATE TABLE 판매
 (
 판매번호 INT IDENTITY,
 제품번호 INT FOREIGN KEY REFERENCES 제품(제품번호),
 판매수량 INT,
 판매날짜 CHAR(10) 
 )
 
 INSERT INTO 판매 VALUES(1,10,'2015/02/11')
 INSERT INTO 판매 VALUES(2,12,'2015/02/11')
 INSERT INTO 판매 VALUES(2,15,'2015/02/12')
 INSERT INTO 판매 VALUES(4,21,'2015/02/13')
 INSERT INTO 판매 VALUES(7,17,'2015/02/16')
 INSERT INTO 판매 VALUES(4,11,'2015/02/16')
 INSERT INTO 판매 VALUES(10,3,'2015/02/17')

 -- 전공이블 생성
CREATE TABLE 전공
(
 전공코드 CHAR(3) PRIMARY KEY,
 전공명 VARCHAR(20)
)

INSERT INTO 전공 VALUES('D01','통신')
INSERT INTO 전공 VALUES('D02','DB')
INSERT INTO 전공 VALUES('D03','그래픽')
INSERT INTO 전공 VALUES('D04','알고리즘')
INSERT INTO 전공 VALUES('D05','정보보안')
INSERT INTO 전공 VALUES('D06','분산시스템')


-- 지도교수 테이블 생성
CREATE TABLE 지도교수
(
 지도교수 CHAR(3) PRIMARY KEY,
 교수명  VARCHAR(20),
 전공코드 CHAR(3) FOREIGN KEY REFERENCES 전공(전공코드),
 조장 CHAR(9),
)

INSERT INTO 지도교수 VALUES('P01','김철수','D02','201501013')
INSERT INTO 지도교수 VALUES('P02','박영희','D01','201501001')
INSERT INTO 지도교수 VALUES('P03','최석민','D04','201501009')
INSERT INTO 지도교수 VALUES('P04','이영민','D02','201501005')
INSERT INTO 지도교수 VALUES('P05','한시원','D03','201501003')

-- 팀프로젝트 테이블 생성
CREATE TABLE 팀프로젝트
(학번 CHAR(9) PRIMARY KEY,
이름 VARCHAR(20),
조장 CHAR(9)
)

INSERT 팀프로젝트 VALUES('201501001','김수현','201501001')
INSERT 팀프로젝트 VALUES('201501002','송혜교','201501005')
INSERT 팀프로젝트 VALUES('201501003','하지원','201501003')
INSERT 팀프로젝트 VALUES('201501004','장근석','201501013')
INSERT 팀프로젝트 VALUES('201501005','이종석','201501005')
INSERT 팀프로젝트 VALUES('201501006','주원','201501013')
INSERT 팀프로젝트 VALUES('201501007','박보영','201501001')
INSERT 팀프로젝트 VALUES('201501009','송중기','201501009')
INSERT 팀프로젝트 VALUES('201501010','김우빈','201501003')
INSERT 팀프로젝트 VALUES('201501012','유승호','201501001')
INSERT 팀프로젝트 VALUES('201501013','박신혜','201501013')
INSERT 팀프로젝트 VALUES('201501014','한지민','201501009')
INSERT 팀프로젝트 VALUES('201501016','박민영','201501009')
INSERT 팀프로젝트 VALUES('201501019','이민호','201501005')
INSERT 팀프로젝트 VALUES('201501020','김태희','201501003')
INSERT 팀프로젝트 VALUES('G01','원빈','201501005') -- FULL OUTER JOIN 예제를 위한 레코드 삽입

-- 학생평가 테이블 생성 
CREATE TABLE 학생평가
(학번 CHAR(9) PRIMARY KEY,
이름 VARCHAR(20),
점수 INT,
조이름 VARCHAR(20))

INSERT INTO 학생평가 VALUES('201501001','김수현',90,'T2015')
INSERT INTO 학생평가 VALUES('201501002','송혜교',75,'무한도전')
INSERT INTO 학생평가 VALUES('201501003','하지원',77,'학교짱')
INSERT INTO 학생평가 VALUES('201501004','장근석',85,'T2015')
INSERT INTO 학생평가 VALUES('201501005','이종석',96,'BIG')
INSERT INTO 학생평가 VALUES('201501006','주원',80,'베스트')
INSERT INTO 학생평가 VALUES('201501007','박보영',95,'BIG')
INSERT INTO 학생평가 VALUES('201501008','한효주',90,'학교짱')
INSERT INTO 학생평가 VALUES('201501009','송중기',83,'T2015')
INSERT INTO 학생평가 VALUES('201501010','김우빈',88,'베스트')
INSERT INTO 학생평가 VALUES('201501011','이연희',75,'학교짱')
INSERT INTO 학생평가 VALUES('201501012','유승호',84,'BIG')
INSERT INTO 학생평가 VALUES('201501013','박신혜',89,'무한도전')
INSERT INTO 학생평가 VALUES('201501014','한지민',94,'베스트')
INSERT INTO 학생평가 VALUES('201501015','이승기',78,'무한도전')

-- merge 예제로 대상 테이블, 소스 테이블 생성
 CREATE TABLE 대상
 (사번 INT PRIMARY KEY,
 이름 VARCHAR(10) NOT NULL,
 직급 VARCHAR(10) NOT NULL,
 부서 CHAR(20) NOT NULL)
 
 INSERT INTO 대상 VALUES(1,'홍길동','부장','홍보부')
 INSERT INTO 대상 VALUES(2,'김선달','부장','인사부')
 INSERT INTO 대상 VALUES(3,'이도령','과장','홍보부')
  
 CREATE TABLE 소스
 (사번 INT PRIMARY KEY,
 이름 VARCHAR(10) NOT NULL,
 직급 VARCHAR(10) NOT NULL,
 부서 CHAR(20) NOT NULL)
 
 INSERT INTO 소스 VALUES(1,'홍길동','부장','국제마케팅부')
 INSERT INTO 소스 VALUES(3,'이도령','부장','홍보부')
 INSERT INTO 소스 VALUES(4,'성춘향','과장','영업부')

USE master

declare @dttm VARCHAR(55)
select  @dttm=convert(VARCHAR,getdate(),102)
raiserror('SampleDB.SQL완료 :  %s ',1,1,@dttm) with nowait

GO

-- 3주차 

-- DDL / DEFINE || DML / MANIPULATION || DCL / ????몰라 나중에 적어

-- SELECT / FROM / WHERE

SELECT * FROM 성적 -- dbo.성적의 모든 Data ex) 202501001 김수현 남 A 90

SELECT 학번 FROM 성적 -- dbo.성적 중에서도 학번 열만 가져오기
SELECT * FROM dbo.성적 -- 기본적으로 dbo는 생략 처리되어있을 뿐임
SELECT * FROM SampleDB.dbo.성적 -- 이런 식으로도 가능

-- 테이블을 묶는 스키마(Schema) 형식도 존재한다

select * from 성적

-- 열 이름 변경하기
-- 실제로 열 이름을 변경하는 것은 아니고, 표를 출력할 때만 이름을 바꿔 표시하는것
-- ex) db_userName AS '사용자명'

SELECT 학번, 이름 AS '학생이름', 점수 AS [DB점수] FROM 성적 -- '' "" []로 묶을 수 있음

-- 학번 || 학생이름 || DB점수 형식으로 표시됨

-- 순서 정렬하기

select 학번, 이름
from 성적
order by 학번 asc -- default 오름차순(asc) 내림차순(desc)

select *
from 성적
order by 학번, 이름 --여기서도 asc 기본이니 즉 반 오름차순 + 동일하면 이름 오름차순

-- 중복 데이터 제거 || DISTINCT

select 종류 from 제품 -- 코트 / 코트 / 점퍼 / 점퍼.....

select DISTINCT 종류 -- 코트 / 점퍼 ......
from 제품


-- 1번
select 제품명, 색상, 가격 from 제품

-- 2번
select 제품번호 AS '의류번호', 제품명 AS '의류명' from 제품

-- 3번
 select 학번, 이름, 점수 from 학생평가 
 order by 점수 desc, 학번

-- 4번

select DISTINCT 반 from 성적
