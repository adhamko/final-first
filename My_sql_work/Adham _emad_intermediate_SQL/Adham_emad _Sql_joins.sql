--joins
select *
from Adham_SQL_Tuotrial.dbo.DEMOGraphics

select *
from Adham_SQL_Tuotrial.dbo.EMPLOYEE_SALARY

-- Inner joins 
select * 
from Adham_SQL_Tuotrial.dbo.DEMOGraphics 
INNER JOIN Adham_SQL_Tuotrial.dbo.EMPLOYEE_SALARY
on DEMOGraphics.Employee_ID = EMPLOYEE_SALARY.Employee_ID


-- full outer joins

select * 
from Adham_SQL_Tuotrial.dbo.DEMOGraphics 
Full Outer  JOIN Adham_SQL_Tuotrial.dbo.EMPLOYEE_SALARY
on DEMOGraphics.Employee_ID = EMPLOYEE_SALARY.Employee_ID

-- left outer joins 

select * 
from Adham_SQL_Tuotrial.dbo.DEMOGraphics 
Left Outer  JOIN Adham_SQL_Tuotrial.dbo.EMPLOYEE_SALARY
on DEMOGraphics.Employee_ID = EMPLOYEE_SALARY.Employee_ID

-- right outer joins 
select * 
from Adham_SQL_Tuotrial.dbo.DEMOGraphics 
Right Outer  JOIN Adham_SQL_Tuotrial.dbo.EMPLOYEE_SALARY
on DEMOGraphics.Employee_ID = EMPLOYEE_SALARY.Employee_ID

-- inner joins 
select DEMOGraphics.Employee_ID,first_Namme ,Last_Name , job_title ,Salary
from Adham_SQL_Tuotrial.dbo.DEMOGraphics 
INNER JOIN Adham_SQL_Tuotrial.dbo.EMPLOYEE_SALARY
on DEMOGraphics.Employee_ID = EMPLOYEE_SALARY.Employee_ID

-- left outer joins 

select DEMOGraphics.Employee_ID,first_Namme ,Last_Name , job_title ,Salary
from Adham_SQL_Tuotrial.dbo.DEMOGraphics 
Left Outer JOIN Adham_SQL_Tuotrial.dbo.EMPLOYEE_SALARY
on DEMOGraphics.Employee_ID = EMPLOYEE_SALARY.Employee_ID


-- right outer joins 
select DEMOGraphics.Employee_ID,first_Namme ,Last_Name , job_title ,Salary
from Adham_SQL_Tuotrial.dbo.DEMOGraphics 
right outer JOIN Adham_SQL_Tuotrial.dbo.EMPLOYEE_SALARY
on DEMOGraphics.Employee_ID = EMPLOYEE_SALARY.Employee_ID


-- joins with where 
select DEMOGraphics.Employee_ID,first_Namme ,Last_Name , job_title ,Salary
from Adham_SQL_Tuotrial.dbo.DEMOGraphics 
Inner  JOIN Adham_SQL_Tuotrial.dbo.EMPLOYEE_SALARY
on DEMOGraphics.Employee_ID = EMPLOYEE_SALARY.Employee_ID
where First_Namme <> 'Michael'
 
 

 
-- joins with where and order by 
select DEMOGraphics.Employee_ID,first_Namme ,Last_Name , job_title ,Salary
from Adham_SQL_Tuotrial.dbo.DEMOGraphics 
Inner  JOIN Adham_SQL_Tuotrial.dbo.EMPLOYEE_SALARY
on DEMOGraphics.Employee_ID = EMPLOYEE_SALARY.Employee_ID
where First_Namme <> 'Michael'
order by Salary

-- joins with where and group by 
Select job_title ,AVG(Salary) as average_salary
from Adham_SQL_Tuotrial.dbo.DEMOGraphics 
Inner  JOIN Adham_SQL_Tuotrial.dbo.EMPLOYEE_SALARY
on DEMOGraphics.Employee_ID = EMPLOYEE_SALARY.Employee_ID
where job_title= 'salesman'
group by job_title




