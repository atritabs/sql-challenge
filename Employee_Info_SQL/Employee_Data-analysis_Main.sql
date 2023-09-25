-- Tables References for each table (Using Select Queries)

Select * from titles;
Select * from departments;
Select * from employees;
Select * from dept_emp;
Select * from salaries;
Select * from dept_manager;


-- List the employee number, last name, first name, sex, and salary of each employee
SELECT emp.emp_no,emp.last_name,emp.first_name,emp.sex,sal.salary
FROM employees AS emp
JOIN salaries AS sal
ON sal.emp_no = emp.emp_no;

-- List the first name, last name, and hire date for the employees who were hired in 1986
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31';

-- List the manager of each department along with their department number, department name, employee number, last name, and first name
SELECT dmg.dept_no, dep.dept_name, dmg.emp_no, emp.last_name AS last_name_of_manager, emp.first_name AS first_name_of_manager
FROM dept_manager AS dmg
JOIN employees AS emp
ON emp.emp_no = dmg.emp_no
JOIN departments AS dep
ON dep.dept_no = dmg.dept_no;

-- List the department number for each employee along with that employee’s employee number, last name, first name, and department name
SELECT dept.dept_no, dept.emp_no, emp.last_name, emp.first_name, dep.dept_name
FROM dept_emp AS dept
JOIN employees AS emp
ON emp.emp_no = dept.emp_no
JOIN departments AS dep
ON dep.dept_no = dept.dept_no;

-- List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

-- List each employee in the Sales department, including their employee number, last name, and first name
SELECT 'Sales' AS dept_name, emp.emp_no, emp.last_name, emp.first_name
FROM employees AS emp
JOIN dept_emp AS dept
ON emp.emp_no = dept.emp_no
WHERE dept.dept_no = (SELECT dept_no
	FROM departments
	WHERE dept_name = 'Sales');

-- List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name
SELECT emp.emp_no, emp.last_name, emp.first_name, dep.dept_name
FROM employees AS emp
JOIN dept_emp AS dept
ON emp.emp_no = dept.emp_no
JOIN departments AS dep
ON dep.dept_no = dept.dept_no
WHERE dep.dept_name IN ('Sales','Development');

-- List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name)
SELECT last_name, COUNT(first_name) AS count_of_first_names
FROM employees
GROUP BY last_name
ORDER BY count_of_first_names DESC;
