insert into products (name, `type`, price)
select CONCAT_WS(" ",w.last_name, 'specialty'), 'Cocktail', CEILING(w.salary*0.01) from waiters as w 
where w.id > 6

update orders set table_id = table_id - 1 where id BETWEEN 12 and 23;

delete w from waiters w left join orders o on o.waiter_id = w.id where o.id is null;
