# SQL Practice — Data Analyst Portfolio

A structured collection of SQL practice queries using realistic business datasets.
Covers beginner-to-intermediate concepts commonly tested in Data Analyst, MIS Analyst,
and Reporting Analyst interviews.

---

## About This Repository

This repository demonstrates practical SQL skills through business-oriented examples
using employee, sales, and orders data. Each file is focused on a specific concept
with clear comments explaining the logic behind every query.

**Skill Level:** Beginner to Intermediate  
**Use Case:** Data Analyst Portfolio | Interview Preparation | SQL Practice  

---

## Folder Structure

```
SQL-Practice/
│
├── datasets/
│   ├── create_tables.sql        -- Table creation scripts
│   └── insert_data.sql          -- Sample data for all tables
│
├── queries/
│   ├── 01_basic_queries.sql     -- SELECT, WHERE, ORDER BY, LIMIT
│   ├── 02_aggregate_functions.sql -- COUNT, SUM, AVG, MAX, MIN, GROUP BY, HAVING
│   ├── 03_joins.sql             -- INNER JOIN, LEFT JOIN, RIGHT JOIN
│   ├── 04_case_when.sql         -- Conditional logic with CASE WHEN
│   ├── 05_subqueries.sql        -- Nested queries and subquery patterns
│   └── 06_window_functions.sql  -- ROW_NUMBER, RANK, DENSE_RANK
│
├── docs/
│   └── data_dictionary.md       -- Table and column descriptions
│
└── README.md
```

---

## Datasets Used

| Table | Description | Rows |
|---|---|---|
| `employees` | Employee records including department, salary, hire date | 20 rows |
| `departments` | Department names and manager info | 5 rows |
| `sales` | Monthly sales transactions by employee | 50 rows |
| `orders` | Customer orders with product and amount details | 40 rows |
| `customers` | Customer master data | 15 rows |

---

## Topics Covered

| File | Concepts |
|---|---|
| `01_basic_queries.sql` | SELECT, WHERE, ORDER BY, LIMIT, DISTINCT |
| `02_aggregate_functions.sql` | COUNT, SUM, AVG, MAX, MIN, GROUP BY, HAVING |
| `03_joins.sql` | INNER JOIN, LEFT JOIN, RIGHT JOIN |
| `04_case_when.sql` | CASE WHEN, conditional grouping, salary banding |
| `05_subqueries.sql` | Subqueries in WHERE, FROM, SELECT clauses |
| `06_window_functions.sql` | ROW_NUMBER, RANK, DENSE_RANK, partitioning |

---

## How to Use

1. Run `datasets/create_tables.sql` first to create all tables
2. Run `datasets/insert_data.sql` to load sample data
3. Open any file in the `queries/` folder and run queries in order

Compatible with **MySQL**, **PostgreSQL**, and **SQLite** with minor syntax adjustments.

---

## Skills Demonstrated

- Data retrieval and filtering
- Aggregation and summarisation for business reporting
- Multi-table joins for relational data analysis
- Conditional logic for data categorisation
- Subqueries for nested business logic
- Window functions for ranking and comparative analysis

---

*Built as part of a Data Analyst portfolio. Dataset values are fictional and for practice purposes only.*
