--Table 1 Insert:
Insert into Adham_SQL_Tuotrial.dbo.DEMOGraphics VALUES
(1011, 'Ryan', 'Howard', 26, 'Male'),
(NULL, 'Holly', 'Flax', NULL, NULL),
(1013, 'Darryl', 'Philbin', NULL, 'Male')

Select * 
from Adham_SQL_Tuotrial.dbo.DEMOGraphics

-- table 3 
create table  Adham_SQL_Tuotrial.dbo.WareHouseEmployeeDemographics 
(Employee_ID int , First_name VARCHAR (50),Lastname VARCHAR (50),age int , Gender VARCHAR (50))

--table 3 insert 
Insert into Adham_SQL_Tuotrial.dbo.WareHouseEmployeeDemographics VALUES
(1013, 'Darryl', 'Philbin', NULL, 'Male'),
(1050, 'Roy', 'Anderson', 31, 'Male'),
(1051, 'Hidetoshi', 'Hasagawa', 40, 'Male'),
(1052, 'Val', 'Johnson', 31, 'Female')

select * from  Adham_SQL_Tuotrial.dbo.WareHouseEmployeeDemographics

Select * 
from Adham_SQL_Tuotrial.dbo.DEMOGraphics

-- full joins 

Select * 
from Adham_SQL_Tuotrial.dbo.DEMOGraphics
Full outer join Adham_SQL_Tuotrial.dbo.WareHouseEmployeeDemographics
on Adham_SQL_Tuotrial.dbo.DEMOGraphics.Employee_ID = Adham_SQL_Tuotrial.dbo.WareHouseEmployeeDemographics.Employee_ID

--union 
select * from  Adham_SQL_Tuotrial.dbo.WareHouseEmployeeDemographics
Union
Select * 
from Adham_SQL_Tuotrial.dbo.DEMOGraphics

--union all
select * from  Adham_SQL_Tuotrial.dbo.WareHouseEmployeeDemographics
Union all
Select * 
from Adham_SQL_Tuotrial.dbo.DEMOGraphics
Order by age

select * from  Adham_SQL_Tuotrial.dbo.WareHouseEmployeeDemographics
Union all
Select * 
from Adham_SQL_Tuotrial.dbo.DEMOGraphics
Order by Employee_ID


select *
from Adham_SQL_Tuotrial.dbo.DEMOGraphics

select * 
from Adham_SQL_Tuotrial.dbo.EMPLOYEE_SALARY


-- unions 
Select Employee_ID ,First_Namme , AGe
from Adham_SQL_Tuotrial.dbo.DEMOGraphics
Union 
Select Employee_ID ,job_title,Salary
from Adham_SQL_Tuotrial.dbo.EMPLOYEE_SALARY
Order by Employee_ID