# Retail_sales
This project involves analyzing retail sales data using MySQL. The purpose is to extract insights and perform various data analysis tasks using SQL queries.
# MySQL Retail Analysis Project

## Description
This project involves analyzing retail sales data using MySQL. The purpose is to extract insights and perform various data analysis tasks using SQL queries.

## Table of Contents
- [Description](#description)
- [Installation](#installation)
- [Table Creation](#table-creation)
- [Usage](#usage)
- [SQL Queries](#sql-queries)
  - [Q1: Retrieve all columns for sales made on '2022-11-05'](#q1-retrieve-all-columns-for-sales-made-on-2022-11-05)
  - [Q2: Retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 10 in Nov-2022](#q2-retrieve-all-transactions-where-the-category-is-clothing-and-the-quantity-sold-is-more-than-10-in-nov-2022)
  - [Q3: Calculate the total sales (total_sale) for each category](#q3-calculate-the-total-sales-total_sale-for-each-category)
  - [Q4: Find the average age of customers who purchased items from the 'Beauty' category](#q4-find-the-average-age-of-customers-who-purchased-items-from-the-beauty-category)
  - [Q5: Find all transactions where the total_sale is greater than 1000](#q5-find-all-transactions-where-the-total_sale-is-greater-than-1000)
  - [Q6: Find the total number of transactions made by each gender in each category](#q6-find-the-total-number-of-transactions-made-by-each-gender-in-each-category)
  - [Q7: Find the top 5 customers based on the highest total sales](#q7-find-the-top-5-customers-based-on-the-highest-total-sales)
  - [Q8: Calculate the average sale for each month and find out the best-selling month in each year](#q8-calculate-the-average-sale-for-each-month-and-find-out-the-best-selling-month-in-each-year)
  - [Q9: Find the number of unique customers who purchased items from each category](#q9-find-the-number-of-unique-customers-who-purchased-items-from-each-category)
  - [Q10: Create each shift and number of orders](#q10-create-each-shift-and-number-of-orders)
- [Findings and Insights](#findings-and-insights)
- [Contributing](#contributing)


## Installation
1. Clone the repository:
   ```sh
   git clone https://github.com/yourusername/sql_project_1.git
## Usage
1.Run the provided SQL queries to analyze the data.

2.Use MySQL Workbench to view the database and execute additional queries.

3.Use the created views and queries to extract insights from the data.

## Table Creation
'''sql
CREATE DATABASE IF NOT EXISTS sql_project_1;

USE sql_project_1;

CREATE TABLE IF NOT EXISTS RETAIL (
    TRANSACTION_ID INT PRIMARY KEY,
    SALE_DATE DATE,
    SALE_TIME TIME,
    CUSTOMER_ID INT,
    GENDER VARCHAR(24),
    AGE INT,
    CATEGORY VARCHAR(21),
    QUANTITY INT,
    PRICE_PER_UNIT DECIMAL,
    COGS DECIMAL,
    TOTAL_SALE DECIMAL
); 

## SQL Queries
### Q1: Retrieve all columns for sales made on '2022-11-05'
```sql
SELECT * FROM RETAIL WHERE SALE_DATE = '2022-11-05';
''' 
