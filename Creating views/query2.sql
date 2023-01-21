CREATE OR REPLACE VIEW order_item_products AS
SELECT o.order_id, order_date, tax_amount, ship_date, p.product_name, item_price, discount_amount, (item_price-discount_amount) as final_price, quantity, (item_price-discount_amount)*quantity as item_total
FROM orders o
JOIN order_items oi
ON o.order_id=oi.order_id
JOIN products p
ON oi.product_id=p.product_id