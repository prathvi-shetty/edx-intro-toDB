/*
Write an INSERT statement that adds this row to the Categories table:
category_name: Brass
Code the INSERT statement so MySQL automatically generates the category_id column.*/
INSERT INTO categories(category_name)
VALUES ('Brass');

/*Write a DELETE statement that deletes the Keyboards category in the Categories table. This statement should use the category_id column to identify the row.*/
DELETE FROM categories
WHERE category_id = 
( SELECT * FROM (SELECT category_id FROM categories WHERE category_name = 'Keyboards')
as t)

/*
Write an INSERT statement that adds this row to the Products table:
product_id: The next automatically generated ID 
category_id: 4
product_code: dgx_640
product_name: Yamaha DGX 640 88-Key Digital Piano
description: Long description to come.
list_price: 799.99
discount_percent: 0
date_added: Today’s date/time.*/
INSERT INTO products
    (product_id, category_id, product_code, product_name, description, 
list_price, discount_percent, date_added)
    values
(default, 4, 'dgx_640', 'Yamaha DGX 640 88-Key Digital Piano', 'Long description to come', 
'799.99', '0', NOW());

/*
Write an UPDATE statement that modifies the 'Fender Stratocaster' product. This statement should change the discount_percent column from 30% to 35%*/
UPDATE products
SET discount_percent = 35.00
WHERE  product_name = 'Fender Stratocaster'

/*
Write an UPDATE statement that modifies the Customers table. Change the first_name column to “Al” for the customer with an email address of 'allan.sherwood@yahoo.com'.*/
UPDATE customers
SET first_name = 'Al'
WHERE email_address = 'allan.sherwood@yahoo.com'