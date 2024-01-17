----string function 

--TRIM,LTRIM,RTRIM,substring,upper,lower


CREATE TABLE EmployeeErrors (
EmployeeID varchar(50)
,FirstName varchar(50)
,LastName varchar(50)
)

Insert into EmployeeErrors Values 
('1001  ', 'Jimbo', 'Halbert')
,('  1002', 'Pamela', 'Beasely')
,('1005', 'TOby', 'Flenderson - Fired')

Select *
From EmployeeErrors

--- using TRIM,LTRIM,RTRIM
select EmployeeID ,trim(EmployeeID) as IDTRIM
from EmployeeErrors

select EmployeeID ,ltrim(EmployeeID) as IDLTRIM
from EmployeeErrors

select EmployeeID ,trim(EmployeeID) as IDRTRIM
from EmployeeErrors

-- using replace
select LastName , REPLACE (lastName , ' - Fired', '') as LastNamefixed 
from EmployeeErrors

--using substring 
select FirstName
from EmployeeErrors

select substring(FirstName,1,3)
from EmployeeErrors

select err.FirstName ,demo.First_Namme
from EmployeeErrors err
join  DEMOGraphics demo
on err.FirstName =demo.First_Namme

--upper ,lower 
select LOWER(FirstName)
from EmployeeErrors
select upper(FirstName)
from EmployeeErrors
