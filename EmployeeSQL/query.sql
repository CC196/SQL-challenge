
--List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT em.emp_no as "employee number", last_name as "last name", first_name as "first name", sex, salary
FROM employees em
JOIN salaries sa on sa.emp_no=em.emp_no;

--List first name, last name, and hire date for employees who were hired in 1986.
SELECT last_name as "last name", first_name as "first name", hire_date as "hire date"
FROM employees
WHERE hire_date like '%1986';

-- the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
SELECT ma.dept_no, dept_name, ma.emp_no, last_name, first_name
FROM dept_manager ma
JOIN departments de on de.dept_no = ma.dept_no
JOIN employees em on em.emp_no = ma.emp_no;

--List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT dem.emp_no, last_name, first_name, dept_name
FROM dept_emp dem
JOIN departments de on de.dept_no = dem.dept_no
JOIN employees em on em.emp_no = dem.emp_no;

--List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT first_name, last_name, sex
FROM employees
WHERE first_name like 'Hercules' and last_name like 'B%';

select * from departments
--List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT dem.emp_no, last_name, first_name, dept_name
FROM employees em
JOIN dept_emp dem on em.emp_no = dem.emp_no
JOIN departments de on de.dept_no = dem.dept_no
WHERE dept_name = 'Sales';


--List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT dem.emp_no, last_name, first_name, dept_name
FROM employees em
JOIN dept_emp dem on em.emp_no = dem.emp_no
JOIN departments de on de.dept_no = dem.dept_no
WHERE dept_name in ('Sales','Development');

--In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name, COUNT(last_name) AS "frequency"
FROM employees
GROUP BY last_name
ORDER BY frequency DESC;