CREATE PROCEDURE test()
BEGIN

	DECLARE results VARCHAR(400);
	IF "Guitars" in 
    (SELECT category_name 
    FROM categories) then
		set results="Row was not inserted - duplicate entry.";
	else
		INSERT INTO categories
        (category_name)
        VALUES(Guitars);
        set results="1 row was inserted.";
	END IF;
    
	select results;

END
