 ## Q1: Total sales revenue by product category for each month

SELECT 
    d.month_name,
    p.category,
    SUM(f.units_sold * f.unit_price) AS total_revenue
FROM fact_sales f

##- Top 2 performing stores by total revenue

SELECT 
    s.store_name,
    s.store_city,
    SUM(f.units_sold * f.unit_price) AS total_revenue
FROM fact_sales f
JOIN dim_store s ON f.store_key = s.store_key
GROUP BY s.store_name, s.store_city
ORDER BY total_revenue DESC
LIMIT 2;

 ## Q3: Month-over-month sales trend across all stores
 
 Not clear...not attempt


