-- CONVERT : 자료형을 변경하는 함수
-- SELECT CONVERT(type(length), originData, style)
-- STYLE은 변수의 양식, 예를 들어 YYYY/MM/DD도 있을 거고, YYMMDD로도 쓰고 싶을 수도 있고....

select getdate()
select CONVERT(varchar(30),GETDATE(),109)
--실행해보면 둘이 다른 형식을 가진 것을 알 수 있음

select CONVERT(time, getdate())
select CONVERT(date, getdate())
select CONVERT(datetime, getdate())
select CONVERT(datetime2, getdate())

-- CONVERT : 자료형을 변경하는 함수
-- SELECT CONVERT(type(length), originData, style)
-- STYLE은 변수의 양식, 예를 들어 YYYY/MM/DD도 있을 거고, YYMMDD로도 쓰고 싶을 수도 있고....


-- CAST : 동일하게 자료형을 변경하는 함수
-- SELECT CAST(data as type)

SELECT CAST('55' as int)

DECLARE @a VARCHAR(10) = 'SQL Server' -- 이거 왜 작은따옴표임???
DECLARE @b INT = 2024

select CONVERT(VARCHAR(5), @b)
select @a+CONVERT(VARCHAR(5), @b)

select @a+CAST(@b as varchar(5))

-- 시스템 데이터 형식 / 기타

--CURSOR
--TIMESTAMP
--HIERARCHYID....


-- 연산 함수
select abs(-30), abs(20) -- Absolute 절댓값
select CEILING(2.35), floor(2.35) -- 올림 내림(천장과 바닥)
select POWER(5,2) -- 지수 5^2 = 25
select ROUND(123.4567, 2) -- 반올림, 옵션 파라미터에 0 넣으면 정수만 출력
select RAND(), RAND()*100-- 0~1 사이의 난수, 시드값 조정 가능
select SIGN(-10), SIGN(0), SIGN(10) -- 부호값 반환
select SQRT(4), SQRT(25) -- 제곱근 반환

select SQRT(100)
select ROUND(PI(), 6)
select POWER(5,3)
select FLOOR(Rand()*100*0.45)


-- 문자열 관련
select ascii('A') 
select char(65)
select left('server',2) -- se
select right('server',2) -- er
select lower('Apple') -- LowerCase => apple
select Upper('Apple') -- UpperCase => APPLE
select LTRIM('   Hello'), RTRIM('Hello   ') -- Left Trim, 즉 왼쪽 공백을 지운다
select REPLICATE('hello', 3) -- n회 루프 => hello
select REVERSE('abcdef'),'-'+space(5),'-' space는 공백을 만들어준다
select SUBSTRING('SQLServer',3,2) -- LS
