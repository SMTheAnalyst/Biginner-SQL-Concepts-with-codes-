select * from parks_and_recreation.employee_demographics;
select * from parks_and_recreation.employee_salary;
-- Innner join
select * from employee_demographics as empd join employee_salary as emps 
on empd.employee_id = emps.employee_id;

-- Left join 
select * from employee_demographics empd left join employee_salary emps on empd.employee_id = emps.employee_id;

-- Right join
select empd.first_name,empd.last_name,empd.employee_id from employee_demographics empd right join employee_salary emps on empd.employee_id = emps.employee_id;
select * from employee_demographics empd right join employee_salary emps on empd.employee_id = emps.employee_id;
select emps.first_name,emps.last_name,emps.employee_id,emps.salary from employee_demographics empd right join employee_salary emps on empd.employee_id = emps.employee_id;

-- self join
select emp1.employee_id as emp_santa, 
emp1.first_name as firstname_santa,
emp1.last_name as lastname_santa,
emp2.employee_id as empg, 
emp2.first_name as firstnameg,
emp2.last_name as lastname_santag
from employee_salary emp1
join employee_salary emp2
on emp1.employee_id+1 = emp2.employee_id;

-- Joining Multiple table
select * from parks_departments;
select * from employee_salary;

select * from employee_demographics as empd 
join employee_salary as emps 
	on empd.employee_id = emps.employee_id
join parks_departments as pd
	on emps.dept_id = pd.department_id;

-- Union with use case 
select * from employee_demographics 
union 
select * from employee_salary;

-- We need to cut the employees those who are Older than 40 and also highly paid (Use case)
select first_name,last_name,'old man' as lable 
from employee_demographics 
where age > 40 and gender = 'Male'
union
select first_name,last_name,'old lady' as lable 
from employee_demographics 
where age > 40 and gender = 'Female'
union 
select first_name,last_name,'Highly paid' as lable
from employee_salary 
where salary > 70000 order by first_name desc;

-- String Function ( LENGTH,UPPER,LOWER,TRIM,SUBSTRING,REPLACE,LOCATE,CONCAT)

select * from employee_demographics;
select first_name, length(first_name) from employee_demographics; 
select first_name, upper(last_name) from employee_demographics; 
select first_name, lower(first_name) from employee_demographics; 
select ltrim('       ILOVESQL   ');
SELECT TRIM('sky'   );
SELECT rtrim('       ILOVESQL   ');
select first_name, last_name, left(first_name, 4) from employee_demographics;
select first_name, last_name, right(last_name, 2) from employee_demographics;
select first_name, last_name,right(last_name, 2), left(first_name, 4), substring(first_name,1,4), birth_date,substring(birth_date,7,1) as birth_month from employee_demographics;

-- Case Statement

select * from employee_salary;
select * from employee_demographics;
select first_name,last_name,age,
case 
	when age < 30 then 'YOUNG'
    when age between 30 and 50 then 'OLD'
    when age > 50 then 'NEED TO RETIRE'
end AS Decision
from employee_demographics;

-- Case study if someone gets less then 50k give them 5% increase 
-- if someone gets greater then 50k give them 5% increase 
-- if someone works in finance dept then give them 10% bonus
select 
first_name , last_name, salary,
case 
	when salary < 50000 then salary + ( salary * .05)
    when salary > 50000 then salary + ( salary * .07)
 end as Revisedsalary,
 case 
	when dept_id = 6 then salary + ( salary * .10)
end as Bonusforgreatwork
from employee_salary;
select * from parks_departments;

-- Subquery ( Query into a query)

select * from employee_demographics;
select * from employee_salary;
-- Subquery in where clause
SELECT *
FROM employee_demographics
WHERE employee_id IN 
	(SELECT employee_id FROM employee_salary WHERE dept_id = 1);
    
-- Subquery in select statement
select first_name , last_name, salary as avg_sal,
( select avg(salary) from employee_salary) 
from employee_salary;

-- Subquery in from statement
select gender, avg(MIN_AGE) from 
(select gender, max(age) as MAX_AGE, min(age) AS MIN_AGE, avg(age) as AVG_AGE, count(age) AS COUNT_AGE from employee_demographics group by GENDER)
AS AGG_AGE
group by gender;



