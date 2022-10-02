CREATE FUNCTION udf_actor_history_movies_count(full_name varchar(50))
RETURNS INT
BEGIN
	declare history_movies int;
	set history_movies = (select count(actor_id) as history_movies from movies_actors ma join actors a on ma.actor_id = a.id join movies m on m.id = ma.movie_id
join genres_movies gm on m.id = gm.movie_id join genres g on g.id = gm.genre_id
where CONCAT_WS(' ', a.first_name, a.last_name) = full_name and g.name ='history' group by actor_id);
	return history_movies;
END


CREATE PROCEDURE udp_award_movie(movie_title VARCHAR(50))
BEGIN
	update actors as a 
		join movies_actors as ma on a.id = ma.actor_id 
		join movies as m on ma.movie_id = m.id set a.awards = a.awards + 1 
		where m.title = movie_title;
END
