CREATE FUNCTION discount_price(itemid VARCHAR(50)) 
RETURNS DECIMAL(6,2)
READS SQL DATA
DETERMINISTIC
BEGIN
	DECLARE price DECIMAL(6,2);
	select (item_price-discount_amount) into price
    FROM order_items
    WHERE item_id=itemid;
    RETURN price;
END