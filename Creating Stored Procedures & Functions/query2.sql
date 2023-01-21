CREATE PROCEDURE test(OUT results VARCHAR(400))
BEGIN
	DECLARE names_var VARCHAR(50);
	DECLARE prices_var DECIMAL (8,2);
    DECLARE finished int default 0;
    
DECLARE products_cursor CURSOR FOR
    SELECT product_name, list_price 
    FROM products 
    WHERE list_price > 700
    ORDER BY list_price DESC;
    
DECLARE CONTINUE HANDLER FOR NOT FOUND SET finished = 1;
    
OPEN products_cursor;

set results='';

myloop: WHILE finished=0 do
	FETCH NEXT FROM products_cursor INTO names_var, prices_var;
    if (finished=1) then
		LEAVE myloop;
	END IF;
	set results=CONCAT(results, "*", names_var, "*,*", prices_var, "*|");
END WHILE myloop;
CLOSE products_cursor;

END