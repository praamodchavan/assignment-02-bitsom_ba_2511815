C:\Users\Pramod>duckdb

memory D INSTALL ducklake;
memory D LOAD ducklake;

preview all files - 

SELECT * FROM read_csv_auto('C:/pramod/New start of career/lectures/ASSIGMENT 2/customers.csv');
SELECT * FROM read_json_auto('C:/pramod/New start of career/lectures/ASSIGMENT 2/orders.json');
SELECT * FROM read_parquet('C:/pramod/New start of career/lectures/ASSIGMENT 2/products.parquet');


5.1 — Cross-Format Queries

-- Q1: List all customers along with the total number of orders they have placed

SELECT 
    c.customer_id,
    c.name,
    COUNT(o.order_id) AS total_orders
FROM read_csv_auto('C:/pramod/New start of career/lectures/ASSIGMENT 2/customers.csv') AS c
LEFT JOIN read_json_auto('C:/pramod/New start of career/lectures/ASSIGMENT 2/orders.json') AS o
    ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.name
ORDER BY total_orders DESC;


-- Q2: Find the top 3 products by total quantity sold

SELECT 
    c.customer_id,
    c.name,
    SUM(o.total_amount) AS total_order_value
FROM read_csv_auto('C:/pramod/New start of career/lectures/ASSIGMENT 2/customers.csv') AS c
LEFT JOIN read_json_auto('C:/pramod/New start of career/lectures/ASSIGMENT 2/orders.json') AS o
    ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.name
ORDER BY total_order_value DESC
LIMIT 3;


-- Q3: List all sales representatives and the number of unique customers they have handled

SELECT DISTINCT
    p.product_name,
    c.city
FROM read_csv_auto('C:/pramod/New start of career/lectures/ASSIGMENT 2/customers.csv') AS c
JOIN read_json_auto('C:/pramod/New start of career/lectures/ASSIGMENT 2/orders.json') AS o
    ON c.customer_id = o.customer_id
JOIN read_parquet('C:/pramod/New start of career/lectures/ASSIGMENT 2/products.parquet') AS p
    ON o.product_id = p.product_id
WHERE c.city = 'Bangalore';



-- Q4: Find all orders where the total value exceeds 10,000, sorted by value descending


SELECT 
    c.name AS customer_name,
    o.order_date,
    p.product_name,
    o.quantity
FROM read_csv_auto('C:/pramod/New start of career/lectures/ASSIGMENT 2/customers.csv') AS c
JOIN read_json_auto('C:/pramod/New start of career/lectures/ASSIGMENT 2/orders.json') AS o
    ON c.customer_id = o.customer_id
JOIN read_parquet('C:/pramod/New start of career/lectures/ASSIGMENT 2/products.parquet') AS p
    ON o.product_id = p.product_id
ORDER BY o.order_date;


-- Q5: Identify any products that have never been ordered


SELECT 
    p.product_id,
    p.product_name
FROM read_parquet('C:/pramod/New start of career/lectures/ASSIGMENT 2/products.parquet') AS p
LEFT JOIN read_json_auto('C:/pramod/New start of career/lectures/ASSIGMENT 2/orders.json') AS o
    ON p.product_id = o.product_id
WHERE o.product_id IS NULL;
