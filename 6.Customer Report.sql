/*
----------------------------------------------------------------
Customer report
---------------------------------------------------------------
Purpose:
   -this report consolidates key customer metrics and behaviors

Highlights:
  1.Gather essential fields such as names ,ages , and transaction details
  2.Segement customers into categories (VIP,Regular,New)
  3.Aggregate customer level metrics
  4.Calculate KPI'savepoint
  
  -------------------------------------------------------------------
  */
  
  create view customers_report as (
  with base_query as (
  select 
  s.order_number,s.product_key,s.order_date,s.sales_amount,s.quantity,
  c.customer_key,c.customer_number,concat(c.first_name," ",c.last_name) as customer_name,c.birthdate,
  timestampdiff(year,birthdate,curdate()) as age
  from fact_sales s 
  left join dim_customers c 
  on s.customer_key = c.customer_key
  ),

customer_aggregation as (
  select 
  customer_key,customer_number,customer_name,age,
  count(distinct order_number) as total_orders,
  sum(quantity) as total_quantity,
  sum(sales_amount) as total_sales,
  count(distinct product_key) as total_products,
  max(order_date) as last_order_date,
  timestampdiff(month,min(order_date),max(order_date)) as life_span
  from base_query
  group by customer_key,customer_number,customer_name,age
)

select customer_key,customer_number,customer_name,age,
case 
	when age<20 then 'Under Age'
    when age between 20 and 30 then '20-30'
    when age between 31 and 40 then '31-40'
    else '40 and above'
end as age_group,
total_orders,total_quantity,total_sales,total_products,
case
	when total_orders =0 then 0
    when total_orders >0 then total_sales/total_orders
end as avg_order_value,
last_order_date,life_span,
case
	when life_span=0 then total_sales
    when life_span>0 then total_sales/life_span
end as avg_monthly_spends,
case 
	when life_span>12 and total_sales >5000 then 'VIP'
	when life_span >=12 and total_sales < 5000 then 'Regular'
    else 'New'
end as customer_segment
from customer_aggregation

);
  
  

  
  
  
  
  
  
  
  
  
  
  
  
  
  