--Data Analysis
--List the employee number, last name, first name, sex, and salary of each employee.
--select * from salaries;
SELECT
	e.employee_number,
	e.last_name,
	e.frst_name,
	e.sex,
	s.salary
FROM
	employees as e
	
INNER JOIN salaries as s 
    ON s.employee_number = e.employee_number 

--List the first name, last name, and hire date for the employees who were hired in 1986.
select * from employees;


SELECT
	e.frst_name,
	e.last_name,
	e.hire_date

FROM
	employees as e
WHERE
	date_part('year', e.hire_date ) = '1986'

-- OTHER WAYS OF DOING THIS - two options
--WHERE
--	date_part('year', e.hire_date ) in ('1986','1987','1990')
--WHERE
--e.hire_date between '1986-01-01' AND '1987-12-31' 


--List the manager of each department along with their department number, department name, employee number, last name, and first name.
--select*from departments;
SELECT
	dm.department_number, 
	departments.department_name, 
	dm.employee_number, 
	e.last_name,
	e.frst_name
	
FROM
	employees as e
INNER JOIN department_manager as dm 
    ON e.employee_number = dm.employee_number 
INNER JOIN departments 
    ON departments.department_number = dm.department_number 

--select * from employees;


--List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
SELECT
	de.department_number, 
	de.employee_number, 
	e.last_name,
	e.frst_name,
	departments.department_name
	
FROM
	employees as e
INNER JOIN department_employee as de 
    ON de.employee_number = e.employee_number 
INNER JOIN departments 
    ON departments.department_number = de.department_number 
 
--List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
SELECT
	e.frst_name,
	e.last_name,
	e.sex
	
FROM
	employees as e
WHERE
	frst_name = 'Hercules' AND last_name like 'B%'
	
--List each employee in the Sales department, including their employee number, last name, and first name.
SELECT
	e.employee_number,
	e.last_name,
	e.frst_name
	
FROM
	employees as e
INNER JOIN department_employee as de 
    ON de.employee_number = e.employee_number 
WHERE
	department_number = 'd007'

--List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT
	e.employee_number,
	e.last_name,
	e.frst_name,
	departments.department_name
FROM
	employees as e
INNER JOIN department_employee as de 
    ON de.employee_number = e.employee_number 
INNER JOIN departments 
    ON departments.department_number = de.department_number 
WHERE
	departments.department_number in ('d007','d005')
--List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
SELECT
	e.last_name, COUNT (e.last_name) 
FROM
	employees as e
GROUP BY e.last_name 
ORDER BY COUNT desc 