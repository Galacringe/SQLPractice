-- DB: pubs 
select * from sales
select * from titles
select * from stores

-- ���� 1

-- Q1
select top 6 title_id as å�ڵ�, qty as �ֹ��� from sales order by qty desc

-- Q2

select top 6 with ties title_id as å�ڵ�, qty as �ֹ��� from sales order by qty desc

-- Q3

select distinct type as å�о� from titles 

-- Q4

select distinct type as å�о� from titles where type is not null

-- Q5

select title + ' (' + title_id + ')' as 'å�̸� (å�ڵ�)' , price from titles


-- ���� �� (�ٽ� SampleDB)


-- ������� �����
-- ex) ������ ���� ���� ������, �� ���� �ο�ó��, �����Լ�
-- �����Լ����� �⺻������ NULL�� ���ߵ��ϰ� �ɷ����ش�

-- AVG / COUNT / MAX / MIN / SUM

select sum(����)/count(����) from ��ǰ --72500
select  sum(����)/count(*) from ��ǰ -- 60416

-- ���� �� ������ ����� �ٸ� ������ count(*)�� null�� ī��Ʈ�߱� ����
-- count(����)�� null�� �˾Ƽ� �ɷ��� �� ���� ���� ������

-- GROUP BY

select ����, AVG(����) as ���������� from ��ǰ GROUP BY ����
-- return ������ ��� ����, ������ ��� ����....

select ����, ��ǰ��ȣ, AVG(����) as ���������� from ��ǰ GROUP BY ����
-- ��� �ȵ�. �������� ��� �����϶� �ߴµ� ��ǰ��ȣ�� ���� �ٸ� �״ϱ�
-- key - pair ��, �� 1��1 ���� ���ð� �ƴ϶� 1��n ������ �Ǽ� �ȵ�???

-- having
-- group by ���� having�� �������� �ʴ´�

select ����, AVG(����) as ���������� from ��ǰ GROUP BY ���� having avg(����) >= 60000
-- return ������ ��� ����, ������ ��� ���� �߿����� 60000 �̻��� �͵鸸 ����




select * from �Ǹ�

-- ���� 1
-- ��¥�� where�� ����.....

select ��ǰ��ȣ, avg(�Ǹż���) as '����Ǹŷ�' from �Ǹ� 
where �Ǹų�¥ between '2015/02/01' and '2015/02/15'
group by ��ǰ��ȣ
-- ��ǰ��ȣ�� group by�� ����ϴ� ������ �־�����

select ��ǰ��ȣ, avg(�Ǹż���) as '����Ǹŷ�' from �Ǹ� 
where �Ǹų�¥ between '2015/02/01' and '2015/02/15'
group by ��ǰ��ȣ having avg(�Ǹż���) >= 15







