/*
Write a SELECT statement that joins the Categories table to the Products table and returns these columns: category_name, product_name, list_price.
Sort the result set by the category_name column and then by the product_name column in ascending sequence.
*/
SELECT category_name, product_name, list_price
FROM categories
JOIN products
ON categories.category_id = products.category_id
ORDER BY category_name, product_name

/*
Write a SELECT statement that joins the Customers table to the Addresses table and returns these columns: first_name, last_name, line1, city, state, zip_code.
Return one row for each address for the customer with an email address of allan.sherwood@yahoo.com
Sort the result set by the zip_code column in ascending sequence.
*/
SELECT first_name, last_name, line1, city, state, zip_code
FROM customers
JOIN addresses
ON customers.customer_id = addresses.customer_id
WHERE email_address = 'allan.sherwood@yahoo.com'
ORDER BY zip_code

/*
Write a SELECT statement that joins the Customers table to the Addresses table and returns these columns: first_name, last_name, line1, city, state, zip_code.
Return one row for each customer, but only return addresses that are the shipping address for a customer.
Sort the result set by the zip_code column in ascending sequence.*/
SELECT first_name, last_name, line1, city, state, zip_code
FROM customers
JOIN addresses
ON customers.customer_id = addresses.customer_id
AND customers.shipping_address_id = addresses.address_id
ORDER BY zip_code

/*
Write a SELECT statement that joins the Customers, Orders, Order_Items, and Products tables. This statement should return these columns: last_name, first_name, order_date, product_name, item_price, discount_amount, and quantity.
Use aliases for the tables.
Sort the final result set by the last_name, order_date, and product_name columns.*/
SELECT last_name, first_name, order_date,
product_name, item_price, discount_amount,quantity
FROM customers AS c
JOIN orders AS o
ON c.customer_id = o.customer_id
JOIN order_items as ot
ON ot.order_id = o.order_id
JOIN products as p
ON p.product_id = ot.product_id
ORDER BY last_name, order_date, product_name


/*
Use the UNION operator to generate a result set consisting of three columns from the Orders table: 
ship_status A calculated column that contains a value of SHIPPED or NOT SHIPPED
order_id The order_id column
order_date The order_date column
If the order has a value in the ship_date column, the ship_status column should contain a value of SHIPPED. Otherwise, it should contain a value of NOT SHIPPED.
Sort the final result set by the order_date column.*/
SELECT 'SHIPPED' AS ship_status, order_id, order_date
FROM orders
WHERE ship_date IS NOT NULL
UNION
SELECT'NOT SHIPPED' AS ship_status, order_id, order_date
FROM orders
WHERE ship_date IS NULL
ORDER BY order_date