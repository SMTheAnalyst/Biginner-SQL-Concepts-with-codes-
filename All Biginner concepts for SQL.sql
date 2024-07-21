# Basic select statement 
select * from parks_and_recreation.employee_salary ;
select distinct salary from parks_and_recreation.employee_salary ;
select distinct dept_id from parks_and_recreation.employee_salary ;
select * from parks_and_recreation.employee_demographics;
select * from parks_and_recreation.parks_departments;

# select statement with where clause
select first_name,last_name from parks_and_recreation.employee_salary where salary > 60000;
select first_name,last_name,salary from parks_and_recreation.employee_salary where salary > 60000;

# PEMDAS
select first_name,age from parks_and_recreation.employee_demographics where gender = 'Male' ;
select first_name,age+10 from parks_and_recreation.employee_demographics where gender = 'Male' ;
select first_name,(age+10)*10 from parks_and_recreation.employee_demographics where gender = 'Male' ;

# Operators
select * from parks_and_recreation.employee_demographics;
select * from parks_and_recreation.employee_demographics where birth_date > 1980-01-01 and gender = 'Male';
select * from parks_and_recreation.employee_demographics where birth_date < 1990-01-01 or gender != 'Male';
select * from parks_and_recreation.employee_demographics where first_name like '%e%' ;

# group by 
select * from parks_and_recreation.employee_demographics;
select gender, AVG(age) from parks_and_recreation.employee_demographics group by gender;
select gender, AVG(age), max(age), min(age) from parks_and_recreation.employee_demographics group by gender;
select gender, AVG(age), max(age), min(age), count(age) from parks_and_recreation.employee_demographics group by gender;

# order by
select * from parks_and_recreation.employee_demographics;
select * from parks_and_recreation.employee_demographics order by gender desc;
select * from parks_and_recreation.employee_demographics order by gender,age;

# having vs where 
select * from parks_and_recreation.employee_demographics;
select gender , avg(age) from parks_and_recreation.employee_demographics group by gender having avg(age) > 40;
select * from parks_and_recreation.employee_salary;
select occupation, max(salary) from parks_and_recreation.employee_salary group by occupation having max(salary) > 50000;
select occupation, avg(salary) from parks_and_recreation.employee_salary where occupation like '%Manager%' group by occupation having avg(salary) > 50000;

# Limit and aliases
select * from employee_demographics;
select * from employee_demographics order by age desc limit 3;
select first_name, avg(age) as AVG_AGE from employee_demographics group by first_name having AVG_AGE > 40;