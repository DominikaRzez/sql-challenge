--1. Listing following details of each employee: 
-- employee number, last name, first name, sex, and salary.
SELECT emp.emp_no, emp.last_name, emp.first_name, emp.sex, sal.salary
FROM employees AS emp
INNER JOIN salaries AS sal ON
emp.emp_no=sal.emp_no;


--2. Listing first name, last name, and hire date for employees who were hired in 1986.

SELECT first_name, last_name, hire_date 
FROM employees 
WHERE hire_date >= '01/01/1986' AND hire_date<='31/12/1986';


--3. Listing the manager of each department with the following information: 
--department number, department name, 
--the manager's employee number, last name, first name.

SELECT  dept_manager.dept_no, departments.dept_name, 
		dept_manager.emp_no,employees.last_name, employees.first_name
FROM dept_manager 
JOIN departments ON 
dept_manager.dept_no=departments.dept_no
JOIN employees ON 
dept_manager.emp_no=employees.emp_no;



--4. Listing the department of each employee with the following information: 
-- employee number, last name, first name, and department name.

SELECT  dept_emp.emp_no, employees.last_name, 
		employees.first_name, departments.dept_name
FROM dept_emp 
JOIN departments ON 
dept_emp.dept_no=departments.dept_no
JOIN employees ON 
dept_emp.emp_no=employees.emp_no;


----5. Listing first name, last name, and sex for employees whose 
-- first name is "Hercules" and last names begin with "B."

SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';


--6. --Listing all employees in the Sales department, 
--including their employee number, last name, first name, and department name.

SELECT dept_emp.emp_no, emp.last_name, emp.first_name,
		d.dept_name
FROM dept_emp
JOIN employees as emp ON
dept_emp.emp_no=emp.emp_no
JOIN departments as d ON
dept_emp.dept_no=d.dept_no
WHERE d.dept_name='Sales';


--7. Listing all employees in the Sales and Development departments, 
--including their employee number, last name, first name, and department name.

SELECT dept_emp.emp_no, emp.last_name, emp.first_name, 
		d.dept_name
FROM dept_emp
JOIN employees AS emp ON
dept_emp.emp_no=emp.emp_no
JOIN departments AS d ON
dept_emp.dept_no=d.dept_no
WHERE d.dept_name = 'Sales' OR d.dept_name = 'Development';



--8. Listing in descending order, 
-- the frequency count of employee last names

SELECT last_name, COUNT(last_name) AS "last name frequency"
FROM employees
GROUP BY last_name
ORDER BY "last name frequency" DESC;