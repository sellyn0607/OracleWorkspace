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
    t.team_name ,
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
select count(sche_date) from schedule where substr(sche_date,6,1)like'5'
union
select count(sche_date) from schedule where substr(sche_date,6,1)like'6'
union
select count(sche_date) from schedule where substr(sche_date,6,1)like'7'
union
select count(sche_date) from schedule where substr(sche_date,6,1)like'4';
   
select sche_date from schedule order by sche_date;

--20�� ��
select
(select count(*) from schedule where sche_date like '201201%')"1��",
(select count(*) from schedule where sche_date like '201202%')"2��", 
(select count(*) from schedule where sche_date like '201203%')"3��",
(select count(*) from schedule where sche_date like '201204%')"4��",
(select count(*) from schedule where sche_date like '201205%')"5��",
(select count(*) from schedule where sche_date like '201206%')"6��",
(select count(*) from schedule where sche_date like '201207%')"7��",
(select count(*) from schedule where sche_date like '201208%')"8��",
(select count(*) from schedule where sche_date like '201209%')"9��",
(select count(*) from schedule where sche_date like '201210%')"10��",
(select count(*) from schedule where sche_date like '201211%')"11��",
(select count(*) from schedule where sche_date like '201212%')"12��"
from dual;

select
    count(s3.sche_date) "3��" ,
    count(s4.sche_date) "4��"  ,
    count(s5.sche_date) "5��" 
from 
 
    schedule s3,
    schedule s4,
    schedule s5 
where


    substr(s3.sche_date,6,1)like'3' and
    substr(s4.sche_date,6,1)like'4' and
    substr(s5.sche_date,6,1)like'5';


select
    count(s1.sche_date) "1��"
    
  
from 
    schedule s1
    
   
where
    substr(s1.sche_date,6,0)like'1';
    
    
    select count(sche_date) from schedule where substr(sche_date,6,1)like'3';
    

--22��

select 
    t1.team_name Ȩ�� ,
    t2.team_name ������ 
from 
    schedule sc join team t1 on sc.hometeam_id like t1.team_id
    join team t2 on sc.awayteam_id like t2.team_id
where 
    sc.sche_date like '20120914';
    
    
    --21�� 
select
(select count(*) from schedule where sche_date like '201201%' and gubun='Y')"1��",
(select count(*) from schedule where sche_date like '201202%' and gubun='Y')"2��", 
(select count(*) from schedule where sche_date like '201203%' and gubun='Y')"3��",
(select count(*) from schedule where sche_date like '201204%'and gubun='Y')"4��",
(select count(*) from schedule where sche_date like '201205%'and gubun='Y')"5��",
(select count(*) from schedule where sche_date like '201206%'and gubun='Y')"6��",
(select count(*) from schedule where sche_date like '201207%'and gubun='Y')"7��",
(select count(*) from schedule where sche_date like '201208%'and gubun='Y')"8��",
(select count(*) from schedule where sche_date like '201209%'and gubun='Y')"9��",
(select count(*) from schedule where sche_date like '201210%'and gubun='Y')"10��",
(select count(*) from schedule where sche_date like '201211%'and gubun='Y')"11��",
(select count(*) from schedule where sche_date like '201212%'and gubun='Y')"12��"
from dual;


SELECT * FROM SCHEDULE WHERE SCHE_DATE ='20120914' ORDER BY SCHE_DATE;

--23��
--���� ������ �� ( GROUP BY )
 
select 
    (select team_name from team where team_id like t.team_id) ����,
    --t.team_id �����̵�,
    count(p.player_id) ||' ��'�����ο� 

from 
    player p join team t on t.team_id like p.team_id
group by
   t.team_id
order by 
    t.team_id;
    
    
 --24��
 
select 
    (select team_name from team where team_id like t.team_id) ����,
    round(avg(p.height),1) ||' cm' ���Ű
from 
    player p join team t on p.team_id like t.team_id
group by
    t.team_id
order by 
    t.team_id
    ;

SELECT * FROM TEAMZ;
CREATE TABLE TEAMZ(TEMA_ID VARCHAR2(20) primary key,team_name varchar2(20));
INSERT INTO TEAMZ values('HTEAM','��ī��');
INSERT INTO TEAMZ values('CTEAM','������');
INSERT INTO TEAMZ values('ATEAM','����Ƽ��');
INSERT INTO TEAMZ values('STEAM','�����');

--����34,����35,����21,����29,����25
--����26,����26,��27,���30,�ܾ�26
--������32,��ȣ31,����29,����23,����30
--��ȣ27,����26,�̽�29,����26,����30
SELECT * FROM TEAMW;
drop table teamz;
create table teamw(mem_id varchar2(20) primary key,
team_id varchar2(20),mem_name varchar2(20),mem_age decimal);
DESC TEAMW;
DROP TABLE TEAMW;
--ATEAM  ����Ƽ��
INSERT INTO TEAMW VALUES('A1','ATEAM','����',34);
INSERT INTO TEAMW VALUES('A2','ATEAM','����',35);
INSERT INTO TEAMW VALUES('A3','ATEAM','����',21);
INSERT INTO TEAMW VALUES('A4','ATEAM','����',29);
INSERT INTO TEAMW VALUES('A5','ATEAM','����',25);
--CTEAM ������
INSERT INTO TEAMW VALUES('C1','CTEAM','������',32);
INSERT INTO TEAMW VALUES('C2','CTEAM','��ȣ',31);
INSERT INTO TEAMW VALUES('C3','CTEAM','����',29);
INSERT INTO TEAMW VALUES('C4','CTEAM','����',23);
INSERT INTO TEAMW VALUES('C5','CTEAM','����',30);
--HTEAM ��ī��
INSERT INTO TEAMW VALUES('H1','HTEAM','����',26);
INSERT INTO TEAMW VALUES('H2','HTEAM','����',26);
INSERT INTO TEAMW VALUES('H3','HTEAM','�ܾ�',26);
INSERT INTO TEAMW VALUES('H4','HTEAM','���',30);
INSERT INTO TEAMW VALUES('H5','HTEAM','��',27);
--STEAM �����
INSERT INTO TEAMW VALUES('S1','STEAM','��ȣ',27);
INSERT INTO TEAMW VALUES('S2','STEAM','����',26);
INSERT INTO TEAMW VALUES('S3','STEAM','�̽�',29);
INSERT INTO TEAMW VALUES('S4','STEAM','����',26);
INSERT INTO TEAMW VALUES('S5','STEAM','����',30);

ALTER TABLE TEAMW
ADD CONSTRAINT TEAMZ FOREIGN KEY (TEAM_ID) REFERENCES TEAMw(TEAM_ID);
update teamw SET mem_age=25 where mem_id='A5';

--���� ������
SELECT 
    (select team_name from teamz where tema_id like tw.team_id) ����,
    tw.SUM(MEM_AGE) ������ 
FROM 
    TEAMW tw
group by 
    tw.team_id;
    
--���
SELECT 
    (select team_name from teamz where tema_id like tw.team_id) ����,
    avg(tw.MEM_AGE) ��ճ��� 
FROM 
    TEAMW tw
group by 
    tw.team_id;
    
--�ִ�
SELECT 
    (select team_name from teamz where tema_id like tw.team_id) ����,
    max(tw.MEM_AGE) �ִ볪�� 
FROM 
    TEAMW tw
group by 
       tw.team_id;
       
--�ּ�
SELECT 
    (select team_name from teamz where tema_id like tw.team_id) ����,
    min(TW.MEM_AGE) �ּҳ��� 
FROM 
    TEAMW tw
group by 
    tw.team_id;
    
--ī��Ʈ
SELECT 
    (select team_name from teamz where tema_id like tw.team_id) ����,
    count(*) ī��Ʈ 
FROM 
    TEAMW tw
group by 
    team_id;
    
--����
    SELECT 
    (select T1.team_name from teamz T1 where T1.team_id like tw.team_id) ����,
    count(*) ī��Ʈ ,
    MIN(TW.MEM_AGE) �ּҳ���,
    MAX(TW.MEM_AGE) �ִ볪��,
    SUM(TW.MEM_AGE) ������,
    AVG(TW.MEM_AGE) �������
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

UPDATE TEAMW SET ROLL='����' WHERE MEM_ID='H1';
UPDATE TEAMW SET ROLL='����' WHERE MEM_ID='A1';
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
    WHEN MEM_NAME LIKE '����' THEN '����'
    WHEN MEM_NAME LIKE '����' THEN '����'
    WHEN MEM_NAME LIKE '������' THEN '����'
    WHEN MEM_NAME LIKE '��ȣ' THEN '����'
    ELSE '����'
    END ;

 
--?
DESC TEAMW;
DESC TEAMZ;

select 
    player_name,
    position,
    case
        when position is null then '����'
        when position like 'GK' then '��Ű��'
        when position like 'DF' then '�����'
        when position like 'FW' then '���ݼ�'
        when position like 'MF' then '�̵��ʴ�'
        else position
    end ������
from
    player
where 
    team_id='K08'
 ;
--25��
SELECT 
    rownum "No.",
    A.*
 FROM
(SELECT 
    T.TEAM_NAME ����,
    P.PLAYER_NAME ������,
    P.POSITION ������,
    P.BACK_NO ��ѹ�,
    P.HEIGHT Ű
FROM PLAYER P
    JOIN TEAM T
        ON P.TEAM_ID LIKE T.TEAM_ID
WHERE 
   t.team_id like (select team_id from team where team_name='�Ｚ�������')
   and p.height is not null
order by 
    p.height desc) A; 

   
    
    
    --25�� Ȯ��
SELECT 
B.*
FROM
(SELECT 
    rownum "No.",
    A.*
 FROM
(SELECT 
    T.TEAM_NAME ����,
    P.PLAYER_NAME ������,
    P.POSITION ������,
    P.BACK_NO ��ѹ�,
    P.HEIGHT Ű
FROM PLAYER P
    JOIN TEAM T
        ON P.TEAM_ID LIKE T.TEAM_ID
WHERE 
   t.team_id like (select team_id from team where team_name='�Ｚ�������')
   and p.height is not null
order by 
    p.height desc) A)B
where 
   B."No." BETWEEN 10 AND 20;
   
   
   -- 026
-- ���� ��Ű���� ��� Ű����
-- ���� ���Ű�� ū ������

SELECT 

A."���̸�",
A."���Ű"
FROM
(select
    (SELECT TEAM_NAME FROM TEAM WHERE TEAM_ID LIKE T.TEAM_ID) ���̸�,
    AVG(P.HEIGHT) ���Ű
from
team t join player p on t.team_id like p.team_id
where
    position='GK'
group by
t.team_id) A
ORDER BY 
A."���Ű" DESC;


-- 027
-- �� ���ܺ� ������ ���Ű�� �Ｚ �����������
-- ���Ű���� ���� ���� �̸��� �ش� ���� ���Ű�� 
-- ���Ͻÿ�

SELECT
A.*
FROM
(select
    (SELECT TEAM_NAME FROM TEAM WHERE TEAM_ID LIKE T.TEAM_ID) ���̸�,
    ROUND(AVG(P.HEIGHT),1) ���Ű
from
team t join player p on t.team_id like p.team_id    
group by
t.team_iD)A
WHERE 
(SELECT AVG(HEIGHT) FROM PLAYER WHERE TEAM_ID='K02')>A."���Ű"
ORDER BY 
A."���Ű" DESC;

-- 028
-- 2012�� ��� �߿��� �������� ���� ū ��� ����

SELECT B.SCHE_DATE                    �����,
      B.WTEAM || 'VS' || B.LTEAM     Ȩ��VS������,
      B.DSCORE || '�������'     ������
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
-- �¼������ ��Ÿ��� ���� �ű��
SELECT
ROWNUM "No.",
A.STADIUM_NAME ��Ÿ���,
A.seat_count �¼���
FROM
(select
    stadium_name,
    seat_count 
from 
    stadium 
order by 
    seat_count DESC)A;
    

-- 030
-- 2012�� ���� �¸� ������ �����ű��
 SELECT    
   A.TEAM_NAME ����,    
   COUNT(A.SCORE)+COUNT(B.SCORE) �¼�
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
