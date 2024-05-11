# Pizza Sales Database Queries

This repository contains a series of SQL queries designed to analyze the sales data of a pizza store. The queries help to extract meaningful insights such as total revenue, average order value, pizza sales trends, and much more from the `pizzas_sales` table.

## Table of Contents

- [Database Setup](#database-setup)
- [Import Data](#import-data)
- [Query Descriptions](#query-descriptions)
- [Power BI Dashboard](#power-bi-dashboard)
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

## Import Data
```sql
COPY pizzas FROM 'D:/akshay/pizza_sales.csv' WITH (FORMAT csv, HEADER);
```

## Query Descriptions

1. **Total Revenue**: Calculates the total revenue generated from pizza sales.
 ```sql
 SELECT Sum(total_price) AS Total_Revenue
FROM   pizzas
```

2. **Average Order Value**: Computes the average value of each order, considering total revenue and the number of orders.
```sql

 SELECT 
  (
    SUM(total_price) / COUNT(DISTINCT order_id)
  ) AS Avg_order_Value 
FROM 
  pizzas
 ```

6. **Total Pizzas Sold**: Determines the total quantity of pizzas sold across all orders.

7. **Total Orders**: Counts the total number of unique orders placed.

8. **Average Pizzas Per Order**: Calculates the average number of pizzas ordered per order.

9. **Inventory and Supply Chain Management**: Provides insights into inventory management by analyzing the usage count of pizza ingredients.

10. **Daily and Monthly Trends**: Analyzes the frequency of orders on a daily and monthly basis to identify trends in sales volume.

11. **Sales Analysis by Category and Size**: Examines sales performance based on pizza category and size to understand customer preferences.

12. **Top and Bottom Performers**: Identifies the top and bottom-performing pizzas in terms of revenue, quantity sold, or total orders.

13. **Monthly Sales Trends**: Provides a detailed analysis of monthly sales trends to track performance over time.

14. **Cost Analysis**: Calculates the average cost per pizza size to assess cost efficiency and pricing strategies.




