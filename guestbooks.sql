-- Operator SET
CREATE TABLE guestbooks (
	id INT NOT NULL AUTO_INCREMENT,
    email VARCHAR(100),
    title VARCHAR(200),
    content TEXT,
    PRIMARY KEY (id)
);

SELECT * FROM customers;

INSERT INTO guestbooks (email, title, content) 
	VALUES ('guest1@mail.com','Hello','Hello All'),
			('guest2@mail.com','Hi','Hi All'),
			('guest3@mail.com','Morning','Morning All'),
			('mhasan@mail.com','Hola','Hola All'),
			('mhasan@mail.com','Hola','Hola All'),
			('mhasan@mail.com','Hola','Hola All');
            
SELECT * FROM guestbooks;

SELECT DISTINCT email FROM customers UNION SELECT DISTINCT email FROM guestbooks;      
SELECT DISTINCT email FROM customers UNION ALL SELECT DISTINCT email FROM guestbooks;
-- Intersect
SELECT email FROM customers WHERE email IN(SELECT email FROM guestbooks);      
SELECT DISTINCT customers.email FROM customers INNER JOIN GUESTBOOKS ON (customers.email = guestbooks.email);
-- Minus
SELECT DISTINCT customers.email, guestbooks.email FROM customers LEFT JOIN GUESTBOOKS ON (customers.email = guestbooks.email) WHERE guestbooks.email IS NULL;
      
-- Start Transaction
START TRANSACTION;
INSERT INTO guestbooks (email,title,content)
	VALUES ('guestbooks1@gmail.com','guestbooks1','guestbooks 1'),
			('guestbooks2@gmail.com','guestbooks2','guestbooks 2'),
			('guestbooks3@gmail.com','guestbooks3','guestbooks 3');
COMMIT;

START TRANSACTION;
DELETE FROM guestbooks;
ROLLBACK;
            
            



