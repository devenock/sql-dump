use sql_learning;

-- show existing tables on this database
show tables;

SELECT * FROM countries;
SELECT country_id, country_name FROM countries ORDER BY country_id ASC;

-- show all departments
SELECT * FROM departments;

-- show all employees
SELECT * FROM employees;

SELECT first_name, last_name, email, salary FROM employees ORDER BY salary DESC;

-- DISTINCT
SELECT DISTINCT salary FROM employees ORDER BY salary DESC;

-- LIMIT
SELECT DISTINCT salary FROM employees ORDER BY salary DESC LIMIT 10;

-- use FETCH to limit the returned query instead of LIMIT because LIMIT clause is not a SQL standard and not supported by some versions of SQL
-- The OFFSET FETCH clause allows you to skip N first rows in a result set before starting to return any row
-- Because rows are stored in the table in an unspecified order, you should always use the FETCH clause with the ORDER BY clause to get consistent output.
-- The OFFSET FETCH clause is typically used in the client or web applications that require pagination.

-- SELECT employee_id, first_name, last_name, salary FROM employees ORDER BY salary DESC OFFSET 0 ROWS FETCH NEXT 1 ROWS ONLY;

-- mysql offset syntax
SELECT employee_id, first_name, last_name, salary FROM employees ORDER BY salary DESC LIMIT 5 OFFSET 5;

-- WHERE
SELECT employee_id, first_name, last_name, salary FROM employees WHERE salary > 10000 ORDER BY salary ASC LIMIT 5;

-- AND
SELECT employee_id, first_name, last_name, salary FROM employees WHERE salary > 10000 AND employee_id < 200 ORDER BY salary ASC;


-- OR
SELECT employee_id, first_name, last_name, salary FROM employees WHERE salary > 10000 OR employee_id < 200 ORDER BY salary ASC;

-- BETWEEN
SELECT employee_id, first_name, last_name, salary FROM employees WHERE salary BETWEEN 12000 AND 17000 ORDER BY salary ASC;

-- NOT BETWEEN
SELECT employee_id, first_name, last_name, salary FROM employees WHERE salary NOT BETWEEN 12000 AND 17000 ORDER BY salary ASC;

-- IN
SELECT employee_id, first_name, last_name, salary FROM employees WHERE salary IN(10000, 12000, 14000) ORDER BY salary ASC;

-- NOT IN
SELECT employee_id, first_name, last_name, salary FROM employees WHERE salary NOT IN(12000,17000,10000, 11000) ORDER BY salary ASC;

-- IN SUBQUERY
SELECT employee_id, first_name, last_name, salary
FROM employees 
WHERE department_id IN(SELECT department_id FROM departments WHERE department_title = 'Marketing' OR department_title = 'Sales'); 

-- LIKE: test whether a value matches a pattern.
SELECT employee_id, first_name, last_name, salary FROM employees WHERE first_name LIKE 'Da%';

-- NULL
SELECT employee_id, first_name, last_name, phone_number FROM employees WHERE phone_number IS NULL;
-- SELECT employee_id, first_name, last_name, phone_number FROM employees WHERE phone_number = NULL => Should not be used

-- NOT NULL
SELECT employee_id, first_name, last_name, phone_number FROM employees WHERE phone_number IS NOT NULL;

-- ALIAS
SELECT employee_id, first_name, last_name, phone_number AS employee_phone FROM employees WHERE phone_number IS NOT NULL;

-- JOINS: This is the process of linking up multiple SQL table together 
-- SQL provides different kinds of JOINS: INNER, LEFT, RIGHT, FULL OUTER JOIN, e.t.c

-- INNER JOIN: Using SQL INNER JOIN to join two tables(employees and departments)
-- INNER JOIN returns rows if there is, at least, one row in both tables that matches the join condition. 
-- The inner join clause eliminates the rows that do not match with a row of the other table.

SELECT department_title, department_id FROM departments WHERE department_id IN(1,2,3);
SELECT first_name, last_name, department_id FROM employees WHERE department_id IN(1,2,3) ORDER BY department_id;

-- using INNER JOIN to combine the tables(two tables)
SELECT 
first_name, 
last_name, 
employees.department_id, 
departments.department_id, 
department_title 
FROM employees 
INNER JOIN departments 
ON departments.department_id = employees.department_id
WHERE employees.department_id IN(1,2,3);

-- using INNER JOIN to combine 3 tables
SELECT 
first_name, 
last_name, 
job_title,
department_title 
FROM employees 
INNER JOIN departments 
ON departments.department_id = employees.department_id
INNER JOIN jobs ON jobs.job_id = employees.job_id
WHERE employees.department_id IN(1,2,3);

-- LEFT JOIN: returns all rows from the left table whether or not there is a matching row in the right table.

-- show tables;
-- SELECT * FROM countries;
-- SELECT * FROM locations;

SELECT 
country_name, 
countries.country_id, 
locations.country_id, 
locations.street_address, 
locations.city 
FROM countries
LEFT JOIN locations 
ON locations.country_id = countries.country_id 
WHERE countries.country_id IN('US', 'UK', 'CN');


-- SELF JOIN


-- AGGREGATE FUNCTIONS

-- AVG: used to return the average for a set of values from a table
SELECT AVG(salary) AS average_salary FROM employees;
-- AVG with DISTINCT
SELECT AVG(DISTINCT salary) AS average_salary FROM employees;
-- AVG with DISTINCT and ROUND
SELECT ROUND(AVG(DISTINCT salary), 2) AS average_salary FROM employees;

-- COUNT













