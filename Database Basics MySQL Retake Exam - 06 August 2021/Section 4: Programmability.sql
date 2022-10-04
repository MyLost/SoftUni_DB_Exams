CREATE FUNCTION udf_game_info_by_name(game_name VARCHAR (20))
RETURNS text
BEGIN
	return (select concat('The ', g.name, ' is developed by a ', t.name, ' in an office with an address ', a.name) from games g left join teams t on t.id = g.team_id left join offices o on t.office_id = o.id left join addresses a on o.address_id = a.id
where g.name = game_name); 
END


CREATE PROCEDURE udp_update_budget(min_game_rating float)
BEGIN
-- 	update games g left join games_categories gc on g.id = gc.game_id left join categories c on gc.category_id = c.id
-- 	set g.budget = g.budget + 100000, release_date = ADDDATE(release_date, INTERVAL 1 year) 
-- 	where c.id is null and rating > rating and release_date is not null;
	UPDATE games AS g
	LEFT JOIN games_categories AS c
    	ON g.id = c.game_id
    	SET g.budget = g.budget + 100000, 
		g.release_date = adddate(g.release_date, INTERVAL 1 YEAR)
	WHERE c.category_id IS NULL 
		AND g.release_date IS NOT NULL 
		AND g.rating > min_game_rating;
END
