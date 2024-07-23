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




