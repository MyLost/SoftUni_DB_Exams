insert into coaches(first_name, last_name, salary, coach_level)
select p.first_name, p.last_name, 2*p.salary, length(p.first_name) 
from players as p
where p.age >=45;

update coaches as c 
	join players_coaches as pc on c.id = pc.coach_id 
SET 
	c.coach_level  = c.coach_level +1
where c.first_name like 'A%'; 

delete from players where age >= 45;
