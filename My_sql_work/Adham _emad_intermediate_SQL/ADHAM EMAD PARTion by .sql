--partioning  by

select * 
from Adham_SQL_Tuotrial.dbo.DEMOGraphics

select *
from Adham_SQL_Tuotrial.dbo.EMPLOYEE_SALARY

select *

from Adham_SQL_Tuotrial.dbo.DEMOGraphics demo
join Adham_SQL_Tuotrial.dbo.EMPLOYEE_SALARY sal
on demo.Employee_ID=sal.Employee_ID


select demo.First_Namme,demo.Last_Name, demo.GENDER ,sal.Salary
,count (GENDER) OVER (PARTITION BY GENDER) as totalgender
from Adham_SQL_Tuotrial.dbo.DEMOGraphics demo
join Adham_SQL_Tuotrial.dbo.EMPLOYEE_SALARY sal
on demo.Employee_ID=sal.Employee_ID
