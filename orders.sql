-- Many To Many
CREATE TABLE orders (
	id INT NOT NULL AUTO_INCREMENT,
    total INT NOT NULL,
    order_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id)
);

DESC orders;
SHOW CREATE TABLE orders;

CREATE TABLE orders_detail (
	id_product VARCHAR(15) NOT NULL,
    id_order INT NOT NULL,
    price INT,
    quantity INT,
    PRIMARY KEY (id_product, id_order)
);

DESC orders_detail;
SHOW CREATE TABLE orders_detail;

ALTER TABLE orders_detail
ADD CONSTRAINT fk_orders_detail_products
FOREIGN KEY (id_product) REFERENCES products(id);

ALTER TABLE orders_detail
ADD CONSTRAINT fk_orders_detail_orders
FOREIGN KEY (id_order) REFERENCES orders(id);

INSERT INTO orders (total) VALUES (15);

SELECT * FROM orders;
SELECT * FROM orders_detail;

INSERT INTO orders_detail (id_product, id_order, price, quantity)
VALUES ('P1685356889', '1', '1000', '5'),
		('P1685356900', '1', '2000', '9'),
		('P1685356911', '2', '2500', '15'),
		('P1685356922', '2', '5000', '30'),
		('P1685356933', '3', '1500', '2'),
		('P1685356889', '3', '1000', '10');
        
SELECT * FROM orders
JOIN orders_detail ON (orders_detail.id_order = orders.id)
JOIN products ON (products.id = orders_detail.id_product)        



