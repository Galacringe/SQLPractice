-- 인수 코드표 주목!!!!

select GETDATE() -- 날짜와 시간 반환

select day(GETDATE()), month(getdate()), year(getdate())

select DATENAME(day,'2024-03-24') -- 문자열 반환 / '24'
select DATEPART(day,'2024-03-14') -- 정수 반환 / 14

select DATENAME(month,'2024-03-24') -- 03
select DATEPART(day,'2024-03-14')

-- DATEDIFF(Scale, DATE1, DATE2) || DATE1부터 DATE2까지 며칠 / 몇달 / 몇년이 지났는가

select DATEDIFF(week, '2023-03-14', GETDATE()) -- 2024/03/14부터 지금까지 몇주가 지났는가?

-- select DATEADD(Scale, num1, DATE) || 날짜에  며칠 / 몇달 / 몇년 더하기

select DATEADD(day,100,'2024-03-14') -- 100일 가산

--DAY('2024-03-14')
--MONTH('2024-03-14')
--DAY('2024-03-14')

-- 과제

-- 1.

select DATEPART(dw, '2025-03-27') -- 정수 반환
select DATENAME(dw, '2025-03-27') -- 문자열 반환

-- 2.

select DATEDIFF(day, getdate(), '2026-03-27')
select DATEDIFF(month, getdate(), '2026-03-27')
select DATEDIFF(year, getdate(), '2026-03-27')

-- 3. 

select DATEADD(DAY, 100, getdate())
select DATEADD(MONTH, 100, getdate())
select DATEADD(YEAR, 100, getdate())




