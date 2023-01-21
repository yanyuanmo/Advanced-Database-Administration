CREATE PROCEDURE test()
BEGIN
	DECLARE countprod int;
	SELECT count(*) into countprod 
	FROM products;
	if countprod>=7 then
	select 'The number of products is greater than or equal to 7';
	else
	select 'The number of products is less than 7';
	END if;
END