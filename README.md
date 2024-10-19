# MySQL Retail Analysis Project

## Description
This project involves analyzing retail sales data using MySQL. The purpose is to extract insights and perform various data analysis tasks using SQL queries.

## Table of Contents
- [Description](#Dsecription)
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
  - [Q10: Create shifts based on sale time and count the number of orders](#q10-Create-shifts-based-on-sale-time-and-count-the-number-of-orders).
- [Findings and Insights](#findings-and-insights)
- [Contributing](#contributing)


## Installation
1. Clone the repository:
   ```sh
    git clone https://github.com/shivasai45/Retail_sales.git
   
## Usage
1.Run the provided SQL queries to analyze the data.

2.Use MySQL Workbench to view the database and execute additional queries.

3.Use the created views and queries to extract insights from the data.

## Table Creation

```sql

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
```
## SQL Queries 

### Q1: Retrieve all columns for sales made on '2022-11-05'.

```sql
SELECT * 
FROM RETAIL 
WHERE SALE_DATE = '2022-11-05';
```

### Q2: Retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 10 in Nov-2022.

```sql
SELECT * 
FROM RETAIL 
WHERE 
    CATEGORY = 'CLOTHING' 
    AND QUANTITY > 10 
    AND DATE_FORMAT(SALE_DATE, '%Y-%m') = '2022-11';
```

### Q3: Calculate the total sales (total_sale) for each category.

```sql
SELECT 
    CATEGORY,
    COUNT(*) AS TOTALSALES_COUNT, 
    SUM(TOTAL_SALE) AS TOTAL_AMOUNT
FROM RETAIL 
GROUP BY CATEGORY;
```
### Q4: Find the average age of customers who purchased items from the 'Beauty' category.

```sql
SELECT 
    ROUND(AVG(AGE), 2) AS AVERAGE_AGE
FROM RETAIL
WHERE CATEGORY = 'BEAUTY';
```
### Q5: Find all transactions where the total_sale is greater than 1000.

```sql
SELECT * 
FROM RETAIL 
WHERE TOTAL_SALE > 1000;
```
### Q6: Find the total number of transactions made by each gender in each category.

```sql
SELECT 
    CATEGORY,
    GENDER,
    COUNT(*) AS TRANSACTION_COUNT
FROM RETAIL
GROUP BY GENDER, CATEGORY
ORDER BY CATEGORY;
```

### Q7: Find the top 5 customers based on the highest total sales.

```sql
SELECT 
  	CUSTOMER_ID,
  	SUM(TOTAL_SALE) 
FROM RETAIL 
GROUP BY CUSTOMER_ID
ORDER BY SUM(TOTAL_sALE) DESC
LIMIT 5;
```

### Q8: Calculate the average sale for each month and find out the best-selling month in each year.

```sql
WITH cte1 AS (
    SELECT 
        EXTRACT(YEAR FROM SALE_DATE) AS year,
        EXTRACT(MONTH FROM SALE_DATE) AS month,
        ROUND(AVG(TOTAL_SALE), 2) AS average_sale,
        DENSE_RANK() OVER (PARTITION BY EXTRACT(YEAR FROM SALE_DATE) ORDER BY ROUND(AVG(TOTAL_SALE), 2) DESC) AS ranked
    FROM RETAIL
    GROUP BY year, month
)
SELECT 
    year, 
    month,
    average_sale 
FROM cte1
WHERE ranked = 1;
```

### Q9: Find the number of unique customers who purchased items from each category.

```sql
SELECT 
    CATEGORY,
    COUNT(DISTINCT CUSTOMER_ID) AS UNIQUE_CUSTOMERS
FROM RETAIL 
GROUP BY CATEGORY;
```

### Q10: Create shifts based on sale time and count the number of orders.

```sql
CREATE VIEW exam AS
SELECT *,
    CASE 
        WHEN HOUR(SALE_TIME) < 12 THEN 'Morning'
        WHEN HOUR(SALE_TIME) >= 12 AND HOUR(SALE_TIME) <= 17 THEN 'Afternoon'
        ELSE 'Evening'
    END AS shift 
FROM RETAIL;

SELECT 
    shift,
    COUNT(*) AS ORDER_COUNT
FROM exam
GROUP BY shift;

```
## Findings and Insights

1. **Category Performance**: 

   The **Clothing** category showed strong sales, indicating opportunities for targeted marketing and inventory management.

3. **Sales by Shift**: 

   Analyzing sales by shift revealed peak shopping times, allowing for optimized staffing and promotional strategies.

5. **Top Customers**: 

   Identifying top customers based on sales can enhance loyalty programs and targeted marketing efforts.

## Contributing

Contributions are welcome! Please create a pull request or open an issue to discuss any changes.

