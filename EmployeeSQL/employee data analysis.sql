-- Read the data from the tables 

Select * from employees limit 15
Select * from departments limit 15
Select * from dept_emp limit 15
Select * from dept_manager limit 15
Select * from salaries limit 15
Select * from titles limit 15

-- List the employee number, last name, first name, sex, and salary of each employee.
select employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
from employees
inner join salaries
on employees.emp_no = salaries.emp_no;

-- List the first name, last name, and hire date for the employees who were hired in 1986.
select employees.first_name, employees.last_name, employees.hire_date
from employees
where extract(year from employees.hire_date) = 1986;

-- List the manager of each department along with their department number, department name, employee number, last name, and first name.
select dept_manager.dept_no, departments.dept_name, dept_manager.emp_no, employees.last_name, employees.first_name
from dept_manager
join departments
on departments.dept_no = dept_manager.dept_no
inner join employees
on dept_manager.emp_no = employees.emp_no

-- List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
select dept_emp.dept_no, employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
from employees
inner join dept_emp
on dept_emp.emp_no = employees.emp_no
join departments
on dept_emp.dept_no = departments.dept_no

-- List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
select employees.first_name, employees.last_name, employees.sex
from employees
where employees.first_name = 'Hercules' and employees.last_name like 'B%'

-- List each employee in the Sales department, including their employee number, last name, and first name.
select employees.emp_no, employees.last_name, employees.first_name
from employees
inner join dept_emp
on dept_emp.emp_no = employees.emp_no
join departments
on dept_emp.dept_no = departments.dept_no
where dept_emp.dept_no = 'd007'

-- List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
select employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
from employees
inner join dept_emp
on dept_emp.emp_no = employees.emp_no
join departments
on dept_emp.dept_no = departments.dept_no
where dept_emp.dept_no = 'd007'or dept_emp.dept_no = 'd005'

-- List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).