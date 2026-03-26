#Analyze how an individual part is performing compared to the overall
#allowing us to understand which category has the greatest impact on the business

#Which categories contribute the most to the sales

with category_sales as (
select category,
sum(sales_amount) as total_sales
from fact_sales s
left join dim_products p 
on s.product_key = p.product_key
group by category
)

select category,total_sales,
sum(total_sales) over() as overall_sales,
round((total_sales/sum(total_sales) over())*100 ,2)as pct_of_total
from category_sales
order by total_sales desc