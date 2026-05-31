-- ============================================================
-- FILE: 04_case_when.sql
-- TOPIC: Conditional Logic with CASE WHEN
-- CONCEPTS: CASE WHEN, salary banding, performance labels,
--           order categorisation, conditional aggregation
-- ============================================================

-- CASE WHEN is SQL's way of writing IF-THEN-ELSE logic.
-- It creates a new column based on conditions you define.

-- Syntax:
--   CASE
--     WHEN condition1 THEN result1
--     WHEN condition2 THEN result2
--     ELSE default_result
--   END AS column_alias


-- ============================================================
-- SECTION 1: Salary banding / categorisation
-- ============================================================

-- 1.1 Label employees by salary range
SELECT
    first_name,
    last_name,
    salary,
    CASE
        WHEN salary >= 80000 THEN 'Senior Band'
        WHEN salary >= 60000 THEN 'Mid Band'
        WHEN salary >= 40000 THEN 'Junior Band'
        ELSE 'Entry Level'
    END AS salary_band
FROM employees
ORDER BY salary DESC;


-- 1.2 Count of employees per salary band
SELECT
    CASE
        WHEN salary >= 80000 THEN 'Senior Band'
        WHEN salary >= 60000 THEN 'Mid Band'
        WHEN salary >= 40000 THEN 'Junior Band'
        ELSE 'Entry Level'
    END AS salary_band,
    COUNT(*) AS employee_count
FROM employees
GROUP BY salary_band
ORDER BY employee_count DESC;


-- ============================================================
-- SECTION 2: Sales performance labelling
-- ============================================================

-- 2.1 Label each sales record as above or below target
SELECT
    employee_id,
    sale_month,
    sales_amount,
    target_amount,
    CASE
        WHEN sales_amount >= target_amount THEN 'Target Met'
        ELSE 'Below Target'
    END AS performance_status
FROM sales
WHERE sale_year = 2024
ORDER BY employee_id, sale_month;


-- 2.2 More detailed performance tier labelling
SELECT
    employee_id,
    sale_month,
    sales_amount,
    target_amount,
    CASE
        WHEN sales_amount >= target_amount * 1.15 THEN 'Exceeded Target'
        WHEN sales_amount >= target_amount        THEN 'Met Target'
        WHEN sales_amount >= target_amount * 0.85 THEN 'Near Target'
        ELSE 'Below Target'
    END AS performance_label
FROM sales
WHERE sale_year = 2024
ORDER BY employee_id;


-- 2.3 Summary: How many months did each employee meet target?
SELECT
    employee_id,
    COUNT(*)                                        AS total_months,
    SUM(CASE WHEN sales_amount >= target_amount
             THEN 1 ELSE 0 END)                     AS months_target_met,
    SUM(CASE WHEN sales_amount < target_amount
             THEN 1 ELSE 0 END)                     AS months_below_target
FROM sales
WHERE sale_year = 2024
GROUP BY employee_id
ORDER BY months_target_met DESC;


-- ============================================================
-- SECTION 3: Order categorisation
-- ============================================================

-- 3.1 Label orders by size
SELECT
    order_id,
    product_name,
    total_amount,
    CASE
        WHEN total_amount >= 300000 THEN 'Large Order'
        WHEN total_amount >= 100000 THEN 'Medium Order'
        WHEN total_amount >= 30000  THEN 'Small Order'
        ELSE 'Micro Order'
    END AS order_size
FROM orders
ORDER BY total_amount DESC;


-- 3.2 Revenue breakdown by order size category
SELECT
    CASE
        WHEN total_amount >= 300000 THEN 'Large Order'
        WHEN total_amount >= 100000 THEN 'Medium Order'
        WHEN total_amount >= 30000  THEN 'Small Order'
        ELSE 'Micro Order'
    END AS order_size,
    COUNT(*)          AS order_count,
    SUM(total_amount) AS total_revenue
FROM orders
GROUP BY order_size
ORDER BY total_revenue DESC;


-- 3.3 Flag orders that need attention
SELECT
    order_id,
    product_name,
    total_amount,
    status,
    CASE
        WHEN status = 'Cancelled'               THEN 'Action Needed — Cancelled'
        WHEN status = 'Pending' AND
             total_amount > 100000              THEN 'Priority Follow-up'
        WHEN status = 'Pending'                 THEN 'Standard Follow-up'
        ELSE 'No Action Required'
    END AS action_flag
FROM orders
ORDER BY action_flag;


-- ============================================================
-- SECTION 4: Employee tenure categorisation
-- ============================================================

-- 4.1 Label employees by how long they have been with the company
-- Using hire_date to calculate years of service
SELECT
    first_name,
    last_name,
    hire_date,
    CASE
        WHEN hire_date <= '2017-12-31' THEN 'Veteran (7+ years)'
        WHEN hire_date <= '2020-12-31' THEN 'Experienced (4-7 years)'
        WHEN hire_date <= '2022-12-31' THEN 'Mid-tenure (2-4 years)'
        ELSE 'New Joiner (under 2 years)'
    END AS tenure_category
FROM employees
ORDER BY hire_date ASC;


-- ============================================================
-- SECTION 5: Conditional aggregation
-- Combining CASE WHEN inside aggregate functions
-- ============================================================

-- 5.1 Revenue split by order status in one row
-- Useful for executive summary reports
SELECT
    SUM(CASE WHEN status = 'Delivered' THEN total_amount ELSE 0 END) AS delivered_revenue,
    SUM(CASE WHEN status = 'Pending'   THEN total_amount ELSE 0 END) AS pending_revenue,
    SUM(CASE WHEN status = 'Cancelled' THEN total_amount ELSE 0 END) AS cancelled_revenue,
    SUM(total_amount)                                                  AS total_revenue
FROM orders;


-- 5.2 Order count by status pivoted into columns
SELECT
    COUNT(CASE WHEN status = 'Delivered' THEN 1 END) AS delivered_orders,
    COUNT(CASE WHEN status = 'Pending'   THEN 1 END) AS pending_orders,
    COUNT(CASE WHEN status = 'Cancelled' THEN 1 END) AS cancelled_orders,
    COUNT(*)                                          AS total_orders
FROM orders;
