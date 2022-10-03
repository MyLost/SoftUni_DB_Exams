INSERT INTO reviews (content, rating , picture_url, published_at)
SELECT left(`description`, 15), price/8, reverse(`name`), '2010-10-10'
FROM products
WHERE id >= 5;

update products set quantity_in_stock = quantity_in_stock - 5 where quantity_in_stock between 60 and 70;

delete c from customers c left join orders o on o.customer_id = c.id where o.id is NULL;
