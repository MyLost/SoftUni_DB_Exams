select first_name, age, salary from players p order by p.salary DESC; 

select p.id, CONCAT_WS(' ', p.first_name, p.last_name) as full_name, p.age, p.`position` , p.hire_date  from players p join skills_data sd on sd.id = p.skills_data_id 
where p.age < 23 and p.`position` = 'A' and p.hire_date is null and sd.strength > 50 order by p.salary ASC, age;

select t.name, t.established, t.fan_base, count(p.id) as players_count 
from teams t left join players p on p.team_id = t.id group by t.id order by players_count DESC, t.fan_base DESC;

SELECT max(sd.speed) AS max_speed, t.`name`
FROM players AS p
	RIGHT JOIN skills_data AS sd
    	ON p.skills_data_id = sd.id
    	RIGHT JOIN teams AS te
    	ON p.team_id = te.id
    	RIGHT JOIN stadiums AS s
    	ON te.stadium_id = s.id
    	RIGHT JOIN towns AS t
    	ON s.town_id = t.id
WHERE te.`name` NOT LIKE 'Devify'
GROUP BY t.`name`
ORDER BY max_speed DESC, t.`name`;

SELECT c.name, count(p.id) as total_count_of_players, sum(p.salary) as total_sum_of_salaries from players p 
right join teams t on t.id = p.team_id 
right join stadiums s on s.id = t.stadium_id 
right join towns t2 on t2.id = s.town_id
right join countries c on c.id = t2.country_id
group by c.name
order by total_count_of_players DESC, c.name;
