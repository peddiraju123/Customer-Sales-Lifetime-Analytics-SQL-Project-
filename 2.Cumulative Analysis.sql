#Aggregate the data progessively over time.
#Helps us to understand whether our business is growing or declining

#Calculate total sales per month and running total of sales over time

select date,total_sales,
sum(total_sales) over(partition by date order by date ) as running_total_sales,
avg(total_sales) over(partition by date order by date) as moving_average
from
(
select date_format(order_date,'%Y-%m-01') as date,
sum(sales_amount) as total_sales,
avg(sales_amount) as Avg_Sales
from fact_sales
where date_format(order_date,'%Y-%m-01') is not null
group by date
) t
