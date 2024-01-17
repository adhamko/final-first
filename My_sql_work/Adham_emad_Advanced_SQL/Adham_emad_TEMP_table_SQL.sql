--- temp table \

Create table #temp_employee(
EmployeeID int,
JobTitle varchar(100),
Salary int
)
Select * From #temp_employee

Insert into #temp_employee values (
'1001', 'HR', '45000'
)

Insert into #temp_employee
SELECT * From Adham_SQL_Tuotrial.dbo.EMPLOYEE_SALARY				(--insert to temp table from another table )


Select * From #temp_employee
 Create table #temp_employee2(
 jobtitle varchar(50),employeesperjob int ,Avgage int ,avgsalary int )



   drop table if exists #temp_employee2   (----tips  if you want to create table again)
   insert into #temp_employee2						(--insert to temp table from another table )

   select job_title,count(job_title),AVG(AGe),AVG(Salary)				--(selection from salary table)

   from Adham_SQL_Tuotrial.dbo.DEMOGraphics demo
   join Adham_SQL_Tuotrial.dbo.EMPLOYEE_SALARY sal
   on demo.Employee_ID=sal.Employee_ID

   group by job_title

   select * 
   from #temp_employee2
