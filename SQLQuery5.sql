-- DB: pubs 
select * from sales
select * from titles
select * from stores

-- 예제 1

-- Q1
select top 6 title_id as 책코드, qty as 주문량 from sales order by qty desc

-- Q2

select top 6 with ties title_id as 책코드, qty as 주문량 from sales order by qty desc

-- Q3

select distinct type as 책분야 from titles 

-- Q4

select distinct type as 책분야 from titles where type is not null

-- Q5

select title + ' (' + title_id + ')' as '책이름 (책코드)' , price from titles


-- 다음 장 (다시 SampleDB)


-- 요약정보 만들기
-- ex) 조에서 가장 높은 점수들, 각 조별 인원처럼, 집계함수
-- 집계함수들은 기본적으로 NULL을 알잘딱하게 걸러내준다

-- AVG / COUNT / MAX / MIN / SUM

select sum(가격)/count(가격) from 제품 --72500
select  sum(가격)/count(*) from 제품 -- 60416

-- 위의 두 구문의 결과가 다른 이유는 count(*)는 null도 카운트했기 때문
-- count(가격)은 null을 알아서 걸러서 더 작은 수로 나눴고

-- GROUP BY

select 종류, AVG(가격) as 종류별가격 from 제품 GROUP BY 종류
-- return 바지의 평균 가격, 셔츠의 평균 가격....

select 종류, 제품번호, AVG(가격) as 종류별가격 from 제품 GROUP BY 종류
-- 얘는 안됨. 종류별로 묶어서 제시하라 했는데 제품번호가 각기 다를 테니까
-- key - pair 쌍, 즉 1대1 구조 제시가 아니라 1대n 구조가 되서 안됨???

-- having
-- group by 없는 having은 존재하지 않는다

select 종류, AVG(가격) as 종류별가격 from 제품 GROUP BY 종류 having avg(가격) >= 60000
-- return 바지의 평균 가격, 셔츠의 평균 가격 중에서도 60000 이상인 것들만 리턴




select * from 판매

-- 예제 1
-- 날짜는 where를 쓰자.....

select 제품번호, avg(판매수량) as '평균판매량' from 판매 
where 판매날짜 between '2015/02/01' and '2015/02/15'
group by 제품번호
-- 제품번호는 group by를 사용하니 가급적 넣어주자

select 제품번호, avg(판매수량) as '평균판매량' from 판매 
where 판매날짜 between '2015/02/01' and '2015/02/15'
group by 제품번호 having avg(판매수량) >= 15







