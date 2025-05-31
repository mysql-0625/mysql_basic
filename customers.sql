-- Constraint
CREATE TABLE customers (
	id INT NOT NULL AUTO_INCREMENT,
    email VARCHAR(100) NOT NULL,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100),
    PRIMARY KEY (id),
    UNIQUE KEY email_unique(email)
);

DESC customers;

ALTER TABLE customers
DROP CONSTRAINT email_unique;

ALTER TABLE customers
ADD CONSTRAINT email_unique UNIQUE(email);

INSERT INTO customers (email, first_name, last_name) 
	VALUES ('mhasan@mail.com', 'M', 'Hasan'),
			('mhasanain@mail.com', 'M', 'Hasanain');
            
INSERT INTO customers (email, first_name, last_name) 
	-- VALUES ('mhasan@mail.com', 'M', 'Hasan');
	VALUES ('mhasan2@mail.com', 'M', 'Hasan');
            
SELECT * FROM customers;            


