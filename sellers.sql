-- Index
CREATE TABLE sellers(
	id INT NOT NULL AUTO_INCREMENT,
    email VARCHAR(100) NOT NULL,
    first_name VARCHAR(100) NOT NULL,
    middle_name VARCHAR(100),
    last_name VARCHAR(100),
    PRIMARY KEY (id),
    CONSTRAINT email_unique UNIQUE(email),
    INDEX firstname_index (first_name),
    INDEX middlename_index (middle_name),
    INDEX lastname_index (last_name),
    INDEX firstname_middlename_lastname_index (first_name, middle_name, last_name)
);    

SHOW CREATE TABLE sellers;
DESC sellers;

SELECT * FROM sellers WHERE first_name = 'Adi';
SELECT * FROM sellers WHERE last_name = 'Budi';
SELECT * FROM sellers WHERE first_nane = 'Adi' AND last_name = 'Budi';

