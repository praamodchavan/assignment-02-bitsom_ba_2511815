
Part 1 — Relational Databases

1.1 -  Anomaly Analysis

Orders_flat.csv includes multiple information in single file which is understood as denormalized data .
Any action/change in particular cell,value,content may require multiple attempts in depedent cell.   

Order_flat data is look like information about orders placed by customer because Each line item has order id and information about customer & product ,office , revenue etc etc

1. Insert Anomaly

Definition: Cannot add certain facts independently (e.g., a product without an order).
We can't add any data randomly in absence of related/unrelated data

--- Citation:--

Column - Each product name has unique product id which is unique e.g POO1 is laptop , POO2 is mouse & so on also there are customer details who place orders and it is linked to order id .Order is unique but rest of information can be repeated.

like Mr x can order different product a,b,c,d so there will be 4 orders which unique order id

So if we try to add data in Columns:** `product_id`, `product_name`, `product_price`in absence of order id we cannt do it.

E.g if there is new product P009-laptop charger cost rs 5000 per unit & if we try to save this information in file we would require order id but what if there is no product sold of POO9 ? we cannt add it 


    
2. Update Anomaly
Definition: Same fact copied in many rows; missing one update creates inconsistent data.
Inconsistency in data due change in any information in particular element in row but remains unchanged in other rows.

--- Citation:--

Column - Sales_rep_name and office_address. 

E.g sales_rep_name Anita desai and her office address is Delhi Office, Connaught Place, New Delhi - 110001
There are 46 rows in which here name is reflected.

So if we change her office address to MUM HO METRO LINES WORLI -400705 and it is updated in only in 30 lines and 16 are left without change It will give information Anita desai is working in two different location

  

### 3. Delete Anomaly

Definition: Removing one row may delete the only copy of important information.
Deletion of particulate element/data leads to permanent loss of data.

Citation:

Column name - 
1) Customer_name,Customer_email,Customer city - 8 unique Customers
2) sales_rep_name , sales_rep_email and office address - 3 unique sales

If we delete particular customer or sales rep name it will delete all records Permanently.

e.gIf we delete priya sharma - it will delete records of all orders placed by priya sharma and her details like email & city
or If we delete Anita desao - it will delete all orders records place by Anit with her details like office address and sales_rep_email

SUBJECTIVE: Normalization Justification:

To make manager understand thar normalization is not over engineering but it makes life simple.
Understand the data it has unique order id , customer related information, sales reps information.
To defend my position, I will take example as below
Let consider new sales rep is join in company and there is no order id generated against new sale rep we cannt add it in flat data
But if we create new table only of sale rep we can add name , office address email id data base 
Also, future if company want to update unit price of mouse from 800 to 1000 and instead of updating 28 records it is updated in 20 rows it will lead to wrong revenue.
Creating separate table in product we can directly update the unit price .
Creating table we can stop inconsistency, accidental loss, halfupdate information





