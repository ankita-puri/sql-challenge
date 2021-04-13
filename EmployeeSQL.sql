CREATE TABLE titles(
	title_id VARCHAR PRIMARY KEY,
	title VARCHAR NOT NULL
);
select * from employees;
CREATE TABLE departments(
	dept_no VARCHAR PRIMARY KEY,
	dept_name VARCHAR
);
CREATE TABLE employees(
	emp_no INT PRIMARY KEY,
	emp_title_id VARCHAR NOT NULL,
	birth_date VARCHAR NOT NULL,
	first_name VARCHAR NOT NULL,
	last_name VARCHAR NOT NULL,
	sex VARCHAR NOT NULL,
	hire_date VARCHAR NOT NULL,
	FOREIGN KEY (emp_title_id) REFERENCES titles(title_id)
);
CREATE TABLE dept_emp(
	emp_no INT NOT NULL,
	dept_no VARCHAR NOT NULL,
	PRIMARY KEY (emp_no, dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);
CREATE TABLE salaries(
	emp_no INT PRIMARY KEY,
	salary INT NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);
CREATE TABLE dept_manager(
	dept_no VARCHAR NOT NULL,
	emp_no INT NOT NULL,
	PRIMARY KEY (dept_no, emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

List the following details of each employee: employee number, last name, first name, sex, and salary.
select employees.emp_no,employees.last_name,employees.first_name,employees.sex,salaries.salary  
from employees
join salaries on employees.emp_no = salaries.emp_no;

List first name, last name, and hire date for employees who were hired in 1986.
select first_name,last_name,hire_date
from employees where hire_date like '%1986'

List the manager of each department with the following information: department number, department name, the manager''s employee number, last name, first name.
select dept_manager.dept_no,departments.dept_name,dept_manager.emp_no,employees.first_name,employees.last_name
from dept_manager
join departments on dept_manager.dept_no=departments.dept_no
join employees on dept_manager.emp_no=employees.emp_no;

List the department of each employee with the following information: employee number, last name, first name, and department name.
select employees.emp_no,employees.last_name,employees.first_name,departments.dept_name
from employees
join dept_emp on employees.emp_no=dept_emp.emp_no
join departments on dept_emp.dept_no=departments.dept_no;

List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
select first_name,last_name,sex
from employees
where first_name like'%Hercules' and last_name like'B%';

List all employees in the Sales department, including their employee number, last name, first name, and department name.
select * from departments;
dept_no for Sales department is d007
select employees.emp_no,employees.last_name,employees.first_name,departments.dept_name
from employees
join dept_emp on employees.emp_no=dept_emp.emp_no
join departments on dept_emp.dept_no=departments.dept_no
where departments.dept_no='d007';


List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
select employees.emp_no,employees.last_name,employees.first_name,departments.dept_name
from employees
join dept_emp on employees.emp_no=dept_emp.emp_no
join departments on dept_emp.dept_no=departments.dept_no
where departments.dept_no='d007' or departments.dept_no='d005';


In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name, COUNT(last_name) AS "Frequency count"
FROM employees
GROUP BY last_name
ORDER BY "Frequency count" DESC;




