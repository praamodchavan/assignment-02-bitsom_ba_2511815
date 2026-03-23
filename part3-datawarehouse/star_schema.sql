CREATE TABLE dim_date (
    date_key        INT          PRIMARY KEY AUTO_INCREMENT,
    full_date       VARCHAR(20),
    day_name        VARCHAR(10),
    month_name      VARCHAR(10),
    quarter_name    VARCHAR(2)
);

CREATE TABLE dim_product (
    product_key     INT          PRIMARY KEY AUTO_INCREMENT,
    product_name    VARCHAR(255) NOT NULL,
    category        VARCHAR(100) NOT NULL
);

CREATE TABLE dim_store (
    store_key       INT          PRIMARY KEY AUTO_INCREMENT,
    store_name      VARCHAR(255) NOT NULL,
    store_city      VARCHAR(100) NOT NULL
);

CREATE TABLE fact_sales (
    sale_key        INT          PRIMARY KEY AUTO_INCREMENT,
    date_key        INT,
    product_key     INT,
    store_key       INT,
    units_sold      INT,
    unit_price      DECIMAL(10,2),
    total_amount    DECIMAL(10,2) AS (units_sold * unit_price) STORED,

    FOREIGN KEY (date_key)    REFERENCES dim_date(date_key),
    FOREIGN KEY (product_key) REFERENCES dim_product(product_key),
    FOREIGN KEY (store_key)   REFERENCES dim_store(store_key)
);

SET SQL_SAFE_UPDATES = 0;

UPDATE retail_transactions
SET date = STR_TO_DATE(date, '%d/%m/%Y')
WHERE date LIKE '__/__/____';

UPDATE retail_transactions
SET date = STR_TO_DATE(date, '%d-%m-%Y')
WHERE date LIKE '__-__-____';

SET SQL_SAFE_UPDATES = 1;

INSERT INTO fact_sales (date_key, product_key, store_key, units_sold, unit_price)
SELECT 
    d.date_key,
    p.product_key,
    s.store_key,
    r.units_sold,
    r.unit_price
FROM retail_transactions r
JOIN dim_date    d ON DATE(d.full_date)          = DATE(r.date)
JOIN dim_product p ON LOWER(p.product_name)      = LOWER(r.product_name)
JOIN dim_store   s ON LOWER(s.store_name)        = LOWER(r.store_name);