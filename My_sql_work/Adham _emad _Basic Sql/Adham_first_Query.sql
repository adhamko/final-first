--SELECT TOP (1000) [Employee_ID]
--      ,[job_title]
--      ,[Salary]
--  FROM [Adham_SQL_Tuotrial].[dbo].[EMPLOYEE_SALARY]

----(all columns from table ):
--Select *
--from DEMOGraphics




----(specify column from the table ):
--Select First_Namme , Last_Name
----From DEMOGraphics

--Select TOP 4 *
--from  DEMOGraphics


--{
----DISTINCT type in SQL:
----SELECT DISTINCT(Employee_ID)

----from  DEMOGraphics

----SELECT DISTINCT(GENDER)
----from   DEMOGraphics

--}

----COUNT value in SQL \
--{
--SELECT COUNT (Last_Name)
--from   DEMOGraphics
--\

--SELECT COUNT (Last_Name) AS LAST_NAME_COUNT
--from   DEMOGraphics
}

Select * 
From EMPLOYEE_SALARY


--maxmium and minmum  and Average and sum
SELECT MAX (Salary) AS Largest_salary
From EMPLOYEE_SALARY

SELECT MIN (Salary) as Smallest_salary
From EMPLOYEE_SALARY


SELECT AVG (Salary) as Average_salary
From EMPLOYEE_SALARY

SELECT SUM (Salary) as total_salary
From EMPLOYEE_SALARY 

SELECT *
From Adham_SQL_Tuotrial.dbo.DEMOGraphics



