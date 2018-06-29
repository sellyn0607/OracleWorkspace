select * from player;

select count(*) "테이블의 수" from tab;--as생략
select team_name AS " 전체 축구팀 목록 " from team order by team_name; 

DESC PLAYER;

select * from stadium;
select * from schedule;
select  NVL2(POSITION,position,'신입') "포지션" from player;

select team_id,team_name AS " 축구팀 아이디 " from team;

select * from team;

select * from player;

select distinct nvl2(position,position,'신입') from player;

select player_name "이름" from player where team_id='K02' 
and position='GK' ORDER BY player_name;


select position "포지션" ,player_name "이름" from player where team_id='K02'
and height>=170 and substr(player_name,0,1)='고';
select substr(player_name,1,2) 테스트값 from player;

select player_name || ' 선수' "이름" , nvl2(height,height,'0')||' cm'
 "키", nvl2(weight,weight,'0') ||' kg' "몸무게" from player where team_id like 'K02' 
order by height desc; 
;
--comcat = || 

select concat(player_name,' 선수') "이름" , concat(nvl2(height,height,'0'),' cm')
 "키", concat(nvl2(weight,weight,'0'),' kg') "몸무게" ,(weight*weight)/height "비만지수" from player where team_id='K02' 
order by height desc; 
;


select position "포지션" ,player_name "이름" from player where team_id='K02'
and height>=170 and player_name like '고%';


select team_name,player_name,position from player p ,team  t where t.TEAM_ID
IN('K02','K10') and POSITION like'MF' order by team_name,player_name;


select t.team_name,p.player_name,p.position from player,team where player.TEAM_ID = 
team.TEAM_ID AND player.TEAM_ID
IN('K02','K10') and POSITION like'GK' order by team_name,player_name;

--ansi
select t.team_name,p.player_name,p.position from 
player p inner join team t on  p.TEAM_ID like t.TEAM_ID 
where player.TEAM_ID
IN('K02','K10') and POSITION like'GK' order by team_name,player_name;


SELECT Orders.OrderID, Customers.CustomerName, Orders.OrderDate
FROM Orders
INNER JOIN Customers ON Orders.CustomerID=Customers.CustomerID;




select team_name,player_name,height from player p ,team  t where t.TEAM_ID
IN('K02','K10') and height between 185 and 190 order by team_name,player_name;
 
--
select t.team_name 팀명 ,p.player_name 선수이름,p.height ||' cm'키 
from player p  join team t on p.team_id like t.team_id 
where t.TEAM_ID IN('K02','K10') and 
p.height between 180 and 183 order by p.height,t.team_name,p.player_name;


--10번
select 
    t.team_name,p.player_name 
from 
    player p inner join team t on 
    p.team_id like t.team_id 
where 
    p.position is null 
order by 
    t.team_name,p.player_name
;

--11번
select
    t.team_name 팀명,
    s.stadium_name 스타티움 
from team t inner join stadium s on 
    t.stadium_id like s.stadium_id 
order by 
t.team_name;

--12번
select 
    t.team_name 팀명,
    s.stadium_name 스타디움,
    sc.AWAYTEAM_ID 팀id,
    sc.sche_date 스케줄날짜
from 
    team t  join stadium s on t.stadium_id like s.stadium_id 
    join schedule sc on t.stadium_id like sc.stadium_id 
where 
    sc.sche_date like'20120317' 
order by t.team_name;


--13번
 select 
    p.player_name 선수명,
    p.position 포지션,
    t.region_name||' '|| t.team_name 팀명,
    s.stadium_name 스타티움명,
    sc.sche_date 스케줄날짜 
 from 
    team t join player p on p.team_id like t.TEAM_ID 
    join stadium s on  t.stadium_id like s.stadium_id 
    join schedule sc on t.stadium_id like sc.stadium_id 
 where 
    sc.sche_date like '20120317' and 
    p.position like'GK' and 
    t.team_id like(select team_id from team where team_name='스틸러스') 
    order by p.player_name;
 
select * from team;

 --14번
 select 
    s.stadium_name 스타디움,
    sc.sche_date 경기날짜,
    t1.region_name||' '|| t1.TEAM_NAME 홈팀 ,
    t2.region_name||' '|| t2.team_name 원정팀,
    sc.home_score 홈팀점수,
    sc.away_score 원정된점수
 from 
    
    schedule sc join stadium s
        on sc.stadium_id like s.stadium_id
    join team t1 
        on t1.team_id like sc.hometeam_id
    join team t2 
        on t2.team_id like sc.awayteam_id
 where 
    home_score-away_score>=3 

 order by sc.SCHE_DATE;
  
--15번
select 
    s.stadium_name,
    s.stadium_id,
    seat_count,
    s.hometeam_id,
    t.e_team_name
from
    stadium s left join team t on s.stadium_id like t.stadium_id
order by s.hometeam_id;
 
--16번   
SELECT 
    T.TEAM_NAME 팀명,
    P.PLAYER_NAME 선수명,
    P.POSITION 포지션,
    P.BACK_NO 백넘버,
    P.HEIGHT 키
FROM PLAYER P
    JOIN TEAM T
        ON P.TEAM_ID LIKE T.TEAM_ID
WHERE 
    T.TEAM_ID IN ( 
select t.team_id 
from team t 
where t.TEAM_NAME  in ('삼성블루윙즈','드래곤즈'));

--18번
select 
    t.team_name ,
    p.position,
    p.back_no 
from 
player p join team t on 
    p.team_id like t.team_id 
where 
    player_name like (select player_name from player where player_name='최호진') ;
    
    --19번
    select 
        round(avg(height),2) 평균키 
    from player
        where team_id like 'K10' 
        and position like 'MF'; 
    
   --20번
   
select count(sche_date) from schedule where substr(sche_date,6,1)like'3'
union
select count(sche_date) from schedule where substr(sche_date,6,1)like'5'
union
select count(sche_date) from schedule where substr(sche_date,6,1)like'6'
union
select count(sche_date) from schedule where substr(sche_date,6,1)like'7'
union
select count(sche_date) from schedule where substr(sche_date,6,1)like'4';
   
select sche_date from schedule order by sche_date;

--20번 답
select
(select count(*) from schedule where sche_date like '201201%')"1월",
(select count(*) from schedule where sche_date like '201202%')"2월", 
(select count(*) from schedule where sche_date like '201203%')"3월",
(select count(*) from schedule where sche_date like '201204%')"4월",
(select count(*) from schedule where sche_date like '201205%')"5월",
(select count(*) from schedule where sche_date like '201206%')"6월",
(select count(*) from schedule where sche_date like '201207%')"7월",
(select count(*) from schedule where sche_date like '201208%')"8월",
(select count(*) from schedule where sche_date like '201209%')"9월",
(select count(*) from schedule where sche_date like '201210%')"10월",
(select count(*) from schedule where sche_date like '201211%')"11월",
(select count(*) from schedule where sche_date like '201212%')"12월"
from dual;

select
    count(s3.sche_date) "3월" ,
    count(s4.sche_date) "4월"  ,
    count(s5.sche_date) "5월" 
from 
 
    schedule s3,
    schedule s4,
    schedule s5 
where


    substr(s3.sche_date,6,1)like'3' and
    substr(s4.sche_date,6,1)like'4' and
    substr(s5.sche_date,6,1)like'5';


select
    count(s1.sche_date) "1월"
    
  
from 
    schedule s1
    
   
where
    substr(s1.sche_date,6,0)like'1';
    
    
    select count(sche_date) from schedule where substr(sche_date,6,1)like'3';
    

--22번

select 
    t1.team_name 홈팀 ,
    t2.team_name 원정팀 
from 
    schedule sc join team t1 on sc.hometeam_id like t1.team_id
    join team t2 on sc.awayteam_id like t2.team_id
where 
    sc.sche_date like '20120914';
    
    
    --21번 
select
(select count(*) from schedule where sche_date like '201201%' and gubun='Y')"1월",
(select count(*) from schedule where sche_date like '201202%' and gubun='Y')"2월", 
(select count(*) from schedule where sche_date like '201203%' and gubun='Y')"3월",
(select count(*) from schedule where sche_date like '201204%'and gubun='Y')"4월",
(select count(*) from schedule where sche_date like '201205%'and gubun='Y')"5월",
(select count(*) from schedule where sche_date like '201206%'and gubun='Y')"6월",
(select count(*) from schedule where sche_date like '201207%'and gubun='Y')"7월",
(select count(*) from schedule where sche_date like '201208%'and gubun='Y')"8월",
(select count(*) from schedule where sche_date like '201209%'and gubun='Y')"9월",
(select count(*) from schedule where sche_date like '201210%'and gubun='Y')"10월",
(select count(*) from schedule where sche_date like '201211%'and gubun='Y')"11월",
(select count(*) from schedule where sche_date like '201212%'and gubun='Y')"12월"
from dual;


SELECT * FROM SCHEDULE WHERE SCHE_DATE ='20120914' ORDER BY SCHE_DATE;

--23번
--팀별 선수의 수 ( GROUP BY )
 
select 
    (select team_name from team where team_id like t.team_id) 팀명,
    --t.team_id 팀아이디,
    count(p.player_id) ||' 명'선수인원 

from 
    player p join team t on t.team_id like p.team_id
group by
   t.team_id
order by 
    t.team_id;
    
    
 --24번
 
select 
    (select team_name from team where team_id like t.team_id) 팀명,
    round(avg(p.height),1) ||' cm' 평균키
from 
    player p join team t on p.team_id like t.team_id
group by
    t.team_id
order by 
    t.team_id
    ;

SELECT * FROM TEAMZ;
CREATE TABLE TEAMZ(TEMA_ID VARCHAR2(20) primary key,team_name varchar2(20));
INSERT INTO TEAMZ values('HTEAM','엘카로');
INSERT INTO TEAMZ values('CTEAM','가오갤');
INSERT INTO TEAMZ values('ATEAM','저스티스');
INSERT INTO TEAMZ values('STEAM','어벤저스');

--형준34,세인35,희태21,상훈29,태형25
--혜리26,지은26,준27,재경30,단아26
--최정훈32,윤호31,가은29,정훈23,승태30
--승호27,소진26,이슬29,진태26,누리30
SELECT * FROM TEAMW;
drop table teamz;
create table teamw(mem_id varchar2(20) primary key,
team_id varchar2(20),mem_name varchar2(20),mem_age decimal);
DESC TEAMW;
DROP TABLE TEAMW;
--ATEAM  저스티스
INSERT INTO TEAMW VALUES('A1','ATEAM','형준',34);
INSERT INTO TEAMW VALUES('A2','ATEAM','세인',35);
INSERT INTO TEAMW VALUES('A3','ATEAM','희태',21);
INSERT INTO TEAMW VALUES('A4','ATEAM','상훈',29);
INSERT INTO TEAMW VALUES('A5','ATEAM','태형',25);
--CTEAM 가오갤
INSERT INTO TEAMW VALUES('C1','CTEAM','최정훈',32);
INSERT INTO TEAMW VALUES('C2','CTEAM','윤호',31);
INSERT INTO TEAMW VALUES('C3','CTEAM','가은',29);
INSERT INTO TEAMW VALUES('C4','CTEAM','정훈',23);
INSERT INTO TEAMW VALUES('C5','CTEAM','승태',30);
--HTEAM 엘카로
INSERT INTO TEAMW VALUES('H1','HTEAM','혜리',26);
INSERT INTO TEAMW VALUES('H2','HTEAM','지은',26);
INSERT INTO TEAMW VALUES('H3','HTEAM','단아',26);
INSERT INTO TEAMW VALUES('H4','HTEAM','재경',30);
INSERT INTO TEAMW VALUES('H5','HTEAM','준',27);
--STEAM 어벤져스
INSERT INTO TEAMW VALUES('S1','STEAM','승호',27);
INSERT INTO TEAMW VALUES('S2','STEAM','소진',26);
INSERT INTO TEAMW VALUES('S3','STEAM','이슬',29);
INSERT INTO TEAMW VALUES('S4','STEAM','진태',26);
INSERT INTO TEAMW VALUES('S5','STEAM','누리',30);

ALTER TABLE TEAMW
ADD CONSTRAINT TEAMZ FOREIGN KEY (TEAM_ID) REFERENCES TEAMw(TEAM_ID);
update teamw SET mem_age=25 where mem_id='A5';

--팀원 나이합
SELECT 
    (select team_name from teamz where tema_id like tw.team_id) 팀명,
    tw.SUM(MEM_AGE) 나이합 
FROM 
    TEAMW tw
group by 
    tw.team_id;
    
--평균
SELECT 
    (select team_name from teamz where tema_id like tw.team_id) 팀명,
    avg(tw.MEM_AGE) 평균나이 
FROM 
    TEAMW tw
group by 
    tw.team_id;
    
--최대
SELECT 
    (select team_name from teamz where tema_id like tw.team_id) 팀명,
    max(tw.MEM_AGE) 최대나이 
FROM 
    TEAMW tw
group by 
       tw.team_id;
       
--최소
SELECT 
    (select team_name from teamz where tema_id like tw.team_id) 팀명,
    min(TW.MEM_AGE) 최소나이 
FROM 
    TEAMW tw
group by 
    tw.team_id;
    
--카운트
SELECT 
    (select team_name from teamz where tema_id like tw.team_id) 팀명,
    count(*) 카운트 
FROM 
    TEAMW tw
group by 
    team_id;
    
--최종
    SELECT 
    (select T1.team_name from teamz T1 where T1.team_id like tw.team_id) 팀명,
    count(*) 카운트 ,
    MIN(TW.MEM_AGE) 최소나이,
    MAX(TW.MEM_AGE) 최대나이,
    SUM(TW.MEM_AGE) 나이합,
    AVG(TW.MEM_AGE) 나이평균
FROM 
    TEAMW tw
group by 
    TW.team_id
--HAVING
  --  AVG(TW.MEM_AGE) >=28
ORDER BY
    TW.TEAM_ID;
 


alter table teamw add roll varchar2(20);
alter table teamw drop COLUMN ROLL;
alter table teamz rename column tema_id to team_id;
select * from teamw;
select * from teamz;

UPDATE TEAMW SET ROLL='팀장' WHERE MEM_ID='H1';
UPDATE TEAMW SET ROLL='팀장' WHERE MEM_ID='A1';
--UPDATE TEAMW SET ROLL WHERE MEM_ID='C1';
UPDATE TEAMW SET ROLL='' WHERE MEM_ID='H1'
;
--WHERE MEM_ID='S1';
alter table teamw add constraint teamz_fk_team_id
foreign key (team_id) references teamz(team_id);

ALTER TABLE teamw     
ADD CONSTRAINT teamz_fk_team_id FOREIGN KEY (team_id)     
    REFERENCES teamz (team_id) ;

UPDATE 
    TEAMW
    SET ROLL = 
CASE  
    WHEN MEM_NAME LIKE '혜리' THEN '팀장'
    WHEN MEM_NAME LIKE '형준' THEN '팀장'
    WHEN MEM_NAME LIKE '최정훈' THEN '팀장'
    WHEN MEM_NAME LIKE '승호' THEN '팀장'
    ELSE '팀원'
    END ;

 
--?
DESC TEAMW;
DESC TEAMZ;

select 
    player_name,
    position,
    case
        when position is null then '없음'
        when position like 'GK' then '골키퍼'
        when position like 'DF' then '수비수'
        when position like 'FW' then '공격수'
        when position like 'MF' then '미드필더'
        else position
    end 포지션
from
    player
where 
    team_id='K08'
 ;
--25번
SELECT 
    rownum "No.",
    A.*
 FROM
(SELECT 
    T.TEAM_NAME 팀명,
    P.PLAYER_NAME 선수명,
    P.POSITION 포지션,
    P.BACK_NO 백넘버,
    P.HEIGHT 키
FROM PLAYER P
    JOIN TEAM T
        ON P.TEAM_ID LIKE T.TEAM_ID
WHERE 
   t.team_id like (select team_id from team where team_name='삼성블루윙즈')
   and p.height is not null
order by 
    p.height desc) A; 

   
    
    
    --25번 확장
SELECT 
B.*
FROM
(SELECT 
    rownum "No.",
    A.*
 FROM
(SELECT 
    T.TEAM_NAME 팀명,
    P.PLAYER_NAME 선수명,
    P.POSITION 포지션,
    P.BACK_NO 백넘버,
    P.HEIGHT 키
FROM PLAYER P
    JOIN TEAM T
        ON P.TEAM_ID LIKE T.TEAM_ID
WHERE 
   t.team_id like (select team_id from team where team_name='삼성블루윙즈')
   and p.height is not null
order by 
    p.height desc) A)B
where 
   B."No." BETWEEN 10 AND 20;
   
   
   -- 026
-- 팀별 골키퍼의 평균 키에서
-- 가장 평균키가 큰 팀명은

SELECT 

A."팀이름",
A."평균키"
FROM
(select
    (SELECT TEAM_NAME FROM TEAM WHERE TEAM_ID LIKE T.TEAM_ID) 팀이름,
    AVG(P.HEIGHT) 평균키
from
team t join player p on t.team_id like p.team_id
where
    position='GK'
group by
t.team_id) A
ORDER BY 
A."평균키" DESC;


-- 027
-- 각 구단별 선수들 평균키가 삼성 블루윙즈팀의
-- 평균키보다 작은 팀의 이름과 해당 팀의 평균키를 
-- 구하시오

SELECT
A.*
FROM
(select
    (SELECT TEAM_NAME FROM TEAM WHERE TEAM_ID LIKE T.TEAM_ID) 팀이름,
    ROUND(AVG(P.HEIGHT),1) 평균키
from
team t join player p on t.team_id like p.team_id    
group by
t.team_iD)A
WHERE 
(SELECT AVG(HEIGHT) FROM PLAYER WHERE TEAM_ID='K02')>A."평균키"
ORDER BY 
A."평균키" DESC;

-- 028
-- 2012년 경기 중에서 점수차가 가장 큰 경기 전부

SELECT B.SCHE_DATE                    경기일,
      B.WTEAM || 'VS' || B.LTEAM     홈팀VS원정팀,
      B.DSCORE || '점차경기'     점수차
 FROM (SELECT ROWNUM RNUM, A.*
         FROM (  SELECT SC.SCHE_DATE,
                        ABS (SC.HOME_SCORE - SC.AWAY_SCORE)     DSCORE,
                        HT.TEAM_NAME                            WTEAM,
                        AT.TEAM_NAME                            LTEAM
                   FROM SCHEDULE SC
                        JOIN TEAM HT ON HT.TEAM_ID LIKE SC.HOMETEAM_ID
                        JOIN TEAM AT ON AT.TEAM_ID LIKE SC.AWAYTEAM_ID
                  WHERE     SC.SCHE_DATE LIKE '2012%'
                        AND SC.HOME_SCORE IS NOT NULL
               ORDER BY DSCORE DESC) A) B
WHERE B.RNUM = 1;

-- 029
-- 좌석수대로 스타디움 순서 매기기
SELECT
ROWNUM "No.",
A.STADIUM_NAME 스타디움,
A.seat_count 좌석수
FROM
(select
    stadium_name,
    seat_count 
from 
    stadium 
order by 
    seat_count DESC)A;
    

-- 030
-- 2012년 구단 승리 순으로 순위매기기
 SELECT    
   A.TEAM_NAME 팀명,    
   COUNT(A.SCORE)+COUNT(B.SCORE) 승수
FROM    (SELECT    
           SC.HOME_SCORE - SC.AWAY_SCORE SCORE,
           HT.TEAM_ID TEAM_ID,
           HT.TEAM_NAME TEAM_NAME
       FROM SCHEDULE SC
           JOIN TEAM HT ON HT.TEAM_ID LIKE SC.HOMETEAM_ID
           JOIN TEAM AT ON AT.TEAM_ID LIKE SC.AWAYTEAM_ID
       WHERE
           SC.HOME_SCORE - SC.AWAY_SCORE >0
           AND SC.SCHE_DATE LIKE '2012%') A JOIN
       (SELECT    
           SC1.AWAY_SCORE - SC1.HOME_SCORE SCORE,
           AT1.TEAM_ID TEAM_ID,
           AT1.TEAM_NAME TEAM_NAME
       FROM SCHEDULE SC1
           JOIN TEAM HT1 ON HT1.TEAM_ID LIKE SC1.HOMETEAM_ID
           JOIN TEAM AT1 ON AT1.TEAM_ID LIKE SC1.AWAYTEAM_ID
       WHERE
           SC1.AWAY_SCORE - SC1.HOME_SCORE >0
           AND SC1.SCHE_DATE LIKE '2012%') B ON A.TEAM_ID LIKE B.TEAM_ID
GROUP BY
       A.TEAM_ID,A.TEAM_NAME
ORDER BY    
       COUNT(A.SCORE) DESC
;
