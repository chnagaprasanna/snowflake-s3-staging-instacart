<h2 align="center">
  Snowflake Instacart ETL Pipeline <br/>
  <a href="https://github.com/prasanna-chintamaneni" target="_blank">
    By Naga Prasanna Chintamaneni
  </a>
</h2>

<br/>

## 📌 Project Overview  

This project demonstrates a **data engineering workflow on Snowflake** using Instacart data.  
It includes **staging data from AWS S3**, **creating base tables**, and optionally building a **dimensional model** (star schema) for analytics.

Key highlights:
- Staging data from S3 using **Snowflake stages** and **CSV file formats**
- Loading raw CSV data into Snowflake tables using **COPY INTO**
- Optional **dimension & fact tables** for BI-ready star schema
- Modular, production-ready SQL scripts

---

## 🚀 Built With  

- **Snowflake**
- **AWS S3** (data source)
- **SQL**
- **Snowflake Staging & COPY INTO**
- **Dimensional Modeling (Star Schema)**
- **VS Code**
- **GitHub**

---

## 🏗 Architecture  

```text
AWS S3 (CSV Files)
↓
Snowflake Stage (Staging Layer)
↓
Base Tables (aisles, departments, products, orders, order_products)
↓
(Optional) Dimensional Tables & Fact Table
↓
Analytics & BI Queries
```

## 📁 Project Structure

```bash
instacart/
│
├── sql/
│   ├── staging/
│   │   └── s3_stage_and_file_format.sql      # Stage creation & CSV file format
│   └── ddl/
│       └── create_base_tables.sql            # Base tables creation & data loading
│
└── README.md
```
---

## ⚙️ Step-by-Step Implementation
### 1️⃣ Create Staging Layer

- Define a Snowflake stage to access S3.

- Create CSV file format for ingestion.

### 2️⃣ Load Base Tables

- Create tables: aisles, departments, products, orders, order_products.

- Load CSV data using COPY INTO.

- Tables include primary keys to ensure data integrity.

### 3️⃣ Optional: Build Dimensional Model

- Dimension tables: dim_users, dim_products, dim_departments, dim_aisles, dim_orders.

- Fact table: fact_order_product.

- Optimized for BI analytics and SQL queries.

### 4️⃣ Sample Queries
```bash
-- Total products ordered by department
SELECT d.department, COUNT(*) AS total_products_ordered
FROM fact_order_product fop
JOIN dim_departments d ON fop.department_id = d.department_id
GROUP BY d.department
ORDER BY total_products_ordered DESC;

-- Top users by number of orders
SELECT user_id, COUNT(*) AS total_orders
FROM fact_order_product
GROUP BY user_id
ORDER BY total_orders DESC
LIMIT 10;

```

## ✅ Best Practices Followed

- Modular SQL scripts for staging, table creation, and dimensional modeling

- Primary keys for data integrity

- Placeholder AWS credentials to ensure no secrets are pushed

- Clear separation of staging layer and ETL/DWH layer

- Ready for analytics and BI use cases

## 🧠 Key Learnings

- Creating staging layers and CSV file formats in Snowflake

- Loading data efficiently from S3 using COPY INTO

- Designing dimension & fact tables (star schema)

- Structuring SQL projects for GitHub & production readiness

- Writing safe SQL scripts without exposing credentials

