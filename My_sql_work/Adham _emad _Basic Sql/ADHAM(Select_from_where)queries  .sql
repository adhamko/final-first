--WHERE statment(<>,<,>,= ,null ,notnull ,and ,or,in)

--Equal statment
SELECT * 
FROM Adham_SQL_Tuotrial.dbo.DEMOGraphics
where First_Namme= 'Adham' 

--not equal statment 
SELECT * 
FROM Adham_SQL_Tuotrial.dbo.DEMOGraphics

where First_Namme<>'Adham' 

--greater than and smaller than 

Select * 
from Adham_SQL_Tuotrial.dbo.DEMOGraphics
Where AGe > 31

Select * 
from DEMOGraphics
Where AGe >= 31

Select * 
from DEMOGraphics
Where AGe < 31

--AND statment 

Select * 
from DEMOGraphics
Where AGe <= 32 AND GENDER='Male'

-- OR statment 

Select * 
from Adham_SQL_Tuotrial.dbo.DEMOGraphics
Where AGe <= 32 OR GENDER='female'

--like statment where start letter equal to s 
Select * 
from DEMOGraphics
where Last_Name LIKE 'S%' 

-- like statment where s between letters 
Select * 
from DEMOGraphics
where Last_Name LIKE '%S%' 

-- like statment 

Select * 
from DEMOGraphics
where Last_Name LIKE 'S%o%' 

-- NUll and NOT NULL 

Select * 
from Adham_SQL_Tuotrial.dbo.DEMOGraphics
where Last_Name is NOT NULL 

-- IN statment 

Select * 
from Adham_SQL_Tuotrial.dbo.DEMOGraphics
where Last_Name IN ('emad' ,'sakr')







