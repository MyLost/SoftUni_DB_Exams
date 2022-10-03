select id, name from categories c order by name DESC ;

select id, brand_id, name, quantity_in_stock from products p where price > 1000 and quantity_in_stock < 30 order by quantity_in_stock ASC , id;


select * from reviews r where content like 'My%' and LENGTH(content) > 61 order by rating DESC;

select CONCAT_WS(' ', first_name, last_name) as full_name, address, o.order_datetime from customers c join orders o on o.customer_id = c.id 
where extract(year from o.order_datetime) <= 2018 order by full_name DESC;


select count(c.id) as items_count, c.name, sum(p.quantity_in_stock) as total_quantity FROM  categories c join products p on c.id = p.category_id GROUP by c.id
order by items_count DESC, total_quantity asc limit 5;
