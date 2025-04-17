-- book / orders / Customer
-- sellprice 판매가(orders) / 정가(book)
select * from book

-- 1-1 (distinct) 이거 사용하는 법 자꾸 까먹음

select distinct publisher from book

-- 1-2 (count)

select count(publisher) from book

-- 1-3 (between / and)

select * from book where 10000 <= price and price <= 20000

-- 1-4 (in, ~만 빼고)

select * from book where publisher != '굿스포츠' and publisher != '대한미디어'

-- 1-5 (축구 책 중에서도 2만원 이상, 와일드카드?)
-- 앞자리에 축구가 써있긴 한데 그걸 쓰라는건가

select * from book where bookname like '축구%' and price >= 20000

-- 1-6 (order by + desc? + order by 두번 쓰기)

select * from book order by price desc, publisher

-- join / from절 뒤에 테이블 2개 쓸 수 있게 하는 거

-- 2-1 (sum, avg, min, max)

select sum(saleprice) as 총판매액, avg(saleprice) as 평균가, min(saleprice) as 최저가, max(saleprice) as 최고가 from orders

-- 2-2 (group by)

select custid, count(custid) from orders where saleprice >= 8000 group by custid

-- 2-3 (group by + having)

select custid, count(custid) from orders where saleprice >= 8000  group by custid having count(custid) >= 2