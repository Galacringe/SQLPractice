-- group by all

select ����, AVG(����) as ��հ��� from ��ǰ where ���� >= 50000 group by all ����

select * from ��ǰ where ���� >= 50000

-- group by rollup / group by�� Ȯ����
-- ������ ����? 
-- ������ ���� ���� ������ش�?????????

select ��, ����, AVG(����) as ������� from ���� group by ��, ���� with rollup

--A��86
--A         	��	84
--A         	NULL	85
--B         	��	85
--B         	��	81
--B         	NULL	83
--NULL	NULL	84

-- https://dev-jy.tistory.com/68
-- ���� �׷��ϱ� A/NULL/85�� A ��/���� ��հ��� �����ؼ� ��Ÿ����
-- B/NULL/83�� ����, NULL / NULL /84�� A,B ����̶�°ǰ�??


SELECT ����, ��, AVG(����)
AS �������
FROM ����
GROUP BY ����, ��
WITH ROLLUP

--��	A         	86
--��	B         	85
--��	NULL	86
--��	A         	84
--��	B         	81
--��	NULL	82
--NULL	NULL	84

-- GROUP BY CUBE

-- ��� �������� �������ش�
-- �Ʒ� �ڵ�� �ݺ� / ���� ���踦 �� �� ����

SELECT ��, ����, AVG(����) AS �������
FROM ����
GROUP BY ��, ���� WITH CUBE




-- rollup�� ���� / �б⺰ / ������ ���� �ܰ躰 ��� ����
-- cube�� ��ǰ��, ������. ������ ������ �м�