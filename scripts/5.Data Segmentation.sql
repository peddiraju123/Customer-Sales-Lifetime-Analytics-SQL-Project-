#Group the data based on a specific range
#Helps understand the corerelation between two measures

#Segment products into cost ranges and count how many products fall into each segment

with product_segment as (
select 
product_key,product_name,cost,
case 
	when cost<100 then 'Below 100'
    when cost between 100 and 500 then '100-500'
    when cost between 500 and 1000 then '500-1000'
    else 'Above 1000'
end as cost_range
from dim_products
)

select cost_range,
count(product_key) as total_products
from product_segment
group by cost_range
order by total_products desc;

/* Group Customers into three segments based on their spending behaviour:
	  VIP-Customer with atleast 12 months of history and spending more than 5000
	  Regular - customer with at tleast 12 months of history and spending 5000 or less
	  New- customer with lifespan of less than 12 months
	  and find the total number of customers by each group
  */

with customer_spending as (
select c.customer_key,
sum(s.sales_amount) as total_spending,
min(order_date) as first_order,
max(order_date) as last_order,
timestampdiff(month,min(order_date),max(order_date)) as lifespan
from fact_sales s 
left join dim_customers c 
on s.customer_key = c.customer_key
group by c.customer_key
)

select 
case 
	when lifespan>12 and total_spending >5000 then 'VIP'
	when lifespan >=12 and total_spending < 5000 then 'Regular'
    else 'New'
end as customer_segment,
count(customer_key) as TotalCustomers
from customer_spending
group by customer_segment





















