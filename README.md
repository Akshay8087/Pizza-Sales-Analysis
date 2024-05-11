# Pizza Sales Database Queries

This repository contains a series of SQL queries designed to analyze the sales data of a pizza store. The queries help to extract meaningful insights such as total revenue, average order value, pizza sales trends, and much more from the `pizzas_sales` table.

## Table of Contents

- [Database Setup](#database-setup)
- [Import Data](#import-data)
- [Query Descriptions](#query-descriptions)
  - [Total Revenue](#total-revenue)
  - [Average Order Value](#average-order-value)
  - [Total Pizzas Sold](#total-pizzas-sold)
  - [Total Orders](#total-orders)
  - [Average Pizzas Per Order](#average-pizzas-per-order)
  - [Inventory and Supply Chain Management](#inventory-and-supply-chain-management)
  - [Daily and Monthly Trends](#daily-and-monthly-trends)
  - [Sales Analysis by Category and Size](#sales-analysis-by-category-and-size)
  - [Top and Bottom Performers](#top-and-bottom-performers)
  - [Monthly Sales Trends](#monthly-sales-trends)
  - [Cost Analysis](#cost-analysis)
- [Run the Queries](#run-the-queries)

## Database Setup
```sql
DROP TABLE IF EXISTS pizzas;
CREATE TABLE pizzas
(
    pizza_id            INT PRIMARY KEY,
    order_id            INT,
    pizza_name_id       VARCHAR(255),
    quantity            INT,
    order_date          DATE,
    order_time          TIME,
    unit_price          DECIMAL(10, 2),
    total_price         DECIMAL(10, 2),
    pizza_size          VARCHAR(50),
    pizza_category      VARCHAR(100),
    pizza_ingredients   TEXT,
    pizza_name          VARCHAR(255)
);
```

## New Section Title

[kbkigigi]
