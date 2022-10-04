select first_name, last_name , age , salary , happiness_level  from employees e order by salary , id;

select t.name as team_name, a.name as address_name, LENGTH(a.name) as count_of_characters from teams t 
left join offices o on t.office_id  = o.id 
left join addresses a on o.address_id = a.id
where o.website is not null
order by team_name, address_name;

select c.name, COUNT(c.id) as games_count, round(avg(budget), 2) as avg_budget, round(max(rating),1) as max_rating 
from categories c join games_categories gc on c.id = gc.category_id join games g on g.id = gc.game_id 
group by c.id
having max_rating >= 9.5
order by games_count DESC, c.name;


select g.name, release_date, CONCAT(SUBSTR(description,1, 10),'...') as summary,
CASE
		WHEN month(g.release_date) BETWEEN 1 AND 3 THEN 'Q1'
		WHEN month(g.release_date) BETWEEN 4 AND 6 THEN 'Q2'
		WHEN month(g.release_date) BETWEEN 7 AND 9 THEN 'Q3'
        	ELSE 'Q4'
    	END AS `quarter`,
t.name as team_name from games g
join teams t on t.id = g.team_id 
where EXTRACT(year from g.release_date) = '2022' and EXTRACT(MONTH from g.release_date) % 2 = 0 and RIGHT(g.name, 1) = 2
ORDER BY `quarter`;


select g.name, if(g.budget < 50000, 'Normal budget', 'Insufficient budget') as budget_level , t.name as team_name, a.name as address_name from games g left join games_categories gc on g.id = gc.game_id
join teams t on g.team_id = t.id 
join offices o on t.office_id = o.id 
join addresses a on o.address_id = a.id 
where g.release_date is null and gc.category_id is null
order by g.name;


select g.name, if(g.budget < 50000, 'Normal budget', 'Insufficient budget') as budget_level , t.name as team_name, a.name as address_name from games g left join games_categories gc on g.id = gc.game_id
join teams t on g.team_id = t.id 
join offices o on t.office_id = o.id 
join addresses a on o.address_id = a.id 
where g.release_date is null and gc.category_id is null
order by g.name;
