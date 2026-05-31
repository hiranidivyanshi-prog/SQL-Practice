-- ============================================================
-- FILE: 02_aggregate_functions.sql
-- TOPIC: Aggregate Functions
-- CONCEPTS: COUNT, SUM, AVG, MAX, MIN, GROUP BY, HAVING
-- ============================================================


-- ============================================================
-- SECTION 1: COUNT — Counting rows
-- ============================================================

-- 1.1 Count total number of employees
SELECT COUNT(*) AS total_employees
FROM employees;


-- 1.2 Count only active employees
SELECT COUNT(*) AS active_employees
FROM employees
WHERE is_active = 'Yes';


-- 1.3 Count total number of orders
SELECT COUNT(*) AS total_orders
FROM orders;


-- 1.4 Count orders by status
-- How many orders are Delivered, Pending, or Cancelled?
SELECT
    status,
    COUNT(*) AS order_count
FROM orders
GROUP BY status;


-- ============================================================
-- SECTION 2: SUM — Adding up values
-- ============================================================

-- 2.1 Total salary cost for all employees
SELECT SUM(salary) AS total_salary_cost
FROM employees;


-- 2.2 Total revenue from all orders
SELECT SUM(total_amount) AS total_revenue
FROM orders;


-- 2.3 Total revenue from Delivered orders only
SELECT SUM(total_amount) AS delivered_revenue
FROM orders
WHERE status = 'Delivered';


-- 2.4 Total sales amount by employee in 2024
SELECT
    employee_id,
    SUM(sales_amount) AS total_sales_2024
FROM sales
WHERE sale_year = 2024
GROUP BY employee_id
ORDER BY total_sales_2024 DESC;


-- ============================================================
-- SECTION 3: AVG — Calculating averages
-- ============================================================

-- 3.1 Average salary across all employees
SELECT AVG(salary) AS avg_salary
FROM employees;


-- 3.2 Average salary by department
SELECT
    department_id,
    AVG(salary) AS avg_salary
FROM employees
GROUP BY department_id
ORDER BY avg_salary DESC;


-- 3.3 Average order value overall
SELECT AVG(total_amount) AS avg_order_value
FROM orders;


-- 3.4 Average monthly sales per employee
SELECT
    employee_id,
    ROUND(AVG(sales_amount), 2) AS avg_monthly_sales
FROM sales
GROUP BY employee_id
ORDER BY avg_monthly_sales DESC;


-- ============================================================
-- SECTION 4: MAX and MIN — Finding highest and lowest values
-- ============================================================

-- 4.1 Highest and lowest salary in the company
SELECT
    MAX(salary) AS highest_salary,
    MIN(salary) AS lowest_salary
FROM employees;


-- 4.2 Largest and smallest single order
SELECT
    MAX(total_amount) AS largest_order,
    MIN(total_amount) AS smallest_order
FROM orders;


-- 4.3 Max and min salary by department
SELECT
    department_id,
    MAX(salary) AS highest_salary,
    MIN(salary) AS lowest_salary
FROM employees
GROUP BY department_id
ORDER BY department_id;


-- 4.4 Best and worst monthly sales performance per employee
SELECT
    employee_id,
    MAX(sales_amount) AS best_month_sales,
    MIN(sales_amount) AS worst_month_sales
FROM sales
GROUP BY employee_id;


-- ============================================================
-- SECTION 5: GROUP BY — Grouping rows for aggregation
-- ============================================================

-- 5.1 Total revenue by product category
SELECT
    category,
    COUNT(*)            AS total_orders,
    SUM(total_amount)   AS total_revenue
FROM orders
GROUP BY category
ORDER BY total_revenue DESC;


-- 5.2 Number of employees per department
SELECT
    department_id,
    COUNT(*) AS employee_count
FROM employees
GROUP BY department_id
ORDER BY employee_count DESC;


-- 5.3 Total revenue by month in 2024
-- Useful for monthly business reporting
SELECT
    sale_month,
    SUM(sales_amount)  AS total_sales,
    SUM(units_sold)    AS total_units
FROM sales
WHERE sale_year = 2024
GROUP BY sale_month;


-- 5.4 Sales performance summary by employee for 2024
SELECT
    employee_id,
    COUNT(*)                    AS months_active,
    SUM(sales_amount)           AS total_sales,
    ROUND(AVG(sales_amount), 0) AS avg_monthly_sales,
    MAX(sales_amount)           AS best_month,
    MIN(sales_amount)           AS worst_month
FROM sales
WHERE sale_year = 2024
GROUP BY employee_id
ORDER BY total_sales DESC;


-- 5.5 Order summary by customer segment (via customers table)
-- Count and revenue by customer segment
SELECT
    c.segment,
    COUNT(o.order_id)         AS total_orders,
    SUM(o.total_amount)       AS total_revenue,
    ROUND(AVG(o.total_amount), 0) AS avg_order_value
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
GROUP BY c.segment
ORDER BY total_revenue DESC;


-- ============================================================
-- SECTION 6: HAVING — Filtering after GROUP BY
-- HAVING filters on aggregated results (WHERE cannot do this)
-- ============================================================

-- 6.1 Departments with more than 2 employees
-- WHERE cannot be used here because we're filtering on COUNT
SELECT
    department_id,
    COUNT(*) AS employee_count
FROM employees
GROUP BY department_id
HAVING COUNT(*) > 2;


-- 6.2 Employees whose total 2024 sales exceeded 700,000
SELECT
    employee_id,
    SUM(sales_amount) AS total_sales
FROM sales
WHERE sale_year = 2024
GROUP BY employee_id
HAVING SUM(sales_amount) > 700000
ORDER BY total_sales DESC;


-- 6.3 Product categories with total revenue above 500,000
SELECT
    category,
    SUM(total_amount) AS total_revenue
FROM orders
GROUP BY category
HAVING SUM(total_amount) > 500000
ORDER BY total_revenue DESC;


-- 6.4 Months where average sales exceeded the target
-- Sales months where average performance beat 60,000
SELECT
    sale_month,
    ROUND(AVG(sales_amount), 0) AS avg_sales
FROM sales
WHERE sale_year = 2024
GROUP BY sale_month
HAVING AVG(sales_amount) > 60000;


-- 6.5 Combining WHERE and HAVING
-- From Delivered orders only, show categories with revenue > 200,000
SELECT
    category,
    COUNT(*)          AS total_orders,
    SUM(total_amount) AS total_revenue
FROM orders
WHERE status = 'Delivered'
GROUP BY category
HAVING SUM(total_amount) > 200000
ORDER BY total_revenue DESC;
