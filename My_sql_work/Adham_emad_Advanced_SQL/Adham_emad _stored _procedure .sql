----stored procedure


--creating procedure 

create procedure test
as 
select * 
from DEMOGraphics

CREATE PROCEDURE   tmp_employee 
 as 
Create table #temp_employee2(
 jobtitle varchar(50),employeesperjob int ,Avgage int ,avgsalary int )


 insert into #temp_employee2						--insert to temp table from another table )

   select job_title,count(job_title),AVG(AGe),AVG(Salary)				--(selection from salary table)

   from Adham_SQL_Tuotrial.dbo.DEMOGraphics demo
   join Adham_SQL_Tuotrial.dbo.EMPLOYEE_SALARY sal
   on demo.Employee_ID=sal.Employee_ID

   group by job_title

   select *
   from #temp_employee2


 EXEC tmp_employee @job_title ='Salesman'


 exec tmp_employee @job_title ='Salesman'  --alter procedure 

 