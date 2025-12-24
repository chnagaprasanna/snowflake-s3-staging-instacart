-- Create Base Tables and Load Data

-- Aisles Table
create or replace table aisles(
    aisle_id integer primary key,
    aisle varchar
);

copy into aisles(aisle_id, aisle)
from @my_stage/aisles.csv
file_format = (format_name='csv_file_format');

select * from aisles;

-- Departments Table
create or replace table departments(
    department_id integer primary key,
    department varchar
);

copy into departments(department_id, department)
from @my_stage/departments.csv
file_format = (format_name='csv_file_format');

select * from departments;

-- Products Table
create or replace table products(
    product_id integer primary key,
    product_name varchar,
    aisle_id integer,
    department_id integer
);

copy into products(product_id, product_name, aisle_id, department_id)
from @my_stage/products.csv
file_format = (format_name='csv_file_format');

select * from products;

-- Orders Table
create or replace table orders(
    order_id integer primary key,
    user_id integer,
    eval_set string,
    order_number integer,
    order_dow integer,
    order_hour_of_day integer,
    days_since_prior_order integer
);

copy into orders(order_id, user_id, eval_set, order_number, order_dow, order_hour_of_day, days_since_prior_order)
from @my_stage/orders.csv
file_format = (format_name='csv_file_format');

select * from orders;

-- Order Products Table
create or replace table order_products(
    order_id integer,
    product_id integer,
    add_to_cart_order integer,
    reordered integer,
    primary key(order_id, product_id)
);

copy into order_products(order_id, product_id, add_to_cart_order, reordered)
from @my_stage/order_products.csv
file_format = (format_name='csv_file_format');

select * from order_products;
