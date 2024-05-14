# Pizza Sales Database Queries

This repository contains a series of SQL queries designed to analyze the sales data of a pizza store. The queries help to extract meaningful insights such as total revenue, average order value, pizza sales trends, and much more from the `pizzas_sales` table.

## Table of Contents
- [Objective](Objective)
- [Database Setup](#database-setup)
- [Import Data](#import-data)
- [Query Descriptions](#query-descriptions)
- [Power BI Dashboard](#power-bi-dashboard)
- [Run the Queries](#run-the-queries)
- [Tools](#Tools)
- [Development](#Development)
- [Summary and Conclusion](#Summary-and-Conclusion)



# Objective 

# Pizza Chain BI Dashboard

## Overview
This Business Intelligence (BI) dashboard is designed to help the management team of the pizza chain efficiently monitor and analyze critical aspects of their business operations. It provides real-time insights into sales performance, customer preferences, and operational metrics, aiding in strategic decision-making.

## Key Pain Point
The management team of the pizza chain faced challenges in efficiently monitoring and analyzing sales performance, customer preferences, and operational metrics. These challenges hindered their ability to make informed decisions and optimize business operations.

## Dashboard Features

### Total Revenue
- **Purpose**: Monitors the overall sales effectiveness to gauge financial health and growth.
- **Benefits**: Allows for real-time tracking of sales trends and revenue generation.

### Average Order Value
- **Purpose**: Provides insights into customer spending behaviors.
- **Benefits**: Helps understand how much customers are spending per order, which can influence pricing strategies and promotional activities.

### Total Pizzas Sold
- **Purpose**: Tracks the popularity of different pizzas.
- **Benefits**: Identifies best-selling products to inform marketing strategies and menu adjustments.

### Total Orders
- **Purpose**: Assesses the levels of customer engagement and order frequency.
- **Benefits**: Enables understanding of customer retention and order patterns, useful for improving customer service and engagement strategies.

### Inventory Usage
- **Purpose**: Manages supply chain efficiency and tracks inventory levels.
- **Benefits**: Optimizes inventory management to reduce waste and ensure the availability of ingredients, improving cost management.

## Conclusion
The deployment of this dashboard will significantly empower the pizza chain's marketing team by providing them with essential insights into sales performance, customer preferences, and operational metrics. With real-time data on total revenue, average order value, total pizzas sold, and more, the team can strategically plan and implement marketing initiatives. This will not only enhance decision-making but also optimize marketing campaigns to better target customer needs and preferences, ultimately boosting both customer engagement and profitability.







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

10. **Monthly Sales Trends**: Provides a detailed analysis of monthly sales trends to track performance over time.
```sql 
--Monthly Sales Trends

SELECT EXTRACT(YEAR FROM order_date) AS year,
EXTRACT(MONTH FROM order_date) AS month, SUM(total_price) AS monthly_sales
FROM pizzas
GROUP BY year, month
ORDER BY year, month;
```


11. **Cost Analysis**: Calculates the average cost per pizza size to assess cost efficiency and pricing strategies.
```sql 

-- Cost Analysis Average Cost Per Pizza Size

SELECT pizza_size, AVG(unit_price) AS average_cost
FROM pizzas
GROUP BY pizza_size
ORDER BY average_cost DESC;
```


![power bi 1](https://github.com/Akshay8087/Pizza-Sales-Analysis/assets/139254824/1c5ad2cb-6517-4a1c-bfd3-bab215950417)

![power bi 22](https://github.com/Akshay8087/Pizza-Sales-Analysis/assets/139254824/795ee89f-1039-46ee-a262-c02e3e17aeef)

## Summary and Conclusion


## Tools 


| Tool | Purpose |
| --- | --- |
| Excel | Exploring the data |
| SQL Server | Cleaning, testing, and analyzing the data |
| Power BI | Visualizing the data via interactive dashboards |
| GitHub | Hosting the project documentation and version control |
| Mokkup AI | Designing the wireframe/mockup of the dashboard | 

# Development

## Pseudocode

- What's the general approach in creating this solution from start to finish?

1. Get the data
2. Explore the data in Excel
3. Load the data into SQL Server
4. Clean the data with SQL
5. Test the data with SQL
6. Visualize the data in Power BI
7. Generate the findings based on the insights
8. Write the documentation + commentary
9. Publish the data to GitHub Pages
