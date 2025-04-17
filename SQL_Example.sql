-- book / orders / Customer
-- sellprice �ǸŰ�(orders) / ����(book)
select * from book

-- 1-1 (distinct) �̰� ����ϴ� �� �ڲ� �����

select distinct publisher from book

-- 1-2 (count)

select count(publisher) from book

-- 1-3 (between / and)

select * from book where 10000 <= price and price <= 20000

-- 1-4 (in, ~�� ����)

select * from book where publisher != '�½�����' and publisher != '���ѹ̵��'

-- 1-5 (�౸ å �߿����� 2���� �̻�, ���ϵ�ī��?)
-- ���ڸ��� �౸�� ���ֱ� �ѵ� �װ� ����°ǰ�

select * from book where bookname like '�౸%' and price >= 20000

-- 1-6 (order by + desc? + order by �ι� ����)

select * from book order by price desc, publisher

-- join / from�� �ڿ� ���̺� 2�� �� �� �ְ� �ϴ� ��

-- 2-1 (sum, avg, min, max)

select sum(saleprice) as ���Ǹž�, avg(saleprice) as ��հ�, min(saleprice) as ������, max(saleprice) as �ְ� from orders

-- 2-2 (group by)

select custid, count(custid) from orders where saleprice >= 8000 group by custid

-- 2-3 (group by + having)

select custid, count(custid) from orders where saleprice >= 8000  group by custid having count(custid) >= 2