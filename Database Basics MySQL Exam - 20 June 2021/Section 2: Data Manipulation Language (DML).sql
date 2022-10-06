INSERT INTO clients (full_name, phone_number)
select CONCAT_WS(' ', first_name, last_name), CONCAT('(088) 9999', id*2)  
from drivers
where id between 10 and 20;

update cars 
set `condition` = 'C'
where (mileage >= 800000 or mileage is null) and `year` <= 2010 AND make NOT LIKE 'Mercedes-Benz';


DELETE c
FROM clients AS c
LEFT JOIN courses AS co
ON c.id = co.client_id
WHERE co.client_id IS NULL AND length(c.full_name) > 3;
