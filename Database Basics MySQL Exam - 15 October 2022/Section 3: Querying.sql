select * from clients c order by birthdate DESC, id desc;

select first_name, last_name, birthdate, review from clients c 
where card is null and extract(year from birthdate) BETWEEN 1978 and 1993
order by last_name DESC, id asc limit 5;

select table_id, capacity, count(oc.order_id) as `count_clients`,
CASE
		WHEN capacity > count(oc.order_id) THEN 'Free seats'
		WHEN capacity = count(oc.order_id) THEN 'Full'
        	ELSE 'Extra seats'
    	END AS `availability`
from tables t join orders o on o.table_id = t.id join orders_clients oc on oc.order_id = o.id
where floor = 1
group by table_id
order by table_id desc;

select p.id, p.name , count(op.product_id) as `count` from products p join orders_products op ON op.product_id = p.id 
group by op.product_id
having `count` >= 5
order by `count` desc, name asc;

select CONCAT(last_name, first_name,LENGTH(first_name),'Restaurant') as username, REVERSE(SUBSTR(email,2,12)) as password from waiters w where salary is not null
order by password DESC;
