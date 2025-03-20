-- SQL- Structured Query Language
-- Transact-SQL : ANSI SQL-92의 표준을 따르는 MS의 독자 SQL (몇몇 기능이 추가되었음)

-- 새 쿼리를 눌러서 시작 -> 파이썬마냥 부분 드래그해서 선택 후 실행가능
-- 기본은 뭐 그냥 선형적인거고

-- 주석처리 단축키 : 드래그 후 Ctrl+K -> Ctrl+C

-- #1. TSQL 구문의 종류

--데이터 정의 언어 - DDL (CREATE / DROP / ALTER)
--데이터 조작 언어 - DML (SELECT / INSERT / UPDATE / DELETE)
--데이터 제어 언어 - DCL (GRANT / DENY / REVOKE) 권한 및 명령 계통?

-- 주석입니다. 끝에는 뭐 붙일 필요가 없는 것 같아요

/* 복수 줄에 사용되는 주석입니다. 이거 PHP에서 썼던거 아닙니까 
정말 싫습니다 그냥 # 쓰라고 */

--# 변수 정의 및 값 할당

-- DECLARE @변수명 자료형
DECLARE @id INT -- (이거 쓰레기값 어케됨???)
DECLARE @idx INT = 10

SET @id = 10
SET @id += 10 -- (++은 안됨)

-- # 값을 조회하기 위한 SELECT

-- ex)

DECLARE @num INT, @city CHAR(10)
SET @num = 10
SET @city = '서울' -- (한글 몇바이트더라? 개당 2바이트였나?)
SELECT @num, @city


-- # 시스템 변수

-- Transact-SQL 기본요소 시스템변수(시스템함수) –@@로시작
-- 예) 

SELECT @@SERVERNAME
SELECT @@VERSION
SELECT @@ERROR
SELECT @@ROWCOUNT

SELECT @@SERVERNAME, @@VERSION, @@ERROR, @@ROWCOUNT

-- 시스템 변수의 의미

-- @@SERVERNAME SQL Server를 실행하는 로컬서버의 이름을 반환한다.
-- @@VERSION 현재 설치된 SQL Server의 버전을 반환한다.
-- @@ERROR SQL문이 성공적으로 실행되면 0을 반환하고 오류가 발생하면 해당 오류번호를 반환한다.
-- @@ROWCOUNT 최근 실행된 SQL문의 영향을 받은 행의 수를 반환한다.
-- @@IDENTITY 마지막으로 삽입된 identity 값을 반환한다.
-- @@TRANCOUNT 현재 연결에서 발생한 BEGIN TRANSACTION 문의 수를 반환한다

-- # 정수형

-- BIGINT (8byte) :-2^63 ~ 2^63-1 까지 
-- INT (4byte) -2^31 ~ 2^31-1 까지 
-- SMALLINT (2byte) -2^15 ~ 2^15-1 까지
-- TINYINT (1byte) 0~255 까지
-- BIT 0/1 (bit = boolean)

-- # 고정실수
-- DECIMAL / NUMERIC (5~17 byte) 
-- DECLARE @dcm DECIMAL(6,2) = 정수 6자리 + 소수 2자리

-- # 부동실수
-- FLOAT (4~8byte)
-- REAL (4byte)

 DECLARE @i INT = 1234
 DECLARE @b BIT = 0
 DECLARE @dcm DECIMAL(6,2) = 1234.45

 SELECT @i, @b, @dcm
