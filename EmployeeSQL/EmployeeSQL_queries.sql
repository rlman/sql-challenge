-- Data Analysis
-- Section 1: 
-- 1. List the following details of each employee: employee number, last name, first name, gender, and salary.
--    Use aliases for column names and sort by "Employee Number" (Lessons: 05-Stu_Order_By and 06-Ins_Subqueries)
--    show "Salary" column as currency - (CAST(s.salary AS MONEY)) AS "Salary"
--    show "Salary" column with commas - TO_CHAR(s.salary, '999,999,999,999') AS "Salary"   
SELECT 
	e.emp_no AS "Employee Number",
	e.last_name AS "Last Name",
	e.first_name AS "First Name",
	e.gender AS "Gender",
	(CAST(s.salary AS MONEY)) AS "Salary"
FROM employees e
INNER JOIN salaries s
ON e.emp_no=s.emp_no
ORDER BY e.emp_no
;


-- 2. List employees who were hired in 1986.
SELECT emp_no, first_name, last_name, hire_date
FROM employees 
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31';
-- OR hire_date >= '1986-01-01' AND hire_date <= '1986-12-31';


-- 3. List the manager of each department with the following information:
--    department number, department name, the manager's employee number, last name, first name,
--    and start and end employment dates.
SELECT 
	dm.dept_no AS "Department No.", 
	d.dept_name AS "Department", 
	dm.emp_no AS "Employee Number",
	e.last_name AS "Last Name",
	e.first_name AS "First Name",
	dm.from_date AS "Start Date",
	dm.to_date AS "Last Day"
FROM dept_manager dm
INNER JOIN departments d
ON dm.dept_no = d.dept_no
INNER JOIN employees e
ON dm.emp_no=e.emp_no
ORDER BY dm.dept_no ASC, dm.emp_no ASC
;

-- 4. List the department of each employee with the following information:
--    employee number, last name, first name, and department name.
SELECT 
	e.emp_no AS "Employee Number",
	e.last_name AS "Last Name",
	e.first_name AS "First Name",
	d.dept_name AS "Department" 
FROM employees e
INNER JOIN dept_emp de
ON e.emp_no = de.emp_no
INNER JOIN departments d
ON de.dept_no = d.dept_no
ORDER BY e.emp_no ASC
;

-- 5. Option 1: List all employees whose first name is "Hercules" and last names begin with "B."-returns null/empty table
--    Option 2: List all employees whose first name is "Hercules" and last names begin with letter "B"-returns 20 records
SELECT first_name, last_name
FROM Employees
WHERE first_name='Hercules' 
AND last_name Like 'B%'
ORDER BY last_name ASC
;

-- 6. List all employees in the Sales department, including their employee number,
--                                      last name, first name, and department name.
SELECT 
	e.emp_no AS "Employee Number",
	e.last_name AS "Last Name",
	e.first_name AS "First Name",
	d.dept_name AS "Department" 
FROM employees e
INNER JOIN dept_emp de
ON e.emp_no=de.emp_no
INNER JOIN departments d
ON de.dept_no=d.dept_no
WHERE d.dept_name='Sales'
ORDER BY e.emp_no
;

-- 7. List all employees in the Sales and Development departments, including their
--                     employee number, last name, first name, and department name.
SELECT 
	e.emp_no AS "Employee Number",
	e.last_name AS "Last Name",
	e.first_name AS "First Name",
	d.dept_name AS "Department" 
FROM employees e
INNER JOIN dept_emp de
ON e.emp_no=de.emp_no
INNER JOIN departments d
ON de.dept_no=d.dept_no
WHERE d.dept_name IN ('Sales','Development')
ORDER BY d.dept_no ASC, e.emp_no ASC
;

-- 8. In descending order, list the frequency count of employee last names, 
--    i.e., how many employees share each last name.
SELECT last_name AS "Last Name", COUNT(last_name) AS "Frequency of Occurrence"
FROM employees
GROUP BY last_name
ORDER BY "Frequency of Occurrence" DESC;

-- Section 2: Bonus (Optional)
-- 1.  Import the SQL database into Pandas.
-- https://docs.sqlalchemy.org/en/13/core/engines.html#postgresql
-- in jupyter notebook, use the following code:
--     FROM sqlalchemy IMPORT create_engine
--     engine = create_engine('postgresql://localhost:5432/Employee_db')
--     CONNECTION = engine.connect()

-- 2. Create a histogram to visualize the most common salary ranges for employees.

-- 3. Create a bar chart of average salary by title.
