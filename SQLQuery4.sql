-- 다른 DB에서 데이터를 가져오고 싶을 때

select top 5 * from 성적

select top 1 percent * from 성적 

select top 5 percent with ties * from 성적 -- with ties / 중복 포함
-- with ties는 order by 와 함께 와야함. 왜냐? 일단 성적이 동일한 놈을 집어왔으니 그걸 또 정렬해야지

select top 5 percent with ties  * from 성적 order by 점수 -- with ties / 중복 포함

set rowcount 1  -- 다음 결과에서 최대 1줄까지만
select top 5 * from 성적

set rowcount 5
select top 5 * from 성적

--  행 추출

set rowcount 0 -- 초기화

select 이름, 점수
from 성적
where 점수 >= 90

-- https://injun379.tistory.com/113

-- 문자열 비교와 와일드카드

-- like, not like

select 이름, 점수
from 성적
where 이름 like '김%'

/* ‘김’으로 시작하는 글자 검색 (정확한 검색이 아니라
부분매칭하는 것이므로 like 를 사용)*/

-- _ / book_ = book+@(char) / books, booka, booky
-- % / book% = book+@ / book, books, booker, bookanistan
-- % / %book% = includes book / timbooker, timbooksttaks
-- [] / [bo]ing = 시작이 b/o로 시작해서 ing로 끝나는 문자 / boring, booking, bookmaxxing....
-- [] / [b-f]ing = b~f까지의 단일 문자가 front / bing_chilling, ding, eing, fing
-- [^] / M[^c]% = [^]안의 문자 제외 / Mike/Many/Mickey



select * from 성적
where 이름 like '이%[석기]'





-- 예제2
set rowcount 0
select top 3 with ties * from 성적 order by 점수 -- 오름차순이니 가장 낮은게 위로 간다는 사실!!!

select 학번, 이름, 점수 from 학생평가
where 점수 >= 90

select 이름, 조이름 from 학생평가 where 조이름 like'[A-Z]%'

select 학번, 이름 + '(' + 성별 + ')'
 as [이름(성별)]
from 성적

-- 학번 , 이름+성별 데이터를 가져와서 이름(성별)로 표시 이름을 가져온다

-- and, or, not

-- between a and b // a,b 포함 범위 내
-- and 연산자로 변경가능 (그러나 점수 >= A and 점수 <= B 식은 메모리를 2번 먹는다)
-- Not between a and b // a,b포함 범위 외
-- or 연산자로 변경가능

-- between 75 and 85 // 75. 76. 77....
-- Not between 75 and 85, // 1, 2, 3.... 74, 86, 87....

-- in

select * from 성적
 where 이름 in ('이종석', '송중기', '이연희')

select * from 성적
 where 이름 not in ('이종석', '송중기', '이연희')

select * from 성적
where 이름 != '이종석' and 이름 != '송중기' and 이름 != '이연희'


-- 예제3

select * from 학생평가 where 조이름 = '무한도전' and  점수 >= 80

select * from 학생평가 where 점수 between 80 and 90

select * from 학생평가 where 조이름 = 'BIG' or 조이름 = '베스트' --order by 조이름


SELECT 이름, 점수+3 as '3점추가' from 성적 -- 실 데이터는 건드리지 않고 3점 추가 해서 가져오기


-- null
-- SQL에서는 unidentified 정도로 보는듯

select * from 제품 where 가격 is not null



-- 예제 4

-- select 제품번호, 제품명, 가격 from 제품 where 가격 is not null
select 제품번호, 제품명, floor(가격*1.1) as '최종가' from 제품 where 가격 is not null 
order by 최종가 desc


-- etc

not을 사용하여 검색을 자제할 것 (메모리 이슈 1)

like 검색을 자제하고 일치하는 검색을 쓰자 (메모리 이슈 2)

order by 구문을 자제하자 (보통 서버에서 정렬해서 주니까 order by 안써도 될거임)

where절 왼쪽에 계산을 넣지 마라 
ex)
where 점수 - 3 = 100 (X)
where 점수 = 100+3 (O)

select에서 *를 남발해서 자료를 다 긁어오지 마라
