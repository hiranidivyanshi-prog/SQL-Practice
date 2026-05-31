-- ============================================================
-- FILE: 05_subqueries.sql
-- TOPIC: Subqueries
-- CONCEPTS: Subquery in WHERE, subquery in FROM,
--           subquery in SELECT, correlated subquery
-- ============================================================

-- A subquery is a query written inside another query.
-- It runs first and its result is used by the outer query.
-- Subqueries can appear in the WHERE, FROM, or SELECT clause.


-- ============================================================
-- SECTION 1: Subquery in WHERE clause
-- Filter rows based on a value calculated by the subquery
-- ============================================================

-- 1.1 Find employees earning above the company average salary
-- The subquery calculates the average; the outer query filters
SELECT
    first_name,
    last_name,
    salary
FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees)
ORDER BY salary DESC;


-- 1.2 Find the employee(s) with the highest salary
SELECT
    first_name,
    last_name,
    salary
FROM employees
WHERE salary = (SELECT MAX(salary) FROM employees);


-- 1.3 Find orders above the average order value
SELECT
    order_id,
    product_name,
    total_amount
FROM orders
WHERE total_amount > (SELECT AVG(total_amount) FROM orders)
ORDER BY total_amount DESC;


-- 1.4 Find employees who made at least one sale in 2024
-- IN with subquery: check if employee_id exists in the sales table
SELECT
    first_name,
    last_name,
    job_title
FROM employees
WHERE employee_id IN (
    SELECT DISTINCT employee_id
    FROM sales
    WHERE sale_year = 2024
);


-- 1.5 Find employees who have NOT made any sales
-- NOT IN: employees whose ID does not appear in the sales table
SELECT
    first_name,
    last_name,
    job_title
FROM employees
WHERE employee_id NOT IN (
    SELECT DISTINCT employee_id FROM sales
);


-- 1.6 Find customers who placed orders above 200,000
SELECT
    customer_name,
    city,
    segment
FROM customers
WHERE customer_id IN (
    SELECT customer_id
    FROM orders
    WHERE total_amount > 200000
);


-- ============================================================
-- SECTION 2: Subquery in FROM clause (Derived Table)
-- The subquery creates a temporary result set that the outer
-- query treats like a regular table
-- ============================================================

-- 2.1 Get employees above average salary, with their department
-- First, the subquery calculates avg salary per department.
-- Then the outer query joins it to get the department name.
SELECT
    e.first_name,
    e.last_name,
    e.salary,
    e.department_id
FROM employees e
JOIN (
    SELECT
        department_id,
        AVG(salary) AS dept_avg_salary
    FROM employees
    GROUP BY department_id
) AS dept_avg
ON e.department_id = dept_avg.department_id
WHERE e.salary > dept_avg.dept_avg_salary
ORDER BY e.department_id, e.salary DESC;


-- 2.2 Monthly sales summary with target hit rate
-- Subquery builds a summary, outer query adds the hit rate label
SELECT
    monthly_summary.sale_month,
    monthly_summary.total_sales,
    monthly_summary.months_above_target,
    CASE
        WHEN monthly_summary.months_above_target >= 3 THEN 'Strong Month'
        WHEN monthly_summary.months_above_target >= 1 THEN 'Average Month'
        ELSE 'Weak Month'
    END AS month_rating
FROM (
    SELECT
        sale_month,
        SUM(sales_amount)                                          AS total_sales,
        SUM(CASE WHEN sales_amount >= target_amount THEN 1 END)    AS months_above_target
    FROM sales
    WHERE sale_year = 2024
    GROUP BY sale_month
) AS monthly_summary
ORDER BY total_sales DESC;


-- 2.3 Top 3 customers by revenue using a subquery
SELECT
    customer_revenue.customer_id,
    customer_revenue.total_revenue
FROM (
    SELECT
        customer_id,
        SUM(total_amount) AS total_revenue
    FROM orders
    GROUP BY customer_id
    ORDER BY total_revenue DESC
    LIMIT 3
) AS customer_revenue;


-- ============================================================
-- SECTION 3: Subquery in SELECT clause (Scalar subquery)
-- Returns a single value for each row in the outer query
-- ============================================================

-- 3.1 Show each employee's salary alongside the company average
-- The subquery runs once per row and returns the same value
SELECT
    first_name,
    last_name,
    salary,
    (SELECT ROUND(AVG(salary), 0) FROM employees) AS company_avg_salary,
    salary - (SELECT AVG(salary) FROM employees)  AS diff_from_avg
FROM employees
ORDER BY salary DESC;


-- 3.2 Show each order with the total revenue context
SELECT
    order_id,
    product_name,
    total_amount,
    (SELECT SUM(total_amount) FROM orders)           AS company_total_revenue,
    ROUND(total_amount /
         (SELECT SUM(total_amount) FROM orders) * 100, 2) AS pct_of_total
FROM orders
ORDER BY total_amount DESC
LIMIT 10;


-- ============================================================
-- SECTION 4: Practical reporting with subqueries
-- ============================================================

-- 4.1 Employees who earned more than their department's average
SELECT
    e.first_name,
    e.last_name,
    e.salary,
    e.department_id
FROM employees e
WHERE e.salary > (
    SELECT AVG(e2.salary)
    FROM employees e2
    WHERE e2.department_id = e.department_id
)
ORDER BY e.department_id, e.salary DESC;


-- 4.2 Best performing month overall (by total sales)
SELECT
    sale_month,
    SUM(sales_amount) AS total_sales
FROM sales
WHERE sale_year = 2024
GROUP BY sale_month
HAVING SUM(sales_amount) = (
    SELECT MAX(monthly_total)
    FROM (
        SELECT SUM(sales_amount) AS monthly_total
        FROM sales
        WHERE sale_year = 2024
        GROUP BY sale_month
    ) AS month_totals
);
