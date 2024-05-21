DROP TABLE IF EXISTS pizzas_sales;
CREATE TABLE pizzas_sales
             (
                          pizza_id       int PRIMARY KEY,
                          order_id       int,
                          pizza_name_id  varchar(255),
                          quantity       int,
                          order_date     date,
                          order_time     time,
                          unit_price     decimal(10, 2),
                          total_price    decimal(10, 2),
                          pizza_size     varchar(50),
                          pizza_category varchar(100),
                          pizza_ingredients text,
                          pizza_name varchar(255)
             );



--1. Count the total number of records (or rows) are in the SQL 

SELECT
    COUNT(*) AS no_of_rows
FROM
    pizzas_sales;



--2.# Count the total number of columns and data types (or fields) are in the SQL view

SELECT column_name, data_type
FROM information_schema.columns
WHERE table_name = 'pizzas_sales';
















SET datestyle = 'ISO, DMY';


COPY pizzas_sales FROM 'D:/akshay/pizza_sales.csv' WITH (FORMAT csv, HEADER);

select count(*)
from pizzas_sales


SELECT * FROM pizzas

--SQL QUERYS FOR KPI 

--Total Revenue:

SELECT Sum(total_price) AS Total_Revenue
FROM   pizzas_sales 

--2. Average Order Value   --using distinct beacuserepeted orders

SELECT 
  (
    SUM(total_price) / COUNT(DISTINCT order_id)
  ) AS Avg_order_Value 
FROM 
  pizzas_sales

--3. Total Pizzas Sold

SELECT SUM(quantity) AS Total_pizza_sold
FROM pizzas_sales

--4. Total Orders

SELECT COUNT(DISTINCT order_id) AS Total_Orders 
FROM pizzas_sales

--5. Average Pizzas Per Order

SELECT 
  CAST(
    CAST(
      SUM(quantity) AS DECIMAL(10, 2)
    ) / CAST(
      COUNT(DISTINCT order_id) AS DECIMAL(10, 2)
    ) AS DECIMAL(10, 2)
  ) AS Avg_Pizzas_per_order 
FROM 
  pizzas_sales

--. Inventory and Supply Chain Management

SELECT 
  pizza_ingredients, 
  COUNT(*) AS usage_count 
FROM 
  pizzas_sales 
GROUP BY 
  pizza_ingredients 
ORDER BY 
  usage_count DESC;




--B. Daily Trend for Total Orders

SELECT 
  to_char(order_date, 'Day') AS order_day, 
  COUNT(DISTINCT order_id) AS total_orders 
FROM 
  pizzas_sales 
GROUP BY 
  to_char(order_date, 'Day');



--C. Monthly Trend for Orders

SELECT 
  to_char(order_date, 'Month') AS Month_Name, 
  COUNT(DISTINCT order_id) AS Total_Orders 
FROM 
  pizzas_sales 
GROUP BY 
  to_char(order_date, 'Month') 
ORDER BY 
  Total_Orders DESC;




--D. % of Sales by Pizza Category

SELECT
 pizza_category,
 
 ROUND(SUM(total_price)::NUMERIC,
        2) AS total_revenue,
        
 ROUND(SUM(total_price) * 100 / (SELECT SUM(total_price)
    FROM pizzas)::NUMERIC, 2) AS PCT
FROM pizzas_sales
GROUP BY pizza_category;


--E. % of Sales by Pizza Size

SELECT
    pizza_size,
    CAST(SUM(total_price) AS DECIMAL(10,2)) AS total_revenue,
    ROUND(SUM(total_price) * 100 / (SELECT SUM(total_price) FROM pizzas), 2) AS PCT
FROM pizzas_sales
GROUP BY pizza_size;



--F. Total Pizzas Sold by Pizza Category


SELECT pizza_category, SUM(quantity) AS Total_Quantity_Sold
FROM pizzas_sales
WHERE extract(MONTH FROM order_date) = 2
GROUP BY pizza_category
ORDER BY Total_Quantity_Sold DESC;


--G. Top 5 Pizzas by Revenue


SELECT pizza_name, SUM(total_price) AS Total_Revenue
FROM pizzas_sales
GROUP BY pizza_name
ORDER BY Total_Revenue DESC
LIMIT 5;

--H. Bottom 5 Pizzas by Revenue

SELECT
    pizza_name,
    SUM(total_price) AS Total_Revenue
FROM
    pizzas_sales
GROUP BY
    pizza_name
ORDER BY
    Total_Revenue ASC;
	
--I. Top 5 Pizzas by Quantity

SELECT pizza_name, SUM(quantity) AS Total_Pizza_Sold
FROM pizzas_sales
GROUP BY pizza_name
ORDER BY Total_Pizza_Sold DESC
LIMIT 5;

--J. Bottom 5 Pizzas by Quantity

SELECT pizza_name, SUM(quantity) AS Total_Pizza_Sold
FROM pizzas_sales
GROUP BY pizza_name
ORDER BY Total_Pizza_Sold ASC
LIMIT 5;


--K. Top 5 Pizzas by Total Orders


SELECT pizza_name, COUNT(DISTINCT order_id) AS Total_Orders
FROM pizzas_sales
GROUP BY pizza_name
ORDER BY Total_Orders DESC
limit 5


--L. Borrom 5 Pizzas by Total Orders


SELECT pizza_name, COUNT(DISTINCT order_id) AS Total_Orders
FROM pizzas_sales
GROUP BY pizza_name
ORDER BY Total_Orders ASC
LIMIT 5

--total order count for each pizzas
SELECT pizza_category, COUNT(*) AS order_count
FROM pizzas_sales
GROUP BY pizza_category
ORDER BY pizza_category;


select * from pizzas

--Monthly Sales Trends

SELECT EXTRACT(YEAR FROM order_date) AS year,
EXTRACT(MONTH FROM order_date) AS month, SUM(total_price) AS monthly_sales
FROM pizzas_sales
GROUP BY year, month
ORDER BY year, month;

-- Cost Analysis Average Cost Per Pizza Size

SELECT pizza_size, AVG(unit_price) AS average_cost
FROM pizzas_sales
GROUP BY pizza_size
ORDER BY average_cost DESC;

