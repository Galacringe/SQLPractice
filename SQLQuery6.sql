-- group by all

select 종류, AVG(가격) as 평균가격 from 제품 where 가격 >= 50000 group by all 종류

select * from 제품 where 가격 >= 50000

-- group by rollup / group by의 확장기능
-- 다차원 집계? 
-- 실제로 없는 값을 만들어준다?????????

select 반, 성별, AVG(점수) as 평균점수 from 성적 group by 반, 성별 with rollup

--A남86
--A         	여	84
--A         	NULL	85
--B         	남	85
--B         	여	81
--B         	NULL	83
--NULL	NULL	84

-- https://dev-jy.tistory.com/68
-- 대충 그러니까 A/NULL/85가 A 남/여의 평균값을 정리해서 나타내고
-- B/NULL/83도 동일, NULL / NULL /84는 A,B 평균이라는건가??


SELECT 성별, 반, AVG(점수)
AS 평균점수
FROM 성적
GROUP BY 성별, 반
WITH ROLLUP

--남	A         	86
--남	B         	85
--남	NULL	86
--여	A         	84
--여	B         	81
--여	NULL	82
--NULL	NULL	84

-- GROUP BY CUBE

-- 모든 방향으로 집계해준다
-- 아래 코드는 반별 / 성별 집계를 둘 다 해줌

SELECT 반, 성별, AVG(점수) AS 평균점수
FROM 성적
GROUP BY 반, 성별 WITH CUBE




-- rollup은 월별 / 분기별 / 연도별 등의 단계별 요약 보고서
-- cube는 제품별, 지역별. 연도별 다차원 분석