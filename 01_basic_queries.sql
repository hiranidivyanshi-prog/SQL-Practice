-- ============================================================
-- FILE: 01_basic_queries.sql
-- TOPIC: Basic SQL Queries
-- CONCEPTS: SELECT, WHERE, ORDER BY, LIMIT, DISTINCT
-- ============================================================


-- ============================================================
-- SECTION 1: SELECT — Retrieving data from a table
-- ============================================================

-- 1.1 Select all columns from the employees table
SELECT *
FROM employees;


-- 1.2 Select only specific columns
-- Best practice: always name the columns you need
SELECT
    employee_id,
    first_name,
    last_name,
    job_title,
    salary
FROM employees;


-- 1.3 Select with a calculated column
-- Adding a new column that calculates annual salary
SELECT
    first_name,
    last_name,
    salary          AS monthly_salary,
    salary * 12     AS annual_salary
FROM employees;


-- 1.4 DISTINCT — Get unique values only
-- Useful for checking what unique departments or cities exist
SELECT DISTINCT city
FROM employees;

SELECT DISTINCT job_title
FROM employees;


-- ============================================================
-- SECTION 2: WHERE — Filtering rows
-- ============================================================

-- 2.1 Filter employees earning more than 60,000
SELECT
    first_name,
    last_name,
    salary
FROM employees
WHERE salary > 60000;


-- 2.2 Filter by exact value — only Sales department (ID = 1)
SELECT
    first_name,
    last_name,
    department_id
FROM employees
WHERE department_id = 1;


-- 2.3 Filter using text — employees in Mumbai
SELECT
    first_name,
    last_name,
    city
FROM employees
WHERE city = 'Mumbai';


-- 2.4 Filter using AND — Mumbai employees earning above 50,000
SELECT
    first_name,
    last_name,
    city,
    salary
FROM employees
WHERE city = 'Mumbai'
  AND salary > 50000;


-- 2.5 Filter using OR — employees in Mumbai OR Delhi
SELECT
    first_name,
    last_name,
    city
FROM employees
WHERE city = 'Mumbai'
   OR city = 'Delhi';


-- 2.6 IN — shorthand for multiple OR conditions
-- Cleaner way to filter multiple cities
SELECT
    first_name,
    last_name,
    city
FROM employees
WHERE city IN ('Mumbai', 'Delhi', 'Bangalore');


-- 2.7 BETWEEN — employees with salary between 50,000 and 80,000
SELECT
    first_name,
    last_name,
    salary
FROM employees
WHERE salary BETWEEN 50000 AND 80000;


-- 2.8 LIKE — pattern matching
-- Find employees whose first name starts with 'A'
SELECT
    first_name,
    last_name
FROM employees
WHERE first_name LIKE 'A%';

-- Find employees whose job title contains the word 'Manager'
SELECT
    first_name,
    last_name,
    job_title
FROM employees
WHERE job_title LIKE '%Manager%';


-- 2.9 Filter active employees only
SELECT
    first_name,
    last_name,
    is_active
FROM employees
WHERE is_active = 'Yes';


-- 2.10 Filter orders by status — only Delivered orders
SELECT
    order_id,
    product_name,
    total_amount,
    status
FROM orders
WHERE status = 'Delivered';


-- ============================================================
-- SECTION 3: ORDER BY — Sorting results
-- ============================================================

-- 3.1 Sort employees by salary — highest to lowest (DESC)
SELECT
    first_name,
    last_name,
    salary
FROM employees
ORDER BY salary DESC;


-- 3.2 Sort employees by salary — lowest to highest (ASC)
SELECT
    first_name,
    last_name,
    salary
FROM employees
ORDER BY salary ASC;


-- 3.3 Sort by multiple columns
-- Sort by department first, then by salary within each department
SELECT
    first_name,
    last_name,
    department_id,
    salary
FROM employees
ORDER BY department_id ASC, salary DESC;


-- 3.4 Sort orders by order date — most recent first
SELECT
    order_id,
    product_name,
    order_date,
    total_amount
FROM orders
ORDER BY order_date DESC;


-- 3.5 Sort orders by total amount — largest orders first
SELECT
    order_id,
    product_name,
    total_amount
FROM orders
ORDER BY total_amount DESC;


-- ============================================================
-- SECTION 4: LIMIT — Restricting number of rows returned
-- ============================================================

-- 4.1 Get top 5 highest-paid employees
SELECT
    first_name,
    last_name,
    salary
FROM employees
ORDER BY salary DESC
LIMIT 5;


-- 4.2 Get the 3 most recent orders
SELECT
    order_id,
    product_name,
    order_date,
    total_amount
FROM orders
ORDER BY order_date DESC
LIMIT 3;


-- 4.3 Get top 5 largest orders by amount
SELECT
    order_id,
    product_name,
    total_amount
FROM orders
ORDER BY total_amount DESC
LIMIT 5;


-- 4.4 Get lowest 5 salaries (useful for HR review)
SELECT
    first_name,
    last_name,
    salary
FROM employees
ORDER BY salary ASC
LIMIT 5;
