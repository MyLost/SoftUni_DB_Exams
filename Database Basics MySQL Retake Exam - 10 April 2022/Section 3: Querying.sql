select id, name, continent, currency  from countries c order by currency DESC, id;

select mai.id, title, runtime, budget, release_date from movies_additional_info mai join movies m on mai.id = m.movie_info_id 
where release_date BETWEEN '1996-01-01' and '1999-12-31' order by runtime, id limit 20;

select CONCAT_WS(' ', first_name, last_name) as full_name, CONCAT(reverse(last_name), LENGTH(last_name),'@cast.com') as email, 2022 - EXTRACT(year from birthdate) as age,  height 
from actors a left join movies_actors ma on ma.actor_id = a.id left join movies m on m.id = ma.movie_id where m.id is null
order by height asc;

select c.name, count(c.id) as movies_count from countries c join movies m on c.id = m.country_id group by c.id HAVING count(c.id) >= 7 order by c.name DESC;


select m.title, 
	case
		when rating <= 4 then 'poor' 
		when rating > 4 and rating <= 7 then 'good' 
		when rating > 7 then 'excellent' 
		end as `rating`,
		if (mai.has_subtitles, 'english', '-')  as `subtitles`,
		budget 
from movies m join movies_additional_info mai on m.movie_info_id = mai.id
order by mai.budget DESC;
