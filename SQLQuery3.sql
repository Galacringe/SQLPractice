-- �μ� �ڵ�ǥ �ָ�!!!!

select GETDATE() -- ��¥�� �ð� ��ȯ

select day(GETDATE()), month(getdate()), year(getdate())

select DATENAME(day,'2024-03-24') -- ���ڿ� ��ȯ / '24'
select DATEPART(day,'2024-03-14') -- ���� ��ȯ / 14

select DATENAME(month,'2024-03-24') -- 03
select DATEPART(day,'2024-03-14')

-- DATEDIFF(Scale, DATE1, DATE2) || DATE1���� DATE2���� ��ĥ / ��� / ����� �����°�

select DATEDIFF(week, '2023-03-14', GETDATE()) -- 2024/03/14���� ���ݱ��� ���ְ� �����°�?

-- select DATEADD(Scale, num1, DATE) || ��¥��  ��ĥ / ��� / ��� ���ϱ�

select DATEADD(day,100,'2024-03-14') -- 100�� ����

--DAY('2024-03-14')
--MONTH('2024-03-14')
--DAY('2024-03-14')

-- ����

-- 1.

select DATEPART(dw, '2025-03-27') -- ���� ��ȯ
select DATENAME(dw, '2025-03-27') -- ���ڿ� ��ȯ

-- 2.

select DATEDIFF(day, getdate(), '2026-03-27')
select DATEDIFF(month, getdate(), '2026-03-27')
select DATEDIFF(year, getdate(), '2026-03-27')

-- 3. 

select DATEADD(DAY, 100, getdate())
select DATEADD(MONTH, 100, getdate())
select DATEADD(YEAR, 100, getdate())




