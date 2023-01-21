CREATE OR REPLACE VIEW  customer_addresses AS
SELECT q1.customer_id, email_address, last_name, first_name, bill_line1, bill_line2, bill_city, bill_state, bill_zip, ship_line1, ship_line2, ship_city, ship_state, ship_zip
FROM 
(SELECT c.customer_id, c.email_address, c.last_name, c.first_name, line1 as ship_line1, line2 as ship_line2, city as ship_city, state as ship_state, zip_code as ship_zip 
FROM customers c
JOIN addresses a
ON c.customer_id=a.customer_id
WHERE shipping_address_id=address_id
) q1
INNER JOIN 
(SELECT c.customer_id, line1 as bill_line1, line2 as bill_line2, city as bill_city, state as bill_state, zip_code as bill_zip 
FROM customers c
JOIN addresses a
ON c.customer_id=a.customer_id
WHERE billing_address_id=address_id
) q2
ON q1.customer_id=q2.customer_id
