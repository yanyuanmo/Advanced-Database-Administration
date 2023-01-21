CREATE OR REPLACE VIEW product_summary AS
-- Each row should include product_name, order_count (the quantity of the product that has been ordered) 
-- and order_total (the total sales revenue for the product).
SELECT product_name, count(*) as order_count, sum(item_total) as order_total
FROM
(SELECT o.order_id, order_date, tax_amount, ship_date, p.product_name, item_price, discount_amount, (item_price-discount_amount) as final_price, quantity, (item_price-discount_amount)*quantity as item_total
FROM orders o
JOIN order_items oi
ON o.order_id=oi.order_id
JOIN products p
ON oi.product_id=p.product_id) t
GROUP BY product_name
