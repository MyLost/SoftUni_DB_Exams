CREATE FUNCTION udf_users_photos_count(username VARCHAR(30))
RETURNS INT
DETERMINISTIC
BEGIN
	DECLARE photosCount INT;
	SET photosCount := (
		SELECT count(up.photo_id)
		FROM users_photos AS up
		JOIN users AS u
		ON u.id = up.user_id
		WHERE u.username = username);
  	RETURN photosCount;
END


CREATE PROCEDURE udp_modify_user(address VARCHAR(30), town VARCHAR(30))
BEGIN
	update users u join addresses a on u.id = a.user_id 
	set u.age = u.age + 10
	where a.address  = address and a.town = town;
END
