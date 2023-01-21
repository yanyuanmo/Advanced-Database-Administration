CREATE PROCEDURE test()
BEGIN
	DECLARE res VARCHAR(100);
    DECLARE x int;
    set x=1;
    set res=CONCAT('Common factors of 10 and 20:', space(1));
    
    
	WHILE x  <= 10 DO
    IF (10%x=0 AND 20%x=0) then
		SET res=CONCAT(res, CONVERT(x, CHAR), space(1));
	END IF;
	SET  x = x + 1; 
	END WHILE;
    
    select TRIM(res);

END

