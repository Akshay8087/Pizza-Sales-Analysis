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

3. **Total Pizzas Sold**: Determines the total quantity of pizzas sold across all orders.
 ```sql
   SELECT SUM(quantity) AS Total_pizza_sold
FROM pizzas
```
4. **Total Orders**: Counts the total number of unique orders placed.
 ```sql
SELECT COUNT(DISTINCT order_id) AS Total_Orders 
FROM pizzas
```

5. **Average Pizzas Per Order**: Calculates the average number of pizzas ordered per order.
 ```sql
 SELECT 
  CAST(
    CAST(
      SUM(quantity) AS DECIMAL(10, 2)
    ) / CAST(
      COUNT(DISTINCT order_id) AS DECIMAL(10, 2)
    ) AS DECIMAL(10, 2)
  ) AS Avg_Pizzas_per_order 
FROM 
  pizzas
 ```

6. **Inventory and Supply Chain Management**: Provides insights into inventory management by analyzing the usage count of pizza ingredients.
 ```sql
SELECT 
  pizza_ingredients, 
  COUNT(*) AS usage_count 
FROM 
  pizzas 
GROUP BY 
  pizza_ingredients 
ORDER BY 
  usage_count DESC;
 ```

7. **Daily and Monthly Trends**: Analyzes the frequency of orders on a daily and monthly basis to identify trends in sales volume.
 ```sql
SELECT 
  to_char(order_date, 'Day') AS order_day, 
  COUNT(DISTINCT order_id) AS total_orders 
FROM 
  pizzas 
GROUP BY 
  to_char(order_date, 'Day');
```

8. **Sales Analysis by Category and Size**: Examines sales performance based on pizza category and size to understand customer preferences.
 ```sql 
SELECT
 pizza_category,
 
 ROUND(SUM(total_price)::NUMERIC,
        2) AS total_revenue,
        
 ROUND(SUM(total_price) * 100 / (SELECT SUM(total_price)
    FROM pizzas)::NUMERIC, 2) AS PCT
FROM pizzas
GROUP BY pizza_category;
 ```

9. **Top and Bottom Performers**: Identifies the top and bottom-performing pizzas in terms of revenue, quantity sold, or total orders.
```sql
-- Bottom 5 Pizzas by Revenue

SELECT
    pizza_name,
    SUM(total_price) AS Total_Revenue
FROM
    pizzas
GROUP BY
    pizza_name
ORDER BY
    Total_Revenue ASC;
```
```sql 

--I. Top 5 Pizzas by Quantity

SELECT pizza_name, SUM(quantity) AS Total_Pizza_Sold
FROM pizzas
GROUP BY pizza_name
ORDER BY Total_Pizza_Sold DESC
```


```sql 

--J. Bottom 5 Pizzas by Quantity

SELECT pizza_name, SUM(quantity) AS Total_Pizza_Sold
FROM pizzas
GROUP BY pizza_name
ORDER BY Total_Pizza_Sold ASC
LIMIT 5;
```


```sql 

--K. Top 5 Pizzas by Total Orders


SELECT pizza_name, COUNT(DISTINCT order_id) AS Total_Orders
FROM pizzas
GROUP BY pizza_name
ORDER BY Total_Orders DESC
limit 5
LIMIT 5;
```

15. **Monthly Sales Trends**: Provides a detailed analysis of monthly sales trends to track performance over time.

16. **Cost Analysis**: Calculates the average cost per pizza size to assess cost efficiency and pricing strategies.




