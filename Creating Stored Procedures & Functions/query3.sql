
CREATE PROCEDURE insert_category(IN cat_name VARCHAR(100))
BEGIN

	DECLARE results VARCHAR(400);
	IF cat_name in 
    (SELECT category_name 
    FROM categories) then
		set results="Row was not inserted - duplicate entry.";
	else
		INSERT INTO categories
        (category_name)
        VALUES(cat_name);
        set results="1 row was inserted.";
	END IF;
    
	select results;

END