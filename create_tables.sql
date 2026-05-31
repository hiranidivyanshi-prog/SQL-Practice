-- ============================================================
-- FILE: create_tables.sql
-- PURPOSE: Create all tables used in SQL Practice queries
-- Run this file first before inserting data
-- ============================================================


-- Drop tables if they already exist (for clean re-runs)
DROP TABLE IF EXISTS sales;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS departments;
DROP TABLE IF EXISTS customers;


-- ------------------------------------------------------------
-- TABLE: departments
-- Stores department information
-- ------------------------------------------------------------
CREATE TABLE departments (
    department_id   INT PRIMARY KEY,
    department_name VARCHAR(50) NOT NULL,
    location        VARCHAR(50),
    manager_name    VARCHAR(100)
);


-- ------------------------------------------------------------
-- TABLE: employees
-- Stores employee records linked to departments
-- ------------------------------------------------------------
CREATE TABLE employees (
    employee_id     INT PRIMARY KEY,
    first_name      VARCHAR(50) NOT NULL,
    last_name       VARCHAR(50) NOT NULL,
    department_id   INT,
    job_title       VARCHAR(100),
    salary          DECIMAL(10, 2),
    hire_date       DATE,
    city            VARCHAR(50),
    is_active       VARCHAR(3) DEFAULT 'Yes',
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);


-- ------------------------------------------------------------
-- TABLE: customers
-- Stores customer master data
-- ------------------------------------------------------------
CREATE TABLE customers (
    customer_id     INT PRIMARY KEY,
    customer_name   VARCHAR(100) NOT NULL,
    city            VARCHAR(50),
    segment         VARCHAR(50),
    email           VARCHAR(100)
);


-- ------------------------------------------------------------
-- TABLE: orders
-- Stores customer order transactions
-- ------------------------------------------------------------
CREATE TABLE orders (
    order_id        INT PRIMARY KEY,
    customer_id     INT,
    order_date      DATE,
    product_name    VARCHAR(100),
    category        VARCHAR(50),
    quantity        INT,
    unit_price      DECIMAL(10, 2),
    total_amount    DECIMAL(10, 2),
    status          VARCHAR(20),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);


-- ------------------------------------------------------------
-- TABLE: sales
-- Stores monthly sales performance by employee
-- ------------------------------------------------------------
CREATE TABLE sales (
    sale_id         INT PRIMARY KEY,
    employee_id     INT,
    sale_month      VARCHAR(20),
    sale_year       INT,
    region          VARCHAR(50),
    sales_amount    DECIMAL(10, 2),
    units_sold      INT,
    target_amount   DECIMAL(10, 2),
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);
