
#Sales Over Years
select year(order_date) as year,
sum(sales_amount) as TotalSales,
count(customer_key) as TotalCustomers,
sum(quantity) as TotalQuantity
from fact_sales
where year(order_date) is not null
group by year(order_date)
order by year(order_date);

#Sales Over Months
select month(order_date) as month,
sum(sales_amount) as TotalSales,
count(customer_key) as TotalCustomers,
sum(quantity) as TotalQuantity
from fact_sales
where month(order_date) is not null
group by month(order_date)
order by month(order_date);

#everyyear every month
select year(order_date) as Year,month(order_date) as month,
sum(sales_amount) as TotalSales,
count(customer_key) as TotalCustomers,
sum(quantity) as TotalQuantity
from fact_sales
where month(order_date) is not null
group by year(order_date),month(order_date)
order by year(order_date),month(order_date);


#using month and year in same column
SELECT date_format(order_date,'%Y-%m-01') as month_start,
sum(sales_amount) as TotalSales
FROM fact_sales
where DATE_FORMAT(order_date,'%Y-%m-01') is not null
GROUP BY DATE_FORMAT(order_date,'%Y-%m-01');




