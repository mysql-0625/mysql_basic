CREATE TABLE wishlist (
	id INT NOT NULL AUTO_INCREMENT,
    id_product VARCHAR(15) NOT NULL,
    description TEXT,
    PRIMARY KEY(id),
    CONSTRAINT fk_wishlist_product
		FOREIGN KEY (id_product) REFERENCES products (id)
);

DESC wishlist;
SHOW CREATE TABLE wishlist;

ALTER TABLE wishlist
DROP CONSTRAINT fk_wishlist_product;

ALTER TABLE wishlist
ADD CONSTRAINT fk_wishlist_product
FOREIGN KEY (id_product) REFERENCES products (id);

INSERT INTO wishlist (id_product, description) VALUES ('P1685356845', 'Stok gula Mei');
-- INSERT INTO wishlist (id_product, description) VALUES ('P16853568450', 'Stok gula Mei'); Gagal add krn tidak ada id tsb

DELETE FROM products WHERE id = 'P1685356845'; -- Tidak dapat hapus product krn fk ada di wishlist

ALTER TABLE wishlist
ADD CONSTRAINT fk_wishlist_product
FOREIGN KEY (id_product) REFERENCES products (id)
ON DELETE CASCADE ON UPDATE CASCADE; -- Atur ketika update/delete di parent, maka di child ikut terupdate

INSERT INTO wishlist (id_product, description) VALUES ('P1685357098', 'Sandal Rumah');

DELETE FROM products WHERE id = 'P1685357098'; -- di wishlist akan ikut terhapus setelah di set CASCADE

-- JOIN
SELECT * FROM wishlist JOIN products ON (wishlist.id_product = products.id);
SELECT wishlist.id, products.id, products.name, wishlist.description FROM wishlist JOIN products ON (wishlist.id_product = products.id);
SELECT w.id AS wishlist_id, p.id AS product_id, p.name AS products_name, w.description AS wishlist_description FROM wishlist AS w JOIN products AS p ON (w.id_product = p.id);

ALTER TABLE wishlist
ADD COLUMN id_customer INT;

ALTER TABLE wishlist
ADD CONSTRAINT fk_wishlist_customer
FOREIGN KEY (id_customer) REFERENCES customers(id);

UPDATE wishlist SET id_customer = 2 WHERE id = 8;

UPDATE wishlist SET id_customer =  CASE 
				WHEN id = 1 THEN 1
                WHEN id = 2 THEN 2
                ELSE id_customer
END WHERE id IN (1,2);
                
SELECT w.id AS wishlist_id, p.id AS product_id, c.id AS customers_id, p.name AS product_name, p.price AS product_price, c.email AS customer_email
FROM wishlist AS w
JOIN products AS p ON (w.id_product = p.id)
JOIN customers AS c ON (w.id_customer = c.id);             

SELECT * FROM wishlist;





