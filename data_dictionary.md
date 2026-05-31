# Data Dictionary

Description of all tables and columns used in this SQL Practice repository.

---

## Table: `departments`

| Column | Type | Description |
|---|---|---|
| department_id | INT | Primary key |
| department_name | VARCHAR | Name of the department |
| location | VARCHAR | City where the department is based |
| manager_name | VARCHAR | Name of the department manager |

---

## Table: `employees`

| Column | Type | Description |
|---|---|---|
| employee_id | INT | Primary key |
| first_name | VARCHAR | Employee first name |
| last_name | VARCHAR | Employee last name |
| department_id | INT | Foreign key → departments |
| job_title | VARCHAR | Employee job designation |
| salary | DECIMAL | Monthly salary in INR |
| hire_date | DATE | Date employee joined |
| city | VARCHAR | City of posting |
| is_active | VARCHAR | Whether employee is currently active (Yes/No) |

---

## Table: `customers`

| Column | Type | Description |
|---|---|---|
| customer_id | INT | Primary key |
| customer_name | VARCHAR | Company or customer name |
| city | VARCHAR | Customer's city |
| segment | VARCHAR | Business segment: Enterprise, Mid-Market, SMB |
| email | VARCHAR | Contact email address |

---

## Table: `orders`

| Column | Type | Description |
|---|---|---|
| order_id | INT | Primary key |
| customer_id | INT | Foreign key → customers |
| order_date | DATE | Date the order was placed |
| product_name | VARCHAR | Name of the product ordered |
| category | VARCHAR | Product category: Software, Hardware, Furniture |
| quantity | INT | Number of units ordered |
| unit_price | DECIMAL | Price per unit in INR |
| total_amount | DECIMAL | Total order value (quantity × unit_price) |
| status | VARCHAR | Order status: Delivered, Pending, Cancelled |

---

## Table: `sales`

| Column | Type | Description |
|---|---|---|
| sale_id | INT | Primary key |
| employee_id | INT | Foreign key → employees |
| sale_month | VARCHAR | Month name (January, February…) |
| sale_year | INT | Year of the sale |
| region | VARCHAR | Sales region |
| sales_amount | DECIMAL | Actual sales amount achieved in INR |
| units_sold | INT | Number of units sold |
| target_amount | DECIMAL | Monthly sales target in INR |

---

## Relationships

```
departments ──< employees ──< sales
customers   ──< orders
```

- One department can have many employees
- One employee can have many sales records (one per month)
- One customer can have many orders

---

*All data is fictional and created for SQL practice purposes.*
