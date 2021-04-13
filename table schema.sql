
departments
-
dept_no PK VARCHAR
dept_name VARCHAR

employees
-
emp_no PK int
emp_title_id VARCHAR FK >- titles.title_id
birth_date VARCHAR
first_name VARCHAR
last_name VARCHAR
sex VARCHAR
hire_date VARCHAR

dept_emp
-
emp_no PK int FK >- employees.emp_no
dept_no PK VARCHAR FK >- departments.dept_no

dept_manager
-
dept_no PK VARCHAR FK >- departments.dept_no
emp_no PK int FK >- employees.emp_no

salaries
-
emp_no PK int FK - employees.emp_no
salary int

titles
-
title_id PK VARCHAR
title VARCHAR