CREATE USER 'hasan'@'localhost';
CREATE USER 'hasanain'@'%';

DROP USER 'hasan'@'localhost';
DROP USER 'hasanain'@'%';

GRANT SELECT, INSERT, UPDATE, DELETE ON mysql_hasan.* TO 'hasan'@'localhost';
GRANT SELECT ON mysql_hasan.products TO 'hasanain'@'%';

SHOW GRANTS FOR 'hasan'@'localhost';
SHOW GRANTS FOR 'hasanain'@'%';

REVOKE SELECT, INSERT, UPDATE, DELETE ON mysql_hasan.* FROM 'hasan'@'localhost';
REVOKE SELECT ON mysql_hasan.products FROM 'hasanain'@'%';

SET PASSWORD FOR 'hasan'@'localhost' = 'password';
SET PASSWORD FOR 'hasanain'@'%' = 'password';

















