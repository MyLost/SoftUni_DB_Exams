CREATE FUNCTION udf_stadium_players_count(stadium_name VARCHAR(30))
RETURNS INT
BEGIN
	Declare count_result int;
	set count_result := (SELECT COUNT(p.id) from players p 
	join teams t on t.id = p.team_id 
	join stadiums s on s.id = t.stadium_id
	where s.name = stadium_name
	GROUP by s.name);
	return if(count_result >= 0, count_result, 0);
END


CREATE PROCEDURE udp_find_playmaker(min_dribble_points int, team_name varchar (45))
BEGIN
	select concat_ws(' ', first_name, last_name) AS full_name, 
		p.age, 
		p.salary, 
		sd.dribbling, 
		sd.speed,	
		t.name 
	from players p join skills_data sd ON sd.id = p.skills_data_id join teams t on t.id = p.team_id
	where sd.dribbling > min_dribble_points and t.name = team_name and (select AVG(speed) from skills_data sd2)
	order by sd.speed desc
	limit 1;
END
