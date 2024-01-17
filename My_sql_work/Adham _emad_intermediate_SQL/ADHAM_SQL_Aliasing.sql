----aliasing 
select First_Namme Fname
from Adham_SQL_Tuotrial.dbo.DEMOGraphics

Select First_Namme +''+Last_name fullname

from Adham_SQL_Tuotrial.dbo.DEMOGraphics\


select Avg(AGe) Average_age
from Adham_SQL_Tuotrial.dbo.DEMOGraphics


select demo.Employee_ID
from Adham_SQL_Tuotrial.dbo.DEMOGraphics as demo
join Adham_SQL_Tuotrial.dbo.EMPLOYEE_SALARY as sal
on demo.Employee_ID = sal.Employee_ID

select demo.Employee_ID ,sal.salary
from Adham_SQL_Tuotrial.dbo.DEMOGraphics demo
join Adham_SQL_Tuotrial.dbo.EMPLOYEE_SALARY  sal

on demo.Employee_ID = sal.Employee_ID

--aliasing example
select a.Employee_ID, a.first_Namme ,b.job_title, c.age

from Adham_SQL_Tuotrial.dbo.DEMOGraphics a
left  join Adham_SQL_Tuotrial.dbo.EMPLOYEE_SALARY b
on a.Employee_ID=b.Employee_ID 
left join Adham_SQL_Tuotrial.dbo.WareHouseEmployeeDemographics c
on b.Employee_ID =c.Employee_ID

--aliasing example 
select demo.Employee_ID,demo.First_Namme,sal.job_title,war.age
from Adham_SQL_Tuotrial.dbo.DEMOGraphics demo
left join Adham_SQL_Tuotrial.dbo.EMPLOYEE_SALARY sal
on demo.Employee_ID=sal.Employee_ID
left join Adham_SQL_Tuotrial.dbo.WareHouseEmployeeDemographics  war
on sal.Employee_ID = war.Employee_ID