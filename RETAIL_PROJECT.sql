-- Creating the new DataBase 

CREATE DATABASE  sql_project_1;

CREATE TABLE IF NOT EXISTS RETAIL
	(
		 TRANSACTION_ID INT PRIMARY KEY ,
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


SELECT *
FROM RETAIL;


SELECT 
    COUNT(*) 
FROM RETAIL;

-- Data Cleaning

SELECT * FROM RETAIL
WHERE 
    TRANSACTION_ID IS NULL
    OR
    SALE_DATE IS NULL
    OR 
    SALE_TIME IS NULL
    OR
    GENDER IS NULL
    OR
    CATEGORY IS NULL
    OR
    QUANTITY IS NULL
    OR
    COGS IS NULL
    OR
    TOTAL_SALE IS NULL;
    
DELETE FROM RETAIL
WHERE 
    TRANSACTION_ID IS NULL
    OR
    SALE_DATE IS NULL
    OR 
    SALE_TIME IS NULL
    OR
    GENDER IS NULL
    OR
    CATEGORY IS NULL
    OR
    QUANTITY IS NULL
    OR
    COGS IS NULL
    OR
    TOTAL_SALE IS NULL;

-- Data Exploration

-- How many sales we have?
SELECT COUNT(*) as TOTAL FROM RETAIL;

-- How many uniuque customers we have ?

SELECT COUNT(DISTINCT customer_id) as "UNIUQUE CUSTOMERS" FROM RETAIL;


-- Data Analysis & Business Key Problems & Answers


--  Q1: Retrieve all columns for sales made on '2022-11-05'.

SELECT * 
FROM RETAIL 
WHERE SALE_DATE = '2022-11-05';
    
-- Q2: Retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 10 in Nov-2022.

SELECT * 
FROM RETAIL 
WHERE 
	CATEGORY ="CLOTHING" 
	AND 
	QUANTITY >10 
	AND 
	DATE_FORMAT(SALE_DATE, "%Y-%M") = "2022-11";


-- Q3: Calculate the total sales (total_sale) for each category.

SELECT 
	CATEGORY ,
	COUNT(*) AS TOTALSALES_COUNT, 
	SUM(TOTAL_SALE) AS TOTAL_AMOUNT
FROM RETAIL 
GROUP BY 1;
    
-- Q4: Find the average age of customers who purchased items from the 'Beauty' category.

SELECT 
	ROUND(AVG(AGE),2) AS AVERAGE_AGE
FROM RETAIL
WHERE CATEGORY = "BEAUTY";

-- Q5: Find all transactions where the total_sale is greater than 1000.

SELECT * 
FROM RETAIL 
WHERE TOTAL_SALE >=1000;

-- Q6: Find the total number of transactions made by each gender in each category.

SELECT 
	CATEGORY,
    GENDER,
	COUNT(*) 
FROM RETAIL
GROUP BY GENDER , CATEGORY
ORDER BY CATEGORY;

-- Q7: Find the top 5 customers based on the highest total sales. 

SELECT 
	CUSTOMER_ID,
	SUM(TOTAL_SALE) 
	FROM RETAIL 
GROUP BY CUSTOMER_ID
ORDER BY SUM(TOTAL_sALE) DESC
LIMIT 5;

-- Q8: Calculate the average sale for each month and find out the best-selling month in each year.

with cte1 as (
select 
	extract(year from sale_date) as year,
	extract(month from sale_date) as month,
	round(avg(total_Sale),2) as average_sale,
	dense_rank() over(partition by extract(year from sale_date) order by round(avg(total_sale),2) desc ) as ranked
from retail
group by year,month
)
select 
		year, 
		month,
		average_sale 
from cte1
where ranked=1;

--  Q9: Find the number of unique customers who purchased items from each category.

select 
	category,
	count(distinct customer_id) as unique_customers
from retail 
group by category;

-- Q10: Create shifts based on sale time and count the number of orders.

create view exam as
select *,
		case 
			when hour(sale_time) < 12  then "Morning"
			when hour(sale_time)>=12 and hour(sale_time) <=17 then "Afternoon"
			else "Evening"
		end as shift 
from retail ;

select 
	shift,
	count(*) 
from exam
group by shift;





