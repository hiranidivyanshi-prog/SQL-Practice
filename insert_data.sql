-- ============================================================
-- FILE: insert_data.sql
-- PURPOSE: Insert sample data into all tables
-- Run this after create_tables.sql
-- ============================================================


-- ------------------------------------------------------------
-- DEPARTMENTS
-- ------------------------------------------------------------
INSERT INTO departments VALUES (1, 'Sales',        'Mumbai',    'Rajesh Kumar');
INSERT INTO departments VALUES (2, 'Marketing',    'Delhi',     'Priya Sharma');
INSERT INTO departments VALUES (3, 'Operations',   'Lucknow',   'Amit Verma');
INSERT INTO departments VALUES (4, 'Finance',      'Bangalore', 'Sunita Rao');
INSERT INTO departments VALUES (5, 'HR',           'Hyderabad', 'Neha Singh');


-- ------------------------------------------------------------
-- EMPLOYEES
-- ------------------------------------------------------------
INSERT INTO employees VALUES (101, 'Aditya',   'Mehta',    1, 'Sales Executive',     52000, '2021-03-15', 'Mumbai',    'Yes');
INSERT INTO employees VALUES (102, 'Pooja',    'Sharma',   1, 'Senior Sales Exec',   68000, '2020-07-01', 'Mumbai',    'Yes');
INSERT INTO employees VALUES (103, 'Rohit',    'Verma',    2, 'Marketing Analyst',   55000, '2022-01-10', 'Delhi',     'Yes');
INSERT INTO employees VALUES (104, 'Sneha',    'Gupta',    2, 'Marketing Executive', 47000, '2022-06-20', 'Delhi',     'Yes');
INSERT INTO employees VALUES (105, 'Karan',    'Joshi',    3, 'Operations Analyst',  60000, '2019-11-05', 'Lucknow',   'Yes');
INSERT INTO employees VALUES (106, 'Divya',    'Nair',     3, 'Operations Exec',     43000, '2023-02-28', 'Lucknow',   'Yes');
INSERT INTO employees VALUES (107, 'Vikram',   'Singh',    4, 'Finance Analyst',     72000, '2018-09-12', 'Bangalore', 'Yes');
INSERT INTO employees VALUES (108, 'Ananya',   'Pillai',   4, 'Senior Accountant',   78000, '2017-04-03', 'Bangalore', 'Yes');
INSERT INTO employees VALUES (109, 'Manish',   'Tiwari',   5, 'HR Executive',        45000, '2023-08-01', 'Hyderabad', 'Yes');
INSERT INTO employees VALUES (110, 'Ritika',   'Agarwal',  5, 'HR Manager',          80000, '2016-12-15', 'Hyderabad', 'Yes');
INSERT INTO employees VALUES (111, 'Sameer',   'Khan',     1, 'Sales Executive',     50000, '2022-03-01', 'Mumbai',    'Yes');
INSERT INTO employees VALUES (112, 'Deepika',  'Reddy',    2, 'Marketing Manager',   85000, '2015-08-20', 'Delhi',     'Yes');
INSERT INTO employees VALUES (113, 'Arjun',    'Patel',    3, 'Operations Manager',  90000, '2014-05-10', 'Lucknow',   'No');
INSERT INTO employees VALUES (114, 'Kavita',   'Mishra',   4, 'Finance Executive',   55000, '2021-11-01', 'Bangalore', 'Yes');
INSERT INTO employees VALUES (115, 'Nikhil',   'Sharma',   1, 'Sales Manager',       95000, '2013-02-14', 'Mumbai',    'Yes');


-- ------------------------------------------------------------
-- CUSTOMERS
-- ------------------------------------------------------------
INSERT INTO customers VALUES (1,  'Reliance Industries',  'Mumbai',    'Enterprise', 'contact@reliance.com');
INSERT INTO customers VALUES (2,  'Tata Consultancy',     'Mumbai',    'Enterprise', 'info@tcs.com');
INSERT INTO customers VALUES (3,  'Infosys Ltd',          'Bangalore', 'Enterprise', 'info@infosys.com');
INSERT INTO customers VALUES (4,  'Wipro Technologies',   'Bangalore', 'Mid-Market', 'info@wipro.com');
INSERT INTO customers VALUES (5,  'HCL Technologies',     'Delhi',     'Mid-Market', 'info@hcl.com');
INSERT INTO customers VALUES (6,  'Mahindra Group',       'Mumbai',    'Enterprise', 'info@mahindra.com');
INSERT INTO customers VALUES (7,  'Bajaj Auto',           'Pune',      'Mid-Market', 'info@bajaj.com');
INSERT INTO customers VALUES (8,  'HDFC Bank',            'Mumbai',    'Enterprise', 'info@hdfc.com');
INSERT INTO customers VALUES (9,  'Larsen & Toubro',      'Mumbai',    'Enterprise', 'info@landt.com');
INSERT INTO customers VALUES (10, 'Zomato Ltd',           'Delhi',     'SMB',        'info@zomato.com');
INSERT INTO customers VALUES (11, 'Byju''s',              'Bangalore', 'SMB',        'info@byjus.com');
INSERT INTO customers VALUES (12, 'Nykaa',                'Mumbai',    'SMB',        'info@nykaa.com');
INSERT INTO customers VALUES (13, 'Swiggy',               'Bangalore', 'SMB',        'info@swiggy.com');
INSERT INTO customers VALUES (14, 'Ola Cabs',             'Bangalore', 'Mid-Market', 'info@olacabs.com');
INSERT INTO customers VALUES (15, 'PhonePe',              'Bangalore', 'Mid-Market', 'info@phonepe.com');


-- ------------------------------------------------------------
-- ORDERS
-- ------------------------------------------------------------
INSERT INTO orders VALUES (1001, 1,  '2024-01-05', 'CRM Software License',   'Software',  2,  25000, 50000,  'Delivered');
INSERT INTO orders VALUES (1002, 2,  '2024-01-12', 'Cloud Storage Plan',     'Software',  5,  8000,  40000,  'Delivered');
INSERT INTO orders VALUES (1003, 3,  '2024-01-18', 'Analytics Dashboard',    'Software',  1,  45000, 45000,  'Delivered');
INSERT INTO orders VALUES (1004, 4,  '2024-02-02', 'ERP Module',             'Software',  1,  80000, 80000,  'Pending');
INSERT INTO orders VALUES (1005, 5,  '2024-02-10', 'Laptop x10',             'Hardware',  10, 60000, 600000, 'Delivered');
INSERT INTO orders VALUES (1006, 6,  '2024-02-14', 'Office Chairs x20',      'Furniture', 20, 4500,  90000,  'Delivered');
INSERT INTO orders VALUES (1007, 7,  '2024-02-20', 'Printer x3',             'Hardware',  3,  12000, 36000,  'Cancelled');
INSERT INTO orders VALUES (1008, 8,  '2024-03-01', 'CRM Software License',   'Software',  3,  25000, 75000,  'Delivered');
INSERT INTO orders VALUES (1009, 9,  '2024-03-08', 'Desk x15',               'Furniture', 15, 6000,  90000,  'Delivered');
INSERT INTO orders VALUES (1010, 10, '2024-03-15', 'Accounting Software',    'Software',  1,  35000, 35000,  'Pending');
INSERT INTO orders VALUES (1011, 11, '2024-03-22', 'Cloud Storage Plan',     'Software',  2,  8000,  16000,  'Delivered');
INSERT INTO orders VALUES (1012, 12, '2024-04-01', 'Laptop x5',              'Hardware',  5,  60000, 300000, 'Delivered');
INSERT INTO orders VALUES (1013, 13, '2024-04-10', 'Office Chairs x10',      'Furniture', 10, 4500,  45000,  'Delivered');
INSERT INTO orders VALUES (1014, 14, '2024-04-18', 'Analytics Dashboard',    'Software',  2,  45000, 90000,  'Pending');
INSERT INTO orders VALUES (1015, 15, '2024-04-25', 'ERP Module',             'Software',  1,  80000, 80000,  'Delivered');
INSERT INTO orders VALUES (1016, 1,  '2024-05-03', 'Laptop x8',              'Hardware',  8,  60000, 480000, 'Delivered');
INSERT INTO orders VALUES (1017, 2,  '2024-05-10', 'CRM Software License',   'Software',  4,  25000, 100000, 'Delivered');
INSERT INTO orders VALUES (1018, 3,  '2024-05-20', 'Office Chairs x30',      'Furniture', 30, 4500,  135000, 'Delivered');
INSERT INTO orders VALUES (1019, 4,  '2024-06-05', 'Accounting Software',    'Software',  2,  35000, 70000,  'Cancelled');
INSERT INTO orders VALUES (1020, 5,  '2024-06-15', 'Printer x5',             'Hardware',  5,  12000, 60000,  'Delivered');
INSERT INTO orders VALUES (1021, 6,  '2024-07-01', 'Cloud Storage Plan',     'Software',  10, 8000,  80000,  'Delivered');
INSERT INTO orders VALUES (1022, 7,  '2024-07-12', 'Analytics Dashboard',    'Software',  3,  45000, 135000, 'Delivered');
INSERT INTO orders VALUES (1023, 8,  '2024-07-20', 'Desk x25',               'Furniture', 25, 6000,  150000, 'Pending');
INSERT INTO orders VALUES (1024, 9,  '2024-08-05', 'Laptop x12',             'Hardware',  12, 60000, 720000, 'Delivered');
INSERT INTO orders VALUES (1025, 10, '2024-08-15', 'ERP Module',             'Software',  2,  80000, 160000, 'Delivered');
INSERT INTO orders VALUES (1026, 11, '2024-09-01', 'CRM Software License',   'Software',  1,  25000, 25000,  'Delivered');
INSERT INTO orders VALUES (1027, 12, '2024-09-10', 'Office Chairs x50',      'Furniture', 50, 4500,  225000, 'Delivered');
INSERT INTO orders VALUES (1028, 13, '2024-09-18', 'Accounting Software',    'Software',  1,  35000, 35000,  'Delivered');
INSERT INTO orders VALUES (1029, 14, '2024-10-02', 'Printer x2',             'Hardware',  2,  12000, 24000,  'Delivered');
INSERT INTO orders VALUES (1030, 15, '2024-10-15', 'Cloud Storage Plan',     'Software',  8,  8000,  64000,  'Pending');
INSERT INTO orders VALUES (1031, 1,  '2024-10-22', 'Analytics Dashboard',    'Software',  1,  45000, 45000,  'Delivered');
INSERT INTO orders VALUES (1032, 2,  '2024-11-05', 'Laptop x6',              'Hardware',  6,  60000, 360000, 'Delivered');
INSERT INTO orders VALUES (1033, 3,  '2024-11-14', 'ERP Module',             'Software',  3,  80000, 240000, 'Delivered');
INSERT INTO orders VALUES (1034, 4,  '2024-11-25', 'Desk x10',               'Furniture', 10, 6000,  60000,  'Delivered');
INSERT INTO orders VALUES (1035, 5,  '2024-12-01', 'CRM Software License',   'Software',  6,  25000, 150000, 'Delivered');
INSERT INTO orders VALUES (1036, 6,  '2024-12-10', 'Office Chairs x15',      'Furniture', 15, 4500,  67500,  'Delivered');
INSERT INTO orders VALUES (1037, 7,  '2024-12-15', 'Accounting Software',    'Software',  1,  35000, 35000,  'Pending');
INSERT INTO orders VALUES (1038, 8,  '2024-12-20', 'Cloud Storage Plan',     'Software',  3,  8000,  24000,  'Delivered');
INSERT INTO orders VALUES (1039, 9,  '2024-12-22', 'Analytics Dashboard',    'Software',  2,  45000, 90000,  'Delivered');
INSERT INTO orders VALUES (1040, 10, '2024-12-28', 'Laptop x4',              'Hardware',  4,  60000, 240000, 'Delivered');


-- ------------------------------------------------------------
-- SALES
-- ------------------------------------------------------------
INSERT INTO sales VALUES (1,  101, 'January',   2024, 'West',  48000,  12, 50000);
INSERT INTO sales VALUES (2,  102, 'January',   2024, 'West',  72000,  18, 70000);
INSERT INTO sales VALUES (3,  111, 'January',   2024, 'West',  35000,  9,  40000);
INSERT INTO sales VALUES (4,  115, 'January',   2024, 'West',  95000,  24, 90000);
INSERT INTO sales VALUES (5,  101, 'February',  2024, 'West',  53000,  14, 50000);
INSERT INTO sales VALUES (6,  102, 'February',  2024, 'West',  68000,  17, 70000);
INSERT INTO sales VALUES (7,  111, 'February',  2024, 'West',  41000,  10, 40000);
INSERT INTO sales VALUES (8,  115, 'February',  2024, 'West',  88000,  22, 90000);
INSERT INTO sales VALUES (9,  101, 'March',     2024, 'West',  60000,  15, 50000);
INSERT INTO sales VALUES (10, 102, 'March',     2024, 'West',  75000,  19, 70000);
INSERT INTO sales VALUES (11, 111, 'March',     2024, 'West',  38000,  9,  40000);
INSERT INTO sales VALUES (12, 115, 'March',     2024, 'West',  100000, 25, 90000);
INSERT INTO sales VALUES (13, 101, 'April',     2024, 'West',  45000,  11, 50000);
INSERT INTO sales VALUES (14, 102, 'April',     2024, 'West',  80000,  20, 70000);
INSERT INTO sales VALUES (15, 111, 'April',     2024, 'West',  42000,  10, 40000);
INSERT INTO sales VALUES (16, 115, 'April',     2024, 'West',  92000,  23, 90000);
INSERT INTO sales VALUES (17, 101, 'May',       2024, 'West',  58000,  14, 50000);
INSERT INTO sales VALUES (18, 102, 'May',       2024, 'West',  70000,  17, 70000);
INSERT INTO sales VALUES (19, 111, 'May',       2024, 'West',  33000,  8,  40000);
INSERT INTO sales VALUES (20, 115, 'May',       2024, 'West',  98000,  24, 90000);
INSERT INTO sales VALUES (21, 101, 'June',      2024, 'West',  62000,  15, 55000);
INSERT INTO sales VALUES (22, 102, 'June',      2024, 'West',  65000,  16, 72000);
INSERT INTO sales VALUES (23, 111, 'June',      2024, 'West',  44000,  11, 42000);
INSERT INTO sales VALUES (24, 115, 'June',      2024, 'West',  105000, 26, 95000);
INSERT INTO sales VALUES (25, 101, 'July',      2024, 'West',  55000,  13, 55000);
INSERT INTO sales VALUES (26, 102, 'July',      2024, 'West',  78000,  19, 72000);
INSERT INTO sales VALUES (27, 111, 'July',      2024, 'West',  40000,  10, 42000);
INSERT INTO sales VALUES (28, 115, 'July',      2024, 'West',  110000, 27, 95000);
INSERT INTO sales VALUES (29, 101, 'August',    2024, 'West',  50000,  12, 55000);
INSERT INTO sales VALUES (30, 102, 'August',    2024, 'West',  82000,  20, 72000);
INSERT INTO sales VALUES (31, 111, 'August',    2024, 'West',  36000,  9,  42000);
INSERT INTO sales VALUES (32, 115, 'August',    2024, 'West',  115000, 28, 95000);
INSERT INTO sales VALUES (33, 101, 'September', 2024, 'West',  66000,  16, 55000);
INSERT INTO sales VALUES (34, 102, 'September', 2024, 'West',  73000,  18, 72000);
INSERT INTO sales VALUES (35, 111, 'September', 2024, 'West',  45000,  11, 42000);
INSERT INTO sales VALUES (36, 115, 'September', 2024, 'West',  108000, 27, 95000);
INSERT INTO sales VALUES (37, 101, 'October',   2024, 'West',  70000,  17, 60000);
INSERT INTO sales VALUES (38, 102, 'October',   2024, 'West',  85000,  21, 75000);
INSERT INTO sales VALUES (39, 111, 'October',   2024, 'West',  48000,  12, 45000);
INSERT INTO sales VALUES (40, 115, 'October',   2024, 'West',  120000, 30, 100000);
INSERT INTO sales VALUES (41, 101, 'November',  2024, 'West',  72000,  18, 60000);
INSERT INTO sales VALUES (42, 102, 'November',  2024, 'West',  90000,  22, 75000);
INSERT INTO sales VALUES (43, 111, 'November',  2024, 'West',  50000,  12, 45000);
INSERT INTO sales VALUES (44, 115, 'November',  2024, 'West',  125000, 31, 100000);
INSERT INTO sales VALUES (45, 101, 'December',  2024, 'West',  68000,  17, 60000);
INSERT INTO sales VALUES (46, 102, 'December',  2024, 'West',  88000,  22, 75000);
INSERT INTO sales VALUES (47, 111, 'December',  2024, 'West',  46000,  11, 45000);
INSERT INTO sales VALUES (48, 115, 'December',  2024, 'West',  130000, 32, 100000);
INSERT INTO sales VALUES (49, 101, 'January',   2025, 'West',  75000,  19, 65000);
INSERT INTO sales VALUES (50, 102, 'January',   2025, 'West',  92000,  23, 80000);
