select * from player;

select count(*) "���̺��� ��" from tab;--as����
select team_name AS " ��ü �౸�� ��� " from team order by team_name; 

DESC PLAYER;

select * from stadium;
select * from schedule;
select  NVL2(POSITION,position,'����') "������" from player;

select team_id,team_name AS " �౸�� ���̵� " from team;

select * from team;

select * from player;

select distinct nvl2(position,position,'����') from player;

select player_name "�̸�" from player where team_id='K02' 
and position='GK' ORDER BY player_name;


select position "������" ,player_name "�̸�" from player where team_id='K02'
and height>=170 and substr(player_name,0,1)='��';
select substr(player_name,1,2) �׽�Ʈ�� from player;

select player_name || ' ����' "�̸�" , nvl2(height,height,'0')||' cm'
 "Ű", nvl2(weight,weight,'0') ||' kg' "������" from player where team_id like 'K02' 
order by height desc; 
;
--comcat = || 

select concat(player_name,' ����') "�̸�" , concat(nvl2(height,height,'0'),' cm')
 "Ű", concat(nvl2(weight,weight,'0'),' kg') "������" ,(weight*weight)/height "������" from player where team_id='K02' 
order by height desc; 
;


select position "������" ,player_name "�̸�" from player where team_id='K02'
and height>=170 and player_name like '��%';


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
select t.team_name ���� ,p.player_name �����̸�,p.height ||' cm'Ű 
from player p  join team t on p.team_id like t.team_id 
where t.TEAM_ID IN('K02','K10') and 
p.height between 180 and 183 order by p.height,t.team_name,p.player_name;


--10��
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

--11��
select
    t.team_name ����,
    s.stadium_name ��ŸƼ�� 
from team t inner join stadium s on 
    t.stadium_id like s.stadium_id 
order by 
t.team_name;

--12��
select 
    t.team_name ����,
    s.stadium_name ��Ÿ���,
    sc.AWAYTEAM_ID ��id,
    sc.sche_date �����ٳ�¥
from 
    team t  join stadium s on t.stadium_id like s.stadium_id 
    join schedule sc on t.stadium_id like sc.stadium_id 
where 
    sc.sche_date like'20120317' 
order by t.team_name;


--13��
 select 
    p.player_name ������,
    p.position ������,
    t.region_name||' '|| t.team_name ����,
    s.stadium_name ��ŸƼ���,
    sc.sche_date �����ٳ�¥ 
 from 
    team t join player p on p.team_id like t.TEAM_ID 
    join stadium s on  t.stadium_id like s.stadium_id 
    join schedule sc on t.stadium_id like sc.stadium_id 
 where 
    sc.sche_date like '20120317' and 
    p.position like'GK' and 
    t.team_id like(select team_id from team where team_name='��ƿ����') 
    order by p.player_name;
 
select * from team;

 --14��
 select 
    s.stadium_name ��Ÿ���,
    sc.sche_date ��⳯¥,
    t1.region_name||' '|| t1.TEAM_NAME Ȩ�� ,
    t2.region_name||' '|| t2.team_name ������,
    sc.home_score Ȩ������,
    sc.away_score ����������
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
  
--15��
select 
    s.stadium_name,
    s.stadium_id,
    seat_count,
    s.hometeam_id,
    t.e_team_name
from
    stadium s left join team t on s.stadium_id like t.stadium_id
order by s.hometeam_id;
 
--16��   
SELECT 
    T.TEAM_NAME ����,
    P.PLAYER_NAME ������,
    P.POSITION ������,
    P.BACK_NO ��ѹ�,
    P.HEIGHT Ű
FROM PLAYER P
    JOIN TEAM T
        ON P.TEAM_ID LIKE T.TEAM_ID
WHERE 
    T.TEAM_ID IN ( 
select t.team_id 
from team t 
where t.TEAM_NAME  in ('�Ｚ�������','�巡����'));

--18��
select 
    t.team_name,
    p.position,
    p.back_no 
from 
player p join team t on 
    p.team_id like t.team_id 
where 
    player_name like (select player_name from player where player_name='��ȣ��') ;
    
    --19��
    select 
        round(avg(height),2) ���Ű 
    from player
        where team_id like 'K10' 
        and position like 'MF'; 
    
   --20��
   
select count(sche_date) from schedule where substr(sche_date,6,1)like'3'
union
select count(sche_date) from schedule where substr(sche_date,6,1)like'4';
   
select sche_date from schedule order by sche_date;