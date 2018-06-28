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
    t.team_name,
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
select count(sche_date) from schedule where substr(sche_date,6,1)like'4';
   
select sche_date from schedule order by sche_date;