---comoomn table expression (CTE)

with CTE_employee as 
(select demo.First_Namme,demo.Last_Name, demo.GENDER ,sal.Salary
,count (GENDER) OVER (PARTITION BY GENDER) as totalgender,
AVG(Salary)  OVER (PARTITION BY Salary)as Average_salary
from Adham_SQL_Tuotrial.dbo.DEMOGraphics demo
join Adham_SQL_Tuotrial.dbo.EMPLOYEE_SALARY sal 
on demo.Employee_ID=sal.Employee_ID 
where Salary > '45000'
)

select *
from CTE_employee

select first_Namme ,Last_name

from CTE_employee