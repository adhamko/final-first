-- having clause 



Select job_title, count(job_title)
From Adham_SQL_Tuotrial.dbo.DEMOGraphics

join Adham_SQL_Tuotrial.dbo.EMPLOYEE_SALARY
on Adham_SQL_Tuotrial.dbo.DEMOGraphics.Employee_ID = Adham_SQL_Tuotrial.dbo.EMPLOYEE_SALARY.Employee_ID
group by job_title
Having count(job_title) >2


Select job_title, Avg(Salary)
From Adham_SQL_Tuotrial.dbo.DEMOGraphics

join Adham_SQL_Tuotrial.dbo.EMPLOYEE_SALARY
on Adham_SQL_Tuotrial.dbo.DEMOGraphics.Employee_ID = Adham_SQL_Tuotrial.dbo.EMPLOYEE_SALARY.Employee_ID
group by job_title
Having  Avg(Salary)>45000
order by  Avg(Salary)
