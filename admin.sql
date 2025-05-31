CREATE TABLE admin(
	id INT NOT NULL AUTO_INCREMENT,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    PRIMARY KEY (id)
);

DESC admin;
SELECT * FROM admin;

INSERT INTO admin (first_name, last_name)
Values ('Budi','Nugraha'),
		('Andi','Septian'),
        ('Cika','Andini');
        
DELETE FROM admin WHERE id = 3;

SELECT LAST_INSERT_ID();  