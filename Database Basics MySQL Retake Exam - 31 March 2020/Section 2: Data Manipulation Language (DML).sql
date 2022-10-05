insert into addresses (address, town, country, user_id)
select u.username, u.password, u.ip, u.age from users u
where u.gender = 'M';

update addresses as a 
	set a.country  = (case 
		when left(a.country ,1) = 'B' then 'Blocked'
		when left(a.country,1) = 'T' then 'Test'
		WHEN left(a.country,1) = 'P' then 'In Progress'
		else a.country 
	end);
	
delete a from addresses a where a.id % 3 = 0;
