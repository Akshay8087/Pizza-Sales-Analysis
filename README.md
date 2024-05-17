# Pizza Sales Database Queries

This repository contains a series of SQL queries designed to analyze the sales data of a pizza store. The queries help to extract meaningful insights such as total revenue, average order value, pizza sales trends, and much more from the `pizzas_sales` table.

## Table of Contents
- [Objective](#Objective)
- [User Story](#User-Story)
- [Design](#Design)
- [Dashboard mockup](#Dashboard-mockup)
- [Tools](#Tools)
- [Development](#Development)
- [Run the Queries](#run-the-queries)
- [Development](#Development)
- [Visualization](#visualization)
- [Action plan](#Action-plan)



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



## User Story

**As a data science fresher working on the pizza chain BI dashboard project,**

**I want** to create a dashboard that presents a comprehensive view of sales, customer behaviors, and inventory metrics for the pizza chain.

**This dashboard should** allow me to visualize key performance indicators such as total revenue, average order value, total pizzas sold, and inventory usage efficiently.

**With this information,** I aim to facilitate strategic business decisions for the management team, enabling them to enhance operational efficiency, understand customer preferences in-depth, and optimize marketing and inventory strategies effectively.


## Design

### Sales Performance
- **Total Revenue**: What is the total revenue generated over selected periods?
- **Monthly Sales Trends**: How do sales vary month-over-month and what seasonal trends exist?

### Product Performance
- **Top 5 Pizzas by Revenue**: Which pizzas generate the most revenue?
- **Bottom 5 Pizzas by Revenue**: Which pizzas generate the least revenue?
- **Top 5 Pizzas by Quantity Sold**: What are the most popular pizzas by quantity sold?
- **Bottom 5 Pizzas by Quantity Sold**: What are the least popular pizzas by quantity sold?
- **Total Pizzas Sold by Pizza Category in February**: How do different pizza categories perform in February?

### Customer Engagement
- **Total Orders**: How many orders have been placed?
- **Average Order Value**: What is the average value of orders placed?
- **Average Pizzas Per Order**: How many pizzas are typically ordered in one transaction?

### Operational Insights
- **Inventory and Supply Chain Management**: What are the most frequently used ingredients?
- **Cost Analysis by Pizza Size**: What is the average cost per pizza size?

### Strategic Decision Making
- **% of Sales by Pizza Category and Size**: What percentage of total sales is contributed by each pizza category and size?
- **Order Count by Pizza Category**: How frequently are pizzas from each category ordered?



## Dashboard mockup

- What should it look like? 

Some of the data visuals that may be appropriate in answering our questions include:

1. KPI(Key Performance Indicators)
2. Bar Chart
3. Line Chart
4. Pie Chart
5. Horizontal bar chart

   ![power bi 1](https://github.com/Akshay8087/Pizza-Sales-Analysis/assets/139254824/1c5ad2cb-6517-4a1c-bfd3-bab215950417)


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
What's the general approach in creating this solution from start to finish?

1. Get the data
2. Explore the data in Excel
3. Load the data into SQL Server
4. Clean the data with SQL
5. Test the data with SQL
6. Visualize the data in Power BI
7. Generate the findings based on the insights
8. Write the documentation + commentary
9. Publish the data to GitHub Pages


## Data exploration notes

This is the stage where you have a scan of what's in the data, errors, inconcsistencies, bugs, weird and corrupted characters etc  
- What are your initial observations with this dataset? What's caught your attention so far? 
 
1. The dataset seems to be relatively comprehensive, containing at least 12 columns that provide various insights into pizza sales. 
2. Rich Details: Includes unique IDs, descriptions (pizza name, size, category) and quantities (how many, price, total).
3. Tracks Time: Order date and time allow analysis of trends across days, weeks, etc. (ensure consistent formatting).
4. Product Breakdown: Details on pizza variations (name, size, category) enable segmentation for targeted analysis.
5. Revenue Analysis: Unit price and total price reveal pricing strategies and revenue generation (average price, revenue per order, etc.).
6. Clear Segmentation: Data allows you to understand what sells best based on size, category, etc.
7. Data Quality Matters: Check for missing values, outliers, and formatting errors to ensure reliable analysis.
8. Actionable Insights: Uncover trends, customer preferences, and pricing strategies to optimize your business.


## Data cleaning 
- What do we expect the clean data to look like? (What should it contain? What contraints should we apply to it?)
The aim is to refine our dataset to ensure it is structured and ready for analysis. 

The cleaned data should meet the following criteria and constraints:

- Only relevant columns should be retained.
- All data types should be appropriate for the contents of each column.
- No column should contain null values, indicating complete data for all records.

Below is a table outlining the constraints on our cleaned dataset:

| Property | Description |
| --- | --- |
| Number of Rows | 48620 |
| Number of Columns | 12 |


And here is a tabular representation of the expected schema for the clean data:

| Field           | Type             | Description                             | Nullable  |
|-----------------|------------------|-----------------------------------------|-----------|
| pizza_id        | int (Primary Key)| Unique identifier for each pizza        | No        |
| order_id        | int              | Identifier for the order                | No        |
| pizza_name_id   | varchar(255)     | Identifier for the pizza type           | No        |
| quantity        | int              | Quantity of pizzas ordered              | No        |
| order_date      | date             | Date of the order                       | No        |
| order_time      | time             | Time of the order                       | No        |
| unit_price      | decimal(10, 2)   | Price per pizza unit                    | No        |
| total_price     | decimal(10, 2)   | Total price of the order                | No        |
| pizza_size      | varchar(50)      | Size of the pizza (e.g., small, medium) | No        |
| pizza_category  | varchar(100)     | Category of the pizza                   | No        |
| pizza_ingredients | text           | Ingredients used in the pizza           | No        |
| pizza_name      | varchar(255)     | Name of the pizza                       | No        |



# Testing 

- What data quality and validation checks are you going to create?

Here are the data quality tests conducted:


## Row count check
```sql
/*
# Count the total number of records (or rows) are in the SQL 
*/

SELECT
    COUNT(*) AS no_of_rows
FROM
    view_uk_youtubers_2024;

```
## Output
![Screenshot 2024-05-16 180941](https://github.com/Akshay8087/Pizza-Sales-Analysis/assets/139254824/a2e746e7-07e4-43fa-9796-f700529dfd62)

## Column count check
### SQL query 
```sql
/*
# Count the total number of columns (or fields) are in the SQL view
*/


SELECT column_name, data_type
  FROM information_schema.columns
    WHERE table_name = 'pizzas_sales';
```
### Output 
![Screenshot 2024-05-16 181750](https://github.com/Akshay8087/Pizza-Sales-Analysis/assets/139254824/e3edae2d-d938-4bd1-8c87-3dd965581983)


# Visualization 


## Results

- What does the dashboard look like?

 ![Screenshot 2024-05-16 184543](https://github.com/Akshay8087/Pizza-Sales-Analysis/assets/139254824/5ee0895c-c3d0-46ee-a8af-ede0e696fdf5)


 ![Screenshot 2024-05-16 185110](https://github.com/Akshay8087/Pizza-Sales-Analysis/assets/139254824/011c00f4-14cc-49dc-8789-186f895bbc8c)


 ### Action plan
- What course of action should we take and why?

Increase pizza sales through strategic partnerships with popular influencers on social media.

We'll engage in discussions with our marketing client to align on their expectations for this collaboration. By forecasting together, we can ensure that our strategies are in line with their objectives. Once we start achieving the anticipated milestones and see positive results, we'll explore potential partnerships with channels like Pizza Experts, TasteMasters, and PizzaConnoisseurs. These collaborations will further expand our reach within the pizza-loving community and solidify our presence in the market.

- What steps do we take to implement the recommended decisions effectively?

## Client Consultation
- **Objective**: Schedule meetings with the marketing client to understand their objectives, target audience, and expectations for the collaboration. Gather insights into their brand messaging and goals.
- **Action**: Initiate discussions with the client to align on project goals and objectives. Collect detailed information about their target audience, brand identity, and desired outcomes from the collaboration.

## Channel Research
- **Objective**: Conduct thorough research on potential influencer channels within the food and lifestyle niche. Analyze audience demographics, engagement metrics, and content style to identify the most suitable partners for promoting pizza products.
- **Action**: Explore various influencer channels such as Pizza Lover's Club, Foodie Adventures, and Tasty Bites. Evaluate their audience demographics, engagement rates, and content themes to determine their suitability for collaboration.

## Outreach and Negotiation
- **Objective**: Initiate contact with selected influencers and negotiate partnership terms, ensuring alignment with the client's budget and objectives.
- **Action**: Reach out to influencers identified during channel research. Present the benefits of collaboration and negotiate partnership terms, including deliverables, posting schedules, compensation, and any exclusivity clauses.

## Contract Finalization
- **Objective**: Work with legal and finance teams to finalize partnership agreements that outline clear deliverables, posting schedules, compensation terms, and any exclusivity clauses.
- **Action**: Collaborate with legal and finance teams to draft partnership agreements based on negotiated terms. Ensure contracts are comprehensive and legally binding, protecting the interests of both parties.

## Campaign Execution
- **Objective**: Launch promotional campaigns on the selected channels, providing influencers with branded content, discount codes, or special offers to share with their audiences.
- **Action**: Coordinate closely with influencers to ensure the timely execution of promotional campaigns. Provide influencers with necessary resources, such as branded content and promotional materials, to facilitate campaign delivery.

## Performance Monitoring
- **Objective**: Utilize analytics tools to track campaign performance in real-time, monitoring metrics such as website traffic, online orders, social media engagement, and coupon redemptions.
- **Action**: Implement tracking mechanisms to monitor campaign performance across various channels. Analyze collected data to assess the effectiveness of each partnership and identify areas for improvement.

## Feedback Collection
- **Objective**: Gather feedback from both the marketing client and influencer channels to evaluate the campaign's impact on brand awareness, customer engagement, and sales growth.
- **Action**: Solicit feedback from the client and influencers involved in the campaign. Evaluate feedback to identify successes and areas for improvement, informing future campaign strategies and optimizations.



 

