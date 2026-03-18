**Project Overview**
This project analyzes customer purchasing behavior using SQL. The goal is to transform raw transactional sales data into meaningful customer-level metrics that help businesses understand customer value, purchasing patterns, and engagement over time.
Using a star schema data warehouse structure (fact_sales, dim_customers, dim_products), SQL queries were written to calculate key customer metrics such as total spending, order frequency, product diversity, and customer lifespan.

**Objectives**
  Analyze customer purchasing behavior
  Calculate customer lifetime metrics
  Aggregate transactional data into customer-level insights
  Prepare data for customer segmentation and marketing analytics


**Dataset Structure**
The project uses a simplified data warehouse schema:

**Fact Table**
fact_sales
      order_number
      order_date
      product_key
      customer_key
      quantity
      sales_amount
      
**Dimension Tables**
dim_customers
    customer_key
    customer_number
    first_name
    last_name
    birthdate
dim_products
    product_key
    product_name
    category


**Key Metrics Calculated**
The SQL queries generate the following customer analytics metrics:
    Total Orders per Customer
    Total Quantity Purchased
    Total Sales (Customer Lifetime Value proxy)
    Unique Products Purchased
    Customer Age
    Last Order Date
    Customer Lifespan (Months between first and last purchase)

**SQL Techniques Used**
    Common Table Expressions (CTEs)
    Joins (Fact-Dimension modeling)
    Aggregations
    Window-ready analytics tables
    Date functions (TIMESTAMPDIFF, CURDATE)
    Data transformation and feature engineering

**Business Use Cases**
The results from this analysis can be used for:
    Customer segmentation
    Customer Lifetime Value (CLV) estimation
    Retention analysis
    Marketing campaign targeting
    Purchase behavior analysis

**Tools Used**
    MySQL
    SQL (CTE, Aggregations, Date Functions)
    Data Warehouse Modeling
