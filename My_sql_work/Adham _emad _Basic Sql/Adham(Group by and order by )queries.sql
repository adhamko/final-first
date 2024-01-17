-- order by ,group by Statments 


--- GROUP BY statment 

select * 
from DEMOGraphics

select GENDER , COUNT(GENDER )
from DEMOGraphics
GROUP BY GENDER

select GENDER ,AGe , COUNT(GENDER ) AS number_of_people
from DEMOGraphics
GROUP BY GENDER ,AGe

-- GROUP BY statment and WHERE STATMENT 
select GENDER , COUNT(GENDER )AS number_of_people
from DEMOGraphics
Where AGe <32
GROUP BY GENDER

--ORDER by statment
select GENDER , COUNT(GENDER )AS number_of_people
from DEMOGraphics
Where AGe <32
GROUP BY GENDER
ORDER by number_of_people DESC

select GENDER , COUNT(GENDER )AS number_of_people
from DEMOGraphics
Where AGe <32
GROUP BY GENDER
ORDER by GENDER


select * 
from DEMOGraphics
order by AGe DESC , GENDER 

select * 
from DEMOGraphics
order by 1 DESC , 4 DESC




