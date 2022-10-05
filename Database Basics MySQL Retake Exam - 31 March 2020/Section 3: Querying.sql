SELECT u.username , u.gender , u.age from users u order by u.age DESC , u.username asc;

select CONCAT_WS(' ',id, username) as id_username, email  
from users u 
join users_photos up on u.id = up.user_id
where u.id = up.photo_id
order by id ASC;

select p.id, p.`date` as date_and_time, p.description , count(p.id) as commentsCount 
from photos p 
join comments c on p.id = c.photo_id 
group by p.id 
order by count(p.id) DESC, p.id asc
limit 5;

select p.id, (select count(id) from likes WHERE photo_id = p.id) as likes_count, (select count(id) from comments c where p.id = photo_id) as comments_count
from photos p 
order by likes_count desc, comments_count desc, p.id ;

select CONCAT(left(description, 30), '...') as summary, p.`date` from photos p
where day(p.`date`) = 10
order by p.`date` DESC;
