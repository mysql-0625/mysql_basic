CREATE TABLE categories(
	id VARCHAR(15) NOT NULL,
    name VARCHAR(100) NOT NULL,
    PRIMARY KEY (id)
);

DESC products;
SHOW CREATE TABLE products;

ALTER TABLE products DROP category;

ALTER TABLE products
ADD COLUMN id_category VARCHAR(15) AFTER name;

ALTER TABLE products
ADD CONSTRAINT fk_products_categories
FOREIGN KEY (id_category) REFERENCES categories(id);

INSERT INTO categories (id, name) 
VALUES ('C001', 'Dapur'),
		('C002', 'Mandi'),
        ('C003', 'Fashion');
        
SELECT * FROM categories;
SELECT * FROM products;

SET SQL_SAFE_UPDATES = 0;

UPDATE products
SET id_category = 'C003'
WHERE name LIKE '%Sandal%';

SELECT p.id AS product_id, ca.id AS category_id, p.name AS product_name, ca.name AS category_name, p.price AS product_price, p.quantity AS product_qty
FROM products AS p
JOIN categories AS ca ON (p.id_category = ca.id);



