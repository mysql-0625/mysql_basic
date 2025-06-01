-- Materi MySQL

show engines;

use mysql_hasan;

-- Materi Table

show tables;

CREATE TABLE barang2 (
id INT,
name VARCHAR(50),
harga INT,
jumlah INT
);

DESCRIBE barang2;

SHOW CREATE TABLE barang;

SELECT * FROM barang2;

-- Edit table
ALTER TABLE barang
MODIFY name VARCHAR(100) NOT NULL,
ADD COLUMN deskripsi TEXT,
DROP COLUMN jumlah,
MODIFY harga VARCHAR(5) AFTER id,
MODIFY name VARCHAR(150) FIRST,
MODIFY harga INT NOT NULL DEFAULT 0,
MODIFY jumlah INT NOT NULL DEFAULT 0,
ADD COLUMN created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP;

-- Membuat ulang table dan data terhapus
TRUNCATE barang2;

-- Menghapus table;
DROP TABLE barang2;

INSERT INTO barang2 (id, harga) VALUES (1, 5000);

-- Materi Insert 

CREATE TABLE products (
id VARCHAR(10) NOT NULL,
name VARCHAR(100) NOT NULL,
description TEXT,
price INT UNSIGNED NOT NULL,
quantity INT UNSIGNED NOT NULL DEFAULT 0,
created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

ALTER TABLE products
ADD PRIMARY KEY (id);

SHOW TABLES;
DESC products;

INSERT INTO products (id, name, price, quantity)
VALUES ('P01','Beras Pimpong 5kg', 65000, 20);

INSERT INTO products (id, name, description, price, quantity)
VALUES ('P02','Minyak Danpo 1L', 'Minyak sawit asli', 13000, 100);

INSERT INTO products (id, name, description, price, quantity) VALUES
('P1685356801', 'Gula Pasir Premium', 'Gula berkualitas tinggi untuk kebutuhan sehari-hari.', 12000, 150),
('P1685356812', 'Sabun Mandi Fresh', '', 5000, 300);

SELECT * FROM products;
SELECT name, price, quantity FROM products;
SELECT * FROM products WHERE quantity = 100;
SELECT name, price, quantity FROM products WHERE price = '10000';

SELECT * FROM products WHERE quantity >= 100;
SELECT * FROM products WHERE category <> 'Alat Mandi';
SELECT name, price, quantity FROM products WHERE price < 8000 AND quantity >= 250;
SELECT name, price, quantity FROM products WHERE price > 100000 OR quantity > 100;
SELECT * FROM products WHERE (quantity > 100 OR price < 100000) AND category != 'Rumah Tangga';
SELECT * FROM products WHERE name LIKE '%sabun%' AND description NOT LIKE '%sabun%';
SELECT * FROM products WHERE category IS NULL AND description = '';
SELECT * FROM products WHERE price BETWEEN 50000 AND 100000;
SELECT * FROM products WHERE price NOT BETWEEN 50000 AND 100000;
SELECT * FROM products WHERE category IN ('Rumah Tangga','Alat Mandi');
SELECT * FROM products WHERE category NOT IN ('Rumah Tangga','Alat Mandi');
SELECT * FROM products ORDER BY name, description DESC;
SELECT * FROM products ORDER BY id LIMIT 10;
SELECT * FROM products ORDER BY id LIMIT 5, 5;
SELECT DISTINCT quantity FROM products;

SELECT 10 * 10 + 100 as Hasil;
SELECT id, name, price DIV 1000 AS 'price in K' FROM products;
SELECT id, COS(price), SIN(price), TAN(price) FROM products;

SELECT id, LOWER(name) as lower_name, UPPER(name) as upper_name, LENGTH(name) as length_name FROM products;
SELECT id, created_at, EXTRACT(YEAR FROM created_at) as Year, EXTRACT(MONTH FROM created_at) as Month FROM products;
SELECT id, created_at, Year(created_at) as Year, Month(created_at) as Month FROM products;

SELECT name, category,
	CASE category
		WHEN 'Rumah Tangga' THEN 'Perabotan'
        WHEN 'Alat Mandi' THEN 'Permandian'
        ELSE 'Lainnya'
        END AS 'category_result'
FROM products;

SELECT name, price,
	IF(price <= 10000, 'Murah', 
		IF(price <= 25000, 'Mahal', 'Mahal bgttt')
			) AS 'pricy_is'
FROM products;

SELECT name, IFNULL(category, 'Lainnya') FROM products;

SELECT COUNT(id) AS 'Total Product',
		MAX(price) AS 'Product Termahal',
        MIN(price) AS 'Product Termurah',
        AVG(price) AS 'Rata-rata harga product',
        SUM(quantity) AS 'Stok product'
FROM products;

-- GROUP BY https://dev.mysql.com/doc/refman/8.0/en/group-by-modifiers.html  
SELECT category, 
		COUNT(id) AS 'Total Product',
		MAX(price) AS 'Product Termahal',
        MIN(price) AS 'Product Termurah',
        AVG(price) AS 'Rata-rata harga product',
        SUM(quantity) AS 'Stok product'
FROM products GROUP BY category;

-- HAVING
SELECT category, COUNT(id) AS 'Total'
FROM products GROUP BY category
HAVING Total > 8;

ALTER TABLE products
ADD COLUMN category ENUM('Rumah Tangga', 'Alat Mandi') AFTER name;

UPDATE products SET category = 'Rumah Tangga' WHERE id = 'P1685356801';
UPDATE products SET category = 'Alat Mandi', description = 'Minyak real' WHERE id = 'P02';
UPDATE products SET price = price + 1000 WHERE id = 'P01';

SELECT * FROM products;
UPDATE products SET category = 'Alat Mandi' WHERE id =  ('P1685356834','P1685356856');

DELETE FROM products WHERE id = 'P02';

-- Alias
SELECT p.id as 'Kode',
		p.name as 'Nama',
        p.category as 'Kategory',
        p.description as 'Deskripsi',
        p.price as 'Harga',
        p.quantity as 'Jumlah'
        From products AS p;

-- CONSTRAINT CHECK
ALTER TABLE products
ADD CONSTRAINT price_check CHECK (price >= 1000 AND price <= 100000);

INSERT INTO products (id, name, category, price, quantity)
VALUES ('P0129321029', 'Sabun Kodok', 'Alat Mandi', '500', '100'),
		('P0129321192','Beras Kepompong', 'Rumah Tangga', '`101000', '10');
        
-- FULLTEXT SEARCH
ALTER TABLE products
ADD FULLTEXT product_search (name, description);

SHOW CREATE TABLE products;
SELECT * FROM products;

SELECT * FROM PRODUCTS WHERE MATCH (name, description) AGAINST ('Sandal' IN NATURAL LANGUAGE MODE);
SELECT * FROM PRODUCTS WHERE MATCH (name, description) AGAINST ('+Sandal -Wanita' IN BOOLEAN MODE);
SELECT * FROM PRODUCTS WHERE MATCH (name, description) AGAINST ('Terigu' WITH QUERY EXPANSION);




