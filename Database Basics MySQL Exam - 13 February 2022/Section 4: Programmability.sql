CREATE FUNCTION udf_customer_products_count(name VARCHAR(30))
RETURNS INT
BEGIN
	declare total_products int;
	set total_products = (select count(o.customer_id) from orders o 
		join customers c on o.customer_id = c.id 
		join orders_products op on op.order_id = o.id 
		where c.first_name = name group by customer_id);
	return total_products;
END;


CREATE PROCEDURE udp_reduce_price(category_name VARCHAR(50))
BEGIN
	update products p join categories c on p.category_id = c.id join reviews r on r.id = p.review_id
	set price = price - price * 0.30 where c.name = category_name and r.rating < 4;
END;
