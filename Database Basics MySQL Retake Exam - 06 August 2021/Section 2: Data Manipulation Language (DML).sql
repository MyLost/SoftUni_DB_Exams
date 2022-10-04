insert into games (name, rating, budget , team_id)
select
	LOWER(reverse(SUBSTR(t.name,2))),
	id,
	leader_id * 1000,
	id
from teams t WHERE id BETWEEN 1 AND 9;

update employees e
	left join teams as t 
	on e.id = t.leader_id 
	set e.salary = e.salary + 1000
	where age <= 40 and e.salary < 5000 and t.leader_id is not null;
	
	
DELETE g
FROM games AS g
LEFT JOIN games_categories AS gc
ON g.id = gc.game_id
WHERE gc.game_id IS NULL AND g.release_date IS NULL;
