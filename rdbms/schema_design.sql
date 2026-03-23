CREATE TABLE customers (
    customer_id VARCHAR(255) PRIMARY KEY,
    customer_name VARCHAR(255) NOT NULL,
    customer_email VARCHAR(255) NOT NULL UNIQUE,
    customer_city VARCHAR(255) NOT NULL
);

CREATE TABLE Products (
    product_id VARCHAR(255)PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50) NOT NULL,
    unit_price DECIMAL(10, 2) NOT NULL
);


CREATE TABLE Offices (
    office_id INT AUTO_INCREMENT PRIMARY KEY,
    office_address VARCHAR(255) NOT NULL UNIQUE
);


CREATE TABLE SalesReps (
    sales_rep_id VARCHAR(255) PRIMARY KEY,
    sales_rep_name VARCHAR(100) NOT NULL,
    sales_rep_email VARCHAR(100) NOT NULL UNIQUE,
    office_id INT NOT NULL,
    FOREIGN KEY (office_id) REFERENCES Offices(office_id)
    );
    
    CREATE TABLE Orders (
    order_id VARCHAR(255) PRIMARY KEY,
    customer_id VARCHAR(255) NOT NULL,
    sales_rep_id VARCHAR(255) NOT NULL,
    order_date DATE NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    FOREIGN KEY (sales_rep_id) REFERENCES SalesReps(sales_rep_id)
);

CREATE TABLE Order_Items (
    order_id VARCHAR(255),
    product_id VARCHAR(255) NOT NULL,
    quantity INT NOT NULL CHECK (quantity > 0),
    PRIMARY KEY (order_id, product_id),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

## iNSERT INTO STATMENT FOR EACH TABLE FOR 5 ROWS
INSERT INTO Offices (office_address) VALUES 
('KOL HO,24 NORTH PARGANA, WESTBENGAL-12345'),
('MP INDUSTRY,BHOPAL Industrial Way, MP-78902'),
('NEW MUMBAI MIDA, Broadway , NEW NUMBAI-400703'),
('Ocean Avenue, CHENNAI,TAMILNADU-45678'),
('AHM INDUSTRY,BARODA,GUJARAT-34568');

INSERT INTO Products (product_id, product_name, category, unit_price) VALUES 
('P009', 'Ergonomic Chair', 'Furniture', 299),
('P010', 'Paper Weight', 'Stationery', 120),
('P011', 'Monitor', 'Electronics', 350),
('P012', 'EXTENSION', 'Electronics', 450),
('P013', 'USB-C Docking Station', 'Stationery', 89);

INSERT INTO Customers (customer_id, customer_name, customer_email, customer_city) VALUES 
('C009', 'AMBITABH B', 'AMIT@gmail.com', 'MUMBAI'),
('C010', 'RAJNI', 'RAJNI@outlook.com', 'CHENNAI'),
('C011', 'RANBEER K', 'RANBEER@rediffmail.com', 'MP'),
('C012', 'SRK', 'SRK@gmail.com', 'KOL'),
('C013', 'SALMAN', 'SALMAN@hotmail.com', 'DELHI');

INSERT INTO SalesReps (sales_rep_id, sales_rep_name, sales_rep_email, office_id) VALUES 
('SR04', 'PRAMOD', 'pramod@corp.com', 5),
('SR05', 'SONALI', 'sonali@corp.com', 6),
('SR06', 'SUMEET', 'sumeet@corp.com', 7),
('SR07', 'GANESH', 'ganesh@corp.com', 8),
('SR08', 'POOJA', 'pooja@corp.com', 9);

INSERT INTO Orders (order_id, customer_id, sales_rep_id, order_date) VALUES 
('ORD1186', 'C009', 'SR04', '01-10-2023'),
('ORD1187', 'C010', 'SR05', '5-11-2023'),
('ORD1188', 'C011', 'SR06', '9-12-2023'),
('ORD1189', 'C012', 'SR07', '17-06-2023'),
('ORD1190', 'C013', 'SR08', '25-05-2023');

INSERT INTO Order_Items (order_id, product_id, quantity) VALUES 
('ORD1186', 'P009', 2),
('ORD1187', 'P010', 1),
('ORD1188', 'P011', 5),
('ORD1189', 'P012', 1),
('ORD1190', 'P013', 3);
