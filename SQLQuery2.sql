-- CONVERT : �ڷ����� �����ϴ� �Լ�
-- SELECT CONVERT(type(length), originData, style)
-- STYLE�� ������ ���, ���� ��� YYYY/MM/DD�� ���� �Ű�, YYMMDD�ε� ���� ���� ���� �ְ�....

select getdate()
select CONVERT(varchar(30),GETDATE(),109)
--�����غ��� ���� �ٸ� ������ ���� ���� �� �� ����

select CONVERT(time, getdate())
select CONVERT(date, getdate())
select CONVERT(datetime, getdate())
select CONVERT(datetime2, getdate())

-- CONVERT : �ڷ����� �����ϴ� �Լ�
-- SELECT CONVERT(type(length), originData, style)
-- STYLE�� ������ ���, ���� ��� YYYY/MM/DD�� ���� �Ű�, YYMMDD�ε� ���� ���� ���� �ְ�....


-- CAST : �����ϰ� �ڷ����� �����ϴ� �Լ�
-- SELECT CAST(data as type)

SELECT CAST('55' as int)

DECLARE @a VARCHAR(10) = 'SQL Server' -- �̰� �� ��������ǥ��???
DECLARE @b INT = 2024

select CONVERT(VARCHAR(5), @b)
select @a+CONVERT(VARCHAR(5), @b)

select @a+CAST(@b as varchar(5))

-- �ý��� ������ ���� / ��Ÿ

--CURSOR
--TIMESTAMP
--HIERARCHYID....


-- ���� �Լ�
select abs(-30), abs(20) -- Absolute ����
select CEILING(2.35), floor(2.35) -- �ø� ����(õ��� �ٴ�)
select POWER(5,2) -- ���� 5^2 = 25
select ROUND(123.4567, 2) -- �ݿø�, �ɼ� �Ķ���Ϳ� 0 ������ ������ ���
select RAND(), RAND()*100-- 0~1 ������ ����, �õ尪 ���� ����
select SIGN(-10), SIGN(0), SIGN(10) -- ��ȣ�� ��ȯ
select SQRT(4), SQRT(25) -- ������ ��ȯ

select SQRT(100)
select ROUND(PI(), 6)
select POWER(5,3)
select FLOOR(Rand()*100*0.45)


-- �ƽ�Ű �ڵ�

select ascii('A') 
select char(65)
select left('server',2) -- se
select right('server',2) -- er
select lower('Apple') -- LowerCase => apple
select Upper('Apple') -- UpperCase => APPLE
select LTRIM('   Hello'), RTRIM('Hello   ') -- Left Trim, �� ���� ������ �����
select REPLICATE('hello', 3) -- nȸ ���� => hello
select REVERSE('abcdef'),'-'+space(5),'-' --1. ���� ���� string �̾�����? 2. space�� ������ ������ش�
select SUBSTRING('SQLServer',3,2) -- LS