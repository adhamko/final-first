-- Case statments 
-- Select Adham_SQL_Tuotrial.dbo.DEMOGraphics.First_Namme ,Adham_SQL_Tuotrial.dbo.DEMOGraphics.Last_Name , Adham_SQL_Tuotrial.dbo.DEMOGraphics.AGe,
-- CASE 
-- WHEN  AGe >30
-- THEN  'old'
-- when AGe between 27 and 30
-- THEN  'young'
--	ELSE  'baby'

--END

-- from Adham_SQL_Tuotrial.dbo.DEMOGraphics
-- where AGe is not null
-- order by AGe

-- -- case statment  
--  Select Adham_SQL_Tuotrial.dbo.DEMOGraphics.First_Namme ,Adham_SQL_Tuotrial.dbo.DEMOGraphics.Last_Name , Adham_SQL_Tuotrial.dbo.DEMOGraphics.AGe,

-- CASE 
--  when AGe = 38 
-- THEN  'Stanely'
-- WHEN  AGe >30
-- THEN  'old'

--	ELSE  'baby'

--END

-- from Adham_SQL_Tuotrial.dbo.DEMOGraphics
-- where AGe is not null
-- order by AGe

select First_Namme ,Last_Name , job_title ,Salary ,
Case 
when job_title ='Salesman' Then Salary + (Salary *.10)
when job_title = 'Accountant' then Salary + (Salary * .05)
when job_title='HR'then Salary + (Salary *0.00001)
else Salary +(salary *.03)

end As salary_increase

From Adham_SQL_Tuotrial.dbo.DEMOGraphics

join Adham_SQL_Tuotrial.dbo.EMPLOYEE_SALARY
on Adham_SQL_Tuotrial.dbo.DEMOGraphics.Employee_ID = Adham_SQL_Tuotrial.dbo.EMPLOYEE_SALARY.Employee_ID

