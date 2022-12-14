CREATE FUNCTION udf_top_paid_employee_by_store(store_name VARCHAR(50))
RETURNS VARCHAR(255)
DETERMINISTIC
BEGIN
	DECLARE full_info VARCHAR (255);
	DECLARE full_name  VARCHAR (40);
	DECLARE years INT;
	DECLARE employee_id INT;
    
	SET employee_id := (
		SELECT e.id
		FROM employees AS e
		JOIN stores AS s
		ON e.store_id = s.id
		WHERE s.`name` = store_name
		ORDER BY e.salary DESC
		LIMIT 1);
        
	SET full_name := (
		SELECT concat_ws(' ', first_name, concat(middle_name, '.'), last_name)
		FROM employees AS e
    		WHERE e.id = employee_id);
	
  	SET years := (
		SELECT floor(DATEDIFF("2020-10-18", hire_date)/365)
		FROM employees AS e
		WHERE e.id = employee_id);
    
  	SET full_info := concat_ws(' ', full_name, 'works in store for', years, 'years');
  	RETURN full_info;
END


CREATE PROCEDURE udp_update_product_price (address_name VARCHAR (50))
BEGIN
	UPDATE products AS p
		JOIN products_stores AS ps
		ON ps.product_id = p.id
    		JOIN stores AS s
    		ON ps.store_id = s.id
    		JOIN addresses AS a
    		ON s.address_id = a.id
	SET p.price = IF (left(address_name, 1) = '0', p.price + 100, p.price + 200)
	WHERE a.`name` = address_name;
END
