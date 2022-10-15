CREATE FUNCTION udf_client_bill(full_name VARCHAR(50))
RETURNS Decimal(19,2)
BEGIN
	declare bill Decimal(19,2);
	set bill := (select sum(price) from clients c 
		join orders_clients oc on oc.client_id = c.id 
		join orders o on oc.order_id = o.id 
		join orders_products op on op.order_id = o.id
		join products p on p.id = op.product_id 
		where CONCAT_WS(" ", first_name, last_name) = full_name);
	return bill;
END

CREATE PROCEDURE udp_happy_hour(product_type VARCHAR(50))
BEGIN
	update products p
	set price = price - price* 0.2
	where p.`type` = product_type and price >= 10.00;
END
