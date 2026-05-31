-- ============================================================
-- FILE: 03_joins.sql
-- TOPIC: SQL Joins
-- CONCEPTS: INNER JOIN, LEFT JOIN, RIGHT JOIN
-- ============================================================

-- QUICK REFERENCE:
-- INNER JOIN  → Only rows that match in BOTH tables
-- LEFT JOIN   → All rows from left table + matching rows from right
-- RIGHT JOIN  → All rows from right table + matching rows from left


-- ============================================================
-- SECTION 1: INNER JOIN
-- Returns only rows where there is a match in both tables
-- ============================================================

-- 1.1 Employee names with their department names
-- Only employees who have a valid department will appear
SELECT
    e.employee_id,
    e.first_name,
    e.last_name,
    e.job_title,
    d.department_name
FROM employees e
INNER JOIN departments d ON e.department_id = d.department_id;


-- 1.2 Employee full details with department and city
SELECT
    e.first_name,
    e.last_name,
    e.salary,
    e.city,
    d.department_name,
    d.manager_name
FROM employees e
INNER JOIN departments d ON e.department_id = d.department_id
ORDER BY d.department_name, e.salary DESC;


-- 1.3 Orders with customer names
-- Only orders that have a matching customer record
SELECT
    o.order_id,
    c.customer_name,
    c.segment,
    o.product_name,
    o.total_amount,
    o.status
FROM orders o
INNER JOIN customers c ON o.customer_id = c.customer_id
ORDER BY o.order_date DESC;


-- 1.4 Sales records with employee names
-- Match each sale row to the employee who made it
SELECT
    s.sale_id,
    e.first_name,
    e.last_name,
    s.sale_month,
    s.sale_year,
    s.sales_amount,
    s.target_amount
FROM sales s
INNER JOIN employees e ON s.employee_id = e.employee_id
ORDER BY s.sale_year, s.employee_id;


-- 1.5 Three-table join — Sales with employee name and department
SELECT
    e.first_name,
    e.last_name,
    d.department_name,
    s.sale_month,
    s.sales_amount
FROM sales s
INNER JOIN employees e   ON s.employee_id   = e.employee_id
INNER JOIN departments d ON e.department_id = d.department_id
ORDER BY s.sale_month, s.sales_amount DESC;


-- ============================================================
-- SECTION 2: LEFT JOIN
-- Returns ALL rows from the LEFT table, plus matching rows
-- from the right table. Non-matching rows show NULL.
-- ============================================================

-- 2.1 All employees, including those without department records
-- If an employee has no department, department_name will be NULL
SELECT
    e.employee_id,
    e.first_name,
    e.last_name,
    d.department_name
FROM employees e
LEFT JOIN departments d ON e.department_id = d.department_id;


-- 2.2 All customers, even those who have never placed an order
-- Useful for identifying inactive customers
SELECT
    c.customer_id,
    c.customer_name,
    c.segment,
    COUNT(o.order_id)   AS total_orders,
    SUM(o.total_amount) AS total_spent
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name, c.segment
ORDER BY total_orders DESC;


-- 2.3 Find customers who have NEVER placed an order
-- NULL in order_id means no orders exist for that customer
SELECT
    c.customer_id,
    c.customer_name,
    c.city
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;


-- 2.4 All employees with their 2024 total sales
-- Employees with no sales records will show NULL
SELECT
    e.first_name,
    e.last_name,
    e.job_title,
    SUM(s.sales_amount) AS total_sales_2024
FROM employees e
LEFT JOIN sales s ON e.employee_id = s.employee_id
         AND s.sale_year = 2024
GROUP BY e.employee_id, e.first_name, e.last_name, e.job_title
ORDER BY total_sales_2024 DESC;


-- ============================================================
-- SECTION 3: RIGHT JOIN
-- Returns ALL rows from the RIGHT table, plus matching rows
-- from the left table. Non-matching rows show NULL.
-- ============================================================

-- 3.1 All departments, even if no employees are assigned
-- If a department has no employees, employee columns show NULL
SELECT
    d.department_name,
    d.location,
    e.first_name,
    e.last_name,
    e.salary
FROM employees e
RIGHT JOIN departments d ON e.department_id = d.department_id
ORDER BY d.department_name;


-- 3.2 All departments with employee count
-- Departments with zero employees will show 0
SELECT
    d.department_name,
    COUNT(e.employee_id) AS employee_count
FROM employees e
RIGHT JOIN departments d ON e.department_id = d.department_id
GROUP BY d.department_name
ORDER BY employee_count DESC;


-- 3.3 All departments with their total salary budget
SELECT
    d.department_name,
    COUNT(e.employee_id)    AS headcount,
    SUM(e.salary)           AS total_salary_budget,
    ROUND(AVG(e.salary), 0) AS avg_salary
FROM employees e
RIGHT JOIN departments d ON e.department_id = d.department_id
GROUP BY d.department_name
ORDER BY total_salary_budget DESC;


-- ============================================================
-- SECTION 4: Practical business reporting using joins
-- ============================================================

-- 4.1 Revenue report by department
-- Which department's employees are generating the most sales?
SELECT
    d.department_name,
    COUNT(DISTINCT e.employee_id)   AS sales_reps,
    SUM(s.sales_amount)             AS total_sales,
    ROUND(AVG(s.sales_amount), 0)   AS avg_sales_per_month
FROM sales s
INNER JOIN employees e   ON s.employee_id   = e.employee_id
INNER JOIN departments d ON e.department_id = d.department_id
GROUP BY d.department_name
ORDER BY total_sales DESC;


-- 4.2 Customer order report with city and segment
SELECT
    c.customer_name,
    c.city,
    c.segment,
    COUNT(o.order_id)             AS total_orders,
    SUM(o.total_amount)           AS total_revenue,
    ROUND(AVG(o.total_amount), 0) AS avg_order_value,
    MAX(o.order_date)             AS last_order_date
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name, c.city, c.segment
ORDER BY total_revenue DESC;
