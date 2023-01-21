
CREATE PROCEDURE test(OUT res VARCHAR(400))
BEGIN
	DECLARE countprod int;
	SELECT count(*) into countprod 
	FROM products;
	if countprod>=7 then
	set res='The number of products is greater than or equal to 7';
	else
	set res='The number of products is less than 7';
	END if;
END

-- Write a script that creates a stored procedure named test. 
-- This stored procedure should declare a variable and set it to the count of all products in the Products table. 
-- The stored procedure should accept an OUT  parameter where a message is passed out of the procedure.  
-- If the count is greater than or equal to 7, the stored procedure should return the value “The number of products is greater than or equal to 7”. 
-- Otherwise, it should return the value “The number of products is less than 7”.

-- Store the query in a file named query.sql and upload to GradeScope below