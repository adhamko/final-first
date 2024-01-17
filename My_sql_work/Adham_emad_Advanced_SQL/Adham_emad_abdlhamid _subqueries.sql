--- subqueries 

select *
from EMPLOYEE_SALARY

--subquery in select 

select Employee_ID,Salary,(select AVg(Salary)from EMPLOYEE_SALARY) as average_salary
from EMPLOYEE_SALARY

-- work with partion by 
select Employee_ID,Salary, AVg(Salary) over () as all_average_salary
from EMPLOYEE_SALARY

-- dont work with group by 
select Employee_ID,Salary, AVg(Salary) as all_average_salary
from EMPLOYEE_SALARY
group by Employee_ID,Salary
order by 1,2

---subquery on form

select a.Employee_ID ,all_average_salary

from (select Employee_ID,Salary, AVg(Salary) over () as all_average_salary
from EMPLOYEE_SALARY) a


--subquery in where 

select Employee_ID,job_title,Salary

from EMPLOYEE_SALARY
where  Employee_ID In(select Employee_ID from DEMOGraphics

where age >33)