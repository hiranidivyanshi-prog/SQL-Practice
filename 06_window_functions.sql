-- ============================================================
-- FILE: 06_window_functions.sql
-- TOPIC: Window Functions
-- CONCEPTS: ROW_NUMBER, RANK, DENSE_RANK, PARTITION BY, ORDER BY
-- ============================================================

-- Window functions perform calculations across a set of rows
-- related to the current row — without collapsing rows like
-- GROUP BY does. Each row keeps its own identity.

-- Syntax:
--   FUNCTION() OVER (
--       PARTITION BY column   -- defines the "window" or group
--       ORDER BY column       -- defines the order within that window
--   )

-- Key difference:
--   RANK()       → skips numbers after a tie (1, 1, 3, 4)
--   DENSE_RANK() → no gaps after a tie     (1, 1, 2, 3)
--   ROW_NUMBER() → always unique           (1, 2, 3, 4)


-- ============================================================
-- SECTION 1: ROW_NUMBER
-- Assigns a unique sequential number to each row
-- ============================================================

-- 1.1 Number all employees by salary (highest = 1)
SELECT
    ROW_NUMBER() OVER (ORDER BY salary DESC) AS row_num,
    first_name,
    last_name,
    salary
FROM employees;


-- 1.2 Number employees within each department by salary
-- PARTITION BY resets the count for each department
SELECT
    ROW_NUMBER() OVER (
        PARTITION BY department_id
        ORDER BY salary DESC
    )               AS rank_in_dept,
    department_id,
    first_name,
    last_name,
    salary
FROM employees
ORDER BY department_id, rank_in_dept;


-- 1.3 Get the top earner in each department
-- Use ROW_NUMBER in a subquery, then filter to row 1
SELECT
    department_id,
    first_name,
    last_name,
    salary
FROM (
    SELECT
        ROW_NUMBER() OVER (
            PARTITION BY department_id
            ORDER BY salary DESC
        ) AS row_num,
        department_id,
        first_name,
        last_name,
        salary
    FROM employees
) AS ranked
WHERE row_num = 1;


-- 1.4 Rank orders by customer — most recent order per customer
SELECT
    customer_id,
    order_id,
    order_date,
    total_amount
FROM (
    SELECT
        ROW_NUMBER() OVER (
            PARTITION BY customer_id
            ORDER BY order_date DESC
        ) AS row_num,
        customer_id,
        order_id,
        order_date,
        total_amount
    FROM orders
) AS recent_orders
WHERE row_num = 1
ORDER BY order_date DESC;


-- ============================================================
-- SECTION 2: RANK
-- Assigns rank with gaps when there are ties
-- (e.g. two employees tied at rank 1 → next rank is 3)
-- ============================================================

-- 2.1 Rank all employees by salary
SELECT
    RANK() OVER (ORDER BY salary DESC) AS salary_rank,
    first_name,
    last_name,
    salary
FROM employees;


-- 2.2 Rank employees within each department by salary
SELECT
    RANK() OVER (
        PARTITION BY department_id
        ORDER BY salary DESC
    )               AS salary_rank,
    department_id,
    first_name,
    last_name,
    salary
FROM employees
ORDER BY department_id, salary_rank;


-- 2.3 Rank sales employees by total annual sales in 2024
SELECT
    RANK() OVER (ORDER BY total_sales DESC) AS sales_rank,
    employee_id,
    total_sales
FROM (
    SELECT
        employee_id,
        SUM(sales_amount) AS total_sales
    FROM sales
    WHERE sale_year = 2024
    GROUP BY employee_id
) AS annual_sales;


-- 2.4 Rank orders by total amount within each product category
SELECT
    RANK() OVER (
        PARTITION BY category
        ORDER BY total_amount DESC
    )               AS rank_in_category,
    category,
    order_id,
    product_name,
    total_amount
FROM orders
ORDER BY category, rank_in_category;


-- ============================================================
-- SECTION 3: DENSE_RANK
-- Like RANK but without gaps — tied values share a rank,
-- and the next rank is always +1 (no skipping)
-- ============================================================

-- 3.1 Dense rank employees by salary
-- Compare with RANK to see the difference clearly
SELECT
    RANK()       OVER (ORDER BY salary DESC) AS rank_with_gaps,
    DENSE_RANK() OVER (ORDER BY salary DESC) AS dense_rank_no_gaps,
    first_name,
    last_name,
    salary
FROM employees;


-- 3.2 Dense rank within each department
SELECT
    DENSE_RANK() OVER (
        PARTITION BY department_id
        ORDER BY salary DESC
    )               AS dense_rank,
    department_id,
    first_name,
    last_name,
    salary
FROM employees
ORDER BY department_id, dense_rank;


-- 3.3 Get top 2 earners per department using DENSE_RANK
-- DENSE_RANK is better here because ties should both be included
SELECT
    department_id,
    first_name,
    last_name,
    salary,
    dense_rank
FROM (
    SELECT
        DENSE_RANK() OVER (
            PARTITION BY department_id
            ORDER BY salary DESC
        ) AS dense_rank,
        department_id,
        first_name,
        last_name,
        salary
    FROM employees
) AS ranked_employees
WHERE dense_rank <= 2
ORDER BY department_id, dense_rank;


-- ============================================================
-- SECTION 4: Side-by-side comparison
-- See ROW_NUMBER, RANK, and DENSE_RANK in a single query
-- ============================================================

-- 4.1 All three functions on the same data
-- Notice how they differ when salaries are the same
SELECT
    ROW_NUMBER() OVER (ORDER BY salary DESC) AS row_number,
    RANK()       OVER (ORDER BY salary DESC) AS rank,
    DENSE_RANK() OVER (ORDER BY salary DESC) AS dense_rank,
    first_name,
    last_name,
    salary
FROM employees
ORDER BY salary DESC;


-- ============================================================
-- SECTION 5: Practical business reporting with window functions
-- ============================================================

-- 5.1 Monthly sales with running total for 2024
-- See cumulative sales growing month by month
SELECT
    sale_month,
    monthly_sales,
    SUM(monthly_sales) OVER (
        ORDER BY month_number
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS running_total
FROM (
    SELECT
        sale_month,
        SUM(sales_amount) AS monthly_sales,
        ROW_NUMBER() OVER (ORDER BY MIN(sale_id)) AS month_number
    FROM sales
    WHERE sale_year = 2024
    GROUP BY sale_month
) AS monthly;


-- 5.2 Each employee's monthly sales vs their personal best month
-- Shows how each month compares to their peak performance
SELECT
    employee_id,
    sale_month,
    sales_amount,
    MAX(sales_amount) OVER (PARTITION BY employee_id) AS personal_best,
    ROUND(sales_amount /
          MAX(sales_amount) OVER (PARTITION BY employee_id) * 100, 1
    ) AS pct_of_personal_best
FROM sales
WHERE sale_year = 2024
ORDER BY employee_id, sale_month;
