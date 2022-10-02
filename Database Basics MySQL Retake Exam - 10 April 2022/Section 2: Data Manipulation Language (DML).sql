INSERT INTO actors (first_name, last_name, birthdate, height, awards, country_id)
SELECT reverse(first_name), 
	reverse(last_name), 
	date_sub(birthdate, INTERVAL 2 DAY), 
	height + 10, 
	country_id, 
	(SELECT id FROM countries WHERE `name` LIKE 'Armenia')
    FROM actors
    WHERE id <= 10;
    
    
update movies_additional_info SET runtime = 
	CASE 
    WHEN runtime - 10 < 0 
    THEN  0 
    ELSE runtime - 10 
    END  where id between 15 and 25; 
    
    
delete c from countries as c left join movies as m on c.`id` = m.country_id where m.id is NULL;  
